import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC, LinearSVC
from sklearn.metrics import (
    accuracy_score,
    precision_score,
    recall_score,
    f1_score,
    confusion_matrix,
    roc_auc_score,
    roc_curve,
    classification_report
)

import warnings

warnings.filterwarnings("ignore")


def load_data():
    """Загрузка данных о зарплатах программистов"""
    # Загружаем данные из CSV файла
    stats = pd.read_csv("var09.csv", index_col=0)

    # Выводим информацию о данных
    print("=" * 60)
    print("ИНФОРМАЦИЯ О ДАННЫХ")
    print("=" * 60)
    print(f"Всего записей: {len(stats)}")
    print(f"Колонки: {list(stats.columns)}")
    print("\nСтатистика по зарплатам:")
    print(f"  Средняя: {stats['зарплата'].mean():.2f}")
    print(f"  Медиана: {stats['зарплата'].median():.2f}")
    print(f"  Минимум: {stats['зарплата'].min():.2f}")
    print(f"  Максимум: {stats['зарплата'].max():.2f}")
    print("\nРаспределение уровней образования:")
    education_dist = stats.groupby('образование_код')['образование'].first()
    for code, edu in education_dist.items():
        count = len(stats[stats['образование_код'] == code])
        print(f"  {code} - {edu}: {count} ({count / len(stats) * 100:.1f}%)")
    print()

    return stats


def preprocess_data(stats):
    """Предобработка данных и выбор признаков"""
    # Выбираем признаки для моделирования
    features = [
        "опыт_лет",
        "возраст",
        "зарплата"
    ]

    # Добавляем дополнительные признаки для улучшения качества
    # Кодируем категориальные признаки
    # Город
    city_mapping = {city: idx for idx, city in enumerate(stats['город'].unique())}
    stats['город_код'] = stats['город'].map(city_mapping)

    # Язык программирования
    lang_mapping = {lang: idx for idx, lang in enumerate(stats['язык_программирования'].unique())}
    stats['язык_код'] = stats['язык_программирования'].map(lang_mapping)

    # Размер компании
    size_mapping = {'Малая': 0, 'Средняя': 1, 'Крупная': 2}
    stats['размер_код'] = stats['размер_компании'].map(size_mapping)

    # Уровень английского
    english_mapping = {'A1-A2': 0, 'B1-B2': 1, 'C1-C2': 2}
    stats['английский_код'] = stats['английский'].map(english_mapping)

    # Добавляем закодированные признаки в список
    extended_features = features + ['город_код', 'язык_код', 'размер_код', 'английский_код']

    X = stats[extended_features]
    y = stats["образование_код"]  # Целевая переменная: 0 - Бакалавр, 1 - Магистр, 2 - PhD

    print("Используемые признаки:")
    for i, f in enumerate(extended_features, 1):
        print(f"  {i}. {f}")
    print()

    # Удаление выбросов
    print("Удаление выбросов...")
    initial_count = len(X)

    Q1 = X.quantile(0.25)
    Q3 = X.quantile(0.75)
    IQR = Q3 - Q1

    mask = ~((X < (Q1 - 1.5 * IQR)) |
             (X > (Q3 + 1.5 * IQR))).any(axis=1)

    X = X[mask]
    y = y[mask]

    print(f"Удалено выбросов: {initial_count - len(X)}")
    print(f"Осталось записей: {len(X)}")
    print()

    return X, y


def split_and_scale(X, y):
    """Разделение данных на train/test и масштабирование"""
    X_train, X_test, y_train, y_test = train_test_split(
        X,
        y,
        test_size=0.2,
        random_state=42,
        stratify=y
    )

    scaler = StandardScaler()
    X_train_scaled = scaler.fit_transform(X_train)
    X_test_scaled = scaler.transform(X_test)

    print(f"Размер обучающей выборки: {len(X_train)}")
    print(f"Размер тестовой выборки: {len(X_test)}")
    print("\nРаспределение классов в train:")
    for i in range(3):
        count = len(y_train[y_train == i])
        print(f"  Класс {i}: {count} ({count / len(y_train) * 100:.1f}%)")
    print()

    return X_train_scaled, X_test_scaled, y_train, y_test


