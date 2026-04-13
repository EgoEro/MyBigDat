import re
import nltk
import matplotlib.pyplot as plt
from sklearn.feature_extraction.text import TfidfVectorizer
from wordcloud import WordCloud
from gensim.models import Word2Vec
from sklearn.manifold import TSNE
import numpy as np
import warnings

warnings.filterwarnings('ignore')

# Загружаем все необходимые ресурсы NLTK
try:
    nltk.data.find('tokenizers/punkt')
except LookupError:
    nltk.download('punkt', quiet=True)

try:
    nltk.data.find('tokenizers/punkt_tab')
except LookupError:
    nltk.download('punkt_tab', quiet=True)

try:
    nltk.data.find('corpora/stopwords')
except LookupError:
    nltk.download('stopwords', quiet=True)

# Для лемматизации
import pymorphy3
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import SnowballStemmer

# 1. Получить файлы с текстовыми данными
file_paths = ['искусственный_интеллект_6.txt', 'искусственный_интеллект_3.txt']

# 2. Загрузить файлы и сформировать датасет
texts = []
for path in file_paths:
    try:
        with open(path, 'r', encoding='utf-8') as f:
            texts.append(f.read())
        print(f"Файл {path} успешно загружен")
    except FileNotFoundError:
        print(f"Файл {path} не найден!")
        exit(1)

# Объединяем все тексты в одну строку
full_text = ' '.join(texts)
print(f"Общий размер текста: {len(full_text)} символов")

# 3. Лемматизация и стемминг с помощью pymorphy3
print("Выполняется лемматизация...")
morph = pymorphy3.MorphAnalyzer()
stemmer = SnowballStemmer('russian')


def lemmatize_text(text):
    # Разбиваем текст на слова (простой способ, чтобы избежать ошибок токенизации)
    words = re.findall(r'[а-яА-ЯёЁ]+', text.lower())
    lemmatized = []
    for word in words:
        try:
            lemmatized.append(morph.parse(word)[0].normal_form)
        except:
            lemmatized.append(word)
    return ' '.join(lemmatized)


def stem_text(text):
    words = re.findall(r'[а-яА-ЯёЁ]+', text.lower())
    stemmed = [stemmer.stem(word) for word in words]
    return ' '.join(stemmed)


# Выбираем лемматизацию (можно заменить на стемминг)
lemmatized_text = lemmatize_text(full_text)
print("Лемматизация завершена")

# 4. Привести все слова к нижнему регистру. Удалить знаки препинания.
# (Уже сделано в функции лемматизации)
cleaned_text = lemmatized_text

# 5. Удалить стоп-слова
print("Удаление стоп-слов...")
russian_stopwords = set(stopwords.words('russian'))
english_stopwords = set(stopwords.words('english'))
all_stopwords = russian_stopwords.union(english_stopwords)

# Добавляем дополнительные стоп-слова
extra_stopwords = {'это', 'весь', 'который', 'также', 'такой', 'быть', 'мочь', 'свой',
                   'наш', 'ваш', 'самый', 'очень', 'более', 'менее', 'потом', 'теперь',
                   'вдруг', 'опять', 'даже', 'именно', 'только', 'ещё', 'уже', 'вот'}
all_stopwords.update(extra_stopwords)

words = cleaned_text.split()
filtered_words = [word for word in words if word not in all_stopwords and len(word) > 2]
filtered_text = ' '.join(filtered_words)
print(f"После удаления стоп-слов осталось {len(filtered_words)} слов")

# 6. Рассчитать метрики TF-IDF
print("Расчет TF-IDF...")
# Разбиваем на "документы" (группы по 50 слов)
sentences = []
for i in range(0, len(filtered_words), 50):
    chunk = ' '.join(filtered_words[i:i + 50])
    if len(chunk.split()) > 10:
        sentences.append(chunk)

if len(sentences) < 2:
    sentences = [filtered_text[:1000], filtered_text[1000:2000]]

