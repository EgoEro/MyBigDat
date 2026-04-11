import seaborn as sns
import pandas as pd
from scipy import stats

def load_data():
    df = pd.read_csv("Boston.csv")
    #df = sns.load_dataset('mpg')
    print('Данные успешно загружены')
    print(f'Количество строк: {df.shape[0]}')
    print(f'Количество столбцов: {df.shape[1]}\n')
    return df

def split_columns(df):
    df['chas'] = df['chas'].astype('category')
    num_cols = df.select_dtypes(include=['int64', 'float64']).columns
    cat_cols = df.select_dtypes(include=['object', 'category']).columns
    return num_cols, cat_cols

def numeric_summary(df, num_cols):
    print('Анализ числовых переменных')
    summary = []

    for col in num_cols:
        s = df[col]
        stats_dict = {
            'variable': col,
            'missing_share': round(s.isna().mean(), 3),
            'min': s.min(),
            'max': s.max(),
            'mean': round(s.mean(), 3),
            'median': round(s.median(), 3),
            'variance': round(s.var(), 3),
            'q_0.1': s.quantile(0.1),
            'q_0.9': s.quantile(0.9),
            'Q1': s.quantile(0.25),
            'Q3': s.quantile(0.75)
        }
        summary.append(stats_dict)

        print(f"\nПеременная: {col}")
        for k, v in stats_dict.items():
            if k != 'variable':
                print(f"  {k}: {v}")

    print()
    return pd.DataFrame(summary)

def categorical_summary(df, cat_cols):
    print('=== Анализ категориальных переменных ===')
    summary = []

    for col in cat_cols:
        s = df[col]
        stats_dict = {
            'variable': col,
            'missing_share': round(s.isna().mean(), 3),
            'unique_values': s.nunique(),
            'mode': s.mode().iloc[0]
        }
        summary.append(stats_dict)

        print(f"\nПеременная: {col}")
        for k, v in stats_dict.items():
            if k != 'variable':
                print(f"  {k}: {v}")

    print()
    return pd.DataFrame(summary)


import pandas as pd
import numpy as np
from scipy import stats


def hypothesis_tests(df):
    print('=== Проверка статистических гипотез ===')
    print()

    # Гипотеза 1: Сравнение зарплат для разных языков программирования
    # Выбираем Python и Java как наиболее представленные языки
    python_salary = df[df['язык_программирования'] == 'Python']['зарплата'].dropna()
    java_salary = df[df['язык_программирования'] == 'Java']['зарплата'].dropna()

    # Проверяем, достаточно ли данных
    if len(python_salary) > 0 and len(java_salary) > 0:
        t_stat, p_value = stats.ttest_ind(python_salary, java_salary, nan_policy='omit')

        print('Гипотеза 1: Сравнение зарплат Python vs Java')
        print('H0: Средняя зарплата не отличается между Python и Java разработчиками')
        print(f'Средняя зарплата Python: {python_salary.mean():.2f} (n={len(python_salary)})')
        print(f'Средняя зарплата Java: {java_salary.mean():.2f} (n={len(java_salary)})')
        print(f't-статистика = {t_stat:.3f}')
        print(f'p-value = {p_value:.5f}')

        if p_value < 0.05:
            print('Вывод: H0 отвергается — различия в зарплатах статистически значимы')
        else:
            print('Вывод: нет оснований отвергнуть H0 — различия в зарплатах статистически незначимы')
        print()
    else:
        print('Гипотеза 1: Недостаточно данных для сравнения Python и Java')
        print()

    # Гипотеза 2: Сравнение зарплат для разных уровней образования
    bachelor_salary = df[df['образование'] == 'Бакалавр']['зарплата'].dropna()
    master_salary = df[df['образование'] == 'Магистр']['зарплата'].dropna()

    if len(bachelor_salary) > 0 and len(master_salary) > 0:
        t_stat2, p_value2 = stats.ttest_ind(bachelor_salary, master_salary, nan_policy='omit')

        print('Гипотеза 2: Сравнение зарплат Бакалавр vs Магистр')
        print('H0: Средняя зарплата не отличается между бакалаврами и магистрами')
        print(f'Средняя зарплата Бакалавр: {bachelor_salary.mean():.2f} (n={len(bachelor_salary)})')
        print(f'Средняя зарплата Магистр: {master_salary.mean():.2f} (n={len(master_salary)})')
        print(f't-статистика = {t_stat2:.3f}')
        print(f'p-value = {p_value2:.5f}')

        if p_value2 < 0.05:
            print('Вывод: H0 отвергается — различия в зарплатах статистически значимы')
        else:
            print('Вывод: нет оснований отвергнуть H0 — различия в зарплатах статистически незначимы')
        print()
    else:
        print('Гипотеза 2: Недостаточно данных для сравнения уровней образования')
        print()