def train_models(X_train, X_test, y_train, y_test):
    """Обучение моделей для мультиклассовой классификации"""
    models = {
        "KNN (k=5)": KNeighborsClassifier(n_neighbors=5),
        "Logistic Regression": LogisticRegression(max_iter=1000),  # Убрали multi_class
        "Linear SVM": LinearSVC(max_iter=3000),
    }

    roc_data = {}
    results = []

    print("=" * 60)
    print("РЕЗУЛЬТАТЫ ОБУЧЕНИЯ МОДЕЛЕЙ")
    print("=" * 60)

    for name, model in models.items():
        print(f"\n{'=' * 50}")
        print(f"Модель: {name}")
        print('=' * 50)
        model.fit(X_train, y_train)

        y_pred = model.predict(X_test)

        # Метрики для мультиклассовой классификации
        print(f"\nAccuracy: {accuracy_score(y_test, y_pred):.4f}")
        print(f"\nPrecision (weighted): {precision_score(y_test, y_pred, average='weighted'):.4f}")
        print(f"Recall (weighted): {recall_score(y_test, y_pred, average='weighted'):.4f}")
        print(f"F1-score (weighted): {f1_score(y_test, y_pred, average='weighted'):.4f}")

        # Детальный отчет по каждому классу
        print(f"\nClassification Report:")
        print(classification_report(y_test, y_pred, target_names=['Бакалавр', 'Магистр', 'PhD']))

        # Confusion Matrix
        print(f"\nConfusion Matrix:")
        cm = confusion_matrix(y_test, y_pred)
        print(cm)

        # Для ROC-AUC
        if hasattr(model, "predict_proba"):
            y_score = model.predict_proba(X_test)
            # Вычисляем ROC-AUC для мультикласса
            try:
                roc_auc = roc_auc_score(y_test, y_score, multi_class='ovr', average='weighted')
                print(f"\nROC-AUC (weighted OVR): {roc_auc:.4f}")
            except:
                # Для старых версий sklearn
                roc_auc = roc_auc_score(y_test, y_score, average='weighted')
                print(f"\nROC-AUC (weighted): {roc_auc:.4f}")

            # Сохраняем ROC кривые для каждого класса
            fpr_dict = {}
            tpr_dict = {}
            for i in range(3):
                y_test_binary = (y_test == i).astype(int)
                y_score_binary = y_score[:, i]
                fpr, tpr, _ = roc_curve(y_test_binary, y_score_binary)
                fpr_dict[i] = fpr
                tpr_dict[i] = tpr
            roc_data[name] = (fpr_dict, tpr_dict)
        else:
            # Для моделей без predict_proba
            try:
                y_score = model.decision_function(X_test)
                if len(model.classes_) == 2:
                    roc_auc = roc_auc_score(y_test, y_score)
                    fpr, tpr, _ = roc_curve(y_test, y_score)
                    roc_data[name] = ({0: fpr}, {0: tpr})
                else:
                    roc_auc = roc_auc_score(y_test, y_score, multi_class='ovr', average='weighted')
                    print(f"\nROC-AUC (weighted OVR): {roc_auc:.4f}")
            except:
                print(f"\nROC-AUC: не удалось вычислить для модели {name}")

        # Сохраняем результаты
        results.append({
            'Model': name,
            'Accuracy': accuracy_score(y_test, y_pred),
            'Precision (w)': precision_score(y_test, y_pred, average='weighted'),
            'Recall (w)': recall_score(y_test, y_pred, average='weighted'),
            'F1 (w)': f1_score(y_test, y_pred, average='weighted')
        })

    # Выводим сводную таблицу
    print("\n" + "=" * 60)
    print("СВОДНАЯ ТАБЛИЦА РЕЗУЛЬТАТОВ")
    print("=" * 60)
    results_df = pd.DataFrame(results)
    print(results_df.to_string(index=False))
    print()

    return models, roc_data, results_df


