import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.cluster import KMeans, AgglomerativeClustering
from sklearn.metrics import silhouette_score, adjusted_rand_score, adjusted_mutual_info_score
from scipy.cluster.hierarchy import dendrogram, linkage
from scipy.spatial.distance import pdist
import joblib

# ------------------------------
# 1. Загрузка данных
# ------------------------------
df = pd.read_csv('var10.csv', index_col=0)
print("Первые 5 строк данных:")
print(df.head())
print("\nИнформация о данных:")
print(df.info())
print("\nОписательная статистика:")
print(df.describe())

# ------------------------------
# 2. Разведочный анализ
# ------------------------------
print("\nПропущенные значения:")
print(df.isnull().sum())

# Визуализация распределения зарплаты
plt.figure(figsize=(10, 5))
plt.hist(df['зарплата'], bins=30, edgecolor='black')
plt.title('Распределение зарплаты')
plt.xlabel('Зарплата')
plt.ylabel('Частота')
plt.show()

# ------------------------------
# 3. Подготовка данных к обучению
# ------------------------------
# Кодируем категориальные признаки
categorical_cols = ['образование', 'город', 'язык_программирования', 'размер_компании', 'английский']
label_encoders = {}

for col in categorical_cols:
    le = LabelEncoder()
    df[col + '_code'] = le.fit_transform(df[col])
    label_encoders[col] = le

# Выбираем признаки для кластеризации
feature_cols = ['опыт_лет', 'возраст', 'образование_код', 'город', 'язык_программирования',
                'размер_компании', 'английский', 'образование_код']
# На самом деле 'образование_код' уже есть, но добавим его из закодированных
feature_cols = ['опыт_лет', 'возраст', 'образование_code', 'город_code',
                'язык_программирования_code', 'размер_компании_code', 'английский_code']

# Добавляем закодированные колонки
for col in categorical_cols:
    df[col + '_code'] = label_encoders[col].transform(df[col])

X = df[feature_cols].copy()

# Масштабируем данные
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# ------------------------------
# 4. Оптимальное число кластеров
# ------------------------------
inertia = []
silhouette_scores = []
K_range = range(2, 11)

for k in K_range:
    kmeans = KMeans(n_clusters=k, random_state=42, n_init=10)
    kmeans.fit(X_scaled)
    inertia.append(kmeans.inertia_)
    silhouette_scores.append(silhouette_score(X_scaled, kmeans.labels_))

# Метод локтя
plt.figure(figsize=(12, 5))
plt.subplot(1, 2, 1)
plt.plot(K_range, inertia, 'bo-')
plt.xlabel('Количество кластеров')
plt.ylabel('Инерция')
plt.title('Метод локтя')

# Метод силуэта
plt.subplot(1, 2, 2)
plt.plot(K_range, silhouette_scores, 'ro-')
plt.xlabel('Количество кластеров')
plt.ylabel('Силуэтный коэффициент')
plt.title('Метод силуэта')
plt.show()

optimal_k = K_range[np.argmax(silhouette_scores)]
print(f"\nОптимальное число кластеров по силуэту: {optimal_k}")

# ------------------------------
# 5. K-means с визуализацией и оценкой качества
# ------------------------------
kmeans_final = KMeans(n_clusters=optimal_k, random_state=42, n_init=10)
clusters_kmeans = kmeans_final.fit_predict(X_scaled)
df['cluster_kmeans'] = clusters_kmeans

# Оценка качества (если бы был target, но его нет, считаем силуэт)
sil_kmeans = silhouette_score(X_scaled, clusters_kmeans)
print(f"\nСилуэтный коэффициент для k-means (k={optimal_k}): {sil_kmeans:.4f}")

# Визуализация (первые 2 главных компоненты для демонстрации)
from sklearn.decomposition import PCA

pca = PCA(n_components=2)
X_pca = pca.fit_transform(X_scaled)

plt.figure(figsize=(8, 6))
scatter = plt.scatter(X_pca[:, 0], X_pca[:, 1], c=clusters_kmeans, cmap='viridis')
plt.colorbar(scatter, label='Кластер')
plt.title(f'K-means кластеризация (k={optimal_k}) в проекции PCA')
plt.xlabel('PC1')
plt.ylabel('PC2')
plt.show()

# Выгрузка модели k-means
joblib.dump(kmeans_final, 'kmeans_model.pkl')
print("Модель k-means сохранена в kmeans_model.pkl")

# ------------------------------
# 6. Иерархическая кластеризация
# ------------------------------
# Построение дендрограммы
plt.figure(figsize=(12, 6))
linked = linkage(X_scaled, method='ward')
dendrogram(linked, truncate_mode='lastp', p=30, leaf_rotation=90., leaf_font_size=10.)
plt.title('Дендрограмма иерархической кластеризации')
plt.xlabel('Индексы наблюдений')
plt.ylabel('Евклидово расстояние')
plt.show()

# Обучение модели иерархической кластеризации
agg_clust = AgglomerativeClustering(n_clusters=optimal_k, linkage='ward')
clusters_hier = agg_clust.fit_predict(X_scaled)
df['cluster_hier'] = clusters_hier

# Оценка качества
sil_hier = silhouette_score(X_scaled, clusters_hier)
print(f"\nСилуэтный коэффициент для иерархической кластеризации: {sil_hier:.4f}")

# Выгрузка модели иерархической кластеризации
joblib.dump(agg_clust, 'hierarchical_model.pkl')
print("Модель иерархической кластеризации сохранена в hierarchical_model.pkl")

# ------------------------------
# 7. Вывод по работе и сравнение результатов
# ------------------------------
print("\n" + "="*60)
print("ВЫВОДЫ И СРАВНЕНИЕ РЕЗУЛЬТАТОВ")
print("="*60)

print(f"Оптимальное число кластеров (по силуэту): {optimal_k}")
print(f"Силуэтный коэффициент k-means: {sil_kmeans:.4f}")
print(f"Силуэтный коэффициент иерархической кластеризации: {sil_hier:.4f}")

if sil_kmeans > sil_hier:
    print("K-means показал лучшее качество кластеризации (более высокий силуэтный коэффициент).")
elif sil_hier > sil_kmeans:
    print("Иерархическая кластеризация показала лучшее качество.")
else:
    print("Оба метода показали одинаковое качество.")

# Сравнение распределения кластеров
print("\nРаспределение объектов по кластерам (k-means):")
print(df['cluster_kmeans'].value_counts().sort_index())
print("\nРаспределение объектов по кластерам (иерархическая):")
print(df['cluster_hier'].value_counts().sort_index())

# Сохранение данных с метками кластеров
df.to_csv('var10_with_clusters.csv')
print("\nДанные с метками кластеров сохранены в var10_with_clusters.csv")