vectorizer = TfidfVectorizer(max_features=50)
tfidf_matrix = vectorizer.fit_transform(sentences)
feature_names = vectorizer.get_feature_names_out()
tfidf_scores = tfidf_matrix.sum(axis=0).A1
word_tfidf = dict(zip(feature_names, tfidf_scores))
sorted_words_tfidf = sorted(word_tfidf.items(), key=lambda x: x[1], reverse=True)

print("\nТоп-15 слов по TF-IDF:")
for i, (word, score) in enumerate(sorted_words_tfidf[:15], 1):
    print(f"{i:2d}. {word}: {score:.4f}")

# 7. Построить график наиболее частых слов с помощью WordCloud
print("Построение облака слов...")
wordcloud = WordCloud(width=800, height=400, background_color='white', max_words=50,
                      colormap='viridis', random_state=42, font_path=None).generate(filtered_text)

plt.figure(figsize=(12, 6))
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis('off')
plt.title('Облако слов (наиболее частые слова после обработки)', fontsize=16, pad=20)
plt.tight_layout()
plt.show()

# 8. Подготовить данные для обучения Word2Vec
print("Подготовка данных для Word2Vec...")
# Создаем предложения для Word2Vec
tokenized_sentences = []
current_sentence = []

for word in filtered_words:
    current_sentence.append(word)
    if len(current_sentence) >= 10:  # Каждые 10 слов - новое "предложение"
        tokenized_sentences.append(current_sentence.copy())
        current_sentence = []

if len(current_sentence) > 3:
    tokenized_sentences.append(current_sentence)

print(f"Создано {len(tokenized_sentences)} предложений для обучения")

# 9. Обучить модель Word2Vec
print("Обучение модели Word2Vec...")
model_w2v = Word2Vec(sentences=tokenized_sentences, vector_size=100,
                     window=5, min_count=2, workers=4, sg=1, epochs=10)

print(f"Модель обучена. Размер словаря: {len(model_w2v.wv)} слов")

# 10. Проверить близкие слова
test_words = ['интеллект', 'искусственный', 'человек', 'будущее', 'компьютер']

for test_word in test_words:
    if test_word in model_w2v.wv:
        similar_words = model_w2v.wv.most_similar(test_word, topn=8)
        print(f"\nСлова, близкие к '{test_word}':")
        for word, sim in similar_words:
            print(f"  {word}: {sim:.4f}")
    else:
        print(f"\nСлово '{test_word}' не найдено в словаре Word2Vec")

# 11. Построить график t-SNE для 15 наиболее часто встречающихся слов
print("\nПостроение t-SNE визуализации...")
top_15_words = [word for word, _ in sorted_words_tfidf[:15]]
word_vectors = []
valid_words = []

for word in top_15_words:
    if word in model_w2v.wv:
        word_vectors.append(model_w2v.wv[word])
        valid_words.append(word)

if len(word_vectors) >= 3:
    perplexity = min(5, len(valid_words) - 1)
    tsne = TSNE(n_components=2, random_state=42, perplexity=perplexity)
    reduced = tsne.fit_transform(np.array(word_vectors))

    plt.figure(figsize=(12, 8))
    colors = plt.cm.viridis(np.linspace(0, 1, len(valid_words)))

    for i, word in enumerate(valid_words):
        x, y = reduced[i]
        plt.scatter(x, y, c=[colors[i]], s=100, alpha=0.7)
        plt.annotate(word, (x, y), fontsize=11, alpha=0.9,
                     bbox=dict(boxstyle="round,pad=0.3", facecolor="white", alpha=0.7))

    plt.title('t-SNE визуализация 15 наиболее частых слов', fontsize=14)
    plt.xlabel('Компонента 1')
    plt.ylabel('Компонента 2')
    plt.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.show()
else:
    print(f"Недостаточно слов с векторами для t-SNE. Найдено: {len(word_vectors)}")

print("\nПрограмма успешно завершена!")