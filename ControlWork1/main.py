import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
import pickle
import warnings

warnings.filterwarnings('ignore')

# Настройка отображения
pd.set_option('display.max_columns', None)
plt.rcParams['figure.figsize'] = (12, 8)

# ==================== ЗАДАНИЕ 1.1 ====================
print("=" * 60)
print("ЗАДАНИЕ 1.1: Загрузка и анализ данных")
print("=" * 60)

# Загрузка данных (замена точки на запятую для десятичных чисел)
df = pd.read_csv('DS_attestation_middle_variants.csv', sep=';', decimal=',')

# Вывод первых 20 строк
print("\n1. Первые 20 строк датасета:")
print(df.head(20))

# Информация о датасете
print("\n2. Информация о датасете:")
print(df.info())

# Базовая статистика по числовым признакам
print("\n3. Базовая статистика по числовым признакам:")
print(df.describe())

# Базовая статистика по категориальным признакам
print("\n4. Базовая статистика по категориальным признакам:")
categorical_cols = df.select_dtypes(include=['object']).columns
if len(categorical_cols) > 0:
    for col in categorical_cols:
        print(f"\n{col}:")
        print(df[col].value_counts())
else:
    print("Категориальные признаки отсутствуют (кроме целевой переменной, если она категориальная)")
    print("\nСтатистика по целевому признаку 'cl':")
    print(df['cl'].value_counts())

# Вопросы для анализа
print("\n" + "=" * 40)
print("ОТВЕТЫ НА ВОПРОСЫ (Задание 1.1):")
print("=" * 40)
print(f"1. Количество наблюдений в датасете: {len(df)}")
print(f"2. Количество признаков (столбцов): {len(df.columns)}")
print(f"3. Пропущенные значения: {df.isnull().sum().sum() > 0}")
if df.isnull().sum().sum() > 0:
    print(f"   Пропуски по столбцам:\n{df.isnull().sum()}")
print("4. Все ли столбцы являются признаками?")
print(f"   Целевой признак: 'cl' (последний столбец)")
print(f"   Остальные {len(df.columns) - 1} столбцов - признаки")
print("5. Признаки, нуждающиеся в преобразовании:")
print("   - Все числовые признаки уже в правильном формате")
print("   - Категориальных признаков (кроме целевого) нет")
print("   - Целевой признак 'cl' - бинарный (1 и 2), подходит для классификации")

# ==================== ЗАДАНИЕ 1.2 ====================
print("\n" + "=" * 60)
print("ЗАДАНИЕ 1.2: Визуализация распределений")
print("=" * 60)

# Создание графиков
fig, axes = plt.subplots(2, 3, figsize=(15, 10))

# 1. Распределение целевого признака
df['cl'].value_counts().plot(kind='bar', ax=axes[0, 0], color=['skyblue', 'salmon'])
axes[0, 0].set_title('Распределение целевого признака (cl)')
axes[0, 0].set_xlabel('Класс')
axes[0, 0].set_ylabel('Количество')
for i, v in enumerate(df['cl'].value_counts().values):
    axes[0, 0].text(i, v + 0.5, str(v), ha='center')

# 2. Boxplot для целевой переменной
# Исправлено: изменен параметр labels на tick_labels
axes[0, 1].boxplot([df[df['cl'] == 1]['cl'], df[df['cl'] == 2]['cl']],
                   tick_labels=['Класс 1', 'Класс 2'])
axes[0, 1].set_title('Boxplot целевой переменной по классам')
axes[0, 1].set_ylabel('Значение')

# 3. Scatter plot: ключевые признаки vs целевой признак
key_features = ['alc', 'Mg', 'phl', 'flav', 'proa']
for i, feat in enumerate(key_features[:3]):
    axes[1, i].scatter(df[feat], df['cl'], alpha=0.6, c=df['cl'], cmap='coolwarm')
    axes[1, i].set_xlabel(feat)
    axes[1, i].set_ylabel('cl (целевой)')
    axes[1, i].set_title(f'{feat} vs cl')

plt.tight_layout()
plt.show()

# Дополнительные графики - исправлено: создаем 2x2 подграфика
fig2, axes2 = plt.subplots(2, 2, figsize=(12, 10))

# Scatter для остальных признаков
axes2[0, 0].scatter(df['col_int'], df['cl'], alpha=0.6, c=df['cl'], cmap='coolwarm')
axes2[0, 0].set_xlabel('col_int')
axes2[0, 0].set_ylabel('cl')
axes2[0, 0].set_title('col_int vs cl')

axes2[0, 1].scatter(df['alc_a'], df['cl'], alpha=0.6, c=df['cl'], cmap='coolwarm')
axes2[0, 1].set_xlabel('alc_a')
axes2[0, 1].set_ylabel('cl')
axes2[0, 1].set_title('alc_a vs cl')

