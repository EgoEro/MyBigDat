import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
from sklearn.metrics import (
    silhouette_score,
    adjusted_rand_score,
    adjusted_mutual_info_score
)

# === Загрузка данных ===
df = pd.read_csv("var25.csv")

# === Очистка ===
df = df.dropna(subset=["Accepted_Offer"])

# Убираем нечисловые и ненужные колонки
drop_cols = ["Accepted_Offer", "Student_ID", "Unnamed: 0"]
X = df.drop(columns=[col for col in drop_cols if col in df.columns])

# Оставляем только числовые признаки
X = X.select_dtypes(include=[np.number])

# === Масштабирование ===
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# === Снижение размерности до 2D ===
pca = PCA(n_components=2)
X_2d = pca.fit_transform(X_scaled)

# === Истинные метки ===
y_true = df["Accepted_Offer"].astype(int).values

# === Перебор K ===
k_values = [2, 3, 4]

for k in k_values:
    kmeans = KMeans(n_clusters=k, random_state=42)
    labels = kmeans.fit_predict(X_scaled)

    # Метрики
    sil = silhouette_score(X_scaled, labels)
    ari = adjusted_rand_score(y_true, labels)
    ami = adjusted_mutual_info_score(y_true, labels)

    print(f"\nK = {k}")
    print(f"Silhouette: {sil:.3f}")
    print(f"ARI: {ari:.3f}")
    print(f"AMI: {ami:.3f}")

    # === Визуализация ===
    plt.figure()
    for cluster in range(k):
        plt.scatter(
            X_2d[labels == cluster, 0],
            X_2d[labels == cluster, 1],
            label=f"Cluster {cluster}"
        )

    plt.title(f"KMeans (k={k})")
    plt.legend()
    plt.xlabel("PC1")
    plt.ylabel("PC2")
    plt.show()