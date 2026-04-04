# PySide6 GUI приложение для лабораторной работы по регрессии
# Требования: pip install PySide6 pandas numpy scikit-learn matplotlib joblib

import sys
import pandas as pd
import numpy as np
import joblib

from PySide6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QPushButton, QLabel, QFileDialog,
    QComboBox, QSpinBox, QMessageBox, QTableWidget, QTableWidgetItem
)

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression
from sklearn.neighbors import KNeighborsRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

import matplotlib.pyplot as plt

class App(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("ML Regression Lab (PySide6)")
        self.resize(900, 600)

        self.df = None

        layout = QVBoxLayout()

        self.label = QLabel("Загрузите CSV файл")
        layout.addWidget(self.label)

        self.load_btn = QPushButton("Загрузить файл")
        self.load_btn.clicked.connect(self.load_file)
        layout.addWidget(self.load_btn)

        self.target_box = QComboBox()
        layout.addWidget(QLabel("Целевая переменная"))
        layout.addWidget(self.target_box)

        self.k_spin = QSpinBox()
        self.k_spin.setMinimum(1)
        self.k_spin.setMaximum(20)
        self.k_spin.setValue(5)
        layout.addWidget(QLabel("K для KNN"))
        layout.addWidget(self.k_spin)

        self.train_btn = QPushButton("Обучить модели")
        self.train_btn.clicked.connect(self.train_models)
        layout.addWidget(self.train_btn)

        self.result_table = QTableWidget()
        layout.addWidget(self.result_table)

        self.setLayout(layout)

    def load_file(self):
        file_name, _ = QFileDialog.getOpenFileName(self, "Открыть CSV", "", "CSV Files (*.csv)")
        if file_name:
            self.df = pd.read_csv(file_name)
            self.label.setText(f"Загружено: {file_name}")
            self.target_box.clear()
            self.target_box.addItems(self.df.columns)

    def train_models(self):
        if self.df is None:
            QMessageBox.warning(self, "Ошибка", "Сначала загрузите файл")
            return

        target = self.target_box.currentText()

        X = self.df.drop(columns=[target]).select_dtypes(include=[np.number])
        y = self.df[target]

        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

        scaler = StandardScaler()
        X_train = scaler.fit_transform(X_train)
        X_test = scaler.transform(X_test)

        results = {}

        # Linear Regression
        lr = LinearRegression()
        lr.fit(X_train, y_train)
        y_pred_lr = lr.predict(X_test)

        mse_lr = mean_squared_error(y_test, y_pred_lr)
        mape_lr = np.mean(np.abs((y_test - y_pred_lr) / y_test)) * 100

        results["Linear"] = [
            mean_absolute_error(y_test, y_pred_lr),
            mse_lr,
            np.sqrt(mse_lr),
            mape_lr,
            r2_score(y_test, y_pred_lr)
        ]

        joblib.dump(lr, "linear_model.pkl")

        # KNN
        k = self.k_spin.value()
        knn = KNeighborsRegressor(n_neighbors=k)
        knn.fit(X_train, y_train)
        y_pred_knn = knn.predict(X_test)

        mse_knn = mean_squared_error(y_test, y_pred_knn)
        mape_knn = np.mean(np.abs((y_test - y_pred_knn) / y_test)) * 100

        results["KNN"] = [
            mean_absolute_error(y_test, y_pred_knn),
            mse_knn,
            np.sqrt(mse_knn),
            mape_knn,
            r2_score(y_test, y_pred_knn)
        ]

        joblib.dump(knn, "knn_model.pkl")

        self.show_results(results)
        self.plot_results(y_test, y_pred_lr, y_pred_knn)

    def show_results(self, results):
        self.result_table.setRowCount(len(results))
        self.result_table.setColumnCount(6)
        self.result_table.setHorizontalHeaderLabels(["Model", "MAE", "MSE", "RMSE", "MAPE (%)", "R2"])

        for row, (model, metrics) in enumerate(results.items()):
            self.result_table.setItem(row, 0, QTableWidgetItem(model))
            for col, value in enumerate(metrics, start=1):
                self.result_table.setItem(row, col, QTableWidgetItem(f"{value:.3f}"))

    def plot_results(self, y_test, y_lr, y_knn):
        plt.figure()
        plt.scatter(y_test, y_lr, label="Linear")
        plt.scatter(y_test, y_knn, label="KNN")
        plt.xlabel("Реальные значения")
        plt.ylabel("Предсказания")
        plt.legend()
        plt.show()


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = App()
    window.show()
    sys.exit(app.exec())