# Гистограммы распределения признаков по классам - исправлено: используем только 2 подграфика
# Берем первые 2 признака из key_features
for i, feat in enumerate(key_features[:2]):
    axes2[1, i].hist(df[df['cl'] == 1][feat], alpha=0.5, label='Класс 1', bins=10)
    axes2[1, i].hist(df[df['cl'] == 2][feat], alpha=0.5, label='Класс 2', bins=10)
    axes2[1, i].set_xlabel(feat)
    axes2[1, i].set_ylabel('Частота')
    axes2[1, i].set_title(f'Распределение {feat} по классам')
    axes2[1, i].legend()

plt.tight_layout()
plt.show()

# Вопросы по визуализации
print("\n" + "=" * 40)
print("ОТВЕТЫ НА ВОПРОСЫ (Задание 1.2):")
print("=" * 40)
print("1. Выбросы в целевом признаке:")
print("   - Целевой признак принимает только значения 1 и 2 (бинарный)")
print("   - Выбросов в классическом понимании нет")
print("   - Размер признаков: все числовые")
print("2. Линейная зависимость между признаками и целевым:")
print("   - Визуально линейная зависимость не очевидна")
print("   - Некоторые признаки (например, alc, phl) показывают различия между классами")
print("   - Для точного вывода нужен корреляционный анализ")

# ==================== ЗАДАНИЕ 2.1 ====================
print("\n" + "=" * 60)
print("ЗАДАНИЕ 2.1: One-Hot Encoding")
print("=" * 60)

# Отделяем признаки и целевую переменную
X = df.drop('cl', axis=1)
y = df['cl']

# Проверяем категориальные признаки
categorical_features = X.select_dtypes(include=['object']).columns
print(f"\nКатегориальные признаки для кодирования: {list(categorical_features)}")

if len(categorical_features) > 0:
    # Применяем One-Hot Encoding
    X_encoded = pd.get_dummies(X, columns=categorical_features, drop_first=False)
else:
    print("Категориальных признаков нет, One-Hot Encoding не требуется")
    X_encoded = X.copy()

# Выводим названия всех столбцов после кодирования
print(f"\nНазвания всех столбцов после кодирования ({len(X_encoded.columns)} столбцов):")
print(list(X_encoded.columns))

# Выводим форму датасета
print(f"\nФорма датасета: {X_encoded.shape} (строки, столбцы)")

# Вопросы для анализа
print("\n" + "=" * 40)
print("ОТВЕТЫ НА ВОПРОСЫ (Задание 2.1):")
print("=" * 40)
print("1. Нужно ли было преобразование?")
print("   - В данном датасете все признаки числовые")
print("   - One-Hot Encoding не требуется")
print("2. Количество новых признаков: 0 (все признаки уже числовые)")

# ==================== ЗАДАНИЕ 2.2 ====================
print("\n" + "=" * 60)
print("ЗАДАНИЕ 2.2: Корреляционный анализ")
print("=" * 60)

# Вычисляем корреляции с целевым признаком
correlations = X_encoded.corrwith(y).sort_values(ascending=False)
print("\nКорреляции признаков с целевым (топ-10 по убыванию):")
print(correlations.head(10))

# Полная корреляционная матрица
corr_matrix = X_encoded.corr()

# Строим тепловую карту
plt.figure(figsize=(14, 12))
mask = np.triu(np.ones_like(corr_matrix, dtype=bool))
sns.heatmap(corr_matrix, mask=mask, annot=True, fmt='.2f', cmap='coolwarm',
            center=0, square=True, linewidths=0.5, cbar_kws={"shrink": 0.8})
plt.title('Тепловая карта корреляционной матрицы', fontsize=16)
plt.tight_layout()
plt.show()

# Вопросы для анализа
print("\n" + "=" * 40)
print("ОТВЕТЫ НА ВОПРОСЫ (Задание 2.2):")
print("=" * 40)
print(f"1. Признак с самой высокой корреляцией с целевым: {correlations.index[0]} "
      f"(корреляция: {correlations.iloc[0]:.3f})")

print("\n2. Сильно коррелированные между собой признаки (|корреляция| > 0.7):")
high_corr_pairs = []
for i in range(len(corr_matrix.columns)):
    for j in range(i + 1, len(corr_matrix.columns)):
        if abs(corr_matrix.iloc[i, j]) > 0.7:
            high_corr_pairs.append((corr_matrix.columns[i], corr_matrix.columns[j],
                                    corr_matrix.iloc[i, j]))
if high_corr_pairs:
    for pair in high_corr_pairs:
        print(f"   - {pair[0]} и {pair[1]}: {pair[2]:.3f}")
else:
    print("   - Нет признаков с корреляцией выше 0.7")

