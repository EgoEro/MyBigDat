import os
import re
import string
from collections import Counter

import nltk
from nltk.corpus import stopwords as nltk_stopwords
from nltk.stem import SnowballStemmer
from sklearn.feature_extraction.text import TfidfVectorizer
import matplotlib.pyplot as plt
from wordcloud import WordCloud

nltk.download('stopwords')
nltk.download('punkt')

FOLDER_PATH = "CPU_HDD"
LANGUAGE = "russian"

russian_stopwords = set(nltk_stopwords.words('russian'))
english_stopwords = set(nltk_stopwords.words('english'))

all_stopwords = russian_stopwords.union(english_stopwords)

punctuation = string.punctuation + '—…«»“”'

stemmer_ru = SnowballStemmer("russian")
stemmer_en = SnowballStemmer("english")

def stem_word(word, lang):
    if lang == 'russian':
        return stemmer_ru.stem(word)
    else:
        return stemmer_en.stem(word)

def read_texts_from_folder(folder):
    documents = []
    for filename in os.listdir(folder):
        if filename.endswith('.txt'):
            with open(os.path.join(folder, filename), 'r', encoding='utf-8') as f:
                text = f.read()
                documents.append((filename, text))
    return documents

def clean_text(text, lang, remove_foreign=True, do_stem=True):
    text = text.lower()
    text = re.sub(f'[{re.escape(punctuation)}0-9]', ' ', text)
    words = text.split()
    words = [w for w in words if w not in all_stopwords and len(w) > 1]
    
    if remove_foreign:
        if lang == 'russian':
            words = [w for w in words if re.fullmatch(r'[а-яё]+', w)]
        else:
            words = [w for w in words if re.fullmatch(r'[a-z]+', w)]
    
    if do_stem:
        words = [stem_word(w, lang) for w in words]
    
    return words

def main():
    docs = read_texts_from_folder(FOLDER_PATH)
    if not docs:
        return
        
    processed_docs = []
    all_words = []

    for filename, text in docs:
        words = clean_text(text, LANGUAGE, remove_foreign=True, do_stem=True)
        processed_docs.append(' '.join(words))
        all_words.extend(words)

    word_freq = Counter(all_words)
    print("\n10 самых частых слов (после стемминга):")
    for word, count in word_freq.most_common(10):
        print(f"  {word}: {count}")
    
    vectorizer = TfidfVectorizer(max_features=100, stop_words=None)
    tfidf_matrix = vectorizer.fit_transform(processed_docs)
    feature_names = vectorizer.get_feature_names_out()
    
    tfidf_sum = tfidf_matrix.sum(axis=0).A1
    word_importance = dict(zip(feature_names, tfidf_sum))
    sorted_importance = sorted(word_importance.items(), key=lambda x: x[1], reverse=True)
    
    print("\n10 слов с наибольшим суммарным TF-IDF:")
    for word, score in sorted_importance[:10]:
        print(f"  {word}: {score:.4f}")
    
    wordcloud = WordCloud(
        width=800, height=400,
        background_color='white',
        max_words=100,
        colormap='viridis',
        font_path=None
    ).generate_from_frequencies(word_freq)
    
    plt.figure(figsize=(10, 5))
    plt.imshow(wordcloud, interpolation='bilinear')
    plt.axis('off')
    plt.title(f'WordCloud – наиболее частые слова (стемминг, язык: {LANGUAGE})')
    plt.show()

if __name__ == "__main__":
    main()