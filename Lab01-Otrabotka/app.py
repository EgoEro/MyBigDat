import sys
import pandas as pd
import sqlite3
from pathlib import Path

from PySide6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QLabel,
    QComboBox, QPushButton, QLineEdit, QFormLayout,
    QMessageBox, QTextEdit, QFileDialog
)

from sqlalchemy import create_engine

import seaborn as sns
from matplotlib.backends.backend_qtagg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure


class DataVizApp(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Data Visualization with SQLite3")
        self.setGeometry(100, 100, 700, 800)
        self.db_path = "university_data.db"
        self.engine = None

        self.layout = QVBoxLayout(self)

        # File selection section
        self.layout.addWidget(QLabel("CSV Files Selection:"))
        self.csv_files_btn = QPushButton("Select CSV Files and Create Database")
        self.csv_files_btn.clicked.connect(self.select_csv_files)
        self.layout.addWidget(self.csv_files_btn)

        # Database info
        self.db_info = QLabel(f"Database: {self.db_path}")
        self.layout.addWidget(self.db_info)

        # Table selector
        self.layout.addWidget(QLabel("Available Tables:"))
        self.table_selector = QComboBox()
        self.layout.addWidget(self.table_selector)

        self.preview_btn = QPushButton("Show Table")
        self.preview_btn.clicked.connect(self.preview_table)
        self.preview_btn.setEnabled(False)
        self.layout.addWidget(self.preview_btn)

        self.table_view = QTextEdit()
        self.table_view.setReadOnly(True)
        self.layout.addWidget(self.table_view)

        # Visualization controls
        self.layout.addWidget(QLabel("X (quantitative):"))
        self.combo_x = QComboBox()
        self.layout.addWidget(self.combo_x)

        self.layout.addWidget(QLabel("Y (quantitative):"))
        self.combo_y = QComboBox()
        self.layout.addWidget(self.combo_y)

        self.layout.addWidget(QLabel("Categorical (hue):"))
        self.combo_hue = QComboBox()
        self.layout.addWidget(self.combo_hue)

        self.layout.addWidget(QLabel("Size (optional):"))
        self.combo_size = QComboBox()
        self.layout.addWidget(self.combo_size)

        self.hist_btn = QPushButton("Histogram")
        self.hist_btn.clicked.connect(self.plot_histogram)
        self.hist_btn.setEnabled(False)
        self.layout.addWidget(self.hist_btn)

        self.scatter_btn = QPushButton("Multivariate Analysis")
        self.scatter_btn.clicked.connect(self.plot_scatter)
        self.scatter_btn.setEnabled(False)
        self.layout.addWidget(self.scatter_btn)

        self.figure = Figure(figsize=(6, 4))
        self.canvas = FigureCanvas(self.figure)
        self.layout.addWidget(self.canvas)

        self.df = None

    def select_csv_files(self):
        """Open file dialog to select multiple CSV files"""
        file_paths, _ = QFileDialog.getOpenFileNames(
            self,
            "Select CSV Files",
            "",
            "CSV Files (*.csv);;All Files (*)"
        )

        if file_paths:
            self.create_database_from_csvs(file_paths)

    def create_database_from_csvs(self, csv_files):
        """Create SQLite3 database from selected CSV files"""
        try:
            # Create SQLite3 engine
            self.engine = create_engine(f"sqlite:///{self.db_path}")

            # Dictionary to store loaded DataFrames
            dataframes = {}
            table_names = []

            # Load each CSV file into a DataFrame and then to SQLite
            for csv_file in csv_files:
                # Extract table name from filename (without extension)
                table_name = Path(csv_file).stem
                # Clean table name: replace spaces and special characters
                table_name = ''.join(c if c.isalnum() else '_' for c in table_name)

                # Read CSV file
                df = pd.read_csv(csv_file)
                dataframes[table_name] = df
                table_names.append(table_name)

                # Write to SQLite database
                df.to_sql(table_name, self.engine, if_exists='replace', index=False)

                print(f"Loaded {table_name}: {len(df)} rows, {len(df.columns)} columns")

            # Create combined DataFrame for analysis (if needed)
            self.create_combined_dataframe(dataframes, table_names)

            # Update UI
            self.table_selector.clear()
            self.table_selector.addItems(table_names)
            self.preview_btn.setEnabled(True)

            QMessageBox.information(
                self,
                "Success",
                f"Database created successfully!\n\n"
                f"Loaded {len(csv_files)} tables:\n" +
                "\n".join([f"- {name}: {len(df)} rows" for name, df in dataframes.items()])
            )

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Failed to create database:\n{str(e)}")

    def create_combined_dataframe(self, dataframes, table_names):
        """Create a combined DataFrame for visualization"""
        # This method should be customized based on your specific data structure
        # Here's a generic approach - you can modify this based on your CSV structure

        try:
            # If there's only one table, use it directly
            if len(dataframes) == 1:
                self.df = list(dataframes.values())[0]
            else:
                # Try to find relationships based on common columns
                # This is a simple approach - you might need to customize this
                combined = None

                # Try to merge tables if they have common columns
                for name, df in dataframes.items():
                    if combined is None:
                        combined = df
                    else:
                        # Find common columns for merging
                        common_cols = list(set(combined.columns) & set(df.columns))
                        if common_cols:
                            combined = combined.merge(df, on=common_cols[0], how='left')
                        else:
                            # If no common columns, just concatenate
                            print(f"No common columns found for {name}, skipping merge")

                self.df = combined if combined is not None else list(dataframes.values())[0]

            # Convert appropriate columns to categorical
            for col in self.df.columns:
                if self.df[col].dtype == 'object' and self.df[col].nunique() < 20:
                    self.df[col] = self.df[col].astype('category')

            # Save combined data for reference
            self.df.to_csv("combined_data.csv", index=False)
            print(f"Combined data saved to combined_data.csv: {len(self.df)} rows")

            # Update visualization controls
            self.fill_comboboxes()
            self.hist_btn.setEnabled(True)
            self.scatter_btn.setEnabled(True)

            self.describe_features()

        except Exception as e:
            print(f"Warning: Could not create combined DataFrame: {e}")
            self.df = None
            QMessageBox.warning(
                self,
                "Warning",
                f"Could not create combined DataFrame for visualization:\n{str(e)}\n\n"
                "You can still view individual tables."
            )

    def preview_table(self):
        """Preview selected table"""
        try:
            table = self.table_selector.currentText()
            df = pd.read_sql(f"SELECT * FROM {table} LIMIT 10", self.engine)

            text = f"Table: {table}\n\n"
            text += "First 10 rows:\n"
            text += df.to_string()
            text += f"\n\nTotal rows in table: {pd.read_sql(f'SELECT COUNT(*) FROM {table}', self.engine).iloc[0, 0]}\n\n"
            text += "Data types:\n"
            text += df.dtypes.to_string()

            self.table_view.setText(text)

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Failed to preview table:\n{str(e)}")

    def describe_features(self):
        """Print feature descriptions for analysis"""
        if self.df is not None:
            print("\n=== FEATURE DESCRIPTION ===")

            numeric = self.df.select_dtypes(include="number").columns
            categorical = self.df.select_dtypes(include=["object", "category"]).columns
            binary = [c for c in self.df.columns if self.df[c].nunique() == 2]

            print("Quantitative features:", list(numeric))
            print("Categorical features:", list(categorical))
            print("Binary features:", binary)
            print(f"\nTotal rows: {len(self.df)}")
            print(f"Total columns: {len(self.df.columns)}")
        else:
            print("No combined data available for analysis")

    def fill_comboboxes(self):
        """Fill comboboxes with column names"""
        if self.df is not None:
            num = self.df.select_dtypes(include="number").columns.tolist()
            cat = self.df.select_dtypes(include=["category", "object"]).columns.tolist()

            self.combo_x.clear()
            self.combo_y.clear()
            self.combo_size.clear()
            self.combo_hue.clear()

            self.combo_x.addItems(num)
            self.combo_y.addItems(num)
            self.combo_size.addItems([""] + num)
            self.combo_hue.addItems([""] + cat)

    def plot_histogram(self):
        """Plot histogram of selected column"""
        if self.df is not None:
            self.figure.clear()
            ax = self.figure.add_subplot(111)

            col = self.combo_x.currentText()
            if col:
                ax.hist(self.df[col].dropna(), bins=30, edgecolor='black')
                ax.set_title(f"Histogram: {col}")
                ax.set_xlabel(col)
                ax.set_ylabel("Frequency")

                self.canvas.draw()
            else:
                QMessageBox.warning(self, "Warning", "Please select an X column")
        else:
            QMessageBox.warning(self, "Warning", "No data loaded for visualization")

    def plot_scatter(self):
        """Plot multivariate analysis"""
        if self.df is not None:
            self.figure.clear()
            ax = self.figure.add_subplot(111)

            x_col = self.combo_x.currentText()
            y_col = self.combo_y.currentText()

            if x_col and y_col:
                try:
                    hue_val = self.combo_hue.currentText() or None
                    size_val = self.combo_size.currentText() or None

                    # Create scatterplot
                    sns.scatterplot(
                        data=self.df,
                        x=x_col,
                        y=y_col,
                        hue=hue_val,
                        size=size_val,
                        sizes=(20, 200),
                        alpha=0.7,
                        ax=ax
                    )

                    ax.set_title("Multivariate Analysis")
                    ax.set_xlabel(x_col)
                    ax.set_ylabel(y_col)

                    # Adjust legend position if needed
                    if hue_val or size_val:
                        ax.legend(bbox_to_anchor=(1.05, 1), loc='upper right')

                    self.canvas.draw()

                except Exception as e:
                    QMessageBox.critical(self, "Error", f"Failed to create plot:\n{str(e)}")
            else:
                QMessageBox.warning(self, "Warning", "Please select X and Y columns")
        else:
            QMessageBox.warning(self, "Warning", "No data loaded for visualization")


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = DataVizApp()
    window.show()
    sys.exit(app.exec())