def correlation_analysis(df):
    print('=== Корреляционный анализ с целевой переменной (зарплата) ===')
    print()

    # Создаем копию датафрейма для кодирования
    df_encoded = df.copy()

    # Преобразуем категориальные переменные в числовые
    # Образование
    education_mapping = {
        'Бакалавр': 0,
        'Магистр': 1,
        'PhD': 2
    }
    if 'образование' in df_encoded.columns:
        df_encoded['образование_код'] = df_encoded['образование'].map(education_mapping)

    # Уровень английского
    english_mapping = {
        'A1-A2': 0,
        'B1-B2': 1,
        'C1-C2': 2
    }
    if 'английский' in df_encoded.columns:
        df_encoded['английский_код'] = df_encoded['английский'].map(english_mapping)

    # Размер компании
    size_mapping = {
        'Малая': 0,
        'Средняя': 1,
        'Крупная': 2
    }
    if 'размер_компании' in df_encoded.columns:
        df_encoded['размер_компании_код'] = df_encoded['размер_компании'].map(size_mapping)

    # Город (One-Hot Encoding)
    if 'город' in df_encoded.columns:
        city_dummies = pd.get_dummies(df_encoded['город'], prefix='город')
        df_encoded = pd.concat([df_encoded, city_dummies], axis=1)

    # Язык программирования (One-Hot Encoding)
    if 'язык_программирования' in df_encoded.columns:
        lang_dummies = pd.get_dummies(df_encoded['язык_программирования'], prefix='язык')
        df_encoded = pd.concat([df_encoded, lang_dummies], axis=1)

    # Выбираем только числовые колонки для корреляции
    numeric_cols = df_encoded.select_dtypes(include=[np.number]).columns.tolist()

    # Исключаем исходные закодированные колонки, если нужно
    exclude_cols = []
    df_numeric = df_encoded[numeric_cols]

    # Рассчитываем корреляцию с зарплатой
    if 'medv' in df_numeric.columns:
        corr = df_numeric.corr()['medv'].sort_values(ascending=False)

        print('Корреляция с зарплатой:')
        print('=' * 50)
        for var, value in corr.items():
            if var != 'medv':
                print(f'{var:25} {value:.3f}')

        print('\n' + '=' * 50)
        print('\nВыводы:')

        # Анализ значимых корреляций
        significant_corr = corr[(corr.abs() > 0.1) & (corr.index != 'medv')]

        if len(significant_corr) > 0:
            print('Наибольшее влияние на зарплату оказывают:')
            for var, value in significant_corr.head(5).items():
                if value > 0:
                    print(
                        f'  • {var}: положительная корреляция ({value:.3f}) - увеличение этого фактора связано с ростом зарплаты')
                else:
                    print(
                        f'  • {var}: отрицательная корреляция ({value:.3f}) - увеличение этого фактора связано с уменьшением зарплаты')
        else:
            print('Не обнаружено статистически значимых корреляций')

        # Специфические выводы
        print('\nДетальный анализ:')

        if 'опыт_лет' in corr.index:
            exp_corr = corr['опыт_лет']
            if exp_corr > 0:
                print(f'  • Опыт работы имеет положительную корреляцию с зарплатой ({exp_corr:.3f})')
                if exp_corr > 0.5:
                    print('    - Очень сильная связь: опыт является ключевым фактором')
                elif exp_corr > 0.3:
                    print('    - Умеренная связь: опыт важен, но не единственный фактор')
                else:
                    print('    - Слабая связь: другие факторы более важны')

        if 'возраст' in corr.index:
            age_corr = corr['возраст']
            print(f'  • Возраст имеет корреляцию {age_corr:.3f} с зарплатой')

        if 'образование_код' in corr.index:
            edu_corr = corr['образование_код']
            if edu_corr > 0:
                print(f'  • Более высокое образование коррелирует с более высокой зарплатой ({edu_corr:.3f})')

        if 'язык_Java' in corr.index or 'язык_Python' in corr.index:
            java_corr = corr.get('язык_Java', 0)
            python_corr = corr.get('язык_Python', 0)
            if java_corr > python_corr:
                print(f'  • Java-разработчики имеют более высокие зарплаты (корр={java_corr:.3f})')
            elif python_corr > java_corr:
                print(f'  • Python-разработчики имеют более высокие зарплаты (корр={python_corr:.3f})')

        if 'город_Москва' in corr.index:
            moscow_corr = corr['город_Москва']
            if moscow_corr > 0:
                print(f'  • Работа в Москве связана с более высокой зарплатой (корр={moscow_corr:.3f})')

        return corr
    else:
        print('Колонка "зарплата" не найдена в данных')
        return None

def main():
    df = load_data()
    num_cols, cat_cols = split_columns(df)

    numeric_summary(df, num_cols)
    categorical_summary(df, cat_cols)

    #hypothesis_tests(df)
    correlation_analysis(df)
    #gradient_descent(df, feature='weight')


main()