def plot_roc_curves(roc_data):
    """Построение ROC-кривых для мультиклассовой классификации"""
    if not roc_data:
        print("Нет данных для построения ROC-кривых")
        return

    plt.figure(figsize=(10, 8))

    colors = ['blue', 'red', 'green', 'orange', 'purple']
    color_idx = 0

    for name, (fpr_dict, tpr_dict) in roc_data.items():
        if len(fpr_dict) > 1:
            # Для каждого класса рисуем свою кривую
            for class_idx in fpr_dict.keys():
                fpr = fpr_dict[class_idx]
                tpr = tpr_dict[class_idx]
                class_name = ['Бакалавр', 'Магистр', 'PhD'][class_idx]
                linestyle = ['-', '--', ':'][class_idx]
                plt.plot(fpr, tpr,
                         label=f"{name} - {class_name}",
                         color=colors[color_idx % len(colors)],
                         linestyle=linestyle,
                         linewidth=1.5)
            color_idx += 1
        else:
            # Для бинарных моделей
            fpr = fpr_dict[0]
            tpr = tpr_dict[0]
            plt.plot(fpr, tpr, label=name, color=colors[color_idx], linewidth=2)
            color_idx += 1

    plt.plot([0, 1], [0, 1], "k--", label="Random Classifier", linewidth=1)
    plt.xlabel("False Positive Rate (FPR)", fontsize=12)
    plt.ylabel("True Positive Rate (TPR)", fontsize=12)
    plt.title("ROC-кривые моделей (Мультиклассовая классификация)", fontsize=14, fontweight='bold')
    plt.legend(loc="lower right", fontsize=9)
    plt.grid(alpha=0.3)
    plt.tight_layout()
    plt.show()


def plot_decision_boundaries(stats):
    """Построение границ решений для двух признаков"""
    # Используем два наиболее важных признака
    features = ["опыт_лет", "зарплата"]

    X = stats[features]
    y = stats["образование_код"]

    # Удаляем выбросы для лучшей визуализации
    Q1 = X.quantile(0.25)
    Q3 = X.quantile(0.75)
    IQR = Q3 - Q1
    mask = ~((X < (Q1 - 1.5 * IQR)) |
             (X > (Q3 + 1.5 * IQR))).any(axis=1)
    X = X[mask]
    y = y[mask]

    # Масштабируем данные
    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)

    models = {
        "KNN (k=5)": KNeighborsClassifier(n_neighbors=5),
        "Logistic Regression": LogisticRegression(max_iter=1000),
        "RBF SVM": SVC(kernel='rbf')
    }

    # Создаем сетку для визуализации
    xx, yy = np.meshgrid(
        np.arange(X_scaled[:, 0].min() - 1, X_scaled[:, 0].max() + 1, 0.1),
        np.arange(X_scaled[:, 1].min() - 1, X_scaled[:, 1].max() + 1, 0.1)
    )

    # Цвета для 3 классов
    cmap_light = ListedColormap(["#FFAAAA", "#AAFFAA", "#AAAAFF"])
    cmap_bold = ListedColormap(["#FF0000", "#00FF00", "#0000FF"])

    plt.figure(figsize=(15, 5))

    for i, (name, model) in enumerate(models.items(), 1):
        model.fit(X_scaled, y)

        Z = model.predict(np.c_[xx.ravel(), yy.ravel()])
        Z = Z.reshape(xx.shape)

        plt.subplot(1, 3, i)
        plt.contourf(xx, yy, Z, cmap=cmap_light, alpha=0.8)
        scatter = plt.scatter(
            X_scaled[:, 0],
            X_scaled[:, 1],
            c=y,
            cmap=cmap_bold,
            edgecolor="k",
            s=30,
            alpha=0.7
        )
        plt.title(f"Граница решения: {name}", fontsize=12, fontweight='bold')
        plt.xlabel(features[0] + " (стандартизованный)", fontsize=10)
        plt.ylabel(features[1] + " (стандартизованная)", fontsize=10)

        # Добавляем легенду
        legend_elements = scatter.legend_elements()[0]
        plt.legend(legend_elements, ['Бакалавр', 'Магистр', 'PhD'],
                   title="Уровень образования", loc='upper left')

    plt.tight_layout()
    plt.show()