print("\n3. Признаки с корреляцией с целевым > 0.5 или < -0.5:")
high_corr_with_target = correlations[abs(correlations) > 0.5]
if len(high_corr_with_target) > 0:
    for feat, corr_val in high_corr_with_target.items():
        print(f"   - {feat}: {corr_val:.3f}")
else:
    print("   - Нет признаков с корреляцией > 0.5 или < -0.5")
    print("   - Это означает, что линейная зависимость слабая")

# ==================== ЗАДАНИЕ 3.1 ====================
print("\n" + "=" * 60)
print("ЗАДАНИЕ 3.1: Разделение на train/test")
print("=" * 60)

# Разделение на признаки и целевую переменную
print("\n1. Разделение на X (признаки) и y (целевая переменная):")
print(f"   X shape: {X_encoded.shape}")
print(f"   y shape: {y.shape}")

# Разделение на обучающую и тестовую выборки (80/20)
X_train, X_test, y_train, y_test = train_test_split(
    X_encoded, y, test_size=0.2, random_state=42, stratify=y
)

print("\n2. Размеры выборок:")
print(f"   Обучающая выборка X_train: {X_train.shape}")
print(f"   Обучающая выборка y_train: {y_train.shape}")
print(f"   Тестовая выборка X_test: {X_test.shape}")
print(f"   Тестовая выборка y_test: {y_test.shape}")
print(f"\n   Распределение классов в обучающей выборке:\n{y_train.value_counts()}")
print(f"\n   Распределение классов в тестовой выборке:\n{y_test.value_counts()}")

# ==================== ЗАДАНИЕ 3.2 ====================
print("\n" + "=" * 60)
print("ЗАДАНИЕ 3.2: Обучение базовой модели")
print("=" * 60)

# Создаем и обучаем модель KNN для классификации
knn_model = KNeighborsClassifier(n_neighbors=5, metric='minkowski', p=2)

print("\n1. Модель: K-ближайших соседей (KNN) для классификации")
print(f"   Параметры: n_neighbors=5, metric='euclidean'")

# Обучение модели
knn_model.fit(X_train, y_train)
print("\n2. Модель обучена")

# Предсказания
y_train_pred = knn_model.predict(X_train)
y_test_pred = knn_model.predict(X_test)

print("\n3. Предсказания сделаны")

# Метрики качества
print("\n4. Метрики качества:")
print("-" * 40)
print("Обучающая выборка:")
print(f"   Accuracy: {accuracy_score(y_train, y_train_pred):.4f}")
print("\nТестовая выборка:")
print(f"   Accuracy: {accuracy_score(y_test, y_test_pred):.4f}")
print("\nClassification Report (тестовая выборка):")
print(classification_report(y_test, y_test_pred, target_names=['Класс 1', 'Класс 2']))

print("\nМатрица ошибок (тестовая выборка):")
cm = confusion_matrix(y_test, y_test_pred)
print(cm)

# Визуализация матрицы ошибок
plt.figure(figsize=(6, 5))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
            xticklabels=['Класс 1', 'Класс 2'],
            yticklabels=['Класс 1', 'Класс 2'])
plt.title('Матрица ошибок')
plt.ylabel('Истинные значения')
plt.xlabel('Предсказанные значения')
plt.show()

# Сохранение модели в pickle
with open('knn_model.pkl', 'wb') as file:
    pickle.dump(knn_model, file)
print("\n5. Модель сохранена в файл 'knn_model.pkl'")

# Вопросы для анализа
print("\n" + "=" * 40)
print("ОТВЕТЫ НА ВОПРОСЫ (Задание 3.2):")
print("=" * 40)
print(f"1. Результат на тестовой выборке: Accuracy = {accuracy_score(y_test, y_test_pred):.4f}")
print(f"   ({accuracy_score(y_test, y_test_pred) * 100:.1f}% правильных предсказаний)")

print("\n2. Признаки переобучения:")
train_acc = accuracy_score(y_train, y_train_pred)
test_acc = accuracy_score(y_test, y_test_pred)
diff = train_acc - test_acc
print(f"   Accuracy на обучающей выборке: {train_acc:.4f}")
print(f"   Accuracy на тестовой выборке: {test_acc:.4f}")
print(f"   Разница: {diff:.4f}")

if diff > 0.15:
    print("   Есть признаки сильного переобучения (разница > 0.15)")
elif diff > 0.05:
    print("   Есть небольшое переобучение (разница 0.05-0.15)")
else:
    print("   Переобучение незначительное или отсутствует")

if train_acc > 0.95:
    print("   Внимание: очень высокая точность на обучающей выборке (>95%)")

print(f"\n   Рекомендации: "
      f"{'Модель работает хорошо' if test_acc > 0.7 else 'Требуется улучшение модели'}")