def plot_class_analysis(stats):
    """Анализ классов по различным признакам"""
    fig, axes = plt.subplots(2, 2, figsize=(14, 10))

    # 1. Распределение зарплат по уровням образования
    ax1 = axes[0, 0]
    for code, name, color in [(0, 'Бакалавр', '#FF6B6B'),
                              (1, 'Магистр', '#4ECDC4'),
                              (2, 'PhD', '#45B7D1')]:
        salary_data = stats[stats['образование_код'] == code]['зарплата']
        ax1.hist(salary_data, bins=20, alpha=0.5, label=name, color=color, edgecolor='black')
    ax1.set_title('Распределение зарплат по уровню образования', fontweight='bold')
    ax1.set_xlabel('Зарплата')
    ax1.set_ylabel('Частота')
    ax1.legend()
    ax1.grid(alpha=0.3)

    # 2. Распределение опыта по уровням образования
    ax2 = axes[0, 1]
    stats.boxplot(column='опыт_лет', by='образование_код', ax=ax2)
    ax2.set_title('Распределение опыта по уровню образования', fontweight='bold')
    ax2.set_xlabel('Уровень образования (0-Бакалавр, 1-Магистр, 2-PhD)')
    ax2.set_ylabel('Опыт (лет)')

    # 3. Распределение возраста по уровням образования
    ax3 = axes[1, 0]
    stats.boxplot(column='возраст', by='образование_код', ax=ax3)
    ax3.set_title('Распределение возраста по уровню образования', fontweight='bold')
    ax3.set_xlabel('Уровень образования (0-Бакалавр, 1-Магистр, 2-PhD)')
    ax3.set_ylabel('Возраст')

    # 4. Языки программирования по уровням образования
    ax4 = axes[1, 1]
    # Группируем данные
    lang_by_edu = pd.crosstab(stats['язык_программирования'], stats['образование_код'])
    lang_by_edu.plot(kind='bar', ax=ax4, color=['#FF6B6B', '#4ECDC4', '#45B7D1'])
    ax4.set_title('Языки программирования по уровню образования', fontweight='bold')
    ax4.set_xlabel('Язык программирования')
    ax4.set_ylabel('Количество')
    ax4.legend(['Бакалавр', 'Магистр', 'PhD'])
    ax4.tick_params(axis='x', rotation=45)

    plt.tight_layout()
    plt.show()


def main():
    """Основная функция"""
    print("\n" + "=" * 60)
    print("МУЛЬТИКЛАССОВАЯ КЛАССИФИКАЦИЯ")
    print("Предсказание уровня образования по характеристикам специалиста")
    print("=" * 60)
    print()

    # Загрузка данных
    stats = load_data()

    # Предобработка данных
    X, y = preprocess_data(stats)

    # Разделение и масштабирование
    X_train, X_test, y_train, y_test = split_and_scale(X, y)

    # Обучение моделей
    models, roc_data, results_df = train_models(X_train, X_test, y_train, y_test)

    # Визуализация ROC-кривых
    if roc_data:
        plot_roc_curves(roc_data)

    # Визуализация границ решений
    plot_decision_boundaries(stats)

    # Анализ классов
    plot_class_analysis(stats)

    # Вывод лучшей модели
    print("\n" + "=" * 60)
    print("РЕКОМЕНДАЦИИ")
    print("=" * 60)
    best_by_f1 = results_df.loc[results_df['F1 (w)'].idxmax()]
    best_by_acc = results_df.loc[results_df['Accuracy'].idxmax()]

    print(f"Лучшая модель по F1-score: {best_by_f1['Model']}")
    print(f"  F1-score (weighted): {best_by_f1['F1 (w)']:.4f}")
    print(f"  Accuracy: {best_by_f1['Accuracy']:.4f}")
    print()
    print(f"Лучшая модель по Accuracy: {best_by_acc['Model']}")
    print(f"  Accuracy: {best_by_acc['Accuracy']:.4f}")
    print(f"  F1-score: {best_by_acc['F1 (w)']:.4f}")
    print()


if __name__ == "__main__":
    main()