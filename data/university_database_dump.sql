--
-- PostgreSQL database dump
--

\restrict llezew94HQps1oV7TiRCnAuygBCsid8HHbNMVsvs2Aqqcv935Dzswws9clqEfYn

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tbolumler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbolumler (
    id smallint NOT NULL,
    fakulte_tfakultelerid smallint,
    kisaltma character varying(30),
    adi character varying(250)
);


ALTER TABLE public.tbolumler OWNER TO postgres;

--
-- Name: tdersialanogrenciler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tdersialanogrenciler (
    id integer NOT NULL,
    ders_tderslerid integer,
    ogrenci_tkullanicilarid integer,
    vize double precision,
    final double precision,
    harf character varying(5)
);


ALTER TABLE public.tdersialanogrenciler OWNER TO postgres;

--
-- Name: tdersler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tdersler (
    id integer NOT NULL,
    bolum_tbolumlerid smallint,
    adi character varying(250),
    teori smallint NOT NULL,
    uygulama smallint NOT NULL,
    akts smallint NOT NULL
);


ALTER TABLE public.tdersler OWNER TO postgres;

--
-- Name: tfakulteler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tfakulteler (
    id smallint NOT NULL,
    adi character varying(250),
    kisaltma character varying(10),
    tur smallint,
    durum boolean
);


ALTER TABLE public.tfakulteler OWNER TO postgres;

--
-- Name: tilceler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tilceler (
    id smallint NOT NULL,
    adi character varying(150),
    il_tillerid smallint
);


ALTER TABLE public.tilceler OWNER TO postgres;

--
-- Name: tiller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tiller (
    id smallint NOT NULL,
    adi character varying(100)
);


ALTER TABLE public.tiller OWNER TO postgres;

--
-- Name: tkangruplari; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tkangruplari (
    id smallint NOT NULL,
    adi character(10)
);


ALTER TABLE public.tkangruplari OWNER TO postgres;

--
-- Name: tkullanicilar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tkullanicilar (
    id integer NOT NULL,
    adi character varying(255),
    soyadi character varying(255),
    eposta character varying(255),
    ceptel character varying(20),
    dogumtarihi date,
    dogumyeri_tilcelerid smallint,
    cinsiyet boolean,
    tckimlikno character varying(11),
    kangrubu_tkangruplariid smallint
);


ALTER TABLE public.tkullanicilar OWNER TO postgres;

--
-- Name: togrenciler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.togrenciler (
    id integer NOT NULL,
    bolum_tbolumlerid smallint,
    ogrenci_tkullanicilarid integer,
    ogrencino character varying(9) NOT NULL,
    baslangictarihi date,
    mezuniyettarihi date
);


ALTER TABLE public.togrenciler OWNER TO postgres;

--
-- Name: tyazokuluucretleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tyazokuluucretleri (
    id integer NOT NULL,
    ders_tderslerid integer,
    ogrenci_tkullanicilarid integer,
    ucret double precision,
    islemtarihi timestamp without time zone
);


ALTER TABLE public.tyazokuluucretleri OWNER TO postgres;

--
-- Data for Name: tbolumler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbolumler (id, fakulte_tfakultelerid, kisaltma, adi) FROM stdin;
1	4	İst_L	İstatistik Lisans Programı
2	4	Mat_L	Matematik Lisans Programı
3	4	Psi_L	Psikoloji Lisans Programı
4	5	Huk_L	Hukuk Lisans Programı
5	2	Görİlt_L	Görsel İletişim Tasarımı Lisans Programı
6	2	Halkİlş_L	Halkla İlişkiler Lisans Programı
7	2	Medİlt_L	Medya ve İletişim Sistemleri Lisans Programı
8	3	BilgMüh_L	Bilgisayar Mühendisliği Lisans Programı
9	3	ElekMüh_L(İng)	Elektrik-Elektronik Mühendisliği İngilizce Lisans Programı
10	3	EndMüh_L	Endüstri Mühendisliği Lisans Programı
11	15	İçm_L	İç Mimarlık ve Çevre Tasarımı Lisans Programı
12	3	MekMüh_L_İng	Mekatronik Mühendisliği İngilizce Lisans Programı
13	15	MTeksT_L	Moda ve Tekstil Tasarımı Lisans Programı
14	3	MücMüh_L_İng	Mücevherat Mühendisliği İngilizce Lisans Programı
15	1	Ban_L	Bankacılık ve Finans Lisans Programı
16	1	İkt_L(İng)	İktisat İngilizce Lisans Programı
17	1	İşl_L_İng	İşletme İngilizce Lisans Programı
18	1	İşl_L	İşletme Lisans Programı
19	1	Turİşl_L(TBF)	Turizm İşletmeciliği (TBF) Lisans Programı
20	1	Uli_L	Uluslararası İlişkiler Lisans Programı
21	1	UlTic_L	Uluslararası Ticaret Lisans Programı
22	6	BilgPro_ÖL	Bilgisayar Programcılığı Önlisans Programı
27	6	DışTic_ÖL	Dış Ticaret Önlisans Programı
28	6	HavLoj_ÖL(İng)	Hava Lojistiği İngilizce Önlisans Programı
29	6	HavYHizm_ÖL(İng)	Havacılıkta Yer Hizmetleri Yönetimi İngilizce Önlisans Programı
30	6	Loj_ÖL	Lojistik Önlisans Programı
35	6	PerSatMağY_ÖL	Perakende Satış ve Mağaza Yönetimi Önlisans Programı
38	8	Mat_YL(Tli)	Matematik Tezli Yüksek Lisans Programı
39	8	Mat_DR	Matematik Doktora Programı
40	8	EndFiz_YL(Tsiz)	Endüstriyel Fizik Tezsiz Yüksek Lisans Programı
41	8	İst_YL(Tli)	İstatistik Tezli Yüksek Lisans Programı
42	8	BilgMüh_YL(Tli)	Bilgisayar Mühendisliği Tezli Yüksek Lisans Programı
43	8	EndMüh_YL(Tli)	Endüstri Mühendisliği Tezli Yüksek Lisans Programı
44	7	İşl_YL(Tli)	İşletme Tezli Yüksek Lisans Programı
45	7	İşl_DR	İşletme Doktora Programı
46	7	Ban_YL(Tsiz)	Bankacılık ve Finans Tezsiz Yüksek Lisans Programı
47	7	MuhDen_YL(Tli)	Muhasebe ve Denetim Tezli Yüksek Lisans Programı
48	7	UygPsi_YL(Tsiz)	Uygulamalı Psikoloji Tezsiz Yüksek Lisans Programı
49	7	Halkİlş_YL(Tli)	Halkla İlişkiler Tezli Yüksek Lisans Programı
50	7	Medİlt_YL(Tli)	Medya ve İletişim Sistemleri Tezli Yüksek Lisans Programı
51	7	Uli_YL(Tli)	Uluslararası İlişkiler Tezli Yüksek Lisans Programı
52	7	ÖzHuk_YL(Tli)	Özel Hukuk Tezli Yüksek Lisans Programı
53	9	UlTicHukAB_YL(Tli)	Uluslararası Ticaret Hukuku ve Avrupa Birliği Tezli Yüksek Lisans Programı
54	9	UlTicABHuk_DR	Uluslararası Ticaret ve Avrupa Birliği Hukuku Doktora Programı
55	1	MuhDen_L	Muhasebe ve Denetim Lisans Programı
56	7	KamHuk_YL(Tli)	Kamu Hukuku Tezli Yüksek Lisans Programı
57	7	UlTic_YL(Tli)	Uluslararası Ticaret (SBE) Tezli Yüksek Lisans Programı
61	7	İşl_YL_İng(Tli)	İşletme İngilizce Tezli Yüksek Lisans Programı
63	1	Eko_L	Ekonomi Lisans Programı
64	14	FinEko_DR	Finansal Ekonomi Doktora Programı
65	8	EndMüh_DR	Endüstri Mühendisliği Doktora Programı
66	8	MekMüh_Yl(Tli)	Mekatronik Mühendisliği Tezli Yüksek Lisans Programı
67	8	MücMüh_YL(Tli)	Mücevherat Mühendisliği Tezli Yüksek Lisans Programı
68	8	BilgMüh_D	Bilgisayar Mühendisliği Doktora Programı
69	8	MekMüh_DR	Mekatronik Mühendisliği Doktora Programı
70	8	MücMüh_DR	Mücevherat Mühendisliği Doktora Programı
72	14	UlFin_YL_İng(Tli)	Uluslararası Finans İngilizce Tezli Yüksek Lisans Programı
73	9	UlTic_YL(Tli)	Uluslararası Ticaret Tezli Yüksek Lisans Programı
75	4	Sos_L	Sosyoloji Lisans Programı
76	10	UlLoj_L	Uluslararası Lojistik Lisans Programı
77	10	SivHavUlşİ_L	Sivil Hava Ulaştırma İşletmeciliği Lisans Programı
78	10	BasYayÜ_L	Basım Yayın Üretim Teknolojileri Lisans Programı
79	14	Ban_DR	Bankacılık Doktora Programı
80	3	TeksMüh_L	Tekstil Mühendisliği Lisans Programı
81	9	TicDip_YL(Tli)	Ticari Diplomasi Tezli Yüksek Lisans Programı
82	9	TicDip_YL(Tsiz)	Ticari Diplomasi Tezsiz Yüksek Lisans Programı
83	9	TicDip_YL_İng(Tli)	Ticari Diplomasi İngilizce Tezli Yüksek Lisans Programı
84	9	TicDip_YL_İng(Tsiz)	Ticari Diplomasi İngilizce Tezsiz Yüksek Lisans Programı
85	7	MuhDen_DR	Muhasebe ve Denetim Doktora Programı
86	7	İky_YL(Tli)	İnsan Kaynakları Yöneticiliği Tezli Yüksek Lisans Programı
87	7	İkt_YL(Tli)	İktisat Tezli Yüksek Lisans Programı
88	14	SigRiskY_Y	Sirta ve Risk Yönetimi Tezli Yüksek Lisans Programı
89	14	Sig_YL(Tsi	Sirtacılık Tezsiz Yüksek Lisans Programı
90	7	ADanE_YL(Tli)	Aile Danışmanlığı ve Eğitimi Tezli Yüksek Lisans Programı
93	4	EğtmB	Eğitim Bilimleri Bölümü
103	6	MuhVergUyg_ÖL	Muhasebe ve Vergi Uygulamaları Önlisans Programı
107	15	EndTas_L	Endüstriyel Tasarım Lisans Programı
108	15	Mim_L	Mimarlık Lisans Programı
109	13	Pre/AP	Pre/AP
110	13	L1	Level 1
111	13	L2	Level 2
112	13	L3	Level 3
113	13	L4	Level 4
115	13	TOEFL	TOEFL Sınav Merkezi
116	9	KürPazMY_YL(Tli)	Küresel Pazarlama ve Marka Yönetimi Tezli Yüksek Lisans Programı
117	9	UlTic_DR	Uluslararası Ticaret Doktora Programı
118	9	UlTic_YL_İng(Tli)	Uluslararası Ticaret İngilizce Tezli Yüksek Lisans Programı
119	9	KürPazMY_YL(Tsiz)	Küresel Pazarlama ve Marka Yönetimi Tezsiz Yüksek Lisans Programı
120	9	UlTic_YL(Tsiz)	Uluslararası Ticaret Tezsiz Yüksek Lisans Programı
121	9	UlTic_YL_İng(Tsiz)	Uluslararası Ticaret İngilizce Tezsiz Yüksek Lisans Programı
122	9	KürPazMY_YL_BH(Tli)	Küresel Pazarlama ve Marka Yönetimi Tezli Bilimsel Hazırlık Programı
123	9	KürPazMY_YL_BH(Tsiz)	Küresel Pazarlama ve Marka Yönetimi Tezsiz Bilimsel Hazırlık Programı
124	9	TicDip_BH_İng(Tli)	Ticari Diplomasi İngilizce Tezli Bilimsel Hazırlık Programı
125	9	TicDip_BH_İng(Tsiz)	Ticari Diplomasi İngilizce Tezsiz Bilimsel Hazırlık Programı
126	9	TicDip_BH(Tli)	Ticari Diplomasi Tezli Bilimsel Hazırlık Programı
127	9	TicDip_BH(Tsiz)	Ticari Diplomasi Tezsiz Bilimsel Hazırlık Programı
128	14	UlFin_BH_İng(Tli)	Uluslararası Finans İngilizce Tezli Bilimsel Hazırlık Programı
129	14	UlFin_BH_İng(Tsiz)	Uluslararası Finans İngilizce Tezsiz Bilimsel Hazırlık Programı
130	14	UlFin_YL_İng(Tsiz)	Uluslararası Finans İngilizce Tezsiz Yüksek Lisans Programı
131	9	UlTic_BH_İng(Tli)	Uluslararası Ticaret İngilizce Tezli Bilimsel Hazırlık Programı
132	9	UlTic_BH_İng(Tsiz)	Uluslararası Ticaret İngilizce Tezsiz Bilimsel Hazırlık Programı
133	9	UlTic_Bh(Tli)	Uluslararası Ticaret Tezli Bilimsel Hazırlık Programı
134	9	UlTic_BH(Tsiz)	Uluslararası Ticaret Tezsiz Bilimsel Hazırlık Programı
135	8	BilgMüh_DR_BH	Bilgisayar Mühendisliği Doktora Bilimsel Hazırlık Programı
136	8	BilgMüh_YL_BH(Tli)	Bilgisayar Mühendisliği Tezli Bilimsel Hazırlık Programı
137	8	BilgMüh_YL_BH(Tsiz)	Bilgisayar Mühendisliği Tezsiz Bilimsel Hazırlık Programı
138	8	BilgMüh_YL(Tsiz)	Bilgisayar Mühendisliği Tezsiz Yüksek Lisans Programı
139	8	EndMüh_DR_BH	Endüstri Mühendisliği Doktora Bilimsel Hazırlık Programı
140	8	EndMüh_YL_BH(Tli)	Endüstri Mühendisliği Tezli Bilimsel Hazırlık Programı
141	8	EndMüh_YL_BH(Tsiz)	Endüstri Mühendisliği Tezsiz Bilimsel Hazırlık Programı
142	8	EndMüh_YL(Tsiz)	Endüstri Mühendisliği Tezsiz Yüksek Lisans Programı
143	8	EndFiz_YL_BH(Tsiz)	Endüstriyel Fizik Tezsiz Bilimsel Hazırlık Programı
144	8	GayGelKentDönP_YL(Tli)	Gayrimenkul Geliştirme Kentsel Dönüşüm ve Planlama Tezli Yüksek Lisans Programı
145	8	GayGelKentDönP_YL(Tsiz)	Gayrimenkul Geliştirme Kentsel Dönüşüm ve Planlama Tezsiz Yüksek Lisans Programı
146	8	İçm_YL(Tli)	İç Mimarlık Tezli Yüksek Lisans Programı
147	8	İçm_YL(Tsiz)	İç Mimarlık Tezsiz Yüksek Lisans Programı
148	8	İst_YL_BH(Tli)	İstatistik Tezli Bilimsel Hazırlık Programı
149	8	İst_YL_BH(Tsiz)	İstatistik Tezsiz Bilimsel Hazırlık Programı
150	8	İst_YL(Tsiz)	İstatistik Tezsiz Yüksek Lisans Programı
151	8	İşSağG_DR	İş Sağlığı ve Güvenliği Doktora Programı
152	8	İşSağG_YL(Tli)	İş Sağlığı ve Güvenliği Tezli Yüksek Lisans Programı
153	8	İşSağG_YL(Tsiz)	İş Sağlığı ve Güvenliği Tezsiz Yüksek Lisans Programı
154	8	Mat_DR_BH	Matematik Doktora Bilimsel Hazırlık Programı
155	8	Mat_YL_BH(Tli)	Matematik Tezli Bilimsel Hazırlık Programı
156	8	Mat_YL_BH(Tsiz)	Matematik Tezsiz Bilimsel Hazırlık Programı
157	8	Mat_YL(Tsiz)	Matematik Tezsiz Yüksek Lisans Programı
158	8	MekMüh_DR_BH	Mekatronik Mühendisliği Doktora Bilimsel Hazırlık Programı
159	8	MekMüh_DR_BH_İng	Mekatronik Mühendisliği İngilizce Doktora Bilimsel Hazırlık Programı
160	8	MekMüh_DR_İng	Mekatronik Mühendisliği İngilizce Doktora Programı
161	8	MekMüh_BH_İng(Tli)	Mekatronik Mühendisliği İngilizce Tezli Bilimsel Hazırlık Programı
162	8	MekMüh_YL_İng(Tli)	Mekatronik Mühendisliği İngilizce Tezli Yüksek Lisans Programı
163	8	MekMüh_BH_İng(Tsiz)	Mekatronik Mühendisliği İngilizce Tezsiz Bilimsel Hazırlık Programı
164	8	MekMüh_YL_İng(Tsiz)	Mekatronik Mühendisliği İngilizce Tezsiz Yüksek Lisans Programı
165	8	MekMüh_BH(Tli)	Mekatronik Mühendisliği Tezli Bilimsel Hazırlık Programı
166	8	MekMüh_BH(Tsiz)	Mekatronik Mühendisliği Tezsiz Bilimsel Hazırlık Programı
167	8	MekMüh_YL(Tsiz)	Mekatronik Mühendisliği Tezsiz Yüksek Lisans Programı
168	8	MücMüh_DR_BH	Mücevherat Mühendisliği Doktora Bilimsel Hazırlık Programı
169	8	MücMüh_BH(Tli)	Mücevherat Mühendisliği Tezli Bilimsel Hazırlık Programı
170	8	MücMüh_BH(Tsiz)	Mücevherat Mühendisliği Tezsiz Bilimsel Hazırlık Programı
171	8	MücMüh_YL(Tsiz)	Mücevherat Mühendisliği Tezsiz Yüksek Lisans Programı
172	8	ÖzlÖğrFBE_BH	Özel Öğrenci (FBE) Doktora Bilimsel Hazırlık Programı
173	8	ÖzlÖğrFBE_DR	Özel Öğrenci (FBE) Doktora Programı
174	8	ÖzlÖğrFBE_BH(Tsiz)	Özel Öğrenci (FBE) Tezsiz Bilimsel Hazırlık Programı
175	8	ÖzlÖğrFBE_YL(Tsiz)	Özel Öğrenci (FBE) Tezsiz Yüksek Lisans Programı
176	8	SibGüv_YL(Tli)	Siber Güvenlik Tezli Yüksek Lisans Programı
177	8	SibGüv_YL(Tsiz)	Siber Güvenlik Tezsiz Yüksek Lisans Programı
178	6	BilgDestYay_ÖL	Bilgisayar Destekli Yayıncılık Önlisans Programı
179	6	BilgTek_ÖL_İng	Bilgisayar Teknolojisi (UOÖLP-Hackney Community College İngiltere) İngilizce Önlisans Programı
180	6	BilgTek_ÖL(İÖ)	Bilgisayar Teknolojisi ve Programlama (İ.Ö.) Önlisans Programı
181	6	BilgTek_ÖL	Bilgisayar Teknolojisi ve Programlama Önlisans Programı
182	6	DışTic_ÖL(İÖ)	Dış Ticaret (İ.Ö.) Önlisans Programı
183	6	METEB_ÖL_İÖ	METEB (İ.Ö.) Önlisans Programı
184	6	Muh_ÖL_İÖ	Muhasebe (İ.Ö.) Önlisans Programı
185	6	Muh_ÖL	Muhasebe Önlisans Programı
186	6	MuhVergUyg_ÖL_İÖ	Muhasebe ve Vergi Uygulamaları (İ.Ö.) Önlisans Programı
187	6	Paz_ÖL	Pazarlama Önlisans Programı
188	6	UlLoj_ÖL	Uluslararası Lojistik Önlisans Programı
189	7	AFÇUİ_YL_BH_İng(Tli)	Afrika Çalışmaları ve Uluslararası İlişkiler İngilizce Tezli Bilimsel Hazırlık Programı
190	7	AFÇUİ_YL_İng(Tli)	Afrika Çalışmaları ve Uluslararası İlişkiler İngilizce Tezli Yüksek Lisans Programı
191	7	AFÇUİ_BH_İng(Tsiz)	Afrika Çalışmaları ve Uluslararası İlişkiler İngilizce Tezsiz Bilimsel Hazırlık Programı
192	7	AFÇUİ_YL_İng(Tsiz)	Afrika Çalışmaları ve Uluslararası İlişkiler İngilizce Tezsiz Yüksek Lisans Programı
193	7	ADanE_YL_BH(Tli)	Aile Danışmanlığı ve Eğitimi Tezli Bilimsel Hazırlık Programı
194	7	ADanE_YL_BH(Tsiz)	Aile Danışmanlığı ve Eğitimi Tezsiz Bilimsel Hazırlık Programı
195	7	ADanE_YL(Tsiz)	Aile Danışmanlığı ve Eğitimi Tezsiz Yüksek Lisans Programı
196	14	Ban_DR_BH	Bankacılık Doktora Bilimsel Hazırlık Programı
197	7	Ban_YL_BH(Tsiz)	Bankacılık ve Finans Tezsiz Bilimsel Hazırlık Programı
198	14	FinEko_DR_	Finansal Ekonomi Doktora Bilimsel Hazırlık Programı
199	7	GayGelKentDönP_YL_BH(Tli)	Gayrimenkul Yönetimi Tezli Bilimsel Hazırlık Programı
200	7	GayGelKentDönP_YL(Tli)	Gayrimenkul Yönetimi Tezli Yüksek Lisans Programı
201	7	GayGelKentDönP_YL_BH(Tsiz)	Gayrimenkul Yönetimi Tezsiz Bilimsel Hazırlık Programı
202	7	GayGelKentDönP_YL(Tsiz)	Gayrimenkul Yönetimi Tezsiz Yüksek Lisans Programı
203	7	Halkİlş_YL_BH(Tli)	Halkla İlişkiler Tezli Bilimsel Hazırlık Programı
204	7	Halkİlş_YL_BH(Tsiz)	Halkla İlişkiler Tezsiz Bilimsel Hazırlık Programı
205	7	Halkİlş_YL(Tsiz)	Halkla İlişkiler Tezsiz Yüksek Lisans Programı
206	7	Halkİlş_DR_BH	Halkla İlişkiler ve Reklamcılık Doktora Bilimsel Hazırlık Programı
207	7	Halkİlş_DR	Halkla İlişkiler ve Reklamcılık Doktora Programı
208	7	İkt_YL_BH_İng(Tli)	İktisat İngilizce Tezli Bilimsel Hazırlık Programı
209	7	İkt_YL_İng(Tli)	İktisat İngilizce Tezli Yüksek Lisans Programı
210	7	İkt_YL_BH_İng(Tsiz)	İktisat İngilizce Tezsiz Bilimsel Hazırlık Programı
211	7	İkt_YL_İng(Tsiz)	İktisat İngilizce Tezsiz Yüksek Lisans Programı
212	7	İkt_YL_BH(Tli)	İktisat Tezli Bilimsel Hazırlık Programı
213	7	İkt_YL_BH(Tsiz)	İktisat Tezsiz Bilimsel Hazırlık Programı
214	7	İkt_YL(Tsiz)	İktisat Tezsiz Yüksek Lisans Programı
215	7	İky_YL(Tsiz)_Brs	İnsan Kaynakları Yöneticiliği (Bursa) Tezsiz Yüksek Lisans Programı
216	7	İky_YL_BH(Tli)	İnsan Kaynakları Yöneticiliği Tezli Bilimsel Hazırlık Programı
217	7	İky_YL_BH(Tsiz)	İnsan Kaynakları Yöneticiliği Tezsiz Bilimsel Hazırlık Programı
218	7	İky_YL(Tsiz)	İnsan Kaynakları Yöneticiliği Tezsiz Yüksek Lisans Programı
219	7	İşl_YL(Tsiz)_Brs	İşletme (Bursa) Tezsiz Yüksek Lisans Programı
220	7	İşl_DR_BH	İşletme Doktora Bilimsel Hazırlık Programı
221	7	İşl_YL_BH_İng(Tli)	İşletme İngilizce Tezli Bilimsel Hazırlık Programı
222	7	İşl_YL_BH_İng(Tsiz)	İşletme İngilizce Tezsiz Bilimsel Hazırlık Programı
223	7	İşl_YL_İng(Tsiz)	İşletme İngilizce Tezsiz Yüksek Lisans Programı
224	7	İşl_YL_BH(Tli)	İşletme Tezli Bilimsel Hazırlık Programı
225	7	İşl_YL_BH(Tsiz)	İşletme Tezsiz Bilimsel Hazırlık Programı
226	7	İşl_YL(Tsiz)	İşletme Tezsiz Yüksek Lisans Programı
227	7	İşlYön_YL(Tli)	İşletme Yönetimi Tezli Yüksek Lisans Programı
228	7	KamHuk_YL_BH(Tli)	Kamu Hukuku Tezli Bilimsel Hazırlık Programı
229	7	KamHuk_YL_BH(Tsiz)	Kamu Hukuku Tezsiz Bilimsel Hazırlık Programı
230	7	KamHuk_YL(Tsiz)	Kamu Hukuku Tezsiz Yüksek Lisans Programı
231	7	Loj_YL_BH(Tli)	Lojistik Yönetimi Tezli Bilimsel Hazırlık Programı
232	7	Loj_YL(Tli)	Lojistik Yönetimi Tezli Yüksek Lisans Programı
233	7	Loj_YL_BH(Tsiz)	Lojistik Yönetimi Tezsiz Bilimsel Hazırlık Programı
234	7	Loj_YL(Tsiz)	Lojistik Yönetimi Tezsiz Yüksek Lisans Programı
235	7	Medİlt_DR_BH	Medya ve İletişim Çalışmaları Doktora Bilimsel Hazırlık Programı
236	7	Medİlt_DR	Medya ve İletişim Çalışmaları Doktora Programı
237	7	Medİlt_BH(Tli)	Medya ve İletişim Sistemleri Tezli Bilimsel Hazırlık Programı
238	7	Medİlt_BH(Tsiz)	Medya ve İletişim Sistemleri Tezsiz Bilimsel Hazırlık Programı
239	7	Medİlt_YL(Tsiz)	Medya ve İletişim Sistemleri Tezsiz Yüksek Lisans Programı
240	7	MuhDen_YL(Tsiz)_Brs	Muhasebe ve Denetim (Bursa) Tezsiz Yüksek Lisans Programı
241	7	MuhDen_DR_BH	Muhasebe ve Denetim Doktora Bilimsel Hazırlık Programı
242	7	MuhDen_BH(Tli)	Muhasebe ve Denetim Tezli Bilimsel Hazırlık Programı
243	7	MuhDen_BH(Tsiz)	Muhasebe ve Denetim Tezsiz Bilimsel Hazırlık Programı
244	7	MuhDen_YL(Tsiz)	Muhasebe ve Denetim Tezsiz Yüksek Lisans Programı
245	7	ÖzHuk_DR_BH	Özel Hukuk Doktora Bilimsel Hazırlık Programı
246	7	ÖzHuk_DR	Özel Hukuk Doktora Programı
247	7	ÖzHuk_BH(Tsiz)	Özel Hukuk Tezsiz Bilimsel Hazırlık Programı
248	7	ÖzHuk_YL(Tsiz)	Özel Hukuk Tezsiz Yüksek Lisans Programı
249	7	ÖzlÖğrSBE_BH	Özel Öğrenci (SBE) Doktora Bilimsel Hazırlık Programı
250	7	ÖzlÖğrSBE_DR	Özel Öğrenci (SBE) Doktora Programı
251	7	ÖzlÖğrSBE_BH(Tsiz)	Özel Öğrenci (SBE) Tezsiz Bilimsel Hazırlık Programı
252	7	ÖzlÖğrSBE_YL(Tsiz)	Özel Öğrenci (SBE) Tezsiz Yüksek Lisans Programı
253	7	RehPsiDan_YL(Tsiz)_Brs	Rehberlik ve Psikolojik Danışmanlık (Bursa) Tezsiz Yüksek Lisans Programı
254	7	RehPsiDan_BH(Tsiz)	Rehberlik ve Psikolojik Danışmanlık Tezsiz Bilimsel Hazırlık Programı
255	7	RehPsiDan_YL(Tsiz)	Rehberlik ve Psikolojik Danışmanlık Tezsiz Yüksek Lisans Programı
256	14	SigRiskY_B	Sirta ve Risk Yönetimi Tezli Bilimsel Hazırlık Programı
257	14	SigRiskY_B	Sirta ve Risk Yönetimi Tezsiz Bilimsel Hazırlık Programı
258	14	SigRiskY_Y	Sirta ve Risk Yönetimi Tezsiz Yüksek Lisans Programı
259	14	Sig_BH(Tsi	Sirtacılık Tezsiz Bilimsel Hazırlık Programı
260	7	Turİşl_BH(Tli)	Turizm İşletmeciliği Tezli Bilimsel Hazırlık Programı
261	7	Turİşl_YL(Tli)	Turizm İşletmeciliği Tezli Yüksek Lisans Programı
262	7	Turİşl_BH(Tsiz)	Turizm İşletmeciliği Tezsiz Bilimsel Hazırlık Programı
263	7	Turİşl_YL(Tsiz)	Turizm İşletmeciliği Tezsiz Yüksek Lisans Programı
264	14	UlBanF_BH(Tli)	Uluslararası Bankacılık ve Finans Tezli Bilimsel Hazırlık Programı
265	14	UlBanF_YL(Tli)	Uluslararası Bankacılık ve Finans Tezli Yüksek Lisans Programı
266	14	UlBanF_BH(Tsiz)	Uluslararası Bankacılık ve Finans Tezsiz Bilimsel Hazırlık Programı
267	14	UlBanF_YL(Tsiz)	Uluslararası Bankacılık ve Finans Tezsiz Yüksek Lisans Programı
268	7	Uli_BH(Tli)	Uluslararası İlişkiler Tezli Bilimsel Hazırlık Programı
269	7	Uli_BH(Tsiz)	Uluslararası İlişkiler Tezsiz Bilimsel Hazırlık Programı
270	7	Uli_YL(Tsiz)	Uluslararası İlişkiler Tezsiz Yüksek Lisans Programı
271	7	Ulİşl_BH(Tli)	Uluslararası İşletme Tezli Bilimsel Hazırlık Programı
272	7	Ulİşl_Yl(Tli)	Uluslararası İşletme Tezli Yüksek Lisans Programı
273	7	Ulİşl_BH(Tsiz)	Uluslararası İşletme Tezsiz Bilimsel Hazırlık Programı
274	7	Ulİşl_YL(Tsiz)	Uluslararası İşletme Tezsiz Yüksek Lisans Programı
275	7	UlTic_DR_BH	Uluslararası Ticaret (SBE) Doktora Bilimsel Hazırlık Programı
276	7	UlTic_BH(Tli)	Uluslararası Ticaret (SBE) Tezli Bilimsel Hazırlık Programı
277	7	UlTic_BH(Tsiz)	Uluslararası Ticaret (SBE) Tezsiz Bilimsel Hazırlık Programı
278	7	UlTic_YL(Tsiz)	Uluslararası Ticaret (SBE) Tezsiz Yüksek Lisans Programı
279	9	UlTicHukAB_BH(Tli)	Uluslararası Ticaret Hukuku ve Avrupa Birliği Tezli Bilimsel Hazırlık Programı
280	9	UlTicHukAB_BH(Tsiz)	Uluslararası Ticaret Hukuku ve Avrupa Birliği Tezsiz Bilimsel Hazırlık Programı
281	9	UlTicHukAB_YL(Tsiz)	Uluslararası Ticaret Hukuku ve Avrupa Birliği Tezsiz Yüksek Lisans Programı
282	9	UlTicABHuk_DR_BH	Uluslararası Ticaret ve Avrupa Birliği Hukuku Doktora Bilimsel Hazırlık Programı
283	7	UygPsi_YL(Tsiz)_Brs	Uygulamalı Psikoloji (Bursa) Tezsiz Yüksek Lisans Programı
284	7	UygPsi_BH(Tsiz)	Uygulamalı Psikoloji Tezsiz Bilimsel Hazırlık Programı
285	7	UygSos_BH(Tli)	Uygulamalı Sosyoloji Tezli Bilimsel Hazırlık Programı
286	7	UygSos_YL(Tli)	Uygulamalı Sosyoloji Tezli Yüksek Lisans Programı
287	7	UygSos_BH(Tsiz)	Uygulamalı Sosyoloji Tezsiz Bilimsel Hazırlık Programı
288	7	UygSos_YL(Tsiz)	Uygulamalı Sosyoloji Tezsiz Yüksek Lisans Programı
289	1	İkt_L	İktisat Lisans Programı
290	4	SiyBUlİ_L	Siyaset Bilimi ve Uluslararası İlişkiler Lisans Programı
291	10	Turİşl_L(UBF)	Turizm İşletmeciliği (UBF) Lisans Programı
292	4	PedFor_Y	Pedajik Formasyon Yaz Programı
293	7	İşl_YL_BH(Tsiz)_Brs	İşletme (Bursa) Tezsiz Bilimsel Hazırlık Programı
294	7	RehPsiDan_BH(Tsiz)_Brs	Rehberlik ve Psikolojik Danışmanlık (Bursa) Tezsiz Bilimsel Hazırlık Programı
295	4	PedFor_G	Pedajik Formasyon Güz Programı
296	4	PedFor_B	Pedajik Formasyon Bahar Programı
297	13	EkYbnDil	Ek Yabancı Diller
298	13	L5	Level 5
299	14	SRYD	Sirta ve Risk Yönetimi Doktora Programı
300	7	RSMİT_YL(Tli)	Reklam ve Stratejik Marka İletişimi Tezli Yüksek Lisans Programı
301	7	RSMİY_YL(Tsiz)	Reklam ve Stratejik Marka İletişimi Tezsiz Yüksek Lisans Programı
302	2	REK_L	Reklamcılık Lisans Programı
303	14	Bank_YL(Tsiz)	Bankacılık Tezsiz Yüksek Lisans Programı
304	14	SermPiys_YL(Tsiz)	Sermaye Piyasası Tezsiz Yüksek Lisans Programı
305	8	İst_DR	İstatistik Doktora Programı
306	7	SanPolTekYön_YL(Tli),	Sanayi Politikaları ve Teknoloji Yönetimi Tezli Yüksek Lisans Programı
307	7	SanPolTekYön_YL(Tsiz)	Sanayi Politikaları ve Teknoloji Yönetimi Tezsiz Yüksek Lisans Programı
308	7	SanPolTekYön_BH(Tli),	Sanayi Politikaları ve Teknoloji Yönetimi Tezli Bilimesl Hazırlık Yüksek Lisans Programı
309	7	SanPolTekYön_BH(Tsiz),	Sanayi Politikaları ve Teknoloji Yönetimi Tezsiz Bilimsel Hazırlık Yüksek Lisans Programı
310	7		Sinema Tezli Yüksek Lisans Programı
311	7		Sinema Tezsiz Yüksek Lisans Programı
313	1	TUR-OTE-YÖN_İŞL	Turizm ve Otel Yöneticiliği Bölümü
314	1	HVC_İŞL	Havacılık Yönetimi Bölümü
315	1	ULS-LOJ_İŞL	Uluslararası Lojistik Bölümü
316	2	H-İ-R_İLET	Halkla İlişkiler ve Reklamcılık Bölümü
318	3	İNŞA_MÜH	İnşaat Mühendisliği Bölümü
319	8	Ken.Sis.Ulş.Yön.Tli.YL	Kentsel Sistemler ve Ulaştırma Yönetimi Tezli Yüksek Lisans Programı
320	8	Ken.Sis.Ulş.Yön.Tsiz.YL	Kentsel Sistemler ve Ulaştırma Yönetimi Tezsiz Yüksek Lisans Programı
\.


--
-- Data for Name: tdersialanogrenciler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tdersialanogrenciler (id, ders_tderslerid, ogrenci_tkullanicilarid, vize, final, harf) FROM stdin;
1	50	8875	38	7	\N
2	102	8875	79	38	\N
3	154	8875	88	17	\N
4	59	7857	25	83	\N
5	111	7857	58	16	\N
6	163	7857	8	51	\N
7	61	2368	15	2	\N
8	113	2368	54	81	\N
9	165	2368	8	89	\N
10	29	7031	14	12	\N
11	81	7031	97	100	\N
12	133	7031	49	34	\N
13	25	5225	75	34	\N
14	77	5225	60	18	\N
15	129	5225	21	44	\N
16	24	7306	76	76	\N
17	76	7306	12	2	\N
18	128	7306	89	71	\N
19	30	2208	68	58	\N
20	82	2208	13	26	\N
21	134	2208	72	66	\N
22	64	8639	69	98	\N
23	116	8639	77	21	\N
24	168	8639	31	60	\N
25	49	6243	88	12	\N
26	101	6243	10	85	\N
27	153	6243	69	90	\N
28	44	8546	63	13	\N
29	96	8546	90	7	\N
30	148	8546	71	56	\N
31	39	5129	86	69	\N
32	91	5129	65	24	\N
33	143	5129	55	52	\N
34	25	7533	60	97	\N
35	77	7533	78	94	\N
36	129	7533	92	67	\N
37	28	7592	41	88	\N
38	80	7592	66	39	\N
39	132	7592	23	37	\N
40	59	8644	90	36	\N
41	111	8644	56	10	\N
42	163	8644	64	61	\N
43	25	6450	44	9	\N
44	77	6450	34	38	\N
45	129	6450	88	53	\N
46	55	8473	8	25	\N
47	107	8473	18	87	\N
48	159	8473	88	60	\N
49	56	8137	80	24	\N
50	108	8137	41	79	\N
51	160	8137	32	66	\N
52	28	7443	78	82	\N
53	80	7443	11	48	\N
54	132	7443	40	99	\N
55	53	4444	45	25	\N
56	105	4444	95	78	\N
57	157	4444	15	59	\N
58	31	6582	5	16	\N
59	83	6582	100	67	\N
60	135	6582	94	38	\N
61	45	8983	49	73	\N
62	97	8983	85	62	\N
63	149	8983	1	94	\N
64	20	5383	20	32	\N
65	72	5383	95	57	\N
66	124	5383	19	27	\N
67	54	8723	90	9	\N
68	106	8723	3	60	\N
69	158	8723	34	47	\N
70	40	7193	82	71	\N
71	92	7193	99	35	\N
72	144	7193	83	13	\N
73	52	7882	89	5	\N
74	104	7882	55	72	\N
75	156	7882	99	1	\N
76	40	8280	46	72	\N
77	92	8280	87	45	\N
78	144	8280	86	86	\N
79	47	5607	2	100	\N
80	99	5607	23	21	\N
81	151	5607	33	92	\N
82	42	5528	53	67	\N
83	94	5528	92	6	\N
84	146	5528	63	85	\N
85	58	6115	93	67	\N
86	110	6115	2	97	\N
87	162	6115	61	71	\N
88	32	7862	68	80	\N
89	84	7862	29	34	\N
90	136	7862	24	24	\N
91	44	7562	88	7	\N
92	96	7562	41	67	\N
93	148	7562	40	94	\N
94	27	6472	14	79	\N
95	79	6472	69	39	\N
96	131	6472	22	7	\N
97	46	8516	31	85	\N
98	98	8516	87	78	\N
99	150	8516	35	15	\N
100	16	5238	9	70	\N
101	68	5238	89	75	\N
102	120	5238	41	37	\N
103	44	5438	77	63	\N
104	96	5438	53	68	\N
105	148	5438	24	90	\N
106	58	8434	19	18	\N
107	110	8434	39	52	\N
108	162	8434	83	29	\N
109	45	8818	1	58	\N
110	97	8818	2	98	\N
111	149	8818	11	52	\N
112	16	6704	6	24	\N
113	68	6704	23	10	\N
114	120	6704	34	66	\N
115	23	4824	36	98	\N
116	75	4824	58	55	\N
117	127	4824	57	26	\N
118	27	8960	55	3	\N
119	79	8960	49	40	\N
120	131	8960	34	98	\N
121	58	7746	90	23	\N
122	110	7746	46	33	\N
123	162	7746	17	83	\N
124	38	8850	40	63	\N
125	90	8850	38	14	\N
126	142	8850	13	100	\N
127	49	9115	18	44	\N
128	101	9115	25	58	\N
129	153	9115	96	24	\N
130	59	2480	88	26	\N
131	111	2480	84	15	\N
132	163	2480	66	34	\N
133	37	7482	26	84	\N
134	89	7482	2	81	\N
135	141	7482	1	74	\N
136	55	8270	66	43	\N
137	107	8270	33	20	\N
138	159	8270	83	29	\N
139	66	8210	2	5	\N
140	118	8210	1	6	\N
141	170	8210	47	44	\N
142	55	7283	57	12	\N
143	107	7283	58	41	\N
144	159	7283	88	95	\N
145	35	7644	12	100	\N
146	87	7644	47	46	\N
147	139	7644	10	32	\N
148	16	6586	76	21	\N
149	68	6586	78	18	\N
150	120	6586	72	84	\N
151	43	4877	17	92	\N
152	95	4877	18	15	\N
153	147	4877	54	29	\N
154	16	8344	48	71	\N
155	68	8344	21	42	\N
156	120	8344	91	59	\N
157	60	5163	8	92	\N
158	112	5163	46	27	\N
159	164	5163	59	70	\N
160	39	8777	71	95	\N
161	91	8777	83	45	\N
162	143	8777	55	93	\N
163	39	2638	23	19	\N
164	91	2638	68	94	\N
165	143	2638	97	1	\N
166	27	8516	59	22	\N
167	79	8516	31	26	\N
168	131	8516	28	90	\N
169	26	7264	74	79	\N
170	78	7264	91	85	\N
171	130	7264	76	56	\N
172	29	4984	81	81	\N
173	81	4984	10	12	\N
174	133	4984	90	78	\N
175	51	2233	68	77	\N
176	103	2233	67	64	\N
177	155	2233	10	33	\N
178	24	6912	70	72	\N
179	76	6912	80	87	\N
180	128	6912	38	95	\N
181	28	6299	5	21	\N
182	80	6299	64	43	\N
183	132	6299	62	30	\N
184	45	5597	30	27	\N
185	97	5597	10	36	\N
186	149	5597	76	19	\N
187	63	6485	42	80	\N
188	115	6485	53	52	\N
189	167	6485	28	98	\N
190	35	7991	5	41	\N
191	87	7991	33	88	\N
192	139	7991	56	93	\N
193	18	5729	96	57	\N
194	70	5729	65	43	\N
195	122	5729	82	37	\N
196	54	7511	99	7	\N
197	106	7511	100	91	\N
198	158	7511	31	65	\N
199	45	8319	100	31	\N
200	97	8319	71	93	\N
201	149	8319	45	37	\N
202	46	6267	60	90	\N
203	98	6267	55	97	\N
204	150	6267	83	20	\N
205	54	4953	35	21	\N
206	106	4953	72	48	\N
207	158	4953	42	95	\N
208	37	4916	46	64	\N
209	89	4916	46	80	\N
210	141	4916	86	4	\N
211	42	6367	88	2	\N
212	94	6367	12	34	\N
213	146	6367	72	98	\N
214	20	5695	11	57	\N
215	72	5695	24	25	\N
216	124	5695	28	95	\N
217	37	5819	31	10	\N
218	89	5819	75	53	\N
219	141	5819	45	51	\N
220	20	4764	100	16	\N
221	72	4764	78	3	\N
222	124	4764	52	39	\N
223	42	8256	49	47	\N
224	94	8256	89	50	\N
225	146	8256	11	77	\N
226	66	5874	75	25	\N
227	118	5874	94	36	\N
228	170	5874	39	70	\N
229	56	4942	74	26	\N
230	108	4942	68	47	\N
231	160	4942	30	31	\N
232	49	5089	42	40	\N
233	101	5089	32	87	\N
234	153	5089	95	23	\N
235	54	5383	82	1	\N
236	106	5383	80	65	\N
237	158	5383	30	74	\N
238	46	6251	34	73	\N
239	98	6251	95	41	\N
240	150	6251	37	1	\N
241	63	5650	25	4	\N
242	115	5650	93	42	\N
243	167	5650	48	21	\N
244	38	2529	79	82	\N
245	90	2529	23	5	\N
246	142	2529	15	51	\N
247	62	5731	74	61	\N
248	114	5731	44	61	\N
249	166	5731	96	19	\N
250	18	7500	47	4	\N
251	70	7500	83	53	\N
252	122	7500	21	51	\N
253	55	4803	96	62	\N
254	107	4803	59	78	\N
255	159	4803	20	99	\N
256	34	6115	89	52	\N
257	86	6115	5	13	\N
258	138	6115	77	58	\N
259	16	4871	95	62	\N
260	68	4871	81	37	\N
261	120	4871	66	76	\N
262	25	8284	7	24	\N
263	77	8284	57	37	\N
264	129	8284	40	47	\N
265	37	9142	61	53	\N
266	89	9142	42	31	\N
267	141	9142	91	86	\N
268	19	8368	39	55	\N
269	71	8368	51	15	\N
270	123	8368	50	63	\N
271	40	2207	87	81	\N
272	92	2207	78	87	\N
273	144	2207	42	73	\N
274	59	8917	62	77	\N
275	111	8917	32	28	\N
276	163	8917	35	27	\N
277	46	6624	80	40	\N
278	98	6624	75	34	\N
279	150	6624	72	88	\N
280	61	6575	71	85	\N
281	113	6575	96	40	\N
282	165	6575	9	84	\N
283	15	7394	71	66	\N
284	67	7394	16	58	\N
285	119	7394	21	75	\N
286	50	5212	59	99	\N
287	102	5212	92	60	\N
288	154	5212	79	23	\N
289	44	5405	61	12	\N
290	96	5405	88	44	\N
291	148	5405	56	67	\N
292	64	3745	97	66	\N
293	116	3745	25	96	\N
294	168	3745	57	27	\N
295	65	9078	48	19	\N
296	117	9078	18	6	\N
297	169	9078	30	30	\N
298	49	7766	71	80	\N
299	101	7766	45	50	\N
300	153	7766	86	47	\N
301	48	9071	29	27	\N
302	100	9071	81	87	\N
303	152	9071	37	78	\N
304	65	8454	23	38	\N
305	117	8454	6	98	\N
306	169	8454	50	19	\N
307	24	5500	9	96	\N
308	76	5500	84	23	\N
309	128	5500	65	76	\N
310	37	6639	1	57	\N
311	89	6639	6	17	\N
312	141	6639	47	73	\N
313	37	4975	56	23	\N
314	89	4975	56	21	\N
315	141	4975	8	59	\N
316	28	5014	5	89	\N
317	80	5014	64	39	\N
318	132	5014	5	11	\N
319	58	7001	57	16	\N
320	110	7001	82	64	\N
321	162	7001	82	80	\N
322	64	7713	14	100	\N
323	116	7713	76	78	\N
324	168	7713	80	8	\N
325	45	8637	70	64	\N
326	97	8637	71	11	\N
327	149	8637	44	8	\N
328	29	4812	61	15	\N
329	81	4812	53	32	\N
330	133	4812	34	60	\N
331	26	6282	90	47	\N
332	78	6282	44	37	\N
333	130	6282	59	15	\N
334	49	2224	62	54	\N
335	101	2224	48	71	\N
336	153	2224	49	89	\N
337	65	5441	39	48	\N
338	117	5441	6	89	\N
339	169	5441	42	53	\N
340	55	9121	11	69	\N
341	107	9121	61	31	\N
342	159	9121	16	85	\N
343	35	6890	52	69	\N
344	87	6890	99	87	\N
345	139	6890	76	55	\N
346	34	4732	93	82	\N
347	86	4732	53	31	\N
348	138	4732	38	58	\N
349	51	5960	58	34	\N
350	103	5960	18	59	\N
351	155	5960	21	64	\N
352	65	6469	21	28	\N
353	117	6469	72	5	\N
354	169	6469	43	37	\N
355	42	5569	49	52	\N
356	94	5569	69	42	\N
357	146	5569	5	35	\N
358	24	5225	22	31	\N
359	76	5225	70	39	\N
360	128	5225	5	94	\N
361	50	8119	89	92	\N
362	102	8119	44	27	\N
363	154	8119	13	37	\N
364	34	8567	4	31	\N
365	86	8567	24	55	\N
366	138	8567	61	97	\N
367	38	5688	54	40	\N
368	90	5688	99	83	\N
369	142	5688	20	50	\N
370	26	8086	72	66	\N
371	78	8086	42	59	\N
372	130	8086	68	80	\N
373	15	5871	16	24	\N
374	67	5871	75	25	\N
375	119	5871	51	69	\N
376	58	9008	98	82	\N
377	110	9008	20	50	\N
378	162	9008	63	98	\N
379	64	5497	12	23	\N
380	116	5497	62	41	\N
381	168	5497	24	92	\N
382	35	6201	20	33	\N
383	87	6201	16	40	\N
384	139	6201	60	16	\N
385	36	5663	18	69	\N
386	88	5663	26	27	\N
387	140	5663	51	15	\N
388	32	2608	95	97	\N
389	84	2608	52	15	\N
390	136	2608	46	11	\N
391	65	7259	98	67	\N
392	117	7259	77	64	\N
393	169	7259	27	25	\N
394	24	4873	17	61	\N
395	76	4873	72	23	\N
396	128	4873	37	5	\N
397	58	8668	84	75	\N
398	110	8668	8	73	\N
399	162	8668	8	20	\N
400	43	7179	68	89	\N
401	95	7179	47	51	\N
402	147	7179	45	34	\N
403	19	6985	46	28	\N
404	71	6985	82	77	\N
405	123	6985	10	95	\N
406	46	6441	66	58	\N
407	98	6441	27	42	\N
408	150	6441	14	40	\N
409	52	9135	100	97	\N
410	104	9135	62	33	\N
411	156	9135	79	49	\N
412	28	5121	63	50	\N
413	80	5121	67	6	\N
414	132	5121	38	81	\N
415	34	4797	37	62	\N
416	86	4797	45	19	\N
417	138	4797	59	36	\N
418	33	8026	9	86	\N
419	85	8026	68	38	\N
420	137	8026	53	50	\N
421	47	5516	48	74	\N
422	99	5516	44	30	\N
423	151	5516	22	75	\N
424	61	5245	22	92	\N
425	113	5245	11	1	\N
426	165	5245	30	75	\N
427	38	8586	15	27	\N
428	90	8586	65	50	\N
429	142	8586	53	3	\N
430	53	7185	31	92	\N
431	105	7185	54	53	\N
432	157	7185	3	64	\N
433	18	2219	30	65	\N
434	70	2219	32	16	\N
435	122	2219	62	61	\N
436	28	6938	94	85	\N
437	80	6938	20	90	\N
438	132	6938	60	22	\N
439	56	9006	50	52	\N
440	108	9006	6	39	\N
441	160	9006	33	60	\N
442	59	7597	44	62	\N
443	111	7597	96	88	\N
444	163	7597	28	85	\N
445	35	7891	86	33	\N
446	87	7891	89	55	\N
447	139	7891	17	80	\N
448	40	6369	91	14	\N
449	92	6369	88	1	\N
450	144	6369	19	19	\N
451	36	6907	29	43	\N
452	88	6907	98	17	\N
453	140	6907	98	20	\N
454	18	5995	46	45	\N
455	70	5995	97	4	\N
456	122	5995	9	6	\N
457	16	4762	72	52	\N
458	68	4762	84	59	\N
459	120	4762	75	21	\N
460	58	7955	18	38	\N
461	110	7955	16	59	\N
462	162	7955	59	20	\N
463	62	2591	85	91	\N
464	114	2591	55	19	\N
465	166	2591	42	53	\N
466	40	5663	91	50	\N
467	92	5663	80	47	\N
468	144	5663	88	49	\N
469	34	4667	81	15	\N
470	86	4667	56	22	\N
471	138	4667	59	17	\N
472	64	2314	12	23	\N
473	116	2314	86	35	\N
474	168	2314	86	70	\N
475	19	5968	79	15	\N
476	71	5968	94	24	\N
477	123	5968	54	31	\N
478	32	7228	49	14	\N
479	84	7228	7	50	\N
480	136	7228	75	63	\N
481	19	5285	60	89	\N
482	71	5285	24	44	\N
483	123	5285	94	23	\N
484	47	5304	32	46	\N
485	99	5304	25	82	\N
486	151	5304	40	56	\N
487	15	7461	30	62	\N
488	67	7461	63	87	\N
489	119	7461	47	69	\N
490	39	2335	34	92	\N
491	91	2335	32	78	\N
492	143	2335	53	66	\N
493	59	4733	39	57	\N
494	111	4733	13	100	\N
495	163	4733	43	84	\N
496	23	8075	85	80	\N
497	75	8075	78	84	\N
498	127	8075	21	64	\N
499	62	4927	62	61	\N
500	114	4927	70	61	\N
501	166	4927	60	70	\N
502	43	6315	34	7	\N
503	95	6315	63	12	\N
504	147	6315	71	70	\N
505	29	8888	26	15	\N
506	81	8888	56	92	\N
507	133	8888	14	55	\N
508	48	5023	22	65	\N
509	100	5023	23	62	\N
510	152	5023	41	73	\N
511	55	8145	1	25	\N
512	107	8145	63	48	\N
513	159	8145	100	13	\N
514	40	4903	80	60	\N
515	92	4903	73	13	\N
516	144	4903	27	72	\N
517	28	8448	20	32	\N
518	80	8448	12	83	\N
519	132	8448	31	1	\N
520	34	6412	54	87	\N
521	86	6412	47	32	\N
522	138	6412	78	8	\N
523	24	9079	61	80	\N
524	76	9079	97	95	\N
525	128	9079	18	1	\N
526	21	8084	26	62	\N
527	73	8084	25	88	\N
528	125	8084	36	9	\N
529	31	8817	27	59	\N
530	83	8817	74	31	\N
531	135	8817	6	86	\N
532	34	7258	48	25	\N
533	86	7258	41	22	\N
534	138	7258	79	5	\N
535	24	7141	50	40	\N
536	76	7141	64	76	\N
537	128	7141	28	84	\N
538	24	7205	75	42	\N
539	76	7205	57	28	\N
540	128	7205	63	55	\N
541	58	2286	41	79	\N
542	110	2286	13	69	\N
543	162	2286	88	63	\N
544	20	4742	20	20	\N
545	72	4742	8	68	\N
546	124	4742	72	77	\N
547	26	8401	10	39	\N
548	78	8401	5	84	\N
549	130	8401	77	36	\N
550	54	6282	26	20	\N
551	106	6282	21	78	\N
552	158	6282	43	51	\N
553	52	7873	65	99	\N
554	104	7873	44	31	\N
555	156	7873	82	100	\N
556	54	8135	2	68	\N
557	106	8135	28	86	\N
558	158	8135	4	9	\N
559	31	5074	46	99	\N
560	83	5074	69	78	\N
561	135	5074	90	59	\N
562	25	5663	17	100	\N
563	77	5663	82	84	\N
564	129	5663	83	62	\N
565	55	2207	25	69	\N
566	107	2207	88	46	\N
567	159	2207	42	86	\N
568	50	8443	75	31	\N
569	102	8443	88	94	\N
570	154	8443	94	62	\N
571	58	7882	99	81	\N
572	110	7882	59	8	\N
573	162	7882	76	51	\N
574	63	6710	55	9	\N
575	115	6710	40	91	\N
576	167	6710	48	93	\N
577	49	7803	97	5	\N
578	101	7803	7	28	\N
579	153	7803	96	51	\N
580	49	5233	8	90	\N
581	101	5233	32	70	\N
582	153	5233	15	86	\N
583	18	9057	42	97	\N
584	70	9057	78	50	\N
585	122	9057	40	71	\N
586	41	6486	20	90	\N
587	93	6486	75	65	\N
588	145	6486	10	34	\N
589	15	7797	15	68	\N
590	67	7797	40	34	\N
591	119	7797	69	35	\N
592	49	2298	68	70	\N
593	101	2298	11	96	\N
594	153	2298	33	57	\N
595	34	4945	18	57	\N
596	86	4945	10	24	\N
597	138	4945	34	37	\N
598	47	4840	99	36	\N
599	99	4840	88	14	\N
600	151	4840	50	50	\N
601	50	4774	65	35	\N
602	102	4774	70	71	\N
603	154	4774	10	91	\N
604	56	8605	25	68	\N
605	108	8605	71	41	\N
606	160	8605	81	62	\N
607	61	2583	77	100	\N
608	113	2583	5	71	\N
609	165	2583	97	21	\N
610	41	2618	24	14	\N
611	93	2618	15	99	\N
612	145	2618	13	3	\N
613	43	7215	33	11	\N
614	95	7215	88	91	\N
615	147	7215	3	3	\N
616	18	5582	46	24	\N
617	70	5582	20	61	\N
618	122	5582	57	48	\N
619	30	6488	22	1	\N
620	82	6488	74	97	\N
621	134	6488	6	60	\N
622	55	6280	60	9	\N
623	107	6280	37	69	\N
624	159	6280	84	12	\N
625	64	2576	11	66	\N
626	116	2576	41	39	\N
627	168	2576	46	47	\N
628	28	2371	44	58	\N
629	80	2371	91	90	\N
630	132	2371	88	34	\N
631	40	8862	84	88	\N
632	92	8862	59	61	\N
633	144	8862	95	69	\N
634	63	8338	97	33	\N
635	115	8338	21	5	\N
636	167	8338	34	84	\N
637	65	6138	82	59	\N
638	117	6138	54	31	\N
639	169	6138	42	2	\N
640	47	4761	6	17	\N
641	99	4761	89	65	\N
642	151	4761	96	88	\N
643	30	5763	27	95	\N
644	82	5763	85	67	\N
645	134	5763	66	19	\N
646	50	6901	46	51	\N
647	102	6901	41	80	\N
648	154	6901	50	32	\N
649	24	6034	98	73	\N
650	76	6034	26	5	\N
651	128	6034	38	55	\N
652	53	7565	20	53	\N
653	105	7565	41	98	\N
654	157	7565	17	68	\N
655	33	5806	76	45	\N
656	85	5806	61	71	\N
657	137	5806	56	19	\N
658	34	6914	14	40	\N
659	86	6914	65	16	\N
660	138	6914	68	84	\N
661	50	4992	85	76	\N
662	102	4992	2	36	\N
663	154	4992	61	87	\N
664	55	6558	89	63	\N
665	107	6558	24	84	\N
666	159	6558	29	73	\N
667	44	7500	56	35	\N
668	96	7500	7	21	\N
669	148	7500	6	42	\N
670	38	4418	27	86	\N
671	90	4418	66	18	\N
672	142	4418	17	63	\N
673	26	8619	55	93	\N
674	78	8619	70	41	\N
675	130	8619	82	74	\N
676	55	6968	3	3	\N
677	107	6968	44	2	\N
678	159	6968	25	83	\N
679	2	6886	52	21	\N
680	4	6886	10	38	\N
681	6	6886	72	5	\N
682	7	6886	11	43	\N
683	8	6886	97	41	\N
684	9	6886	24	99	\N
685	74	6886	40	8	\N
686	126	6886	14	49	\N
687	10	6886	55	70	\N
688	11	6886	94	46	\N
689	12	6886	4	24	\N
690	13	6886	18	9	\N
691	14	6886	91	29	\N
692	22	6886	51	24	\N
693	36	8319	42	48	\N
694	88	8319	77	45	\N
695	140	8319	34	96	\N
696	17	5832	12	98	\N
697	69	5832	47	24	\N
698	121	5832	18	79	\N
699	60	7112	5	59	\N
700	112	7112	60	11	\N
701	164	7112	53	54	\N
702	23	6905	46	25	\N
703	75	6905	46	21	\N
704	127	6905	55	7	\N
705	61	8684	2	45	\N
706	113	8684	93	46	\N
707	165	8684	36	40	\N
708	23	8689	37	24	\N
709	75	8689	41	33	\N
710	127	8689	9	23	\N
711	24	7738	92	43	\N
712	76	7738	14	68	\N
713	128	7738	52	4	\N
714	60	8683	49	47	\N
715	112	8683	42	16	\N
716	164	8683	88	96	\N
717	26	6294	64	20	\N
718	78	6294	99	39	\N
719	130	6294	25	40	\N
720	35	8045	62	93	\N
721	87	8045	99	16	\N
722	139	8045	12	75	\N
723	17	6454	5	8	\N
724	69	6454	43	2	\N
725	121	6454	74	62	\N
726	52	2439	10	13	\N
727	104	2439	12	45	\N
728	156	2439	8	23	\N
729	43	6590	90	37	\N
730	95	6590	15	29	\N
731	147	6590	39	34	\N
732	2	6475	27	21	\N
733	4	6475	32	86	\N
734	6	6475	48	78	\N
735	7	6475	30	22	\N
736	8	6475	27	16	\N
737	9	6475	14	59	\N
738	74	6475	64	68	\N
739	126	6475	71	92	\N
740	10	6475	99	85	\N
741	11	6475	2	23	\N
742	12	6475	49	35	\N
743	13	6475	45	68	\N
744	14	6475	46	35	\N
745	22	6475	76	100	\N
746	33	2539	52	98	\N
747	85	2539	2	3	\N
748	137	2539	22	40	\N
749	17	4815	31	55	\N
750	69	4815	22	80	\N
751	121	4815	15	58	\N
752	23	2378	80	23	\N
753	75	2378	95	51	\N
754	127	2378	50	4	\N
755	15	6328	44	3	\N
756	67	6328	56	100	\N
757	119	6328	27	22	\N
758	33	8497	2	4	\N
759	85	8497	59	22	\N
760	137	8497	9	22	\N
761	47	5221	17	19	\N
762	99	5221	42	73	\N
763	151	5221	58	73	\N
764	55	7615	1	51	\N
765	107	7615	67	99	\N
766	159	7615	64	47	\N
767	17	7262	19	15	\N
768	69	7262	44	22	\N
769	121	7262	67	12	\N
770	28	7115	71	50	\N
771	80	7115	4	68	\N
772	132	7115	39	8	\N
773	38	6314	88	33	\N
774	90	6314	14	74	\N
775	142	6314	46	96	\N
776	16	5160	85	41	\N
777	68	5160	40	79	\N
778	120	5160	42	97	\N
779	35	8169	6	57	\N
780	87	8169	61	2	\N
781	139	8169	29	4	\N
782	50	5256	87	91	\N
783	102	5256	39	4	\N
784	154	5256	52	15	\N
785	57	2355	68	74	\N
786	109	2355	89	63	\N
787	161	2355	27	44	\N
788	51	6937	20	85	\N
789	103	6937	59	91	\N
790	155	6937	39	17	\N
791	25	5607	39	80	\N
792	77	5607	31	41	\N
793	129	5607	21	2	\N
794	39	5916	43	40	\N
795	91	5916	75	28	\N
796	143	5916	45	83	\N
797	21	6188	62	22	\N
798	73	6188	78	91	\N
799	125	6188	65	77	\N
800	41	4761	18	41	\N
801	93	4761	10	20	\N
802	145	4761	13	9	\N
803	36	8664	51	75	\N
804	88	8664	91	61	\N
805	140	8664	27	53	\N
806	37	6107	46	66	\N
807	89	6107	16	88	\N
808	141	6107	85	74	\N
809	19	5642	18	63	\N
810	71	5642	29	58	\N
811	123	5642	6	92	\N
812	16	8680	36	91	\N
813	68	8680	63	67	\N
814	120	8680	94	97	\N
815	45	8709	18	70	\N
816	97	8709	77	51	\N
817	149	8709	32	28	\N
818	55	7792	45	46	\N
819	107	7792	57	53	\N
820	159	7792	77	77	\N
821	39	4725	45	36	\N
822	91	4725	28	35	\N
823	143	4725	75	61	\N
824	54	8731	78	2	\N
825	106	8731	27	21	\N
826	158	8731	11	91	\N
827	64	7086	82	71	\N
828	116	7086	5	61	\N
829	168	7086	23	11	\N
830	66	2239	15	98	\N
831	118	2239	77	27	\N
832	170	2239	72	46	\N
833	15	8471	52	81	\N
834	67	8471	69	52	\N
835	119	8471	36	89	\N
836	64	9068	70	82	\N
837	116	9068	87	35	\N
838	168	9068	97	17	\N
839	26	9129	81	17	\N
840	78	9129	41	61	\N
841	130	9129	21	99	\N
842	23	7735	10	10	\N
843	75	7735	22	3	\N
844	127	7735	42	38	\N
845	42	8372	92	95	\N
846	94	8372	74	51	\N
847	146	8372	37	71	\N
848	61	8580	2	75	\N
849	113	8580	49	17	\N
850	165	8580	2	78	\N
851	65	7658	23	60	\N
852	117	7658	21	48	\N
853	169	7658	28	75	\N
854	34	6247	44	24	\N
855	86	6247	39	84	\N
856	138	6247	75	23	\N
857	63	5344	96	31	\N
858	115	5344	18	35	\N
859	167	5344	15	64	\N
860	34	8874	70	9	\N
861	86	8874	77	65	\N
862	138	8874	64	78	\N
863	31	7437	78	70	\N
864	83	7437	90	58	\N
865	135	7437	31	72	\N
866	21	7003	80	55	\N
867	73	7003	32	63	\N
868	125	7003	64	88	\N
869	66	7537	98	32	\N
870	118	7537	72	18	\N
871	170	7537	42	81	\N
872	49	7444	28	98	\N
873	101	7444	71	23	\N
874	153	7444	29	67	\N
875	23	2973	22	94	\N
876	75	2973	92	67	\N
877	127	2973	35	66	\N
878	34	6906	64	67	\N
879	86	6906	17	19	\N
880	138	6906	79	40	\N
881	45	9091	80	5	\N
882	97	9091	68	79	\N
883	149	9091	6	10	\N
884	45	8137	3	22	\N
885	97	8137	6	47	\N
886	149	8137	62	92	\N
887	20	2320	1	76	\N
888	72	2320	94	53	\N
889	124	2320	11	88	\N
890	27	5927	24	10	\N
891	79	5927	73	61	\N
892	131	5927	46	59	\N
893	44	5856	8	2	\N
894	96	5856	42	53	\N
895	148	5856	94	93	\N
896	31	6487	97	29	\N
897	83	6487	65	52	\N
898	135	6487	20	41	\N
899	58	7195	83	20	\N
900	110	7195	95	44	\N
901	162	7195	41	41	\N
902	49	8170	61	82	\N
903	101	8170	11	34	\N
904	153	8170	68	45	\N
905	37	5612	28	16	\N
906	89	5612	65	74	\N
907	141	5612	75	50	\N
908	50	6465	28	39	\N
909	102	6465	25	10	\N
910	154	6465	96	58	\N
911	2	4691	35	21	\N
912	4	4691	72	5	\N
913	6	4691	5	41	\N
914	7	4691	8	26	\N
915	8	4691	76	68	\N
916	9	4691	63	27	\N
917	74	4691	29	10	\N
918	126	4691	59	31	\N
919	10	4691	39	70	\N
920	11	4691	20	31	\N
921	12	4691	34	78	\N
922	13	4691	97	79	\N
923	14	4691	93	40	\N
924	22	4691	80	42	\N
925	38	6966	66	19	\N
926	90	6966	84	8	\N
927	142	6966	86	47	\N
928	40	5504	20	44	\N
929	92	5504	1	5	\N
930	144	5504	62	75	\N
931	54	8310	18	37	\N
932	106	8310	26	32	\N
933	158	8310	53	91	\N
934	62	5835	82	79	\N
935	114	5835	44	75	\N
936	166	5835	93	2	\N
937	49	5038	11	36	\N
938	101	5038	10	69	\N
939	153	5038	30	96	\N
940	59	7207	34	31	\N
941	111	7207	68	69	\N
942	163	7207	24	22	\N
943	37	2410	49	92	\N
944	89	2410	28	17	\N
945	141	2410	26	62	\N
946	40	2523	100	56	\N
947	92	2523	14	64	\N
948	144	2523	81	43	\N
949	57	6321	53	76	\N
950	109	6321	74	57	\N
951	161	6321	88	50	\N
952	66	6222	51	33	\N
953	118	6222	44	11	\N
954	170	6222	27	14	\N
955	25	8722	40	51	\N
956	77	8722	24	82	\N
957	129	8722	28	30	\N
958	28	8955	49	46	\N
959	80	8955	49	26	\N
960	132	8955	54	71	\N
961	65	5007	30	86	\N
962	117	5007	2	60	\N
963	169	5007	75	75	\N
964	34	6923	58	98	\N
965	86	6923	24	84	\N
966	138	6923	87	25	\N
967	25	6495	49	30	\N
968	77	6495	60	32	\N
969	129	6495	43	100	\N
970	38	2531	89	30	\N
971	90	2531	26	87	\N
972	142	2531	93	96	\N
973	41	7709	97	75	\N
974	93	7709	38	82	\N
975	145	7709	31	74	\N
976	61	8715	4	25	\N
977	113	8715	35	4	\N
978	165	8715	2	34	\N
979	56	4892	86	88	\N
980	108	4892	60	41	\N
981	160	4892	11	86	\N
982	32	9133	95	81	\N
983	84	9133	81	26	\N
984	136	9133	14	93	\N
985	62	7321	76	18	\N
986	114	7321	82	2	\N
987	166	7321	28	95	\N
988	49	4970	47	39	\N
989	101	4970	70	76	\N
990	153	4970	57	59	\N
991	31	8270	25	26	\N
992	83	8270	7	62	\N
993	135	8270	34	29	\N
994	56	5130	37	95	\N
995	108	5130	27	61	\N
996	160	5130	11	7	\N
997	50	2627	97	23	\N
998	102	2627	3	2	\N
999	154	2627	69	46	\N
1000	47	6100	35	76	\N
1001	99	6100	28	85	\N
1002	151	6100	13	23	\N
1003	36	4984	97	17	\N
1004	88	4984	35	46	\N
1005	140	4984	76	53	\N
1006	62	8644	48	36	\N
1007	114	8644	81	94	\N
1008	166	8644	68	83	\N
1009	29	8074	45	68	\N
1010	81	8074	66	38	\N
1011	133	8074	15	59	\N
1012	49	8726	17	74	\N
1013	101	8726	52	8	\N
1014	153	8726	78	42	\N
1015	21	7984	76	86	\N
1016	73	7984	37	71	\N
1017	125	7984	53	77	\N
1018	55	6671	28	1	\N
1019	107	6671	35	86	\N
1020	159	6671	13	45	\N
1021	16	7684	20	31	\N
1022	68	7684	25	62	\N
1023	120	7684	26	83	\N
1024	23	2513	17	51	\N
1025	75	2513	74	98	\N
1026	127	2513	6	24	\N
1027	32	8650	3	27	\N
1028	84	8650	17	82	\N
1029	136	8650	18	9	\N
1030	35	4870	73	66	\N
1031	87	4870	5	59	\N
1032	139	4870	81	85	\N
1033	58	6258	25	70	\N
1034	110	6258	36	45	\N
1035	162	6258	73	12	\N
1036	53	7898	34	41	\N
1037	105	7898	16	58	\N
1038	157	7898	14	82	\N
1039	40	5432	9	80	\N
1040	92	5432	18	88	\N
1041	144	5432	31	21	\N
1042	39	6901	73	52	\N
1043	91	6901	81	42	\N
1044	143	6901	71	39	\N
1045	28	6435	77	44	\N
1046	80	6435	9	47	\N
1047	132	6435	85	22	\N
1048	50	8923	41	54	\N
1049	102	8923	70	53	\N
1050	154	8923	41	61	\N
1051	16	4790	68	42	\N
1052	68	4790	97	27	\N
1053	120	4790	49	6	\N
1054	50	8713	8	62	\N
1055	102	8713	34	20	\N
1056	154	8713	77	9	\N
1057	19	7654	74	57	\N
1058	71	7654	77	98	\N
1059	123	7654	77	58	\N
1060	31	7317	12	72	\N
1061	83	7317	2	4	\N
1062	135	7317	82	63	\N
1063	38	9044	48	77	\N
1064	90	9044	57	93	\N
1065	142	9044	87	25	\N
1066	47	5381	27	37	\N
1067	99	5381	38	18	\N
1068	151	5381	91	1	\N
1069	58	7119	94	17	\N
1070	110	7119	95	4	\N
1071	162	7119	57	21	\N
1072	24	9113	1	63	\N
1073	76	9113	94	66	\N
1074	128	9113	77	100	\N
1075	60	8978	17	15	\N
1076	112	8978	30	34	\N
1077	164	8978	89	69	\N
1078	2	7254	32	32	\N
1079	4	7254	41	66	\N
1080	6	7254	94	6	\N
1081	7	7254	26	36	\N
1082	8	7254	19	65	\N
1083	9	7254	96	97	\N
1084	74	7254	21	27	\N
1085	126	7254	81	59	\N
1086	10	7254	72	28	\N
1087	11	7254	17	58	\N
1088	12	7254	40	77	\N
1089	13	7254	33	11	\N
1090	14	7254	46	99	\N
1091	22	7254	50	95	\N
1092	61	6489	11	15	\N
1093	113	6489	20	87	\N
1094	165	6489	5	88	\N
1095	64	4733	72	87	\N
1096	116	4733	68	66	\N
1097	168	4733	16	78	\N
1098	19	6636	56	35	\N
1099	71	6636	97	8	\N
1100	123	6636	38	72	\N
1101	47	6483	14	12	\N
1102	99	6483	13	20	\N
1103	151	6483	83	10	\N
1104	16	7374	1	28	\N
1105	68	7374	16	68	\N
1106	120	7374	65	85	\N
1107	26	6468	70	92	\N
1108	78	6468	30	13	\N
1109	130	6468	70	65	\N
1110	38	7592	56	16	\N
1111	90	7592	98	47	\N
1112	142	7592	12	68	\N
1113	15	4904	91	55	\N
1114	67	4904	17	71	\N
1115	119	4904	90	31	\N
1116	66	2258	14	99	\N
1117	118	2258	66	21	\N
1118	170	2258	3	40	\N
1119	48	4997	49	56	\N
1120	100	4997	54	66	\N
1121	152	4997	31	70	\N
1122	64	2648	1	19	\N
1123	116	2648	66	56	\N
1124	168	2648	18	25	\N
1125	63	6661	49	70	\N
1126	115	6661	71	51	\N
1127	167	6661	25	42	\N
1128	23	4770	43	31	\N
1129	75	4770	76	82	\N
1130	127	4770	77	17	\N
1131	26	6214	91	54	\N
1132	78	6214	23	96	\N
1133	130	6214	96	7	\N
1134	29	7178	97	58	\N
1135	81	7178	71	46	\N
1136	133	7178	8	7	\N
1137	41	8519	32	56	\N
1138	93	8519	87	12	\N
1139	145	8519	98	80	\N
1140	59	7234	75	15	\N
1141	111	7234	31	4	\N
1142	163	7234	15	30	\N
1143	40	8147	65	47	\N
1144	92	8147	94	51	\N
1145	144	8147	59	85	\N
1146	54	8704	33	8	\N
1147	106	8704	17	73	\N
1148	158	8704	87	89	\N
1149	39	7685	91	95	\N
1150	91	7685	20	29	\N
1151	143	7685	90	48	\N
1152	20	8181	65	55	\N
1153	72	8181	100	86	\N
1154	124	8181	72	34	\N
1155	51	7081	41	71	\N
1156	103	7081	84	49	\N
1157	155	7081	67	74	\N
1158	51	4797	50	46	\N
1159	103	4797	67	97	\N
1160	155	4797	18	6	\N
1161	56	7712	16	3	\N
1162	108	7712	41	10	\N
1163	160	7712	14	35	\N
1164	50	7335	65	46	\N
1165	102	7335	18	96	\N
1166	154	7335	46	20	\N
1167	32	8218	53	48	\N
1168	84	8218	37	70	\N
1169	136	8218	3	29	\N
1170	46	2264	8	13	\N
1171	98	2264	23	19	\N
1172	150	2264	51	17	\N
1173	49	4736	95	61	\N
1174	101	4736	29	95	\N
1175	153	4736	73	17	\N
1176	38	5641	100	75	\N
1177	90	5641	52	69	\N
1178	142	5641	68	99	\N
1179	39	7623	35	64	\N
1180	91	7623	50	94	\N
1181	143	7623	92	79	\N
1182	29	6015	58	60	\N
1183	81	6015	72	27	\N
1184	133	6015	92	33	\N
1185	38	2494	25	86	\N
1186	90	2494	75	48	\N
1187	142	2494	85	40	\N
1188	46	2458	1	34	\N
1189	98	2458	4	27	\N
1190	150	2458	80	87	\N
1191	15	2427	28	18	\N
1192	67	2427	48	23	\N
1193	119	2427	53	41	\N
1194	54	8597	8	74	\N
1195	106	8597	71	6	\N
1196	158	8597	19	20	\N
1197	64	8031	84	99	\N
1198	116	8031	60	74	\N
1199	168	8031	79	82	\N
1200	37	7369	22	7	\N
1201	89	7369	24	19	\N
1202	141	7369	13	84	\N
1203	21	5120	74	15	\N
1204	73	5120	74	70	\N
1205	125	5120	2	25	\N
1206	20	4683	49	76	\N
1207	72	4683	63	46	\N
1208	124	4683	5	57	\N
1209	55	2297	92	65	\N
1210	107	2297	81	35	\N
1211	159	2297	47	29	\N
1212	26	7910	39	68	\N
1213	78	7910	10	35	\N
1214	130	7910	50	23	\N
1215	27	8674	56	92	\N
1216	79	8674	64	67	\N
1217	131	8674	67	11	\N
1218	34	7878	44	66	\N
1219	86	7878	17	15	\N
1220	138	7878	12	74	\N
1221	32	2493	76	40	\N
1222	84	2493	78	68	\N
1223	136	2493	60	68	\N
1224	32	8775	67	89	\N
1225	84	8775	6	76	\N
1226	136	8775	40	3	\N
1227	58	7844	93	86	\N
1228	110	7844	59	65	\N
1229	162	7844	41	52	\N
1230	45	6029	48	17	\N
1231	97	6029	99	68	\N
1232	149	6029	64	43	\N
1233	25	4664	15	7	\N
1234	77	4664	94	9	\N
1235	129	4664	10	91	\N
1236	64	2511	26	80	\N
1237	116	2511	68	72	\N
1238	168	2511	88	76	\N
1239	15	5508	23	98	\N
1240	67	5508	10	93	\N
1241	119	5508	79	32	\N
1242	58	8120	23	89	\N
1243	110	8120	47	46	\N
1244	162	8120	31	81	\N
1245	51	5033	56	10	\N
1246	103	5033	55	21	\N
1247	155	5033	61	96	\N
1248	58	8775	57	54	\N
1249	110	8775	82	61	\N
1250	162	8775	40	46	\N
1251	53	6274	38	85	\N
1252	105	6274	59	97	\N
1253	157	6274	84	75	\N
1254	48	4765	31	70	\N
1255	100	4765	90	36	\N
1256	152	4765	79	57	\N
1257	15	7593	98	2	\N
1258	67	7593	53	28	\N
1259	119	7593	5	20	\N
1260	16	2440	83	80	\N
1261	68	2440	73	66	\N
1262	120	2440	4	67	\N
1263	49	8209	96	21	\N
1264	101	8209	24	39	\N
1265	153	8209	57	32	\N
1266	49	2546	59	60	\N
1267	101	2546	57	33	\N
1268	153	2546	23	85	\N
1269	31	8698	29	21	\N
1270	83	8698	60	19	\N
1271	135	8698	42	2	\N
1272	49	2546	10	37	\N
1273	101	2546	53	85	\N
1274	153	2546	86	88	\N
1275	54	7684	8	56	\N
1276	106	7684	75	78	\N
1277	158	7684	47	71	\N
1278	58	7017	26	8	\N
1279	110	7017	21	83	\N
1280	162	7017	25	94	\N
1281	15	8067	66	43	\N
1282	67	8067	71	5	\N
1283	119	8067	54	91	\N
1284	62	8598	62	60	\N
1285	114	8598	82	37	\N
1286	166	8598	26	75	\N
1287	17	5984	29	46	\N
1288	69	5984	85	83	\N
1289	121	5984	73	81	\N
1290	40	8418	81	24	\N
1291	92	8418	6	18	\N
1292	144	8418	100	15	\N
1293	16	8708	100	39	\N
1294	68	8708	1	68	\N
1295	120	8708	29	7	\N
1296	40	7243	79	81	\N
1297	92	7243	36	73	\N
1298	144	7243	91	99	\N
1299	27	5162	40	96	\N
1300	79	5162	95	76	\N
1301	131	5162	3	75	\N
1302	53	6258	53	92	\N
1303	105	6258	16	86	\N
1304	157	6258	65	56	\N
1305	16	8956	40	34	\N
1306	68	8956	78	15	\N
1307	120	8956	12	91	\N
1308	33	8548	31	55	\N
1309	85	8548	21	60	\N
1310	137	8548	19	23	\N
1311	62	5446	87	14	\N
1312	114	5446	64	49	\N
1313	166	5446	20	5	\N
1314	38	8037	24	96	\N
1315	90	8037	87	31	\N
1316	142	8037	21	35	\N
1317	47	7881	78	28	\N
1318	99	7881	84	83	\N
1319	151	7881	30	86	\N
1320	52	7832	43	70	\N
1321	104	7832	54	44	\N
1322	156	7832	72	74	\N
1323	31	7747	73	1	\N
1324	83	7747	39	73	\N
1325	135	7747	90	53	\N
1326	58	5453	33	4	\N
1327	110	5453	73	42	\N
1328	162	5453	43	68	\N
1329	15	7916	97	35	\N
1330	67	7916	34	2	\N
1331	119	7916	18	93	\N
1332	23	5381	15	97	\N
1333	75	5381	59	98	\N
1334	127	5381	33	67	\N
1335	66	7164	34	45	\N
1336	118	7164	91	100	\N
1337	170	7164	33	86	\N
1338	15	7597	34	9	\N
1339	67	7597	22	34	\N
1340	119	7597	45	70	\N
1341	60	7385	97	96	\N
1342	112	7385	89	49	\N
1343	164	7385	84	63	\N
1344	45	7116	3	64	\N
1345	97	7116	45	16	\N
1346	149	7116	54	2	\N
1347	35	8112	78	42	\N
1348	87	8112	20	33	\N
1349	139	8112	61	72	\N
1350	63	7985	61	84	\N
1351	115	7985	73	19	\N
1352	167	7985	88	90	\N
1353	28	2202	87	5	\N
1354	80	2202	89	3	\N
1355	132	2202	79	92	\N
1356	59	8525	75	40	\N
1357	111	8525	62	71	\N
1358	163	8525	57	91	\N
1359	29	7202	7	16	\N
1360	81	7202	49	82	\N
1361	133	7202	51	23	\N
1362	30	7298	93	54	\N
1363	82	7298	85	94	\N
1364	134	7298	39	93	\N
1365	19	7987	100	16	\N
1366	71	7987	98	43	\N
1367	123	7987	43	62	\N
1368	36	4836	83	98	\N
1369	88	4836	48	99	\N
1370	140	4836	36	32	\N
1371	25	2336	49	14	\N
1372	77	2336	59	84	\N
1373	129	2336	17	2	\N
1374	29	6639	59	41	\N
1375	81	6639	82	95	\N
1376	133	6639	94	96	\N
1377	36	4790	69	33	\N
1378	88	4790	46	18	\N
1379	140	4790	86	60	\N
1380	49	7202	62	42	\N
1381	101	7202	33	99	\N
1382	153	7202	64	6	\N
1383	60	7267	46	58	\N
1384	112	7267	18	7	\N
1385	164	7267	12	40	\N
1386	32	2281	83	77	\N
1387	84	2281	10	69	\N
1388	136	2281	35	40	\N
1389	53	7097	92	18	\N
1390	105	7097	41	36	\N
1391	157	7097	17	75	\N
1392	45	7073	22	45	\N
1393	97	7073	48	62	\N
1394	149	7073	56	4	\N
1395	31	6479	49	97	\N
1396	83	6479	71	92	\N
1397	135	6479	1	95	\N
1398	37	4690	48	4	\N
1399	89	4690	65	72	\N
1400	141	4690	58	93	\N
1401	48	5300	5	67	\N
1402	100	5300	79	64	\N
1403	152	5300	65	39	\N
1404	59	6975	21	40	\N
1405	111	6975	93	10	\N
1406	163	6975	26	28	\N
1407	52	5646	90	35	\N
1408	104	5646	50	49	\N
1409	156	5646	25	74	\N
1410	38	5083	86	54	\N
1411	90	5083	42	53	\N
1412	142	5083	55	59	\N
1413	27	8705	56	40	\N
1414	79	8705	59	22	\N
1415	131	8705	76	25	\N
1416	51	7841	86	55	\N
1417	103	7841	1	38	\N
1418	155	7841	48	67	\N
1419	42	8263	53	39	\N
1420	94	8263	34	89	\N
1421	146	8263	44	24	\N
1422	25	8297	66	13	\N
1423	77	8297	96	23	\N
1424	129	8297	48	35	\N
1425	2	6559	8	75	\N
1426	4	6559	84	67	\N
1427	6	6559	22	71	\N
1428	7	6559	53	12	\N
1429	8	6559	36	77	\N
1430	9	6559	57	43	\N
1431	74	6559	28	5	\N
1432	126	6559	63	76	\N
1433	10	6559	50	98	\N
1434	11	6559	68	14	\N
1435	12	6559	33	25	\N
1436	13	6559	56	36	\N
1437	14	6559	93	41	\N
1438	22	6559	96	27	\N
1439	30	6411	39	42	\N
1440	82	6411	2	29	\N
1441	134	6411	24	67	\N
1442	50	2430	41	50	\N
1443	102	2430	93	91	\N
1444	154	2430	16	41	\N
1445	41	6110	91	53	\N
1446	93	6110	74	31	\N
1447	145	6110	79	70	\N
1448	32	5877	35	99	\N
1449	84	5877	62	17	\N
1450	136	5877	54	24	\N
1451	62	8086	71	58	\N
1452	114	8086	83	61	\N
1453	166	8086	17	3	\N
1454	30	4989	30	70	\N
1455	82	4989	42	4	\N
1456	134	4989	88	86	\N
\.


--
-- Data for Name: tdersler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tdersler (id, bolum_tbolumlerid, adi, teori, uygulama, akts) FROM stdin;
2	8	Hukuka Giriş	3	0	5
4	8	Genel Matematik	3	0	5
6	8	Bilişim Sistemlerine Giriş	3	0	5
7	8	Alritma ve Programlamaya Giriş	3	1	5
8	8	Veri Yapıları	2	1	5
9	8	Nesneye Dayalı Modelleme ve Programlama	3	0	6
10	8	Python	1	1	5
11	8	Veri Tabanı ve Veri Tabanı Yönetim Sistemleri	4	0	7
12	8	Veri Madenciliği ve İş Zekası	2	0	5
13	8	Sistem Analizi ve Tasarımı	4	0	7
14	8	Mobil Programlama	1	1	5
15	1	Türk Dili	4	0	4
16	2	Türk Dili	4	0	4
17	3	Türk Dili	4	0	4
18	4	Türk Dili	4	0	4
19	5	Türk Dili	4	0	4
20	6	Türk Dili	4	0	4
21	7	Türk Dili	4	0	4
22	8	Türk Dili	4	0	4
23	9	Türk Dili	4	0	4
24	10	Türk Dili	4	0	4
25	11	Türk Dili	4	0	4
26	12	Türk Dili	4	0	4
27	13	Türk Dili	4	0	4
28	14	Türk Dili	4	0	4
29	15	Türk Dili	4	0	4
30	16	Türk Dili	4	0	4
31	17	Türk Dili	4	0	4
32	18	Türk Dili	4	0	4
33	19	Türk Dili	4	0	4
34	20	Türk Dili	4	0	4
35	21	Türk Dili	4	0	4
36	22	Türk Dili	4	0	4
37	27	Türk Dili	4	0	4
38	28	Türk Dili	4	0	4
39	29	Türk Dili	4	0	4
40	30	Türk Dili	4	0	4
41	35	Türk Dili	4	0	4
42	55	Türk Dili	4	0	4
43	63	Türk Dili	4	0	4
44	75	Türk Dili	4	0	4
45	76	Türk Dili	4	0	4
46	77	Türk Dili	4	0	4
47	78	Türk Dili	4	0	4
48	80	Türk Dili	4	0	4
49	103	Türk Dili	4	0	4
50	107	Türk Dili	4	0	4
51	108	Türk Dili	4	0	4
52	178	Türk Dili	4	0	4
53	179	Türk Dili	4	0	4
54	180	Türk Dili	4	0	4
55	181	Türk Dili	4	0	4
56	182	Türk Dili	4	0	4
57	183	Türk Dili	4	0	4
58	184	Türk Dili	4	0	4
59	185	Türk Dili	4	0	4
60	186	Türk Dili	4	0	4
61	187	Türk Dili	4	0	4
62	188	Türk Dili	4	0	4
63	289	Türk Dili	4	0	4
64	290	Türk Dili	4	0	4
65	291	Türk Dili	4	0	4
66	302	Türk Dili	4	0	4
67	1	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
68	2	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
69	3	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
70	4	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
71	5	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
72	6	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
73	7	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
74	8	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
75	9	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
76	10	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
77	11	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
78	12	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
79	13	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
80	14	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
81	15	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
82	16	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
83	17	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
84	18	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
85	19	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
86	20	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
87	21	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
88	22	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
89	27	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
90	28	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
91	29	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
92	30	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
93	35	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
94	55	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
95	63	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
96	75	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
97	76	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
98	77	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
99	78	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
100	80	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
101	103	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
102	107	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
103	108	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
104	178	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
105	179	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
106	180	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
107	181	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
108	182	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
109	183	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
110	184	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
111	185	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
112	186	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
113	187	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
114	188	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
115	289	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
116	290	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
117	291	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
118	302	Atatürk İlkeleri ve İnkılâp Tarihi	4	0	4
119	1	İngilizce	4	0	4
120	2	İngilizce	4	0	4
121	3	İngilizce	4	0	4
122	4	İngilizce	4	0	4
123	5	İngilizce	4	0	4
124	6	İngilizce	4	0	4
125	7	İngilizce	4	0	4
126	8	İngilizce	4	0	4
127	9	İngilizce	4	0	4
128	10	İngilizce	4	0	4
129	11	İngilizce	4	0	4
130	12	İngilizce	4	0	4
131	13	İngilizce	4	0	4
132	14	İngilizce	4	0	4
133	15	İngilizce	4	0	4
134	16	İngilizce	4	0	4
135	17	İngilizce	4	0	4
136	18	İngilizce	4	0	4
137	19	İngilizce	4	0	4
138	20	İngilizce	4	0	4
139	21	İngilizce	4	0	4
140	22	İngilizce	4	0	4
141	27	İngilizce	4	0	4
142	28	İngilizce	4	0	4
143	29	İngilizce	4	0	4
144	30	İngilizce	4	0	4
145	35	İngilizce	4	0	4
146	55	İngilizce	4	0	4
147	63	İngilizce	4	0	4
148	75	İngilizce	4	0	4
149	76	İngilizce	4	0	4
150	77	İngilizce	4	0	4
151	78	İngilizce	4	0	4
152	80	İngilizce	4	0	4
153	103	İngilizce	4	0	4
154	107	İngilizce	4	0	4
155	108	İngilizce	4	0	4
156	178	İngilizce	4	0	4
157	179	İngilizce	4	0	4
158	180	İngilizce	4	0	4
159	181	İngilizce	4	0	4
160	182	İngilizce	4	0	4
161	183	İngilizce	4	0	4
162	184	İngilizce	4	0	4
163	185	İngilizce	4	0	4
164	186	İngilizce	4	0	4
165	187	İngilizce	4	0	4
166	188	İngilizce	4	0	4
167	289	İngilizce	4	0	4
168	290	İngilizce	4	0	4
169	291	İngilizce	4	0	4
170	302	İngilizce	4	0	4
\.


--
-- Data for Name: tfakulteler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tfakulteler (id, adi, kisaltma, tur, durum) FROM stdin;
1	İşletme Fakültesi	İŞF	3	t
2	İletişim Fakültesi	İLF	3	t
3	Mühendislik Fakültesi	MF	3	t
4	İnsan ve Toplum Bilimleri Fakültesi	İTBF	3	t
5	Hukuk Fakültesi	HF	3	t
6	Meslek Yüksek Okulu	MYO	2	t
7	Sosyal Bilimler Enstitüsü	SBE	4	t
8	Fen Bilimleri Enstitüsü	FBE	4	t
9	Dış Ticaret Enstitüsü	DTE	4	t
10	Uygulamalı Bilimler Fakültesi	UBF	3	t
13	Hazırlık Okulu	HAZ	1	t
14	Finans Enstitüsü	FE	4	t
15	Mimarlık ve Tasarım Fakültesi	MTF	3	t
\.


--
-- Data for Name: tilceler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tilceler (id, adi, il_tillerid) FROM stdin;
1	SEYHAN	1
2	CEYHAN	1
3	FEKE	1
4	KARAİSALI	1
5	KARATAŞ	1
6	KOZAN	1
7	POZANTI	1
8	SAİMBEYLİ	1
9	TUFANBEYLİ	1
10	YUMURTALIK	1
11	YÜREĞİR	1
12	ALADAĞ	1
13	İMAMOĞLU	1
14	ADIYAMAN MERKEZ	2
15	BESNİ	2
16	ÇELİKHAN	2
17	GERGER	2
18	GÖLBAŞI	2
19	KAHTA	2
20	SAMSAT	2
21	SİNCİK	2
22	TUT	2
23	AFYONMERKEZ	3
24	BOLVADİN	3
25	ÇAY	3
26	DAZKIRI	3
27	DİNAR	3
28	EMİRDAĞ	3
29	İHSANİYE	3
30	SANDIKLI	3
31	SİNANPAŞA	3
32	SULDANDAĞI	3
33	ŞUHUT	3
34	BAŞMAKÇI	3
35	BAYAT	3
36	İŞCEHİSAR	3
37	ÇOBANLAR	3
38	EVCİLER	3
39	HOCALAR	3
40	KIZILÖREN	3
41	AKSARAY MERKEZ	68
42	ORTAKÖY	68
43	AĞAÇÖREN	68
44	GÜZELYURT	68
45	SARIYAHŞİ	68
46	ESKİL	68
47	GÜLAĞAÇ	68
48	AMASYA MERKEZ	5
49	GÖYNÜÇEK	5
50	GÜMÜŞHACIKÖYÜ	5
51	MERZİFON	5
52	SULUOVA	5
53	TAŞOVA	5
54	HAMAMÖZÜ	5
55	ALTINDAĞ	6
56	AYAS	6
57	BALA	6
58	BEYPAZARI	6
59	ÇAMLIDERE	6
60	ÇANKAYA	6
61	ÇUBUK	6
62	ELMADAĞ	6
63	GÜDÜL	6
64	HAYMANA	6
65	KALECİK	6
66	KIZILCAHAMAM	6
67	NALLIHAN	6
68	POLATLI	6
69	ŞEREFLİKOÇHİSAR	6
70	YENİMAHALLE	6
71	GÖLBAŞI	6
72	KEÇİÖREN	6
73	MAMAK	6
74	SİNCAN	6
75	KAZAN	6
76	AKYURT	6
77	ETİMESGUT	6
78	EVREN	6
79	ANSEKİ	7
80	ALANYA	7
81	ANTALYA MERKEZİ	7
82	ELMALI	7
83	FİNİKE	7
84	GAZİPAŞA	7
85	GÜNDOĞMUŞ	7
86	KAŞ	7
87	KORKUTELİ	7
88	KUMLUCA	7
89	MANAVGAT	7
90	SERİK	7
91	DEMRE	7
92	İBRADI	7
93	KEMER	7
94	ARDAHAN MERKEZ	75
95	GÖLE	75
96	ÇILDIR	75
97	HANAK	75
98	POSOF	75
99	DAMAL	75
100	ARDANUÇ	8
101	ARHAVİ	8
102	ARTVİN MERKEZ	8
103	BORÇKA	8
104	HOPA	8
105	ŞAVŞAT	8
106	YUSUFELİ	8
107	MURGUL	8
108	AYDIN MERKEZ	9
109	BOZDOĞAN	9
110	ÇİNE	9
111	GERMENCİK	9
112	KARACASU	9
113	KOÇARLI	9
114	KUŞADASI	9
115	KUYUCAK	9
116	NAZİLLİ	9
117	SÖKE	9
118	SULTANHİSAR	9
119	YENİPAZAR	9
120	BUHARKENT	9
121	İNCİRLİOVA	9
122	KARPUZLU	9
123	KÖŞK	9
124	DİDİM	9
125	AĞRI MERKEZ	4
126	DİYADİN	4
127	DOĞUBEYAZIT	4
128	ELEŞKİRT	4
129	HAMUR	4
130	PATNOS	4
131	TAŞLIÇAY	4
132	TUTAK	4
133	AYVALIK	10
134	BALIKESİR MERKEZ	10
135	BALYA	10
136	BANDIRMA	10
137	BİGADİÇ	10
138	BURHANİYE	10
139	DURSUNBEY	10
140	EDREMİT	10
141	ERDEK	10
142	GÖNEN	10
143	HAVRAN	10
144	İVRİNDİ	10
145	KEPSUT	10
146	MANYAS	10
147	SAVAŞTEPE	10
148	SINDIRGI	10
149	SUSURLUK	10
150	MARMARA	10
151	GÖMEÇ	10
152	BARTIN MERKEZ	74
153	KURUCAŞİLE	74
154	ULUS	74
155	AMASRA	74
156	BATMAN MERKEZ	72
157	BEŞİRİ	72
158	GERCÜŞ	72
159	KOZLUK	72
160	SASON	72
161	HASANKEYF	72
162	BAYBURT MERKEZ	69
163	AYDINTEPE	69
164	DEMİRÖZÜ	69
165	BOLU MERKEZ	14
166	GEREDE	14
167	GÖYNÜK	14
168	KIBRISCIK	14
169	MENGEN	14
170	MUDURNU	14
171	SEBEN	14
172	DÖRTDİVAN	14
173	YENİÇAĞA	14
174	AĞLASUN	15
175	BUCAK	15
176	BURDUR MERKEZ	15
177	GÖLHİSAR	15
178	TEFENNİ	15
179	YEŞİLOVA	15
180	KARAMANLI	15
181	KEMER	15
182	ALTINYAYLA	15
183	ÇAVDIR	15
184	ÇELTİKÇİ	15
185	GEMLİK	16
186	İNEGÖL	16
187	İZNİK	16
188	KARACABEY	16
189	KELES	16
190	MUDANYA	16
191	MUSTAFA K. PAŞA	16
192	ORHANELİ	16
193	ORHANGAZİ	16
194	YENİŞEHİR	16
195	BÜYÜK ORHAN	16
196	HARMANCIK	16
197	NİLÜFER	16
198	OSMAN GAZİ	16
199	YILDIRIM	16
200	GÜRSU	16
201	KESTEL	16
202	BİLECİK MERKEZ	11
203	BOZÜYÜK	11
204	GÖLPAZARI	11
205	OSMANELİ	11
206	PAZARYERİ	11
207	SÖĞÜT	11
208	YENİPAZAR	11
209	İNHİSAR	11
210	BİNGÖL MERKEZ	12
211	GENÇ	12
212	KARLIOVA	12
213	KİGI	12
214	SOLHAN	12
215	ADAKLI	12
216	YAYLADERE	12
217	YEDİSU	12
218	ADİLCEVAZ	13
219	AHLAT	13
220	BİTLİS MERKEZ	13
221	HİZAN	13
222	MUTKİ	13
223	TATVAN	13
224	GÜROYMAK	13
225	DENİZLİ MERKEZ	20
226	ACIPAYAM	20
227	BULDAN	20
228	ÇAL	20
229	ÇAMELİ	20
230	ÇARDAK	20
231	ÇİVRİL	20
232	GÜNEY	20
233	KALE	20
234	SARAYKÖY	20
235	TAVAS	20
236	BABADAĞ	20
237	BEKİLLİ	20
238	HONAZ	20
239	SERİNHİSAR	20
240	AKKÖY	20
241	BAKLAN	20
242	BEYAĞAÇ	20
243	BOZKURT	20
244	DÜZCE MERKEZ	81
245	AKÇAKOCA	81
246	YIĞILCA	81
247	CUMAYERİ	81
248	GÖLYAKA	81
249	ÇİLİMLİ	81
250	GÜMÜŞOVA	81
251	KAYNAŞLI	81
252	DİYARBAKIR MERKEZ	21
253	BİSMİL	21
254	ÇERMİK	21
255	ÇINAR	21
256	ÇÜNGÜŞ	21
257	DİCLE	21
258	ERGANİ	21
259	HANİ	21
260	HAZRO	21
261	KULP	21
262	LİCE	21
263	SİLVAN	21
264	EĞİL	21
265	KOCAKÖY	21
266	EDİRNE MERKEZ	22
267	ENEZ	22
268	HAVSA	22
269	İPSALA	22
270	KEŞAN	22
271	LALAPAŞA	22
272	MERİÇ	22
273	UZUNKÖPRÜ	22
274	SÜLOĞLU	22
275	ELAZIĞ MERKEZ	23
276	AĞIN	23
277	BASKİL	23
278	KARAKOÇAN	23
279	KEBAN	23
280	MADEN	23
281	PALU	23
282	SİVRİCE	23
283	ARICAK	23
284	KOVANCILAR	23
285	ALACAKAYA	23
286	ERZURUM MERKEZ	25
287	PALANDÖKEN	25
288	AŞKALE	25
289	ÇAT	25
290	HINIS	25
291	HORASAN	25
292	OLTU	25
293	İSPİR	25
294	KARAYAZI	25
295	NARMAN	25
296	OLUR	25
297	PASİNLER	25
298	ŞENKAYA	25
299	TEKMAN	25
300	TORTUM	25
301	KARAÇOBAN	25
302	UZUNDERE	25
303	PAZARYOLU	25
304	ILICA	25
305	KÖPRÜKÖY	25
306	ÇAYIRLI	24
307	ERZİNCAN MERKEZ	24
308	İLİÇ	24
309	KEMAH	24
310	KEMALİYE	24
311	REFAHİYE	24
312	TERCAN	24
313	OTLUKBELİ	24
314	ESKİŞEHİR MERKEZ	26
315	ÇİFTELER	26
316	MAHMUDİYE	26
317	MİHALIÇLIK	26
318	SARICAKAYA	26
319	SEYİTGAZİ	26
320	SİVRİHİSAR	26
321	ALPU	26
322	BEYLİKOVA	26
323	İNÖNÜ	26
324	GÜNYÜZÜ	26
325	HAN	26
326	MİHALGAZİ	26
327	ARABAN	27
328	İSLAHİYE	27
329	NİZİP	27
330	OĞUZELİ	27
331	YAVUZELİ	27
332	ŞAHİNBEY	27
333	ŞEHİT KAMİL	27
334	KARKAMIŞ	27
335	NURDAĞI	27
336	GÜMÜŞHANE MERKEZ	29
337	KELKİT	29
338	ŞİRAN	29
339	TORUL	29
340	KÖSE	29
341	KÜRTÜN	29
342	ALUCRA	28
343	BULANCAK	28
344	DERELİ	28
345	ESPİYE	28
346	EYNESİL	28
347	GİRESUN MERKEZ	28
348	GÖRELE	28
349	KEŞAP	28
350	ŞEBİNKARAHİSAR	28
351	TİREBOLU	28
352	PİPAZİZ	28
353	YAĞLIDERE	28
354	ÇAMOLUK	28
355	ÇANAKÇI	28
356	DOĞANKENT	28
357	GÜCE	28
358	HAKKARİ MERKEZ	30
359	ÇUKURCA	30
360	ŞEMDİNLİ	30
361	YÜKSEKOVA	30
362	ALTINÖZÜ	31
363	DÖRTYOL	31
364	HATAY MERKEZ	31
365	HASSA	31
366	İSKENDERUN	31
367	KIRIKHAN	31
368	REYHANLI	31
369	SAMANDAĞ	31
370	YAYLADAĞ	31
371	ERZİN	31
372	BELEN	31
373	KUMLU	31
374	ISPARTA MERKEZ	32
375	ATABEY	32
376	KEÇİBORLU	32
377	EĞİRDİR	32
378	GELENDOST	32
379	SİNİRKENT	32
380	ULUBORLU	32
381	YALVAÇ	32
382	AKSU	32
383	GÖNEN	32
384	YENİŞAR BADEMLİ	32
385	IĞDIR MERKEZ	76
386	ARALIK	76
387	TUZLUCA	76
388	KARAKOYUNLU	76
389	AFŞİN	46
390	ANDIRIN	46
391	ELBİSTAN	46
392	GÖKSUN	46
393	KAHRAMANMARAŞ MERKEZ	46
394	PAZARCIK	46
395	TÜRKOĞLU	46
396	ÇAĞLAYANCERİT	46
397	EKİNÖZÜ	46
398	NURHAK	46
399	EFLANİ	78
400	ESKİPAZAR	78
401	KARABÜK MERKEZ	78
402	OVACIK	78
403	SAFRANBOLU	78
404	YENİCE	78
405	ERMENEK	70
406	KARAMAN MERKEZ	70
407	AYRANCI	70
408	KAZIMKARABEKİR	70
409	BAŞYAYLA	70
410	SARIVELİLER	70
411	KARS MERKEZ	36
412	ARPAÇAY	36
413	DİR	36
414	KAĞIZMAN	36
415	SARIKAMIŞ	36
416	SELİM	36
417	SUSUZ	36
418	AKYAKA	36
419	ABANA	37
420	KASTAMONU MERKEZ	37
421	ARAÇ	37
422	AZDAVAY	37
423	BOZKURT	37
424	CİDE	37
425	ÇATALZEYTİN	37
426	DADAY	37
427	DEVREKANİ	37
428	İNEBOLU	37
429	KÜRE	37
430	TAŞKÖPRÜ	37
431	TOSYA	37
432	İHSANGAZİ	37
433	PINARBAŞI	37
434	ŞENPAZAR	37
435	AĞLI	37
436	DOĞANYURT	37
437	HANÖNÜ	37
438	SEYDİLER	37
439	BÜNYAN	38
440	DEVELİ	38
441	FELAHİYE	38
442	İNCESU	38
443	PINARBAŞI	38
444	SARIOĞLAN	38
445	SARIZ	38
446	TOMARZA	38
447	YAHYALI	38
448	YEŞİLHİSAR	38
449	AKKIŞLA	38
450	TALAS	38
451	KOCASİNAN	38
452	MELİKGAZİ	38
453	HACILAR	38
454	ÖZVATAN	38
455	DERİCE	71
456	KESKİN	71
457	KIRIKKALE MERKEZ	71
458	SALAK YURT	71
459	BAHŞİLİ	71
460	BALIŞEYH	71
461	ÇELEBİ	71
462	KARAKEÇİLİ	71
463	YAHŞİHAN	71
464	KIRKKLARELİ MERKEZ	39
465	BABAESKİ	39
466	DEMİRKÖY	39
467	KOFÇAY	39
468	LÜLEBURGAZ	39
469	VİZE	39
470	KIRŞEHİR MERKEZ	40
471	ÇİÇEKDAĞI	40
472	KAMAN	40
473	MUCUR	40
474	AKPINAR	40
475	AKÇAKENT	40
476	BOZTEPE	40
477	KOCAELİ MERKEZ	41
478	GEBZE	41
479	GÖLCÜK	41
480	KANDIRA	41
481	KARAMÜRSEL	41
482	KÖRFEZ	41
483	DERİNCE	41
484	KONYA MERKEZ	42
485	AKŞEHİR	42
486	BEYŞEHİR	42
487	BOZKIR	42
488	CİHANBEYLİ	42
489	ÇUMRA	42
490	DOĞANHİSAR	42
491	EREĞLİ	42
492	HADİM	42
493	ILGIN	42
494	KADINHANI	42
495	KARAPINAR	42
496	KULU	42
497	SARAYÖNÜ	42
498	SEYDİŞEHİR	42
499	YUNAK	42
500	AKÖREN	42
501	ALTINEKİN	42
502	DEREBUCAK	42
503	HÜYÜK	42
504	KARATAY	42
505	MERAM	42
506	SELÇUKLU	42
507	TAŞKENT	42
508	AHIRLI	42
509	ÇELTİK	42
510	DERBENT	42
511	EMİRGAZİ	42
512	GÜNEYSINIR	42
513	HALKAPINAR	42
514	TUZLUKÇU	42
515	YALIHÜYÜK	42
516	KÜTAHYA  MERKEZ	43
517	ALTINTAŞ	43
518	DOMANİÇ	43
519	EMET	43
520	GEDİZ	43
521	SİMAV	43
522	TAVŞANLI	43
523	ASLANAPA	43
524	DUMLUPINAR	43
525	HİSARCIK	43
526	ŞAPHANE	43
527	ÇAVDARHİSAR	43
528	PAZARLAR	43
529	KİLİS MERKEZ	79
530	ELBEYLİ	79
531	MUSABEYLİ	79
532	POLATELİ	79
533	MALATYA MERKEZ	44
534	AKÇADAĞ	44
535	ARAPGİR	44
536	ARGUVAN	44
537	DARENDE	44
538	DOĞANŞEHİR	44
539	HEKİMHAN	44
540	PÜTÜRGE	44
541	YEŞİLYURT	44
542	BATTALGAZİ	44
543	DOĞANYOL	44
544	KALE	44
545	KULUNCAK	44
546	YAZIHAN	44
547	AKHİSAR	45
548	ALAŞEHİR	45
549	DEMİRCİ	45
550	GÖRDES	45
551	KIRKAĞAÇ	45
552	KULA	45
553	MANİSA MERKEZ	45
554	SALİHLİ	45
555	SARIGÖL	45
556	SARUHANLI	45
557	SELENDİ	45
558	SOMA	45
559	TURGUTLU	45
560	AHMETLİ	45
561	GÖLMARMARA	45
562	KÖPRÜBAŞI	45
563	DERİK	47
564	KIZILTEPE	47
565	MARDİN MERKEZ	47
566	MAZIDAĞI	47
567	MİDYAT	47
568	NUSAYBİN	47
569	ÖMERLİ	47
570	SAVUR	47
571	YEŞİLLİ	47
572	MERSİN MERKEZ	33
573	ANAMUR	33
574	ERDEMLİ	33
575	GÜLNAR	33
576	MUT	33
577	SİLİFKE	33
578	TARSUS	33
579	AYDINCIK	33
580	BOZYAZI	33
581	ÇAMLIYAYLA	33
582	BODRUM	48
583	DATÇA	48
584	FETHİYE	48
585	KÖYCEĞİZ	48
586	MARMARİS	48
587	MİLAS	48
588	MUĞLA MERKEZ	48
589	ULA	48
590	YATAĞAN	48
591	DALAMAN	48
592	KAVAKLI DERE	48
593	ORTACA	48
594	BULANIK	49
595	MALAZGİRT	49
596	MUŞ MERKEZ	49
597	VARTO	49
598	HASKÖY	49
599	KORKUT	49
600	NEVŞEHİR MERKEZ	50
601	AVANOS	50
602	DERİNKUYU	50
603	GÜLŞEHİR	50
604	HACIBEKTAŞ	50
605	KOZAKLI	50
606	ÜRGÜP	50
607	ACIGÖL	50
608	NİĞDE MERKEZ	51
609	BOR	51
610	ÇAMARDI	51
611	ULUKIŞLA	51
612	ALTUNHİSAR	51
613	ÇİFTLİK	51
614	AKKUŞ	52
615	AYBASTI	52
616	FATSA	52
617	GÖLKÖY	52
618	KORGAN	52
619	KUMRU	52
620	MESUDİYE	52
621	ORDU MERKEZ	52
622	PERŞEMBE	52
623	ULUBEY	52
624	ÜNYE	52
625	GÜLYALI	52
626	GÜRGENTEPE	52
627	ÇAMAŞ	52
628	ÇATALPINAR	52
629	ÇAYBAŞI	52
630	İKİZCE	52
631	KABADÜZ	52
632	KABATAŞ	52
633	BAHÇE	80
634	KADİRLİ	80
635	OSMANİYE MERKEZ	80
636	DÜZİÇİ	80
637	HASANBEYLİ	80
638	SUMBAŞ	80
639	TOPRAKKALE	80
640	RİZE MERKEZ	53
641	ARDEŞEN	53
642	ÇAMLIHEMŞİN	53
643	ÇAYELİ	53
644	FINDIKLI	53
645	İKİZDERE	53
646	KALKANDERE	53
647	PAZAR	53
648	GÜNEYSU	53
649	DEREPAZARI	53
650	HEMŞİN	53
651	İYİDERE	53
652	AKYAZI	54
653	GEYVE	54
654	HENDEK	54
655	KARASU	54
656	KAYNARCA	54
657	SAKARYA MERKEZ	54
658	PAMUKOVA	54
659	TARAKLI	54
660	FERİZLİ	54
661	KARAPÜRÇEK	54
662	SÖĞÜTLÜ	54
663	ALAÇAM	55
664	BAFRA	55
665	ÇARŞAMBA	55
666	HAVZA	55
667	KAVAK	55
668	LADİK	55
669	SAMSUN MERKEZ	55
670	TERME	55
671	VEZİRKÖPRÜ	55
672	ASARCIK	55
673	ONDOKUZMAYIS	55
674	SALIPAZARI	55
675	TEKKEKÖY	55
676	AYVACIK	55
677	YAKAKENT	55
678	AYANCIK	57
679	BOYABAT	57
680	SİNOP MERKEZ	57
681	DURAĞAN	57
682	Erfelek	57
683	GERZE	57
684	TÜRKELİ	57
685	DİKMEN	57
686	SARAYDÜZÜ	57
687	DİVRİĞİ	58
688	GEMEREK	58
689	GÜRÜN	58
690	HAFİK	58
691	İMRANLI	58
692	KANGAL	58
693	KOYUL HİSAR	58
694	SİVAS MERKEZ	58
695	SU ŞEHRİ	58
696	ŞARKIŞLA	58
697	YILDIZELİ	58
698	ZARA	58
699	AKINCILAR	58
700	ALTINYAYLA	58
701	DOĞANŞAR	58
702	GÜLOVA	58
703	ULAŞ	58
704	BAYKAN	56
705	ERUH	56
706	KURTALAN	56
707	PERVARİ	56
708	SİİRT MERKEZ	56
709	ŞİRVARİ	56
710	AYDINLAR	56
711	TEKİRDAĞ MERKEZ	59
712	ÇERKEZKÖY	59
713	ÇORLU	59
714	HAYRABOLU	59
715	MALKARA	59
716	MURATLI	59
717	SARAY	59
718	ŞARKÖY	59
719	MARAMARAEREĞLİSİ	59
720	ALMUS	60
721	ARTOVA	60
722	TOKAT MERKEZ	60
723	ERBAA	60
724	NİKSAR	60
725	REŞADİYE	60
726	TURHAL	60
727	ZİLE	60
728	PAZAR	60
729	YEŞİLYURT	60
730	BAŞÇİFTLİK	60
731	SULUSARAY	60
732	TRABZON MERKEZ	61
733	AKÇAABAT	61
734	ARAKLI	61
735	ARŞİN	61
736	ÇAYKARA	61
737	MAÇKA	61
738	OF	61
739	SÜRMENE	61
740	TONYA	61
741	VAKFIKEBİR	61
742	YOMRA	61
743	BEŞİKDÜZÜ	61
744	ŞALPAZARI	61
745	ÇARŞIBAŞI	61
746	DERNEKPAZARI	61
747	DÜZKÖY	61
748	HAYRAT	61
749	KÖPRÜBAŞI	61
750	TUNCELİ MERKEZ	62
751	ÇEMİŞGEZEK	62
752	HOZAT	62
753	MAZGİRT	62
754	NAZİMİYE	62
755	OVACIK	62
756	PERTEK	62
757	PÜLÜMÜR	62
758	BANAZ	64
759	EŞME	64
760	KARAHALLI	64
761	SİVASLI	64
762	ULUBEY	64
763	UŞAK MERKEZ	64
764	BAŞKALE	65
765	VAN MERKEZ	65
766	EDREMİT	65
767	ÇATAK	65
768	ERCİŞ	65
769	GEVAŞ	65
770	GÜRPINAR	65
771	MURADİYE	65
772	ÖZALP	65
773	BAHÇESARAY	65
774	ÇALDIRAN	65
775	SARAY	65
776	YALOVA MERKEZ	77
777	ALTINOVA	77
778	ARMUTLU	77
779	ÇINARCIK	77
780	ÇİFTLİKKÖY	77
781	TERMAL	77
782	AKDAĞMADENİ	66
783	BOĞAZLIYAN	66
784	YOZGAT MERKEZ	66
785	ÇAYIRALAN	66
786	ÇEKEREK	66
787	SARIKAYA	66
788	SORGUN	66
789	ŞEFAATLI	66
790	YERKÖY	66
791	KADIŞEHRİ	66
792	SARAYKENT	66
793	YENİFAKILI	66
794	ÇAYCUMA	67
795	DEVREK	67
796	ZONGULDAK MERKEZ	67
797	EREĞLİ	67
798	ALAPLI	67
799	GÖKÇEBEY	67
800	ÇANAKKALE MERKEZ	17
801	AYVACIK	17
802	BAYRAMİÇ	17
803	BİGA	17
804	BOZCAADA	17
805	ÇAN	17
806	ECEABAT	17
807	EZİNE	17
808	LAPSEKİ	17
809	YENİCE	17
810	ÇANKIRI MERKEZ	18
811	ÇERKEŞ	18
812	ELDİVAN	18
813	ILGAZ	18
814	KURŞUNLU	18
815	ORTA	18
816	ŞABANÖZÜ	18
817	YAPRAKLI	18
818	ATKARACALAR	18
819	KIZILIRMAK	18
820	BAYRAMÖREN	18
821	KORGUN	18
822	ALACA	19
823	BAYAT	19
824	ÇORUM MERKEZ	19
825	İKSİPLİ	19
826	KARGI	19
827	MECİTÖZÜ	19
828	ORTAKÖY	19
829	OSMANCIK	19
830	SUNGURLU	19
831	DODURGA	19
832	LAÇİN	19
833	OĞUZLAR	19
834	ADALAR	34
835	BAKIRKÖY	34
836	BEŞİKTAŞ	34
837	BEYKOZ	34
838	BEYOĞLU	34
839	ÇATALCA	34
840	EMİNÖNÜ	34
841	EYÜP	34
842	FATİH	34
843	GAZİOSMANPAŞA	34
844	KADIKÖY	34
845	KARTAL	34
846	SARIYER	34
847	SİLİVRİ	34
848	ŞİLE	34
849	ŞİŞLİ	34
850	ÜSKÜDAR	34
851	ZEYTİNBURNU	34
852	BÜYÜKÇEKMECE	34
853	KAĞITHANE	34
854	KÜÇÜKÇEKMECE	34
855	PENDİK	34
856	ÜMRANİYE	34
857	BAYRAMPAŞA	34
858	AVCILAR	34
859	BAĞCILAR	34
860	BAHÇELİEVLER	34
861	GÜNGÖREN	34
862	MALTEPE	34
863	SULTANBEYLİ	34
864	TUZLA	34
865	ESENLER	34
866	ALİAĞA	35
867	BAYINDIR	35
868	BERGAMA	35
869	BORNOVA	35
870	ÇEŞME	35
871	DİKİLİ	35
872	FOÇA	35
873	KARABURUN	35
874	KARŞIYAKA	35
875	KEMALPAŞA	35
876	KINIK	35
877	KİRAZ	35
878	MENEMEN	35
879	ÖDEMİŞ	35
880	SEFERİHİSAR	35
881	SELÇUK	35
882	TİRE	35
883	TORBALI	35
884	URLA	35
885	BEYDAĞ	35
886	BUCA	35
887	KONAK	35
888	MENDERES	35
889	BALÇOVA	35
890	ÇİGLİ	35
891	GAZİEMİR	35
892	NARLIDERE	35
893	GÜZELBAHÇE	35
894	ŞANLIURFA MERKEZ	63
895	AKÇAKALE	63
896	BİRECİK	63
897	BOZOVA	63
898	CEYLANPINAR	63
899	HALFETİ	63
900	HİLVAN	63
901	SİVEREK	63
902	SURUÇ	63
903	VİRANŞEHİR	63
904	HARRAN	63
905	BEYTÜŞŞEBAP	73
906	ŞIRNAK MERKEZ	73
907	CİZRE	73
908	İDİL	73
909	SİLOPİ	73
910	ULUDERE	73
911	GÜÇLÜKONAK	73
\.


--
-- Data for Name: tiller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tiller (id, adi) FROM stdin;
1	Adana
2	Adıyaman
3	Afyonkarahisar
4	Ağrı
5	Amasya
6	Ankara
7	Antalya
8	Artvin
9	Aydın
10	Balıkesir
11	Bilecik
12	Bingöl
13	Bitlis
14	Bolu
15	Burdur
16	Bursa
17	Çanakkale
18	Çankırı
19	Çorum
20	Denizli
21	Diyarbakır
22	Edirne
23	Elazığ
24	Erzincan
25	Erzurum
26	Eskişehir
27	Gaziantep
28	Giresun
29	Gümüşhane
30	Hakkâri
31	Hatay
32	Isparta
33	Mersin
34	İstanbul
35	İzmir
36	Kars
37	Kastamonu
38	Kayseri
39	Kırklareli
40	Kırşehir
41	Kocaeli
42	Konya
43	Kütahya
44	Malatya
45	Manisa
46	Kahramanmaraş
47	Mardin
48	Muğla
49	Muş
50	Nevşehir
51	Niğde
52	Ordu
53	Rize
54	Sakarya
55	Samsun
56	Siirt
57	Sinop
58	Sivas
59	Tekirdağ
60	Tokat
61	Trabzon
62	Tunceli
63	Şanlıurfa
64	Uşak
65	Van
66	Yozgat
67	Zonguldak
68	Aksaray
69	Bayburt
70	Karaman
71	Kırıkkale
72	Batman
73	Şırnak
74	Bartın
75	Ardahan
76	Iğdır
77	Yalova
78	Karabük
79	Kilis
80	Osmaniye
81	Düzce
\.


--
-- Data for Name: tkangruplari; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tkangruplari (id, adi) FROM stdin;
0	Bilinmiyor
1	A Rh (+)  
2	A Rh (-)  
3	B Rh (+)  
4	B Rh (-)  
5	AB Rh (+) 
6	AB Rh (-) 
7	0 Rh (+)  
8	0 Rh (-)  
\.


--
-- Data for Name: tkullanicilar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tkullanicilar (id, adi, soyadi, eposta, ceptel, dogumtarihi, dogumyeri_tilcelerid, cinsiyet, tckimlikno, kangrubu_tkangruplariid) FROM stdin;
268	Cihad	YALÇIN	cihad.yalçın28@gmail.com	5514949201	1984-07-18	58	t	93046189981	7
2182	Emrah	SEMİZ	emrah.semiz73@gmail.com	5388935463	2001-09-19	23	t	93602068747	7
2186	Güneş	ÖZTÜRK	güneş.öztürk33@gmail.com	5377815918	1996-09-13	34	f	39350255465	0
2187	Yasemin	KAVAL	yasemin.kaval11@gmail.com	5461777398	2000-04-17	34	f	41043029301	0
2188	Canan	ÖZTÜRK	canan.öztürk19@gmail.com	5583731693	1991-05-28	26	f	20460933882	0
2189	Alim	ERİŞKEN	alim.erişken58@gmail.com	5488894319	1988-10-05	9	t	82087721776	1
2190	Mahbube Seda	KETHÜDA	mahbube seda.kethüda66@gmail.com	5605479723	2002-09-06	25	f	24477804608	1
2191	Murat	SARI	murat.sarı65@gmail.com	5466748865	1992-11-21	34	t	70215736251	7
2193	Ayşe	ALTAN	ayşe.altan73@gmail.com	5552685123	1998-03-02	34	f	87257854715	1
2194	Figen	BOZDAĞ	figen.bozdağ59@gmail.com	5573206804	1986-07-22	59	f	30463262191	7
2195	Kübra	ÖMEROĞLU	kübra.ömeroğlu94@gmail.com	5336339155	1992-12-09	34	f	99573288724	1
2196	Cahide Merve	WAEDOLAH	cahide merve.waedolah48@gmail.com	5328625390	1996-10-12	34	f	33789259030	7
2197	Arzu	YİĞİT	arzu.yiğit55@gmail.com	5453308817	1996-01-13	34	f	94466765454	8
2198	Halime Dicle	BORAN	halime dicle.boran41@gmail.com	5472122770	1989-01-11	6	f	22929900400	0
2199	Ünal Halit	AL DANNAOUI	ünal halit.al dannaouı67@gmail.com	5413278676	1983-12-20	37	t	71382795998	1
2200	Özlem	KARTAL	özlem.kartal95@gmail.com	5525148511	1983-04-05	10	f	27529283765	7
2201	Seda	ENİS	seda.enis99@gmail.com	5595787919	1986-05-13	34	f	49415653881	0
2202	Şükrü	AKYILDIRIM	şükrü.akyıldırım34@gmail.com	5577392411	1998-01-23	50	t	86551594853	0
2203	İbrahim Haluk	MAYIRAN	ibrahim haluk.mayıran21@gmail.com	5411903964	1990-04-13	34	t	50933429179	0
2204	Algun	SARI	algun.sarı15@gmail.com	5348383632	1997-02-06	34	t	26812711210	0
2205	Hüseyin	AKDAŞ	hüseyin.akdaş76@gmail.com	5521380439	1982-10-18	34	t	88475091258	0
2206	Seniha Didem	PİRANİQİ	seniha didem.piraniqi70@gmail.com	5481729105	1988-08-12	34	f	59627677141	0
2207	Esat Timuçin	YAZAR	esat timuçin.yazar65@gmail.com	5537930791	1985-10-27	40	t	63643479220	3
2208	Gökhan	AY	gökhan.ay94@gmail.com	5525585652	1991-07-01	61	t	27507041167	1
2209	Aydın	TUNA	aydın.tuna55@gmail.com	5517003240	1991-05-03	34	t	40100132084	7
2210	Ela	MIERKAMILIJIANG	ela.mıerkamılıjıang92@gmail.com	5338678844	1988-08-24	34	f	51512786132	7
2211	Emin	MENEKŞE	emin.menekşe11@gmail.com	5609096316	1990-01-08	26	t	77062634570	0
2212	Gizem	DEMİR	gizem.demir73@gmail.com	5304246140	2003-04-22	6	f	16082658669	4
2213	Ömer	YILDIRIM	ömer.yıldırım91@gmail.com	5436258334	1980-09-26	78	t	32849718512	0
2214	Ekrem	BASKINDAĞLI DURAK	ekrem.baskındağlı durak32@gmail.com	5486782159	1996-06-09	64	t	36543848015	7
2215	Yusuf	ÖZBAŞ	yusuf.özbaş40@gmail.com	5436137978	1996-08-14	76	t	97616889671	0
2217	Yasemin	ATALAYSOYDAN	yasemin.atalaysoydan82@gmail.com	5446080523	1987-07-14	47	f	32473743649	0
2218	Mehmet Ali	PERRY	mehmet ali.perry33@gmail.com	5558723298	1980-05-14	16	t	50744520952	5
2219	Salim	ÇOPUR	salim.çopur28@gmail.com	5467848544	1989-07-17	6	t	36458925642	0
2220	Asuman	SERİ	asuman.seri69@gmail.com	5602326269	1993-03-12	25	f	48973565463	1
2221	Doğan	YILDIRIM	doğan.yıldırım71@gmail.com	5408691170	1995-10-17	36	t	51909827704	5
2222	Nagehan	DEMİRÖZ	nagehan.demiröz72@gmail.com	5318657342	1991-07-08	55	f	28814675914	0
2223	İsmail	DAĞ	ismail.dağ50@gmail.com	5423995908	1992-11-11	40	t	72709788859	0
2224	Hamdullah	ESEN	hamdullah.esen80@gmail.com	5335092115	1992-06-21	65	t	14810634853	1
2225	Ebru	ALA	ebru.ala34@gmail.com	5367186181	1991-09-02	34	f	69321865244	0
2226	Necip	GÜNGÖR	necip.güngör39@gmail.com	5515647764	1987-11-28	33	t	48833013988	3
2227	Arif Barış	MISTAÇOĞLU	arif barış.mıstaçoğlu82@gmail.com	5501881403	1994-01-13	6	t	19751781997	0
2228	Ramazan	ÖZTÜRK	ramazan.öztürk25@gmail.com	5578114489	2002-12-09	5	t	97214023034	0
2229	Mustafa Said	YUCELİK	mustafa said.yucelik39@gmail.com	5438051861	2003-09-02	61	t	75970805061	7
2230	Oya	GÜVENÇ ULUÇLAR	oya.güvenç uluçlar90@gmail.com	5514300709	1983-03-16	45	f	76053688051	0
2231	Can	HİRABE	can.hirabe58@gmail.com	5356558949	1985-11-05	35	t	53185316693	0
2232	Ayşen	SARIBEYOGLU	ayşen.sarıbeyoglu12@gmail.com	5545756867	1991-06-08	15	f	71239283977	0
2233	Celalettin	Y	celalettin.y34@gmail.com	5476878584	1985-11-15	25	t	69060676013	8
2234	Zeliha	AKARSU	zeliha.akarsu21@gmail.com	5486975327	2000-08-22	63	f	68239101314	2
2235	Oya	KÖMÜRCÜ	oya.kömürcü52@gmail.com	5471899707	2002-10-13	17	f	85678755815	0
2236	Yusuf	VURAL	yusuf.vural47@gmail.com	5499060341	2002-02-22	61	t	96629283455	0
2237	Engin	ÇETİNER	engin.çetiner95@gmail.com	5325421218	1980-05-08	6	t	39734136783	0
2238	Gözde	İSLAM	gözde.islam94@gmail.com	5397248357	1982-03-26	6	f	80356495554	0
2239	Hanifi	SHARİF	hanifi.sharif91@gmail.com	5454385836	1981-08-16	46	t	78235644186	7
2240	Nurullah	ATEŞCİ	nurullah.ateşci26@gmail.com	5352802527	1981-02-10	13	t	14577212670	5
2241	Arzu Çiftoğlu	SIMONOVIC	arzu çiftoğlu.sımonovıc17@gmail.com	5574924489	2003-01-16	34	f	29585896312	1
2242	Burak	DOĞAN	burak.doğan11@gmail.com	5323615146	1987-10-08	34	t	19531563778	1
2243	Ali	AKCA	ali.akca72@gmail.com	5456091473	1985-01-25	61	t	51324188996	0
2244	Yusuf	HANSU	yusuf.hansu86@gmail.com	5605542960	2003-11-14	41	t	20483970686	7
2245	Erdem	DEVECİOĞLU	erdem.devecioğlu27@gmail.com	5565234719	1990-02-05	6	t	77193885094	8
2246	Bekir	SARI	bekir.sarı67@gmail.com	5445496423	1997-02-09	2	t	83320191127	0
2247	Ahmet Korkut	ÇEVİK	ahmet korkut.çevik64@gmail.com	5479123967	1988-10-15	10	t	56051407070	0
2248	Necmettin	ÇETİNKAYA	necmettin.çetinkaya95@gmail.com	5438839478	1984-09-16	58	t	35235244512	0
2250	Mehmet Bedri	MOHAMMADI BAZARGANI	mehmet bedri.mohammadı bazarganı49@gmail.com	5445624565	1991-04-11	21	t	33400551647	7
2251	Fehime Cangüzel	OZAR	fehime cangüzel.ozar97@gmail.com	5344911424	1984-01-19	6	f	99885757552	0
2252	Mete	DİLBEROĞLU	mete.dilberoğlu57@gmail.com	5372865299	1999-09-22	10	t	86704052976	1
2253	Ömer Cüneyt	CEYLAN	ömer cüneyt.ceylan49@gmail.com	5323625345	1989-01-09	34	t	33598700493	0
2254	Hilal Özden	ÇEÇEN	hilal özden.çeçen79@gmail.com	5535911538	1981-06-26	34	f	49730200660	0
2255	Rukiye Gülay	BABAYEV	rukiye gülay.babayev74@gmail.com	5381269495	1982-06-22	34	f	50838021546	7
2256	Rıtvan	ŞEREF	rıtvan.şeref73@gmail.com	5455420220	2000-12-18	57	t	98184418308	1
2257	Ala	KOLUKISA	ala.kolukısa85@gmail.com	5456017280	2003-06-24	34	f	10811987575	1
2258	Nejat	AYDIN	nejat.aydın80@gmail.com	5579028925	1983-12-28	35	t	11141370380	3
2259	Ebru	EMİRALİOĞLU	ebru.emiralioğlu50@gmail.com	5494794382	1991-09-28	34	f	13676309521	7
2260	Ahmet	Y	ahmet.y79@gmail.com	5495898431	1983-01-21	61	t	14560129961	0
2261	Murat Ali	ÖZDEMİR	murat ali.özdemir58@gmail.com	5607640195	1982-03-25	6	t	39028361835	0
2262	Rıfat	ÇAKIROĞLU	rıfat.çakıroğlu11@gmail.com	5412209833	1985-03-25	61	t	47827652386	0
2263	Sezgin	ÇAĞLIN USTA	sezgin.çağlın usta95@gmail.com	5311825165	2001-07-24	34	t	21280389608	0
2264	Mehmet	DOĞAN	mehmet.doğan87@gmail.com	5502996365	1989-10-12	44	t	26091214498	0
2265	Abdül Halim	UZER	abdül halim.uzer24@gmail.com	5345679327	1982-07-16	34	t	70333464762	0
2266	Nurullah	YÜCETÜRK	nurullah.yücetürk50@gmail.com	5507720681	1995-12-23	34	t	33282442997	0
2267	Ahmet Oğuz	CANSU	ahmet oğuz.cansu87@gmail.com	5422188944	1993-07-16	5	t	14297116047	0
2268	Mustafa Cem	PELTEKOĞLU	mustafa cem.peltekoğlu41@gmail.com	5311369838	1981-09-07	61	t	91058097931	0
2269	Hacer Şaduman	GADİMOV	hacer şaduman.gadimov64@gmail.com	5523653902	1980-03-15	52	f	20665045444	0
2270	Fatma Nur	BOĞAZ	fatma nur.boğaz55@gmail.com	5482646646	1992-09-13	34	f	20566014539	1
2271	Özgür	ŞENER	özgür.şener69@gmail.com	5305039170	1995-03-05	34	t	64887656737	0
2272	Oğuz	KÖSE	oğuz.köse12@gmail.com	5586592254	1996-10-23	45	t	33561165422	1
2273	Mustafa	CEYLAN	mustafa.ceylan23@gmail.com	5558831977	1988-06-17	18	t	52130499553	0
2274	Ahu Tuğba	TÜRKAY	ahu tuğba.türkay85@gmail.com	5574302639	1998-02-25	34	f	82094833527	7
2275	Ekrem	YILAMU	ekrem.yılamu10@gmail.com	5347226349	1997-02-10	35	t	36687745921	0
2276	Sıbkat	Y	sıbkat.y48@gmail.com	5431754310	2001-06-07	25	t	23614097525	0
2277	Beliz	ATUKUNDA	beliz.atukunda47@gmail.com	5563360544	1996-06-13	6	f	53813776037	0
2278	Berk	YAZICI	berk.yazıcı67@gmail.com	5558185830	1990-07-14	34	t	70989767022	5
2279	Emin Başar	TARIM	emin başar.tarım59@gmail.com	5361418186	1995-12-17	34	t	12498722420	0
2280	Serap	TAŞYÜREK	serap.taşyürek79@gmail.com	5508916183	1984-10-07	34	f	30437444851	1
2281	İdil	DEMİR	idil.demir65@gmail.com	5441119286	1996-01-28	34	f	23348876664	0
2282	Didem Zeynep	YUSUFU	didem zeynep.yusufu89@gmail.com	5411821353	1999-06-19	34	f	32458670571	0
2283	Murat	GÜNER	murat.güner19@gmail.com	5375017633	1995-12-11	34	t	38518504342	1
2284	Zeki	OLPAK	zeki.olpak85@gmail.com	5465610651	1990-02-13	27	t	55720565589	0
2285	Ayşe Emel	YILDIRIM	ayşe emel.yıldırım51@gmail.com	5481600678	1987-08-24	34	f	77147734366	0
2286	Hamıt Haluk	ŞENAT	hamıt haluk.şenat45@gmail.com	5328115549	1990-01-10	52	t	82821696876	5
2287	Şahin	ÖZTOP	şahin.öztop15@gmail.com	5562609894	2000-03-20	44	t	11352022063	0
2288	Muammer	AĞAOĞLU	muammer.ağaoğlu50@gmail.com	5495789272	2003-06-10	61	t	82587939933	0
2289	Ertuğrul	KOCABAY	ertuğrul.kocabay62@gmail.com	5551675728	1991-11-12	67	t	68853079771	7
2290	Mustafa Alper	TAN ŞEHİTOĞLU	mustafa alper.tan şehitoğlu22@gmail.com	5517190730	1995-04-18	32	t	61172809631	1
2291	Hayrettin	UĞUR	hayrettin.uğur58@gmail.com	5593589555	1980-02-26	61	t	17449576209	0
2292	Mustafa Oğuz	SADİOĞLU	mustafa oğuz.sadioğlu82@gmail.com	5336425475	1987-03-24	35	t	43289586322	0
2293	Vural	ATAN	vural.atan62@gmail.com	5592752403	1988-11-08	34	t	87190182834	0
2294	Arif Ateş	GÜLBÜZ CEYLAN	arif ateş.gülbüz ceylan41@gmail.com	5577843385	1996-10-09	34	t	84352455936	0
2295	Nihat	ÖZEN	nihat.özen16@gmail.com	5313102112	1984-05-22	54	t	17190618159	0
2296	Nazım	TÜRKBAĞ	nazım.türkbağ21@gmail.com	5608312267	1987-02-27	34	t	97251367624	0
2297	Yusuf	SEZEN	yusuf.sezen21@gmail.com	5377719902	1989-04-02	61	t	36470591601	1
2298	Bülent	YAZICI KESKİN	bülent.yazıcı keskin84@gmail.com	5495969517	1999-10-05	1	t	24203500295	1
2299	Elçin	ERHAN	elçin.erhan76@gmail.com	5581834854	1991-05-06	34	f	92051988056	3
2300	Vedat	TOPTAŞ	vedat.toptaş93@gmail.com	5537132299	1980-09-14	23	t	93342459983	1
2301	Gülçin	KART	gülçin.kart50@gmail.com	5476021888	1995-11-07	34	f	60612756311	0
2302	Serhan	AIERKEN	serhan.aıerken40@gmail.com	5394245877	1985-10-18	34	t	91385561206	7
2303	Muhittin	UYAN	muhittin.uyan31@gmail.com	5375082836	1990-10-19	41	f	45535131515	0
2304	SAHABETTİN TAHA	GULIMIRE	sahabettin taha.gulımıre89@gmail.com	5391834898	1996-09-21	30	t	72234099864	2
2305	Betül	ALBAYRAK	betül.albayrak20@gmail.com	5571549681	1991-12-25	81	f	61504694166	0
2306	Ahmet Hayri	BAYKAL	ahmet hayri.baykal87@gmail.com	5344912117	1999-01-12	61	t	98134779425	1
2307	Hasan	ŞEHAN	hasan.şehan10@gmail.com	5376643659	1984-08-20	61	t	16335042892	0
2308	Selim Yüksel	GÜNGÖR	selim yüksel.güngör44@gmail.com	5457204564	2000-03-07	6	t	80515155664	7
2309	Osman	GÜRBÜZ	osman.gürbüz45@gmail.com	5404716121	1997-01-17	25	t	44690340121	0
2310	Mecit	ZORER	mecit.zorer41@gmail.com	5448666381	1993-03-04	35	t	97865725537	0
2311	Masum	MAHSERECİ	masum.mahsereci35@gmail.com	5413244286	2003-05-04	47	t	25851252974	0
2312	Ali Altuğ	ABACIK	ali altuğ.abacık93@gmail.com	5583680131	1997-09-14	34	t	39393013135	1
2313	Erdinç	GELMEZ	erdinç.gelmez86@gmail.com	5491731963	1993-04-05	40	t	44128075827	0
2314	İlker	MARANCI	ilker.marancı61@gmail.com	5341155455	1986-07-20	34	f	44911181676	7
2315	Başak Erdem	ELGENDY	başak erdem.elgendy61@gmail.com	5457569240	1980-06-27	34	f	29626945245	0
2316	Gülay	DEMİRBAŞ	gülay.demirbaş60@gmail.com	5391292668	1987-02-21	55	f	74118920052	0
2317	Habip	Y	habip.y83@gmail.com	5432423772	1990-02-23	61	t	74521104534	5
2318	Hüseyin	BACAKOĞLU	hüseyin.bacakoğlu60@gmail.com	5493200249	1991-01-11	10	t	66195761571	0
2319	Figen	İSMAEL	figen.ismael10@gmail.com	5451223475	1985-06-14	34	f	58071313181	7
2320	Kemal	ŞAHİN	kemal.şahin13@gmail.com	5394796575	1993-06-28	76	t	55689804766	1
2321	İsmet Kahraman	DİRİK	ismet kahraman.dirik45@gmail.com	5327741231	1991-11-20	44	t	41190073749	0
2322	Nigar	KAYA	nigar.kaya45@gmail.com	5351415600	1997-09-05	14	f	36890047798	1
2323	Necla Öykü	ŞAHİN	necla öykü.şahin47@gmail.com	5436351821	2000-03-14	34	f	44133371929	7
2324	Ayşen	DİLİMULATİ	ayşen.dilimulati19@gmail.com	5314628927	2000-01-06	34	f	92704226089	0
2325	Rana Atabay	AĞIRTMIŞ	rana atabay.ağırtmış25@gmail.com	5381715620	1988-11-05	55	f	23712725257	0
5159	Seda	Y	seda.y70@gmail.com	5365467383	1989-06-22	34	f	64510928998	1
2326	İdris	İBRAHİM	idris.ibrahim78@gmail.com	5502301364	2002-07-02	34	t	96805788636	7
2327	Hasan	GÜNEŞ	hasan.güneş66@gmail.com	5343826440	1998-02-20	70	t	89878566985	0
2328	İbrahim	MİAD	ibrahim.miad77@gmail.com	5397341332	1992-09-15	42	t	35160624057	0
2329	Elif	MC KEE	elif.mc kee50@gmail.com	5473260652	2003-08-04	16	f	74130694600	1
2330	Fatma Ceren	İLBEYİ	fatma ceren.ilbeyi99@gmail.com	5343832295	1993-02-11	31	f	31451757849	0
2331	Ali Bülent	UĞUR	ali bülent.uğur87@gmail.com	5465225921	2002-12-16	34	t	62750376628	0
2332	Ömer Faruk	ERDİN	ömer faruk.erdin75@gmail.com	5512861633	1996-08-16	27	t	74459732803	1
2333	Ali Osman	TUNÇ	ali osman.tunç69@gmail.com	5476500426	2000-09-26	42	t	40786391431	0
2334	MEHMET HASAN	MOHAMED	mehmet hasan.mohamed18@gmail.com	5538422996	1991-11-25	73	t	92833455934	0
2335	Suna	ÖZDEMİR	suna.özdemir20@gmail.com	5395412625	1990-10-19	34	f	67754227984	0
2336	Ebru	UNUTUR	ebru.unutur37@gmail.com	5398525355	1984-04-15	45	f	81685485329	0
2337	Esin	KURT	esin.kurt62@gmail.com	5464807719	1990-02-23	34	f	16505823414	1
2338	Yaprak	BİLİCİ	yaprak.bilici93@gmail.com	5494421741	1999-02-18	34	f	41149308907	0
2339	Vahit Ferhan	BABATAŞ İREN	vahit ferhan.babataş iren26@gmail.com	5601761890	1989-05-18	34	t	37107823769	0
2340	Serkan	EKİCİ	serkan.ekici64@gmail.com	5606085346	2000-08-25	34	t	82761637785	7
2341	Hicabi	KARAHAN	hicabi.karahan45@gmail.com	5596766412	1983-10-12	66	t	29282659038	5
2342	Selda	TİRYAKİOĞLU	selda.tiryakioğlu80@gmail.com	5351746991	1992-01-10	34	f	22966186946	0
2343	Atila	BEKTAŞ	atila.bektaş23@gmail.com	5484114193	1990-09-15	40	t	57091082609	0
2345	Ali Işık	KARAKOL	ali ışık.karakol78@gmail.com	5424578992	2002-04-16	34	t	13741722805	0
2346	Bekir Berat	AZİ MOHAMED	bekir berat.azi mohamed44@gmail.com	5494028424	1988-07-14	24	t	67181228950	0
2347	Mim Kemal Bülent	AYKUT	mim kemal bülent.aykut39@gmail.com	5555602875	1995-11-14	34	t	42017470111	0
2348	Firuze İlgin	CÜCİOĞLU	firuze ilgin.cücioğlu76@gmail.com	5532010523	1994-06-02	34	f	48640558016	0
2350	Elif Kısar	ÇETİN	elif kısar.çetin40@gmail.com	5447796546	1980-08-12	34	f	64823576166	0
2351	Ali Resül	YAŞAR	ali resül.yaşar97@gmail.com	5539130948	1987-02-22	14	t	89434677350	0
2352	Melike Kıvanç	HAZNEDAROĞLU	melike kıvanç.haznedaroğlu80@gmail.com	5351498428	1992-10-21	41	f	88066461887	0
2353	Oya	OZBUK	oya.ozbuk58@gmail.com	5589094780	1984-10-07	22	f	78591691237	0
2354	Mehmet Saim	ALİU	mehmet saim.aliu18@gmail.com	5382387304	1981-09-02	17	t	96981296738	0
2355	Ali Osman	SÜMER	ali osman.sümer90@gmail.com	5341073227	1981-07-03	43	t	72162618748	0
2356	Ahmet Coşkun	UZUN	ahmet coşkun.uzun62@gmail.com	5551625171	1996-10-11	27	t	12655588905	0
2357	Nagehan	KILIÇ	nagehan.kılıç42@gmail.com	5482197998	1999-10-03	6	f	71197388951	3
2359	Emine Sare	ELEZİ	emine sare.elezi46@gmail.com	5508310363	1991-11-16	67	f	88788628913	2
2360	Fatma Serab	Y	fatma serab.y29@gmail.com	5514445302	2001-01-19	6	f	92825372190	7
2361	Hasan Basri	BAYRAM	hasan basri.bayram70@gmail.com	5548191841	1985-04-10	26	t	23314218175	1
2362	Halil İbrahim	DELİGÖZ	halil ibrahim.deligöz27@gmail.com	5575502792	1998-04-20	34	t	83455457751	1
2363	Kemal	YILDIZ	kemal.yıldız90@gmail.com	5462397991	1990-10-11	1	t	84406176291	2
2364	İsmail	SAPARALI UULU	ismail.saparalı uulu75@gmail.com	5455475572	1985-09-20	23	t	28447934237	0
2365	Mert Eren	AYKAÇ	mert eren.aykaç25@gmail.com	5307295211	1994-11-27	34	t	78159148820	7
2366	Okşan	ŞAHİN	okşan.şahin84@gmail.com	5332208267	1980-05-15	34	f	32685481991	0
2367	Osman	KARCI	osman.karcı88@gmail.com	5362885156	1999-06-09	10	t	69345143182	0
2368	Mustafa Emre	DEMİRÇİ	mustafa emre.demirçi49@gmail.com	5538921105	1998-12-25	34	t	39647195979	0
2369	Ali	ÖZKIR	ali.özkır26@gmail.com	5354437556	1998-08-06	34	t	43874910791	0
2370	Murat	ATEŞLİ	murat.ateşli85@gmail.com	5433752475	1989-02-20	34	t	42124473785	0
2371	Şahin	ÖZTÜRK	şahin.öztürk39@gmail.com	5586965440	2000-02-24	48	t	62830381865	1
2372	İsmail	AK	ismail.ak57@gmail.com	5435697384	1981-04-09	16	t	54220551246	3
2373	Timur	ERMAN	timur.erman56@gmail.com	5335219702	2003-12-12	21	t	85047934692	4
2374	Mustafa Emre	ELSAİD MOSTAFA	mustafa emre.elsaid mostafa50@gmail.com	5471741661	1986-12-25	34	t	62289591235	2
2376	Muharrem	AKTAŞ	muharrem.aktaş26@gmail.com	5465059162	1991-12-15	6	t	36244198077	0
2377	Nüzhet	EREN	nüzhet.eren25@gmail.com	5307065458	1996-12-28	59	t	64813566502	2
2378	Engin	Bilir	engin.bilir11@gmail.com	5423430175	1996-03-15	34	t	88632164333	0
2379	Mustafa Cevdet	KINCI	mustafa cevdet.kıncı93@gmail.com	5602375264	1997-08-11	59	t	62734025131	0
2380	Mustafa	ÖZCAN	mustafa.özcan80@gmail.com	5413722755	1998-01-21	61	t	79211543710	0
2382	Yücel	PASTIRMACI	yücel.pastırmacı11@gmail.com	5368414676	1997-07-18	34	t	84030271392	0
2383	Kadir Özgür	TERCAN	kadir özgür.tercan19@gmail.com	5403553965	1987-09-14	34	t	42852137556	3
2384	Kayıhan	BARIŞ	kayıhan.barış97@gmail.com	5365932572	1990-04-01	34	t	82605134697	2
2385	Zafer	EKİM	zafer.ekim54@gmail.com	5353376834	1993-12-11	47	f	76540706421	5
2386	Olcay	Aslanhan	olcay.aslanhan24@gmail.com	5325303247	1985-10-20	34	f	23597124112	0
2387	Ayhan	DUTOĞLU	ayhan.dutoğlu25@gmail.com	5362398529	1987-08-13	28	t	17615491350	0
2388	Abdülkadir	YORULMAZ	abdülkadir.yorulmaz31@gmail.com	5489103353	1987-06-25	27	t	33450598434	0
2389	Hüner	PARLAK	hüner.parlak25@gmail.com	5487062725	1984-03-22	39	t	63163588739	0
2390	Nilgün	SARI	nilgün.sarı84@gmail.com	5553797379	1994-10-03	6	f	21943570242	0
2391	Beyza	KAZDAL	beyza.kazdal16@gmail.com	5385754323	1985-08-22	34	t	28740051385	0
2392	Nimet	SERTTAŞ	nimet.serttaş74@gmail.com	5516695485	1990-12-02	35	f	30544318002	0
2397	Ahu	UĞURERKAN	ahu.uğurerkan89@gmail.com	5603441580	2002-01-13	34	f	12689835455	7
2398	Ipek Bılge	ÇAĞLAR	ıpek bılge.çağlar84@gmail.com	5337806238	1989-12-09	34	f	98158160222	0
2400	Şerli	DEMETGÜL	şerli.demetgül10@gmail.com	5425726529	1994-12-25	34	f	75475995266	0
2401	Sezgin	EKİNCİ	sezgin.ekinci13@gmail.com	5405868693	1990-06-08	6	t	93146509239	0
2402	Zülfiye	YILDIZ	zülfiye.yıldız78@gmail.com	5366860406	1992-04-27	50	f	60761462870	7
2403	Can	KORKMAZ	can.korkmaz92@gmail.com	5567978733	1992-04-10	17	t	20654057158	0
2404	Ersoy Mevlut	SÜMER	ersoy mevlut.sümer69@gmail.com	5352958273	1984-12-02	34	t	90500185266	7
2405	Canan	BASATEMİR	canan.basatemir28@gmail.com	5442500711	2002-02-06	43	f	31342708095	1
2406	Emel	BARUT	emel.barut40@gmail.com	5304296400	1990-12-13	3	f	29966227753	1
2407	Fatma Nilgün	ARIOĞLU	fatma nilgün.arıoğlu96@gmail.com	5453422617	2003-12-21	34	f	17884586879	0
2408	Mehmet Savas	IŞILGA	mehmet savas.ışılga54@gmail.com	5338688623	1987-12-11	34	t	51171561411	0
2409	Sultan Nur	ALPTEKİN	sultan nur.alptekin18@gmail.com	5355920844	1993-08-14	34	f	44315398198	0
2410	Zeynep	ÖZBİLEN	zeynep.özbilen87@gmail.com	5319098891	2001-05-22	34	f	84902704186	0
2411	Seçkin	AYTAŞKIN	seçkin.aytaşkın29@gmail.com	5575679392	1982-07-24	34	t	68288581600	1
2412	Ece	ERDİL	ece.erdil23@gmail.com	5336314549	2000-09-04	34	f	16550324962	0
2413	Özlem	ÇELEBİ	özlem.çelebi60@gmail.com	5517163611	1984-02-23	34	f	48866309153	1
2414	YEŞİM	MANAV	yeşim.manav48@gmail.com	5313806977	1988-08-11	34	f	56090111664	7
2415	Pınar	NURLAN	pınar.nurlan66@gmail.com	5321171134	1994-04-05	34	f	11986658696	0
2416	Müge	MUZORORI	müge.muzororı97@gmail.com	5551800449	1996-11-09	54	f	94687493785	0
2417	Alev Aydoğan	ŞEYRANLIOĞLU	alev aydoğan.şeyranlıoğlu80@gmail.com	5393099515	2002-06-25	23	f	31426584100	0
2418	Beldan	PASHOVA	beldan.pashova79@gmail.com	5384613908	1987-08-25	34	f	32311521474	1
2419	İlknur	TURAL	ilknur.tural19@gmail.com	5417529622	2003-10-24	34	f	83126317314	0
2420	Ahmet	KIZMAZ	ahmet.kızmaz13@gmail.com	5499100986	1987-12-04	34	t	11301853208	0
2421	Fatih	Y	fatih.y91@gmail.com	5524133261	2000-05-22	46	t	47732480535	0
2423	Yasemin	SARIKAYA	yasemin.sarıkaya91@gmail.com	5592377312	2001-06-21	16	f	16408471244	7
2424	Aynur	ALAEV	aynur.alaev50@gmail.com	5553499880	1987-08-16	1	f	34447906817	0
2425	Gözde Sunal	ÇAYIROĞLU	gözde sunal.çayıroğlu91@gmail.com	5422781911	1990-01-11	35	f	95052335391	7
2426	Abdullah	SEFİL	abdullah.sefil87@gmail.com	5443804353	1995-10-26	8	t	72765323934	7
2427	Elif	UZUN	elif.uzun88@gmail.com	5407872795	1988-04-25	23	f	94119356833	0
2428	Berke	ATEŞ	berke.ateş21@gmail.com	5336988739	1997-08-16	33	f	47922589207	1
2429	Lütfü	YOLCHUYEV	lütfü.yolchuyev39@gmail.com	5368901700	1989-12-20	52	t	19454329868	0
2430	Sinem	DEMİR	sinem.demir64@gmail.com	5374874125	1984-01-20	21	f	94003987257	7
2431	Hasan Kadir	YILMAZ	hasan kadir.yılmaz20@gmail.com	5336598762	1991-02-25	61	t	60689517475	1
2432	Mahmut Sami	AK	mahmut sami.ak10@gmail.com	5312650584	1997-03-10	42	t	89418596120	0
2433	İsrafil	YILMAZ	israfil.yılmaz28@gmail.com	5394756612	1996-06-06	28	t	39193555036	0
2434	Mehmet	NARDEMİR	mehmet.nardemir12@gmail.com	5585887887	1993-09-04	43	t	42571214039	1
2435	Hakan	KAMASHIDZE	hakan.kamashıdze70@gmail.com	5374063713	1980-11-13	34	t	92710497294	7
2436	Pınar	AĞDAŞ	pınar.ağdaş70@gmail.com	5361736546	1980-04-15	34	f	62306782634	7
2437	Ömer Erdem	SHAMSİBASHA	ömer erdem.shamsibasha20@gmail.com	5516904992	2002-05-22	34	t	63463375345	0
2438	Ali Kürşat	AKIL	ali kürşat.akıl88@gmail.com	5396704241	1992-11-11	3	t	73418323774	7
2439	Duygu	ÖZEL	duygu.özel38@gmail.com	5538314646	1994-06-11	34	f	94139200504	2
2440	Cihat	TUYAKOVA	cihat.tuyakova81@gmail.com	5465859758	1983-07-26	38	t	22210916570	2
2441	Gencay	CEBECİ	gencay.cebeci94@gmail.com	5427263836	2002-02-17	6	t	48430207616	2
2442	Ayben	GULINAZI	ayben.gulınazı80@gmail.com	5484901909	2000-10-05	17	f	49965830600	7
2443	Okan	AKDAĞ	okan.akdağ15@gmail.com	5373249385	1986-12-09	16	t	53732141115	3
2444	Ayşen	AVCI	ayşen.avcı45@gmail.com	5372702746	1997-05-09	68	f	61524065290	1
2445	Ayfer	ERGUN	ayfer.ergun44@gmail.com	5317132291	1990-07-03	22	f	28289164122	3
2446	Mehtap	ÖZGÜR	mehtap.özgür69@gmail.com	5517969208	1984-07-23	23	f	10673502217	1
2447	Ahmet	KURTARAN	ahmet.kurtaran71@gmail.com	5368137312	1994-01-03	28	t	61010078163	0
2448	Mualla Buket	ÇAKIL	mualla buket.çakıl68@gmail.com	5508450284	1985-03-17	6	f	89062431051	1
2450	Muhammet Celal	SAİDYKHAN	muhammet celal.saidykhan62@gmail.com	5408011822	1993-02-24	61	t	15279307409	0
2451	İdris	ERBEK	idris.erbek16@gmail.com	5444762130	1981-10-08	16	t	76971678677	0
2452	Hasret	ÇETİN	hasret.çetin40@gmail.com	5564644643	1996-12-08	52	f	50376110502	0
2453	Hüseyin	DORUK	hüseyin.doruk24@gmail.com	5514908608	2001-09-12	51	t	27152869666	0
2454	Erdem İzzet	RESALAİTİ	erdem izzet.resalaiti43@gmail.com	5324880939	2003-03-24	34	t	57668910748	7
2455	Zehra	YİĞİT	zehra.yiğit40@gmail.com	5364542277	2000-01-20	7	f	63532259565	3
2456	Selvi Nazlı	BİŞER	selvi nazlı.bişer91@gmail.com	5324651834	1985-12-07	46	f	29293054069	3
2457	Sena	Y	sena.y63@gmail.com	5322053680	1990-11-07	34	f	58474606568	3
2458	Ayşegül Elif	GÜLBAK	ayşegül elif.gülbak92@gmail.com	5518643552	1982-07-12	34	f	12852461808	0
2459	Mehmet	DOĞAN	mehmet.doğan29@gmail.com	5477862444	1993-03-20	42	t	38321290602	5
2460	Berk	ÖNER	berk.öner20@gmail.com	5501719218	1994-12-22	34	t	56521376787	0
2461	Nihal	ABDULLAHİ	nihal.abdullahi64@gmail.com	5528008798	1988-12-01	34	f	89519648130	3
2462	Hasan Ramazan	MERAY	hasan ramazan.meray23@gmail.com	5435297184	1993-03-02	34	t	42954781587	0
2463	Ferhat	YALÇINKAYA	ferhat.yalçınkaya40@gmail.com	5355143385	1985-05-12	34	t	74759556677	2
2464	Erdem	ÇEPNİOĞLU	erdem.çepnioğlu24@gmail.com	5484572587	1984-08-11	34	t	96599826790	1
2465	Ufuk	KAVUNCUOĞLU	ufuk.kavuncuoğlu37@gmail.com	5424337438	1983-10-01	34	t	82105365838	3
2473	Can	HASANOVA	can.hasanova70@gmail.com	5334985493	1991-03-25	34	t	72074288799	7
2474	Emel Şeyma	ERDOĞAN	emel şeyma.erdoğan85@gmail.com	5518210138	1987-05-18	34	f	40927984941	3
2475	Merve	ŞAHİN	merve.şahin78@gmail.com	5421172696	1993-05-17	34	f	33806809449	5
2476	Emre	ATILGAN	emre.atılgan46@gmail.com	5364478341	1995-07-24	18	t	87551345227	0
2477	Ahmet Alptekin	ABDELLAHİ	ahmet alptekin.abdellahi50@gmail.com	5328580845	2003-03-13	34	t	91860962115	0
2478	Ezgi	UĞUR	ezgi.uğur98@gmail.com	5442950657	1994-05-02	58	f	83341897711	0
2479	Ali	HAJRAJ	ali.hajraj81@gmail.com	5528045661	2002-05-09	43	t	13639015807	0
2480	Şeyda	MOUSSA	şeyda.moussa52@gmail.com	5514718962	1982-04-24	38	f	53109477628	7
2481	Mehmet	ÖLÇÜCÜOĞLU	mehmet.ölçücüoğlu21@gmail.com	5398165202	1998-02-20	1	t	67837375013	0
2482	Ömer Taha	HAMAD	ömer taha.hamad82@gmail.com	5608601813	1986-03-06	5	t	10067680864	1
2483	Mete Han	TÜRÜT	mete han.türüt94@gmail.com	5375441731	1986-07-14	33	t	24539031148	3
2484	Yunus	DURSUN	yunus.dursun69@gmail.com	5426912695	1999-11-26	34	t	96647123229	0
2485	Ömür	MADJİDOVA	ömür.madjidova74@gmail.com	5312968539	1995-10-23	34	f	58822934548	0
2486	Güldenur	KAYMAZ	güldenur.kaymaz42@gmail.com	5606655843	1985-07-24	34	f	69215641831	0
2487	Emel	JAMMEH	emel.jammeh56@gmail.com	5444041738	1984-07-26	11	f	66916591612	0
2488	Şeyda	ÖZEN	şeyda.özen81@gmail.com	5512582178	2001-12-03	34	f	35276281944	7
2489	Yeşim	ONUR	yeşim.onur73@gmail.com	5456309454	1984-04-28	34	f	57307336256	7
2490	Faik Tansu	ASLAN	faik tansu.aslan57@gmail.com	5464894153	1980-02-12	34	t	91960363106	0
2491	Hediye	BARŞIK	hediye.barşık82@gmail.com	5473839152	1984-11-06	53	f	40704387744	0
2492	Fatma	GÖREN	fatma.gören89@gmail.com	5595077359	2002-12-09	53	f	61242957098	0
2493	Ali Osman	SEZGİN	ali osman.sezgin54@gmail.com	5494952516	1989-07-17	10	t	34938796679	1
2494	Mehmet Ali	AYĞUR	mehmet ali.ayğur52@gmail.com	5583771196	1998-05-03	47	t	28742791541	0
2495	Mehmet	DEMİR	mehmet.demir65@gmail.com	5547983984	2000-06-11	34	t	22360163536	1
2496	Aykut	GÜNDOĞDU	aykut.gündoğdu83@gmail.com	5514056218	1981-02-22	34	t	90460253665	1
2497	Cihan	DURGUN	cihan.durgun42@gmail.com	5312986434	1989-10-04	34	t	29958993990	0
2498	Eyüp	MATRAİMOV	eyüp.matraimov38@gmail.com	5526389252	1998-02-18	55	t	68657603252	0
2499	ÜNAL	EMRE	ünal.emre32@gmail.com	5338437387	1990-03-16	34	t	54048149784	1
2500	Salih Erdem	KAYA	salih erdem.kaya72@gmail.com	5552322584	1990-12-26	5	t	99826212171	0
2502	Nihal	ASLAN	nihal.aslan92@gmail.com	5411601837	1995-09-06	34	f	27628897817	7
2503	Arzu	Y	arzu.y15@gmail.com	5388039115	1985-01-21	34	f	86183718425	0
2504	Engül	BAIERNA	engül.baıerna26@gmail.com	5588665905	2002-06-17	62	f	96118777801	7
2505	Onur Yaşar	DUPLJAK	onur yaşar.dupljak34@gmail.com	5332579123	1980-12-23	36	t	56210267646	1
2506	Necati Erdem	ABD ALLAH	necati erdem.abd allah91@gmail.com	5471467931	1988-03-24	34	t	62614351000	7
2507	Elif	DEMİR	elif.demir46@gmail.com	5534093317	2000-12-12	53	f	25045132978	3
2508	Abdüssamed	YILMAZ	abdüssamed.yılmaz32@gmail.com	5343472220	1990-05-04	34	t	62375206272	0
2509	Ömer	ÖZÇAKIR	ömer.özçakır20@gmail.com	5456425899	1995-10-01	67	t	33970430866	1
2510	Selçuk	ALGÜL	selçuk.algül12@gmail.com	5413799249	1998-04-18	34	t	37838625210	3
2511	Nejla	Y	nejla.y36@gmail.com	5417987987	2000-07-15	53	f	28354585889	1
2512	Aşkım	KOÇAK	aşkım.koçak64@gmail.com	5393347258	1991-09-11	28	f	78682885003	0
2513	Nesrin	ECER	nesrin.ecer49@gmail.com	5453016251	2003-06-28	34	f	16557040166	2
2514	Akif	NAYAB	akif.nayab75@gmail.com	5316433149	2001-04-05	37	t	13174114780	0
2515	Abdulhalım	AKSAK	abdulhalım.aksak91@gmail.com	5424516699	1995-03-04	34	t	80144606754	0
2516	Ömer	ÇEVİK	ömer.çevik82@gmail.com	5507961997	1983-11-17	34	t	21913464188	0
2517	Serdar	VANLI	serdar.vanlı99@gmail.com	5528133320	1994-01-04	34	t	30932271561	0
2518	Ayşe	ÖZBEY	ayşe.özbey30@gmail.com	5418468578	1981-03-02	55	f	92973164432	1
2519	Recep Erhan	UĞUR	recep erhan.uğur31@gmail.com	5532782320	1999-05-02	34	t	77550322846	0
2520	İbrahim	CANER AKIN	ibrahim.caner akın58@gmail.com	5327368249	1999-04-19	34	t	51420570133	7
2521	Esra	KESKİN	esra.keskin52@gmail.com	5324364457	1990-02-07	34	f	20571520605	6
2522	Gökçe	DEMİR	gökçe.demir93@gmail.com	5331331169	1996-07-18	34	f	15298420842	0
2523	Sedat	ÖZÇELİK	sedat.özçelik16@gmail.com	5502388490	1998-06-13	2	t	85933194138	7
2524	Elvan	HASCAN	elvan.hascan55@gmail.com	5502668156	1980-06-07	54	f	69542987197	1
2525	Zülfükar	TAN SOYSAL	zülfükar.tan soysal98@gmail.com	5502566962	1984-12-11	52	t	12763742086	0
2526	İbrahim Emrah	ARCAGÖK	ibrahim emrah.arcagök53@gmail.com	5344014801	1996-01-26	34	t	65156757874	0
2527	İlyas	KALKAN	ilyas.kalkan87@gmail.com	5405364520	1984-06-25	75	t	73697489855	1
2528	Kağan	ŞİŞMAN	kağan.şişman82@gmail.com	5379035785	1998-04-10	6	t	26388958340	0
2529	Fethullah	DEMİRAY	fethullah.demiray27@gmail.com	5553592251	2001-03-27	61	t	27577492596	0
2530	Öztürk	AL	öztürk.al97@gmail.com	5301640649	1984-09-24	34	t	71897979186	1
2531	Bahadır	ERDOĞDU	bahadır.erdoğdu46@gmail.com	5374689863	1986-03-23	34	t	55144826215	0
2532	Kadir	AKTAŞ	kadir.aktaş77@gmail.com	5474236309	1981-06-16	34	t	98195746560	1
2533	Tümer	ASLAN	tümer.aslan11@gmail.com	5361378406	1984-08-19	25	t	56185085717	0
2534	Pınar	TEKÇAM	pınar.tekçam17@gmail.com	5438510973	1992-04-15	34	f	82360949039	0
2535	Halime	KOMŞUOĞLU	halime.komşuoğlu58@gmail.com	5363018929	2000-04-18	34	f	46580794823	0
2536	Mine	AKGÜN	mine.akgün29@gmail.com	5343094197	2000-05-11	34	f	81454717203	1
2537	İhsan	KİRİŞÇİ	ihsan.kirişçi66@gmail.com	5315918812	1998-03-22	34	t	79992748464	1
2538	Yasin	OZYİLMAZ	yasin.ozyilmaz61@gmail.com	5461364835	2002-04-09	61	t	47182289894	1
2539	İsmail	HUSEYNOV	ismail.huseynov11@gmail.com	5463396852	2001-02-14	9	t	85867220901	0
2540	Ahmet Yasir	KARAGÖL KÜÇÜK	ahmet yasir.karagöl küçük30@gmail.com	5465044404	1980-11-24	34	t	21947978766	0
2541	Nevin Ece	Y	nevin ece.y30@gmail.com	5379117497	2003-02-16	6	f	64705178097	0
2542	Alpaslan	ÖZANT	alpaslan.özant67@gmail.com	5554709330	1982-01-04	36	t	68632729583	0
2543	Merve	NURHAN	merve.nurhan33@gmail.com	5317847473	1985-09-13	34	f	40686209897	0
2544	Vahit	BAYRAKTAR	vahit.bayraktar91@gmail.com	5393124329	1989-05-22	34	t	30953294428	0
2545	Abdullah	AŞKAR	abdullah.aşkar31@gmail.com	5402826903	1993-11-02	34	t	83540914087	0
2546	Pınar	ARTAR	pınar.artar69@gmail.com	5361295661	1980-04-17	49	f	88640744229	2
2547	Tüzem	KAVUK	tüzem.kavuk36@gmail.com	5457205588	1983-07-05	34	f	75641537080	0
2548	Elif	ERTINMAZ	elif.ertınmaz68@gmail.com	5426355409	2000-09-05	6	f	11866945552	0
2549	Saadet	PALAOĞLU	saadet.palaoğlu48@gmail.com	5427187732	1986-03-01	34	f	80222898831	1
2550	Aylin	ÖZBAY	aylin.özbay70@gmail.com	5531558812	1998-12-20	34	f	94188606678	7
2551	Selma	KURT	selma.kurt36@gmail.com	5492771663	1983-10-20	76	f	63024073248	1
2552	Figen	GÜLER	figen.güler81@gmail.com	5372783559	1988-05-04	34	f	19436861914	0
2553	Nuray	PAKSOY	nuray.paksoy88@gmail.com	5357527589	1993-11-01	34	f	92409480285	1
2554	Fatma Mine	ÖZYURT	fatma mine.özyurt87@gmail.com	5461117329	1986-07-18	38	f	94588828707	1
2555	Mefule	SAKA	mefule.saka84@gmail.com	5369014793	1982-11-22	38	f	95546431065	7
2556	Deniz	KAVDIR	deniz.kavdır79@gmail.com	5303167596	1980-07-08	34	f	88608218883	0
2557	Gülden	GÖZLER	gülden.gözler57@gmail.com	5593945245	1994-10-06	34	f	21841853747	0
2558	Meltem	kınalı	meltem.kınalı70@gmail.com	5603197289	1983-03-04	34	f	29129981339	0
2559	Sema	ÇALAPÇIKAY	sema.çalapçıkay11@gmail.com	5371559856	1994-06-05	59	f	51110541342	0
2560	Ahmet Nuri	DUMAN	ahmet nuri.duman87@gmail.com	5436445669	1991-08-26	24	t	83478346844	0
2561	nca	COLAK	nca.colak62@gmail.com	5544149301	1980-04-21	34	f	80370810243	2
2562	Sezen	ÇİBUK	sezen.çibuk32@gmail.com	5601730566	1987-04-06	34	f	55237653055	0
2563	Esra Hande	TAŞÇI	esra hande.taşçı37@gmail.com	5572796844	1985-02-11	34	f	49138873605	7
2564	Gizem	BAHCİVANCİLAR	gizem.bahcivancilar76@gmail.com	5406865319	2002-06-12	34	f	32305004537	0
2566	Serdar	SEYDA	serdar.seyda92@gmail.com	5546014685	2001-01-10	55	t	60798793060	1
2567	İbrahim Halid	DOĞAN	ibrahim halid.doğan77@gmail.com	5359020733	1998-02-08	26	t	81225648123	7
2568	Zeynep	CİN	zeynep.cin92@gmail.com	5583875753	2003-05-26	28	f	38216790174	0
2569	Iraz	Y	ıraz.y55@gmail.com	5541763750	1994-11-16	31	f	78239639764	0
2570	Mustafa	GURLER	mustafa.gurler14@gmail.com	5387183382	2001-01-18	25	t	69968692226	0
2571	Selma	GÜNDÜZ DANIŞ	selma.gündüz danış64@gmail.com	5315569405	1988-08-27	34	f	62868999293	7
2572	Esra	ÖZKOÇAK	esra.özkoçak99@gmail.com	5559122582	1988-10-18	34	f	59930061414	1
2573	Uğur	HAKSEVER	uğur.haksever20@gmail.com	5522699446	1994-09-05	34	t	45609651518	0
2574	Metin	YILDIZ	metin.yıldız15@gmail.com	5375232390	1991-06-16	19	t	48983136426	1
2575	Fatih Cem	COULİBALY	fatih cem.coulibaly62@gmail.com	5374655736	2000-12-05	50	t	73170198098	0
2576	Sefa	ÖZ	sefa.öz17@gmail.com	5444700216	1984-07-16	28	t	19972238434	7
2577	Hüseyin	KILIÇ	hüseyin.kılıç74@gmail.com	5458996266	1984-09-04	34	t	50693348172	7
2578	Yasin	KILIÇ	yasin.kılıç58@gmail.com	5377170864	1986-11-04	7	t	64428981272	8
2579	Engin	ÖZYÜKSEL	engin.özyüksel88@gmail.com	5303767935	1982-04-12	28	t	41421322393	7
2580	Müşerref	AK	müşerref.ak17@gmail.com	5402600528	1988-01-04	50	t	95199350212	0
2581	Turhan	ŞAHİN	turhan.şahin91@gmail.com	5571631956	2003-07-01	34	t	54398822795	0
2582	Faruk	FİLİZAY	faruk.filizay55@gmail.com	5586487921	1996-12-12	42	t	89111649906	1
2583	Kemalettin	ÖZDEMİRKAN	kemalettin.özdemirkan34@gmail.com	5503031943	1989-11-01	16	t	52601810704	0
2584	İbrahim	ALMAHO	ibrahim.almaho33@gmail.com	5362694603	1980-05-04	58	t	46633410565	7
2585	Sema Hatun	POLVAN	sema hatun.polvan88@gmail.com	5382956700	1988-03-05	12	f	43992557679	0
2586	Merve	ŞAHİN	merve.şahin40@gmail.com	5545726193	2001-08-03	34	f	25174243094	7
2587	Hasan	GÜNDOĞDU	hasan.gündoğdu42@gmail.com	5446363387	1985-06-26	34	t	32384969735	1
2588	İbrahim	ŞİMŞEK	ibrahim.şimşek30@gmail.com	5327578693	1983-05-21	29	t	90209759659	7
2589	Mehmet	AĞCABAY	mehmet.ağcabay29@gmail.com	5544595761	2001-10-24	47	t	31172876335	0
2590	Ahmet	BAŞARGAN	ahmet.başargan82@gmail.com	5568880263	2002-10-23	58	t	91243052687	7
2591	Nural Elif	SHEİKH NUR	nural elif.sheikh nur27@gmail.com	5541915811	1996-11-05	34	f	24143290594	3
2592	Esra	SANABRIA MEDINA	esra.sanabrıa medına76@gmail.com	5477268154	1980-04-27	34	f	40191022183	7
2593	Emine	KUTLU	emine.kutlu80@gmail.com	5576452379	1986-01-17	34	f	64740499196	0
2594	Muhammet Furkan	DURAK	muhammet furkan.durak21@gmail.com	5477091288	1980-02-26	44	t	29789767152	0
2595	Sacit Emre	TURHAN	sacit emre.turhan22@gmail.com	5468204882	1988-11-05	34	t	12948903393	0
2596	Elif	YILDIRIM	elif.yıldırım15@gmail.com	5457165903	2001-05-02	34	f	67693375634	7
2597	Raif	BAYRAKTAR	raif.bayraktar85@gmail.com	5343360712	1981-08-06	36	t	25238208554	0
2598	Yasemin	ESHETU	yasemin.eshetu58@gmail.com	5332363189	1995-12-15	78	f	76859311386	0
2599	Abdurrahman	ŞAN	abdurrahman.şan86@gmail.com	5534918750	1994-12-09	34	t	24351474749	1
2600	Abdulkerim Talha	YILMAZ	abdulkerim talha.yılmaz71@gmail.com	5456328430	2003-02-26	34	t	30119156951	0
2601	Melih	KÖSE	melih.köse96@gmail.com	5507854402	1984-10-19	34	t	82287533583	6
2602	Nagehan	YASEVAŞ	nagehan.yasevaş18@gmail.com	5504354306	2003-08-16	34	f	49879246834	7
2603	Burhan	MIRIXIATI	burhan.mırıxıatı62@gmail.com	5303339856	1996-06-15	24	t	75945269391	0
2604	Murat	SIMAYI	murat.sımayı92@gmail.com	5463062127	2001-11-24	34	t	21505977777	7
2605	Ahmet Yusuf	GÜNGÖR	ahmet yusuf.güngör39@gmail.com	5343237556	2003-10-17	34	t	79942533917	7
2606	Yusuf	HAKİMİ	yusuf.hakimi99@gmail.com	5381163216	1996-05-15	2	t	28364161583	0
2607	Mehmet Ali	DURANLAR	mehmet ali.duranlar 70@gmail.com	5352662711	2003-11-15	15	t	11479486176	7
2608	Hüseyin	AY	hüseyin.ay91@gmail.com	5385145279	1993-02-06	18	t	94977176923	0
2609	Sezai	GÜNAYDIN	sezai.günaydın88@gmail.com	5474421525	1982-08-03	58	t	52395103109	0
2610	Yener	KARAKA	yener.karaka49@gmail.com	5346890591	1987-05-11	53	t	86263834365	1
2611	Volkan	BAYRAKTAR	volkan.bayraktar51@gmail.com	5313905904	1987-04-01	10	t	99431756008	1
2612	Ülkü	BALCIOĞLU	ülkü.balcıoğlu33@gmail.com	5519097452	1988-06-09	50	f	97087179624	5
2613	Hakan Fikret	Y	hakan fikret.y82@gmail.com	5582484335	1980-06-04	34	t	66135702604	0
2614	Adnan	ŞEN	adnan.şen98@gmail.com	5599180422	1998-08-04	19	t	64359243797	0
2615	Ceyda	YAZICIOĞLU	ceyda.yazıcıoğlu73@gmail.com	5564729404	1982-01-18	34	f	64345137388	0
2616	Burçin	YAHYAOĞLU	burçin.yahyaoğlu77@gmail.com	5365535615	2000-03-22	34	f	43555340707	0
2617	Sacide	UÇAR	sacide.uçar76@gmail.com	5347379784	1986-04-28	26	f	57323517971	8
2618	Hatice Duygu	ŞENTÜRK	hatice duygu.şentürk41@gmail.com	5567974182	1985-07-21	43	f	75787123028	7
2619	İskender	Y	iskender.y66@gmail.com	5384900834	2003-07-01	46	t	97379836970	1
2620	Aslıhan	AKSOY	aslıhan.aksoy25@gmail.com	5526093446	1998-02-20	16	f	64613600297	0
2621	Hatice	ÇORUH	hatice.çoruh10@gmail.com	5362980207	1985-05-09	55	f	68800132457	1
2622	Göksel	ETKESER	göksel.etkeser23@gmail.com	5364392961	1993-08-17	34	t	31093558534	7
2623	Önder	METE	önder.mete44@gmail.com	5485647769	2000-02-22	61	t	22112624177	0
2624	Ayşenur	SEVİĞ	ayşenur.seviğ17@gmail.com	5369138580	2002-09-12	34	f	33023576564	0
2625	Abdullah Ethem	ÇEÇEN	abdullah ethem.çeçen90@gmail.com	5305498816	1990-04-07	19	t	42406511613	0
2626	Ünal	KURT	ünal.kurt57@gmail.com	5608248263	1992-07-04	34	t	62270442689	0
2627	Yüksel	YEREBASMAZ	yüksel.yerebasmaz62@gmail.com	5456696285	1993-02-10	34	t	36731745253	0
2628	Ayşen	YAYLA	ayşen.yayla50@gmail.com	5467722406	1982-10-03	34	f	25944544012	0
2629	Koray	YÜKSEL	koray.yüksel56@gmail.com	5413376450	1992-03-01	67	t	26632126626	1
2630	Recep	ŞENTÜRK	recep.şentürk20@gmail.com	5404895480	1990-02-03	34	t	87736832515	0
2631	Nurşah	KADİRİOĞLU	nurşah.kadirioğlu13@gmail.com	5503839541	1983-06-12	46	f	30658102833	0
2632	Hasan Murat	ERER	hasan murat.erer19@gmail.com	5354837443	1983-10-25	61	t	42416503919	0
2633	Numan Fazıl	MURAT	numan fazıl.murat41@gmail.com	5506400627	1980-11-25	25	t	33645075044	0
2634	Ünal	SEVENCAN	ünal.sevencan96@gmail.com	5318468729	1981-10-25	34	t	73183316567	0
2635	Şükran	ÖZENER	şükran.özener15@gmail.com	5438823652	1985-09-25	32	f	29498113995	0
2636	Alaeddin	GÜNEREN	alaeddin.güneren82@gmail.com	5331017358	1995-04-13	3	t	68704360573	0
2637	Elif Zeynep	GEMİCİ	elif zeynep.gemici96@gmail.com	5416623685	1984-03-23	34	f	25024590302	1
2638	Sinan	BİÇER	sinan.biçer29@gmail.com	5506489892	1987-05-14	6	t	53086646098	0
2639	Murat	KİRAZ	murat.kiraz52@gmail.com	5521248445	1999-06-04	34	t	34684119723	0
2640	Ali	ALTUNBÜKEN	ali.altunbüken50@gmail.com	5604405369	2001-01-05	11	t	92492262102	0
2641	Tamer	ÖZAN	tamer.özan42@gmail.com	5522923447	1980-12-15	34	t	55395053405	0
2642	Şevki	OŞAR	şevki.oşar25@gmail.com	5357980638	2003-10-20	34	t	67226356437	7
2643	Mehmet	SEVÜK	mehmet.sevük95@gmail.com	5322923313	1997-12-07	79	t	39205415010	0
2644	Şenay	AKÇİÇEK	şenay.akçiçek90@gmail.com	5362902617	1980-06-14	34	f	94343936835	7
2645	Beyza Nur	ASLANLI	beyza nur.aslanlı10@gmail.com	5311516976	2000-02-06	34	f	57858020781	0
2646	Emil	Y	emil.y27@gmail.com	5484980543	1995-05-04	34	f	87550603569	1
2647	Gökhan	MURAT	gökhan.murat91@gmail.com	5363575418	1987-10-07	34	t	43235271084	2
2648	Çağlayan Saba	NAMLI	çağlayan saba.namlı93@gmail.com	5484800533	1991-09-18	1	f	50470774918	0
2649	Ayşegül	Oğurlu	ayşegül.oğurlu10@gmail.com	5338736496	1985-03-05	34	f	24588751976	1
2650	Ece	ÇIK	ece.çık99@gmail.com	5438786439	1993-04-08	78	f	29297191193	0
2651	Selahattin	YİĞİT	selahattin.yiğit77@gmail.com	5432274186	1988-10-11	34	t	88134063890	0
2652	Sümeye	KARAKUŞ	sümeye.karakuş28@gmail.com	5581613975	2001-03-15	34	f	60543954220	1
2653	Uğur Yasin	YILMAZ	uğur yasin.yılmaz70@gmail.com	5414238325	1998-08-18	34	t	35542696600	3
2711	Yasin Atakan	Y	yasin atakan.y27@gmail.com	5543507952	1987-02-13	34	t	12247762683	7
2806	Mustafa Seyfullah	YILMAZ	mustafa seyfullah.yılmaz69@gmail.com	5563036341	1988-02-16	34	t	71229231963	0
2821	Hasan Serdar	ALTUN	hasan serdar.altun87@gmail.com	5498242628	1990-05-12	6	t	18539116202	0
2852	Salih	KAYAYURT	salih.kayayurt37@gmail.com	5571207661	1983-06-19	22	t	13794390232	0
2888	Mehmet	BAL	mehmet.bal36@gmail.com	5423480835	1984-05-26	61	t	97803133931	0
2922	Osman	DEMİRTÜRK	osman.demirtürk30@gmail.com	5464525133	1997-08-26	64	t	31626024734	0
2973	Osman Can	ALTINER	osman can.altıner91@gmail.com	5602837934	1981-10-16	44	t	99270876432	1
3098	Mehmet	ARİK	mehmet.arik22@gmail.com	5354374638	1996-07-15	34	t	77270868778	0
3157	Ömer Faruk	KARAAHMETOĞLU	ömer faruk.karaahmetoğlu37@gmail.com	5413883206	1991-06-11	61	t	98394641227	0
3281	Hakan	SÖLMEN	hakan.sölmen86@gmail.com	5494490867	1984-11-04	34	t	18809735138	0
3304	Süleyman Görkem	RENA	süleyman görkem.rena30@gmail.com	5365087226	1999-12-05	6	t	15925322067	0
3335	Fethi	TATAR	fethi.tatar26@gmail.com	5548463694	1982-02-28	61	t	77995851185	0
3344	Fatih Oğuz Han	ARSLAN	fatih oğuz han.arslan54@gmail.com	5532375959	1993-01-06	10	t	24284998180	0
3408	Erdem	GASIMOV	erdem.gasımov79@gmail.com	5371775154	1981-10-14	34	t	30095449699	0
3423	Enes Ahmet	ŞENTÜRKATA	enes ahmet.şentürkata11@gmail.com	5402087513	1988-01-16	34	t	80997417590	0
3446	Muhammet Emin	MENFAATLI	muhammet emin.menfaatlı75@gmail.com	5558288665	1994-07-17	34	t	52157174471	0
3471	Emre	YARKAN	emre.yarkan82@gmail.com	5608004728	2003-05-10	34	t	44954625023	0
3745	Ahmet	ÖZTÜRK	ahmet.öztürk70@gmail.com	5425356244	1980-09-17	34	t	63985639069	0
3747	Ahmet Cihat	BAL	ahmet cihat.bal98@gmail.com	5321443919	1988-07-14	34	t	13810633448	0
3764	AHMET	ZAİM	ahmet.zaim58@gmail.com	5518127980	1999-11-17	34	t	96978224205	0
3788	Arif Can	KUTLU	arif can.kutlu41@gmail.com	5574099819	1997-12-07	34	t	74198210435	7
3825	Yıldız	HİDRİ	yıldız.hidri59@gmail.com	5492745455	1987-03-21	63	f	14643125771	0
3871	Tuğba	KIZILCA UNGEVER	tuğba.kızılca ungever22@gmail.com	5369121475	1982-06-25	6	f	58850244731	0
4066	Nurdan	KUŞAKCI	nurdan.kuşakcı42@gmail.com	5464344633	1995-10-23	26	f	87868054207	0
4191	Merve	KEÇE	merve.keçe86@gmail.com	5374120754	1993-10-01	34	f	95288425258	0
4398	Elif	HADİHA	elif.hadiha33@gmail.com	5382845210	1980-10-15	53	f	18197616210	0
4418	Şaziye Eda	ÖZBÜTÜN	şaziye eda.özbütün90@gmail.com	5581972825	1982-05-24	58	f	49985316503	0
4444	Duygu	YILMAZ	duygu.yılmaz16@gmail.com	5361758103	1980-06-22	34	f	40901682116	0
4507	Ruken	ŞENGÜL	ruken.şengül93@gmail.com	5482449548	2003-02-16	49	f	61294374597	0
4523	Büşra	MOHAMMAD	büşra.mohammad68@gmail.com	5476943510	1989-02-02	6	f	78090531751	0
4619	Asena	ÖZ	asena.öz64@gmail.com	5481612970	1999-11-04	4	f	30754315947	0
4659	Ebru	QADERİ	ebru.qaderi62@gmail.com	5422379176	1999-11-27	34	f	64389769436	0
4660	YURDANUR	ZIRH	yurdanur.zırh11@gmail.com	5354368205	1984-04-02	59	f	65257686200	5
4661	Ali	TAN DEHMEN	ali.tan dehmen15@gmail.com	5571278870	1980-05-03	58	t	94278065681	0
4662	SERDAR	KAYA	serdar.kaya35@gmail.com	5552376963	1992-08-11	34	t	99065850323	4
4663	ÜMİT	AKPINAR	ümit.akpınar65@gmail.com	5591000488	1999-10-20	34	t	76449248507	7
4664	Murat	EROL	murat.erol33@gmail.com	5416303562	1989-03-22	34	t	52201803927	0
4666	Muhammet Serhat	MEHTİZADA	muhammet serhat.mehtizada41@gmail.com	5515008165	1988-11-15	61	t	83739710983	0
4667	MUAMMER	BİTGEN	muammer.bitgen79@gmail.com	5332608817	2003-09-12	5	t	65278782988	1
4668	Beytullah Gültekin	KARASOY	beytullah gültekin.karasoy18@gmail.com	5433370645	1981-11-14	26	t	93753425074	0
4669	HALE	ALKIŞ	hale.alkış95@gmail.com	5577355775	1995-07-10	78	f	36050871499	0
4671	Mine Biret	BÜLÜN	mine biret.bülün52@gmail.com	5348368488	1990-09-24	52	f	61443526487	0
4672	HALUK	TEMEL	haluk.temel10@gmail.com	5436230629	1988-06-07	34	t	27318288887	0
4673	Fatma Refika	AHMADOV	fatma refika.ahmadov51@gmail.com	5495975597	1987-10-23	34	f	40726674692	0
4674	Haluk	BAYRAM	haluk.bayram59@gmail.com	5481045162	1989-03-08	48	t	56924739039	0
4675	MUSTAFA	BOZBEY	mustafa.bozbey95@gmail.com	5605872530	1983-04-23	81	t	50142321897	7
4676	SELİM	İNCİ	selim.inci28@gmail.com	5501767324	1981-11-23	42	t	97353691992	0
4677	DENİZ TURGAY	ARSLAN	deniz turgay.arslan99@gmail.com	5392945938	1989-12-25	34	t	10463676985	1
4678	Fethullah	KARADEMİR	fethullah.karademir55@gmail.com	5601537964	1998-01-26	2	t	99612543376	0
4680	OĞUZHAN	CAYIK	oğuzhan.cayık64@gmail.com	5607767767	1980-08-18	35	t	32559700010	3
4681	YAVUZ	YÜKSEL	yavuz.yüksel51@gmail.com	5303832833	2000-03-06	34	t	12660731772	7
4682	DİDEM	HÜSEYİNBEYLİ	didem.hüseyinbeyli29@gmail.com	5465416774	1980-10-23	45	f	66384911213	5
4683	Hakan	GHIUZEL	hakan.ghıuzel36@gmail.com	5361885300	1985-09-16	59	t	91165115221	7
4684	EMİNE GÜL	ÜTEBAY	emine gül.ütebay51@gmail.com	5352258374	2002-02-14	32	f	85877045497	0
4685	NEVBAHAR	ÇELEN	nevbahar.çelen58@gmail.com	5503987378	1984-01-24	71	f	82144569339	0
4686	Şiir	GÜNÜŞEN	şiir.günüşen57@gmail.com	5487422711	1996-07-12	34	f	46789316291	0
4687	MİNE ŞAKİRE	İMRAĞ	mine şakire.imrağ80@gmail.com	5393334694	1981-03-05	35	f	93014499272	3
4688	Yasemin	ERYILMAZ	yasemin.eryılmaz43@gmail.com	5404247208	1998-04-17	34	f	33790057323	0
4689	Gülhan	İŞCEN	gülhan.işcen95@gmail.com	5358012464	1997-12-08	34	f	11794993114	0
4690	Aydan	KUŞ	aydan.kuş62@gmail.com	5535377462	1990-06-06	53	f	56265921219	0
4691	Handan	BATUR	handan.batur21@gmail.com	5544296457	2003-05-15	61	f	39114236361	2
4692	Berke	BİLGİLİ	berke.bilgili60@gmail.com	5464049676	1981-05-17	34	t	59853408329	0
4693	Zehra Kaya	BOZKURT	zehra kaya.bozkurt16@gmail.com	5334951700	1987-12-24	35	f	11757123276	6
4695	Gülsu	AYDIN	gülsu.aydın24@gmail.com	5492065656	1993-07-05	34	f	40336816114	0
4696	ORHAN	DEMİR	orhan.demir93@gmail.com	5438817741	1985-09-06	60	t	93971364752	7
4697	Selçuk	TİPİ	selçuk.tipi80@gmail.com	5542477957	1990-05-14	56	t	45217244189	0
4698	ALİ İZZET	KAMIŞ	ali izzet.kamış42@gmail.com	5476638832	1996-01-17	34	t	79260736955	0
4699	İMRE	TANYERİ	imre.tanyeri71@gmail.com	5314168471	1987-04-26	34	f	89513783612	7
4700	SİNAN	YIMAMU	sinan.yımamu96@gmail.com	5553044568	2000-09-03	34	t	76620166326	1
4701	SEVİNÇ	Y	sevinç.y23@gmail.com	5333696676	1986-01-01	33	f	78077462953	3
4702	Fatma	ŞAKIAYDIN	fatma.şakıaydın12@gmail.com	5563683701	1988-10-02	61	f	29960867479	0
4704	Zafer	KAYMAK	zafer.kaymak51@gmail.com	5556473854	1984-09-07	54	t	11336278889	3
4705	CELAL	ÖZEN	celal.özen85@gmail.com	5394659240	1985-06-08	52	t	49521284458	0
4706	SEVİM ECE	HİDİMOĞLU	sevim ece.hidimoğlu36@gmail.com	5397706272	2000-01-12	44	f	14472814969	7
4707	Ahmet Ulvi	KENDİR	ahmet ulvi.kendir31@gmail.com	5495309507	1990-08-28	34	t	56627588121	0
4709	ZEYNEP ZUHAL	AKIN	zeynep zuhal.akın57@gmail.com	5318773247	1997-04-26	6	f	70091625261	0
4710	SEBA	KARAMAN	seba.karaman85@gmail.com	5477333518	2000-07-28	34	f	37092031983	0
4711	DEMET	TURAN	demet.turan44@gmail.com	5424467725	1997-04-06	34	f	62561015926	2
4712	Vatan	ŞEKER	vatan.şeker67@gmail.com	5508041273	2002-01-11	44	t	38892837416	0
4713	İbrahim	BABAYEV	ibrahim.babayev87@gmail.com	5325515699	2000-10-05	34	t	45096194974	0
4714	Ali Kemal	GENÇ	ali kemal.genç99@gmail.com	5387476705	1986-04-10	3	t	57134583691	0
4715	PİR ALİ	YILMAZ	pir ali.yılmaz28@gmail.com	5361722900	1991-04-10	4	t	23270048478	0
4716	MAHMUT ZEYYAT	CEYLAN	mahmut zeyyat.ceylan59@gmail.com	5326754544	1980-02-13	65	t	62113244641	0
4717	Sırrı	GÖKER	sırrı.göker91@gmail.com	5433945963	1985-01-26	36	t	40662671147	0
4718	FEHMİ ALİ	KÜÇÜK	fehmi ali.küçük58@gmail.com	5427055794	2001-02-07	6	t	45343402736	5
4719	Başak Aydem	PULLUKÇU	başak aydem.pullukçu69@gmail.com	5357389866	1995-06-13	10	f	65246576436	0
4720	METİN	KELMENDİ	metin.kelmendi23@gmail.com	5547163285	1998-02-22	16	t	50833737569	0
4721	NURAN	GENÇ	nuran.genç99@gmail.com	5303927863	1993-12-20	16	f	29176936320	2
4722	SAİT YÜKSEL	Y	sait yüksel.y13@gmail.com	5308756299	1982-12-18	58	t	77552408460	5
4723	Melek	DENİZ BAŞAR	melek.deniz başar83@gmail.com	5355407743	1982-12-06	16	f	61539886006	0
4724	ADNAN	ÇORLU	adnan.çorlu41@gmail.com	5442534860	1998-11-22	16	t	73275344949	1
4725	JALE	OĞAN	jale.oğan22@gmail.com	5474271203	1987-07-06	46	f	14573944812	0
4726	Mehmet	KARA	mehmet.kara45@gmail.com	5394511178	1995-11-20	6	t	74210364482	0
4727	GÖKHAN	VAROL	gökhan.varol12@gmail.com	5522492188	1991-02-11	16	t	74071749857	0
4728	ASUDE	KARAGÖZ	asude.karagöz29@gmail.com	5381960596	1980-02-08	45	f	38983133596	0
4729	Lale	KARAMUS	lale.karamus64@gmail.com	5558229949	1985-10-08	11	f	90151861352	0
4730	YÜCEL	SAĞLIK	yücel.sağlık40@gmail.com	5483630856	1993-03-13	34	t	90830176516	0
4731	Ümit	ÜLVAN	ümit.ülvan61@gmail.com	5317947113	1990-01-21	34	f	44787745072	0
4732	Ahmet Kamil	ÖNER	ahmet kamil.öner18@gmail.com	5344568414	1980-03-21	16	t	89238559848	0
4733	Ahmet Emre	GAZİ	ahmet emre.gazi24@gmail.com	5358715397	1992-04-12	1	t	77030265941	0
4734	NİZAMETTİN	TUERXUN	nizamettin.tuerxun69@gmail.com	5322613160	1992-08-08	22	t	50928828515	0
4735	Özge	TOPÇU	özge.topçu46@gmail.com	5352659668	1981-08-27	1	f	31130655086	0
4736	Lale	IŞIK	lale.ışık95@gmail.com	5342377928	1984-04-09	61	f	70998292909	0
4737	Tuğsan	ADİLEH	tuğsan.adileh24@gmail.com	5605364734	2003-05-27	80	t	84281908722	7
4738	SÜLEYMAN NAZİF	KAYAR	süleyman nazif.kayar60@gmail.com	5311517948	1980-08-07	20	t	57187866567	5
4739	Gözde	KARSLI	gözde.karslı15@gmail.com	5602726287	1980-01-08	34	f	85138801642	0
4740	Gönül	ÖZEL	gönül.özel68@gmail.com	5506787202	2000-11-05	34	f	55504051945	0
4741	TUĞÇE ŞULE	ÇINAR	tuğçe şule.çınar88@gmail.com	5303152809	1992-12-22	25	f	43535823148	7
4742	FERDA	DEDEOĞLU	ferda.dedeoğlu68@gmail.com	5315481621	1994-11-14	34	f	23981216105	3
4745	ANI VERJIN	ZEYBEK	anı verjın.zeybek94@gmail.com	5343153369	1999-05-11	34	f	73996284086	1
4746	TENZİLE	KARAKOÇ	tenzile.karakoç84@gmail.com	5541985260	1995-09-01	34	f	91390988500	0
4750	Esra	KAYNARCA	esra.kaynarca52@gmail.com	5502775984	1987-12-06	34	f	91615524855	0
4751	Yasemin	ERDEM	yasemin.erdem34@gmail.com	5592505739	1993-09-23	34	f	29492542540	0
4752	Nazan	LALİK	nazan.lalik19@gmail.com	5525219862	1990-12-08	21	f	67471711310	0
4753	BERNA	GÖVEÇ	berna.göveç58@gmail.com	5532428457	1982-11-18	34	f	50350701509	0
4754	SERPİL MELTEM	TZAFER ZADE	serpil meltem.tzafer zade89@gmail.com	5507600465	1984-01-13	47	f	35173729043	0
4761	AHMET	KILIÇ	ahmet.kılıç61@gmail.com	5363997876	1989-12-02	28	t	66180235753	0
4762	Hayrullah	GÖKÇEN	hayrullah.gökçen82@gmail.com	5444555922	1985-12-17	24	t	72616020374	0
4763	Songül	Rexiti	songül.rexiti81@gmail.com	5606177556	1986-06-27	61	f	25397648858	7
4764	Öget	EROĞLU	öget.eroğlu52@gmail.com	5499010879	1999-06-27	34	f	82987182762	7
4765	Tevhide Aslı	KANDEMİR	tevhide aslı.kandemir60@gmail.com	5382982272	1983-06-23	6	f	75028158907	7
4766	Birgül	MUMCUOĞLU	birgül.mumcuoğlu77@gmail.com	5312550652	1984-05-01	34	f	99874322353	1
4767	FULYA SEDA	CEYLAN	fulya seda.ceylan92@gmail.com	5485786111	1989-08-10	34	f	52005054266	7
4768	Serap	ERDEMİR	serap.erdemir86@gmail.com	5406623545	1989-07-13	34	f	90448419203	0
4769	MURAT ERTAN	AKYÜZ	murat ertan.akyüz85@gmail.com	5465278901	1994-10-23	34	t	27347718614	7
4770	Cem	TAPTIK	cem.taptık68@gmail.com	5594162626	1990-02-10	34	t	61782436056	0
4771	Erhan	ÖZEKEN	erhan.özeken73@gmail.com	5485366663	2000-09-18	34	t	39858284236	5
4772	OĞUZ	ÖZKANLISOY	oğuz.özkanlısoy25@gmail.com	5453297874	1988-09-12	27	t	77905565765	1
4773	Bilal	SEYMEN	bilal.seymen51@gmail.com	5418495504	1997-01-22	34	t	55856030541	0
4774	Bülent Ümit	PAÇACI	bülent ümit.paçacı59@gmail.com	5582987110	1996-04-06	34	t	50985716250	0
4775	Firdevs Almila	SEZER	firdevs almila.sezer70@gmail.com	5352911529	1993-09-26	34	f	15319402797	0
4776	Feza	KIRAN	feza.kıran29@gmail.com	5602088396	1990-08-17	78	f	53257907803	0
4777	FATMA PINAR	KAVAK	fatma pınar.kavak36@gmail.com	5316783910	2000-01-05	41	f	65031148330	0
4778	Bahar	YİĞİT	bahar.yiğit23@gmail.com	5491723398	1992-08-12	6	f	46994252600	0
4781	Melikşah	AYDIN	melikşah.aydın62@gmail.com	5506563601	2002-07-20	36	f	60027626444	0
4783	Müge	OKU DEMİR	müge.oku demir68@gmail.com	5598588745	2000-10-14	34	f	52448729656	0
4785	Ayşe Simin	ZAİNO	ayşe simin.zaino21@gmail.com	5383401919	2000-04-25	6	f	73043934284	6
4786	BERK MURAT	KOCAMAN	berk murat.kocaman13@gmail.com	5426237675	1980-11-24	34	t	77047592036	0
4787	Mehmet	EKİNCİ KARABAŞ	mehmet.ekinci karabaş84@gmail.com	5482655767	1995-04-05	33	t	95587327712	0
4788	Halil	GURBETCİ	halil.gurbetci32@gmail.com	5439062410	1990-02-22	53	t	96006725451	0
4789	Veli	VODİNA	veli.vodina77@gmail.com	5484043943	1986-09-27	24	t	43376299833	0
4790	Mustafa Falih	AKÇAY BAYDAR	mustafa falih.akçay baydar62@gmail.com	5448582444	2003-09-28	34	t	32297971760	0
4791	Belma	CEYLAN	belma.ceylan49@gmail.com	5552501109	1995-09-24	58	f	67688286124	3
4792	BİLGEN	OĞURLU	bilgen.oğurlu41@gmail.com	5366449604	1986-10-26	35	t	29054658602	0
4793	SUNA	YAYLAGÜLÜ	suna.yaylagülü78@gmail.com	5448472321	1997-06-28	9	f	45335426545	0
4794	İskender	KÜÇÜKOĞLU	iskender.küçükoğlu58@gmail.com	5474413185	1987-09-02	64	t	16649384655	0
4795	Cenk Yaşar	KALKAN	cenk yaşar.kalkan11@gmail.com	5585652637	1992-03-18	34	t	47358403489	0
4796	Hüseyin	DEMİR	hüseyin.demir65@gmail.com	5544831213	1993-09-06	57	t	49938954384	0
4797	Makbule Meziyet	BAYARTAN	makbule meziyet.bayartan22@gmail.com	5505702224	1995-01-15	7	f	26036332297	0
4799	AHMET	AHMED	ahmet.ahmed28@gmail.com	5556239688	2000-03-21	3	t	70732398288	0
4800	CEMAL	GÜNDÜZ	cemal.gündüz35@gmail.com	5312373404	1997-03-19	9	t	48668282224	0
4801	Murat	MUVAFFAK İSMAİL	murat.muvaffak ismail97@gmail.com	5484200640	1990-08-28	6	t	31148037611	0
4802	İlyas	ERDOĞAN	ilyas.erdoğan25@gmail.com	5478316521	1993-07-09	53	t	32523424356	0
4803	Doğan	ÇOLAK	doğan.çolak96@gmail.com	5527572430	1988-02-10	16	t	53471228587	0
4805	ÖZKAN	YİĞİT	özkan.yiğit19@gmail.com	5564400930	1994-08-07	55	t	40212297152	1
4806	ALİ ERSİN	AŞUT	ali ersin.aşut45@gmail.com	5313557786	1985-08-10	34	t	36663696070	0
4807	ONUR	ÖZTÜRK	onur.öztürk94@gmail.com	5572287903	1996-07-11	34	t	93629171238	0
4808	Ahmet	KOLUKISAOĞLU	ahmet.kolukısaoğlu18@gmail.com	5441449869	1996-05-20	28	t	98080689135	0
4810	NURULLAH	DURMAZ	nurullah.durmaz73@gmail.com	5606273358	1996-06-09	25	t	46646850810	0
4811	Mehmet Nihat	ASKA DALLİ	mehmet nihat.aska dalli75@gmail.com	5593818111	1994-02-13	34	t	59494508578	0
4812	CEYHUN	DİNLER	ceyhun.dinler44@gmail.com	5482347957	2002-04-06	25	t	53276218803	0
4813	Mustafa Sinan	YAMAN	mustafa sinan.yaman68@gmail.com	5586460699	1984-11-12	34	t	50068946303	0
4814	TEVFİK	KOÇOĞLU	tevfik.koçoğlu88@gmail.com	5504724729	1995-09-27	9	t	90669243497	0
4815	UĞUR	XIAOHELAITI	uğur.xıaohelaıtı45@gmail.com	5551868499	1991-04-02	80	t	86928001279	0
4816	SEMA	ASLANTAŞ	sema.aslantaş22@gmail.com	5435921907	2003-11-08	27	f	47949132745	0
4820	YİĞİT	KILIÇER	yiğit.kılıçer30@gmail.com	5457624771	1986-05-03	52	t	68818984697	0
4822	Fatma Gülruh	GÜR	fatma gülruh.gür85@gmail.com	5317650929	1991-08-01	34	f	26421976237	0
4823	Şerif	GERİDÖNMEZ	şerif.geridönmez46@gmail.com	5337894474	1985-06-14	34	t	52155594412	0
4824	Hüsrev	ERTUNA	hüsrev.ertuna34@gmail.com	5408235985	1990-07-03	60	t	74121517388	0
4825	Süleyman Faruk	BÜYÜKSOY	süleyman faruk.büyüksoy62@gmail.com	5391757499	1984-10-27	34	t	45279917701	0
4826	Meral	ÖZCANLI	meral.özcanlı71@gmail.com	5527870534	1992-03-06	34	f	41493328097	0
4827	Recep	ATAKAN	recep.atakan61@gmail.com	5476475713	2000-11-08	38	t	61765719350	0
4828	Dündar Murat	HUPİDİNG	dündar murat.hupiding66@gmail.com	5542802671	1996-01-05	54	t	70933783686	0
4829	Artun	BOZLAĞAN	artun.bozlağan37@gmail.com	5427709915	1984-08-14	34	t	64479859275	0
4830	Esra	ARSLAN	esra.arslan20@gmail.com	5542103678	1980-07-04	54	f	92377817448	0
4831	Aslı	AİMAİERJİANG	aslı.aimaierjiang85@gmail.com	5496494591	1984-06-20	34	f	39418157370	1
4832	Serdar	Y	serdar.y54@gmail.com	5448385440	1996-03-18	19	t	52737326841	0
4833	Uğur	BAZ	uğur.baz75@gmail.com	5526084155	2003-07-10	34	t	21512963185	1
4834	Hatice	ERSOY	hatice.ersoy21@gmail.com	5336228372	1995-04-11	34	f	87068292015	0
4835	Mustafa İlker	ÖZER	mustafa ilker.özer83@gmail.com	5331910206	1999-03-07	43	t	97708795617	0
4836	Ömer	AYRIK	ömer.ayrık55@gmail.com	5592151434	1991-10-23	6	t	18941013213	0
4837	Mehmet Akif	SARIYILDIZ	mehmet akif.sarıyıldız42@gmail.com	5533198577	1989-06-27	44	t	59879642492	0
4838	Fatih	ALTAN	fatih.altan16@gmail.com	5604807696	1984-11-13	1	t	37976777470	0
4840	HANDAN ASUDE	KARABULUT	handan asude.karabulut38@gmail.com	5584329979	1991-12-09	54	f	67896115699	0
4842	İsmail	BOZBURUN	ismail .bozburun28@gmail.com	5421254387	2003-03-26	18	t	36316839817	0
4844	Şahinur	BALABAN	şahinur.balaban81@gmail.com	5422210467	1986-08-23	21	f	60267724970	0
4845	Ayser	KABİL	ayser.kabil26@gmail.com	5423333289	1980-06-15	53	f	29599070091	0
4846	Gökçin	ERKAN	gökçin.erkan35@gmail.com	5356212400	1980-07-08	25	t	60878491258	0
4847	Ahmet	KAPLAN	ahmet.kaplan15@gmail.com	5414552620	1994-09-07	18	t	38392583467	0
4848	Şengül	ÖKTEN	şengül .ökten70@gmail.com	5441111420	2003-02-28	18	f	49472222597	0
4849	İrde	TURANOĞLU	irde.turanoğlu24@gmail.com	5555008490	1998-03-11	77	f	34706404803	1
4850	Ceyda	PİROV	ceyda.pirov56@gmail.com	5511215446	1983-11-14	59	f	72564797409	0
4851	Melike	JAMMEH	melike.jammeh66@gmail.com	5333177180	1988-06-27	34	f	89065681045	0
4852	Cansu Müge	ABUDUREXITI	cansu müge.abudurexıtı66@gmail.com	5521961925	1999-11-03	34	f	54283352788	0
4853	Kaan	Y	kaan.y92@gmail.com	5507898367	1994-08-18	34	t	82502436273	3
4854	Pınar	YENİLMEZ	pınar.yenilmez20@gmail.com	5352215855	1992-04-07	34	f	56734457926	7
4855	Hacer Merve	BAYRAKTAR	hacer merve.bayraktar68@gmail.com	5375234346	2001-12-28	34	f	89169582466	1
4856	Büşra	KOBAN	büşra.koban51@gmail.com	5418228985	1991-10-03	6	f	82052456784	5
4857	Gamze	ÖZEN	gamze.özen48@gmail.com	5556634607	1988-04-07	34	f	86055137539	1
4858	Hüseyin	GÖKPINAR TACİROĞLU	hüseyin.gökpınar taciroğlu99@gmail.com	5551611810	2000-08-04	55	t	98249583659	0
4859	Ali Osman	FERCHİCHİ	ali osman.ferchichi66@gmail.com	5411233358	1996-03-22	18	t	78330321123	1
4860	Cevat Bora	Y	cevat bora.y47@gmail.com	5411549814	1983-09-25	34	t	28678260725	0
4861	Rüya	ÇAĞLAN	rüya.çağlan69@gmail.com	5551588345	1992-05-21	16	f	31448288906	0
4862	Birnur	SH ALİ İBRAHİM	birnur.sh ali ibrahim38@gmail.com	5423551403	1980-08-25	34	f	36043063747	0
4863	Faik	ADIGÜZEL	faik.adıgüzel66@gmail.com	5436626466	1995-01-19	61	t	26158731462	0
4864	Natali	Saadat	natali.saadat93@gmail.com	5372989386	1998-05-07	34	f	93978513507	0
4865	Selim	BDIOUI	selim.bdıouı39@gmail.com	5382278236	2003-07-17	34	t	89936627114	0
4866	Bahri	ÖZYÜREK	bahri.özyürek49@gmail.com	5524922856	2002-06-26	28	t	51860347115	0
4867	Mustafa	GÖKDEMİR	mustafa.gökdemir35@gmail.com	5451324848	1980-02-08	55	t	92889998300	0
4868	Emine Dilara	HATİP	emine dilara.hatip81@gmail.com	5533126504	1982-05-12	10	f	34769467341	0
4869	ŞADİ EVREN	MELEMEN	şadi evren.melemen73@gmail.com	5377820374	1991-12-19	34	t	97930000499	1
4870	KENAN	ALGÖNÜL	kenan.algönül30@gmail.com	5328273448	1996-12-08	40	t	94757625636	7
4871	FUAT	ATLI	fuat.atlı13@gmail.com	5445860566	2002-11-04	61	t	77548922769	2
4872	Levent	TURAN	levent.turan85@gmail.com	5342042865	1993-01-14	22	t	92749242276	0
4873	Canan	Y	canan.y23@gmail.com	5305613326	1989-03-07	22	f	87609095478	0
4874	Ergin	AĞDAŞ	ergin.ağdaş70@gmail.com	5561557611	1983-10-01	34	t	53711303749	0
4875	SETENAY	YILMAZ	setenay.yılmaz82@gmail.com	5476210594	1987-05-04	58	f	85398625825	7
4876	Hüseyin	IRMAK	hüseyin.ırmak94@gmail.com	5311492940	2001-02-19	58	t	68902573220	7
4877	Sencerhan	GİLAN BÜTÜNER	sencerhan.gilan bütüner 11@gmail.com	5522400280	2001-12-20	75	t	49417121741	0
4878	Kadir	AYHAN	kadir.ayhan92@gmail.com	5312620979	1992-04-22	41	t	14071320424	7
4879	İnan	AKBAYIR	inan.akbayır93@gmail.com	5366865957	1990-03-18	45	t	88735911650	0
4882	İlhan Kerem	KARAKUŞ	ilhan kerem.karakuş77@gmail.com	5428005786	2002-09-20	6	t	35277781556	0
4883	İbrahim Olgun	EKE	ibrahim olgun.eke32@gmail.com	5383635215	1986-11-22	6	t	29741546209	0
4884	Murat	KIZILDAĞ	murat.kızıldağ10@gmail.com	5443223801	1992-05-08	34	t	41694472592	7
4885	Ahmet	ÖZCAN	ahmet.özcan82@gmail.com	5338338186	1988-10-14	16	t	35912388162	0
4886	Mustafa Ruhi	ŞEN	mustafa ruhi.şen69@gmail.com	5593882842	1985-12-04	61	t	19932788132	0
4887	Metin	ŞAKİROĞLU	metin.şakiroğlu54@gmail.com	5414897409	2003-08-19	66	t	66206688843	2
4888	Işıl	DEMİRBOZAN	ışıl.demirbozan95@gmail.com	5582243947	1980-08-19	38	f	41614436970	1
4889	GÜLŞAH	Y	gülşah.y77@gmail.com	5473084863	1980-01-21	53	f	79800496083	0
4891	Murat	WILLIAMS	murat.wıllıams27@gmail.com	5486778593	2003-02-01	34	t	96874220003	3
4892	Meral	ÖZMEN	meral.özmen33@gmail.com	5324776917	1993-07-05	34	f	90522828399	0
4893	Mustafa	CANDAN	mustafa.candan14@gmail.com	5415925589	1982-09-07	24	t	13145962955	7
4894	Mehmet Murat	BAYBURTLU	mehmet murat.bayburtlu22@gmail.com	5537927428	1983-05-05	79	t	37992555018	7
4896	Muhammed Murşit	KARATAYLİOGLU	muhammed murşit.karataylioglu16@gmail.com	5402302619	1997-06-09	65	t	72928206513	2
4900	FİRDEVS MELİS	İMECİ	firdevs melis.imeci21@gmail.com	5444940707	1983-02-18	35	f	60671520996	1
4901	FATMA GÜLİZ	ÖZAYDIN	fatma güliz.özaydın20@gmail.com	5574412218	1995-12-24	43	f	51038393335	1
4902	Hüseyin Emre	ALAGÖZ	hüseyin emre.alagöz23@gmail.com	5394988872	1982-02-07	58	t	66226471972	0
4903	Edip Asaf	DERBENT	edip asaf.derbent27@gmail.com	5591371926	2000-09-20	6	t	75116829416	7
4904	Çağla	GHOLIPOUR	çağla.gholıpour80@gmail.com	5596082619	1986-12-28	6	f	87914041262	0
4905	KURTULUŞ	CELİK	kurtuluş.celik65@gmail.com	5456273390	1992-08-01	62	t	17174330933	0
4906	Ahmet Numan	AMANBAİULY	ahmet numan.amanbaiuly66@gmail.com	5557710294	1986-04-20	6	t	88769971557	0
4908	Adem	OLASUPO	adem.olasupo10@gmail.com	5316694714	1994-05-03	80	t	20033763920	0
4909	Ali	Y	ali.y39@gmail.com	5497808722	2000-01-14	16	t	55388274886	0
4910	SELVER	Y	selver.y38@gmail.com	5533079752	1992-11-18	16	f	51978457334	0
4911	SENA	DEMİR	sena.demir99@gmail.com	5321602214	1993-10-23	32	f	33550235418	1
4912	METİN	DEMİRÖZ	metin.demiröz64@gmail.com	5498977215	1986-06-07	42	t	82718305513	0
4913	Tacettin	ERKOÇ	tacettin.erkoç84@gmail.com	5595461153	1990-01-24	34	t	91705892179	0
4914	Gözde	HUSSEN	gözde.hussen49@gmail.com	5582473347	1988-07-26	35	f	32279083294	8
4915	Mustafa Hakkı	AYDEMİR KÜÇÜKYILMAZ	mustafa hakkı.aydemir küçükyılmaz15@gmail.com	5375056793	1984-11-20	73	t	86711077815	0
4916	NİLGÜN	AKBAŞ	nilgün.akbaş28@gmail.com	5347312524	2001-05-13	42	f	62933061104	8
4917	AHMET TAMER	EBİLLER ÖKSÜZÖMER	ahmet tamer.ebiller öksüzömer58@gmail.com	5585530290	1987-04-08	42	t	28577661638	5
4918	AÇELYA	KALAFAT	açelya.kalafat60@gmail.com	5331088451	1993-08-28	45	f	21256673586	0
4919	Ekrem Buğra	KARABİBER	ekrem buğra.karabiber41@gmail.com	5496055222	1999-02-23	6	t	65313548391	0
4920	Hüdai Sırrı	KASIRKA	hüdai sırrı.kasırka91@gmail.com	5597807393	1991-08-21	42	t	48474165393	3
4921	Seda	ÇELİK	seda.çelik38@gmail.com	5436175650	1987-03-18	34	f	61340437849	1
4922	Nezihe	DAYIOĞLU	nezihe.dayıoğlu24@gmail.com	5343997514	1996-03-22	34	f	50482774016	8
4923	Sanem	NAGHİYEVA	sanem.naghiyeva81@gmail.com	5434854365	1981-02-18	52	f	93717493041	7
4924	Derya	Y	derya.y84@gmail.com	5577046299	1998-03-10	34	f	19831221151	3
4925	Ertuğrul	CEYLAN	ertuğrul.ceylan58@gmail.com	5602347581	1989-07-18	12	t	89855773045	7
4927	Fatma	ALVER	fatma.alver23@gmail.com	5513121588	1992-12-11	19	f	69905572558	3
4928	Aliye	ÇAVDAR	aliye.çavdar26@gmail.com	5366382254	1993-08-02	55	f	98176360868	3
4929	Türkan	ERDAL	türkan.erdal14@gmail.com	5598164883	1996-08-01	49	f	61415187443	1
4939	Ayten	UYAR	ayten.uyar31@gmail.com	5567274927	1984-08-05	58	f	47523222559	7
4940	Bayram	UÇAR	bayram.uçar69@gmail.com	5568117577	2002-10-24	58	t	24900752767	1
4941	Fatma	GEDİK	fatma.gedik76@gmail.com	5305073525	1981-02-02	55	f	77361226921	3
4942	Yusuf	CANSIZ	yusuf.cansız46@gmail.com	5525912642	1998-08-15	60	t	80469690466	1
4943	İsmail	YAZGAN	ismail.yazgan31@gmail.com	5603199101	1984-02-24	67	t	15438350023	7
4944	Mustafa Latif	ECEVİŞ	mustafa latif.eceviş52@gmail.com	5393351941	1998-06-12	29	t	93995324292	8
4945	Bekir	KURUCA	bekir.kuruca72@gmail.com	5346385273	1997-03-27	44	t	85594958218	7
4947	Gülay	ÖZER	gülay.özer68@gmail.com	5407141329	2003-01-04	34	f	20476401856	1
4949	NAİM	EKEN	naim.eken51@gmail.com	5356137739	1996-02-09	28	t	51289795382	0
4953	halit	ÖZEN	halit.özen76@gmail.com	5585546704	1990-01-02	52	t	45306847422	7
4954	Necdet	ÇAYIR	necdet.çayır65@gmail.com	5591968941	1985-10-03	6	t	22716461944	0
4955	Öznur	İÇME	öznur.içme66@gmail.com	5416577354	1981-08-14	72	f	99757918469	0
4958	tuna	EROĞLU	tuna.eroğlu63@gmail.com	5536778762	1988-11-06	34	f	21097909964	0
4959	Ekrem	Ertemel	ekrem.ertemel64@gmail.com	5371513803	1986-01-18	34	t	66091871947	0
4960	Ece	BOYACI	ece.boyacı16@gmail.com	5331497965	1996-12-02	59	f	96726229388	0
4961	Mehmet Emin	SOYDEMİR	mehmet emin.soydemir53@gmail.com	5583988545	1990-01-21	4	t	48865701523	0
4962	MUSTAFA HAKAN	ÜNAL	mustafa hakan.ünal44@gmail.com	5387959251	1998-04-18	15	t	74094218565	7
4963	Duygu	SU	duygu.su34@gmail.com	5382648642	1986-10-06	65	f	90256347665	0
4965	Gökhan	YILDIRIM	gökhan.yıldırım 85@gmail.com	5555450915	2003-12-23	7	t	52917037398	0
4966	Kerem	TOKTARBEKOV	kerem.toktarbekov62@gmail.com	5565968464	2000-01-25	41	t	35270710326	0
4970	HAKAN	DILINA	hakan.dılına84@gmail.com	5518040607	1980-04-01	58	t	59614951089	3
4971	Alper Kaan	ÖZCAN	alper kaan.özcan46@gmail.com	5401813373	1990-03-20	77	t	87202567997	0
4974	Müge	UYAN	müge.uyan75@gmail.com	5321641901	1981-12-04	6	f	82910953742	0
4975	Serap	ERTEM	serap.ertem48@gmail.com	5384965158	1983-02-10	34	f	72208021953	0
4976	Okan	DOĞAN (ASİLER)	okan.doğan (asiler)72@gmail.com	5462820353	2000-07-24	9	t	35608438499	3
4978	Esra	EKİN	esra.ekin90@gmail.com	5422751833	1980-03-04	34	f	17661331724	0
4980	Özge	KAŞİFOĞLU	özge.kaşifoğlu16@gmail.com	5561222827	1981-02-08	34	f	97882006400	0
4982	Medine	ALİ	medine.ali68@gmail.com	5554911601	1982-08-16	34	f	70758998456	0
4983	Burak Ferruh	FARRAG	burak ferruh.farrag23@gmail.com	5531520422	1999-05-15	6	t	43987344653	0
4984	Nejla	USTA	nejla.usta13@gmail.com	5389143908	2002-02-09	44	f	41494385644	0
4989	Buse	KURT	buse.kurt68@gmail.com	5304839779	1984-05-25	34	f	98963475633	0
4990	Hatice	GULTEKİN	hatice.gultekin25@gmail.com	5302422848	1988-02-18	34	f	20302596606	0
4991	Ece	TAVAS	ece.tavas21@gmail.com	5368058417	1982-08-07	6	f	86980442385	1
4992	Mehmet	YAZICIOĞLU	mehmet.yazıcıoğlu86@gmail.com	5318639929	1994-07-01	44	t	86947792022	0
4994	Bircan	HEKİMOĞLU	bircan.hekimoğlu86@gmail.com	5387755846	1998-04-07	22	f	77304976409	0
4996	Pakize	TUYSUZ	pakize.tuysuz93@gmail.com	5521630400	1997-11-05	58	f	62819343626	0
4997	Aysel	GÜRAY	aysel.güray58@gmail.com	5537462179	1997-02-27	34	f	89767492093	0
5001	Defne	ÖZKAN	defne.özkan85@gmail.com	5502168229	1982-10-25	34	f	17651502779	8
5002	Hatice	BİLGİN	hatice.bilgin80@gmail.com	5452141903	1990-11-21	34	f	40163940571	0
5003	Zeynep Betül	YAZICI	zeynep betül.yazıcı30@gmail.com	5366472392	1997-01-07	34	f	93852203079	0
5005	Neslihan	ADILI	neslihan.adılı70@gmail.com	5579010993	1996-09-24	77	f	17859633947	0
5007	Burak	SAYLAR	burak.saylar93@gmail.com	5589116882	1984-09-20	34	t	56955326864	0
5008	Melek	KARAKAŞLAR	melek.karakaşlar44@gmail.com	5565649976	1987-06-16	34	f	79233633853	0
5009	Ece Nur	AKYILDIZ	ece nur.akyıldız54@gmail.com	5594991105	1984-01-04	34	f	68585592748	0
5011	Ahmet Rasim	KARAHAN	ahmet rasim.karahan38@gmail.com	5335528704	1992-05-10	34	t	63302447725	0
5012	Hilal	AKGÜNEŞ	hilal.akgüneş42@gmail.com	5478327517	1983-01-20	34	f	32376201160	1
5013	Burak	NERGİS	burak.nergis60@gmail.com	5528574762	1988-02-05	34	t	83937036669	0
5014	Hakan	AKBULUT	hakan.akbulut17@gmail.com	5394773569	1991-05-22	42	t	41433976179	8
5015	Merve	AL TALAA	merve.al talaa63@gmail.com	5453428411	1981-03-18	4	f	56685077192	0
5016	Banu	GİRGİN	banu.girgin61@gmail.com	5591372256	1982-03-17	34	f	61566117321	0
5017	Alkan	AYDIN	alkan.aydın45@gmail.com	5317397962	1992-03-12	34	t	40310240197	0
5019	Feyza	ERTEKİN	feyza.ertekin21@gmail.com	5401194599	1980-09-15	34	f	45911791979	0
5020	Sarre	DEMİRCİOĞLU	sarre.demircioğlu87@gmail.com	5488189167	2000-08-28	50	f	27414168022	0
5022	Emine	AKYOL	emine.akyol19@gmail.com	5456431509	1992-01-13	43	f	15097460956	0
5023	Ahmet Can	KANBUROGLU	ahmet can.kanburoglu54@gmail.com	5489125905	1980-11-20	34	t	38502188487	0
5024	Akide	SAYGILI	akide.saygılı17@gmail.com	5597471692	1988-10-02	48	f	29910626964	0
5025	Hicret Hilal	ALAN	hicret hilal.alan16@gmail.com	5471815731	1993-09-27	34	f	85355387506	0
5027	Sevgi	MUSHUROVA	sevgi.mushurova88@gmail.com	5543532437	1986-03-22	6	f	23550975236	0
5028	Zeynep	KORKUT	zeynep.korkut18@gmail.com	5326074417	1983-02-15	34	f	65258904226	0
5029	Burcu	KAYAALP	burcu.kayaalp30@gmail.com	5472160573	1980-06-23	34	f	84399979055	0
5031	Nizami Olcay	HEPKON	nizami olcay.hepkon97@gmail.com	5571309543	1990-08-28	34	t	77532092078	2
5032	Sümeyye	KUL	sümeyye.kul17@gmail.com	5437029611	2000-10-14	34	f	39867329800	0
5033	Salih Zeki	SVİETKİNA	salih zeki.svietkina21@gmail.com	5473674738	1994-07-14	9	t	74793009406	0
5034	Merve	ÜNAL	merve.ünal66@gmail.com	5461587407	1987-08-10	22	f	58391836383	0
5035	Ece	ALTINTAŞ	ece.altıntaş24@gmail.com	5531018220	1992-09-11	34	f	38536771022	0
5036	Taner	ALMAZ	taner.almaz72@gmail.com	5492827237	1984-09-23	29	t	27880165817	0
5038	Rabia	BAĞCI	rabia.bağcı87@gmail.com	5377902580	1983-04-19	34	f	61671840778	0
5039	Merve	SUSOY	merve.susoy58@gmail.com	5459147882	1993-04-10	34	f	33484023904	8
5040	Gülşah	ARSLAN COŞKUN	gülşah.arslan coşkun52@gmail.com	5608500659	1987-10-28	39	f	31596581284	0
5041	Abdulkadir	PALTA	abdulkadir.palta46@gmail.com	5574476905	1984-04-13	34	t	82094106986	0
5042	Oğuzhan	KALSIN	oğuzhan.kalsın25@gmail.com	5548902631	1980-04-04	16	t	23211128183	0
5045	Cihan	ÇEKMEZ	cihan.çekmez57@gmail.com	5475129159	1989-07-22	12	t	95633973622	0
5046	Selami	BOLATA	selami.bolata50@gmail.com	5335098461	2000-02-09	34	t	62387618945	0
5048	Rıfat	ALTUNA	rıfat.altuna74@gmail.com	5435941272	1983-01-20	16	f	15239084568	0
5049	Beril	ASAR	beril.asar80@gmail.com	5445793201	1999-12-09	34	f	52755243640	0
5051	Tuğba	ERDOĞAN	tuğba.erdoğan85@gmail.com	5574253635	2002-03-19	34	f	45850814205	0
5052	Yamaç	YOMRALIOĞLU	yamaç.yomralıoğlu11@gmail.com	5513447944	1994-03-11	34	t	95768617951	0
5055	Büşra Nur	AKIN	büşra nur.akın55@gmail.com	5508170731	1991-05-15	38	f	81829134064	0
5056	Hilal	ARIKOĞLU OLSEN	hilal.arıkoğlu olsen65@gmail.com	5336146902	1993-06-05	34	f	74062184963	0
5058	Ramazan	Y	ramazan.y70@gmail.com	5428913883	2000-09-25	44	t	84977506702	0
5060	Hilal	DEMİR	hilal.demir96@gmail.com	5465523323	1983-06-16	34	f	22614253034	0
5063	Neval	ISBAŞAR	neval.ısbaşar34@gmail.com	5514962458	1986-10-16	34	f	29429665748	0
5064	Ahmet Emin	ÇAM	ahmet emin.çam17@gmail.com	5351555859	2001-02-12	6	t	46668023587	0
5066	Ali	DANIŞ	ali.danış32@gmail.com	5493720948	1983-04-20	61	t	67485587205	0
5068	Burak	GEZGİN	burak.gezgin75@gmail.com	5474543307	1991-07-20	20	t	43024872754	0
5069	Muhsın	Y	muhsın.y96@gmail.com	5448940567	1993-01-19	60	t	80434659037	0
5072	Deniz	KAVAK	deniz.kavak44@gmail.com	5431481219	1982-05-19	34	f	92357477960	0
5074	Seda	KAHİE	seda.kahie57@gmail.com	5579083120	1998-05-27	7	f	74645968533	0
5077	Meltem	METİN	meltem.metin98@gmail.com	5333981807	1991-09-18	48	f	73141748103	4
5079	Yusuf	ERBİL	yusuf.erbil33@gmail.com	5532011666	1997-06-10	33	t	55658360789	8
5083	İrem	ENGİN	irem.engin82@gmail.com	5413516180	2000-06-16	34	f	59655375813	0
5084	Sümeyye	İÇEL	sümeyye.içel87@gmail.com	5566212819	1998-12-11	25	f	60016183628	0
5085	Merve Dilara	ÖZEN	merve dilara.özen94@gmail.com	5608735907	1996-05-09	34	f	30784460698	0
5089	Tolga	SÖNMEZ	tolga.sönmez87@gmail.com	5444287658	1993-11-20	6	t	37076345396	0
5092	Zulal	BALABAN	zulal.balaban64@gmail.com	5557716673	1980-01-06	34	f	34225184162	0
5093	Berfin	ADIGÜZEL	berfin.adıgüzel42@gmail.com	5323142510	1990-06-28	6	f	95560587430	0
5094	Özge	ÖZTÜRK	özge.öztürk67@gmail.com	5544141366	1998-04-04	52	f	96646910187	0
5095	Ahmed	ÇEÇEN	ahmed.çeçen92@gmail.com	5334975292	1984-05-09	34	t	84310729434	0
5096	Özlem Şahika	BİLGİLİ	özlem şahika.bilgili81@gmail.com	5313013498	1990-08-10	34	f	86845469742	0
5097	Sibel	TARHAN	sibel.tarhan92@gmail.com	5497539881	1994-03-28	34	f	32888850028	0
5098	Fatih	AIZEZI	fatih.aızezı37@gmail.com	5536395940	1992-12-11	34	t	28133292176	0
5099	Rukiye	ÇELİK	rukiye.çelik37@gmail.com	5439110929	1982-06-13	53	f	37163180822	0
5103	Nehir	YILI	nehir.yılı44@gmail.com	5467038509	1984-04-19	34	f	57753857381	0
5107	Büşra	GİRGİN	büşra.girgin85@gmail.com	5525617547	2001-10-21	63	f	53383535316	0
5110	İpek Ece	Y	ipek ece.y23@gmail.com	5587250334	1993-12-06	34	f	48123846315	0
5111	Büşra	ÇÖPLÜ	büşra.çöplü73@gmail.com	5591035654	1982-06-07	34	f	63957747273	0
5112	Burçin	KOÇAL	burçin.koçal57@gmail.com	5344073985	1999-07-07	48	f	80726090884	0
5113	Fatih	ÇAĞALA	fatih.çağala51@gmail.com	5333646172	2001-12-13	59	t	28681976919	0
5116	Yasemin Bahar	HASSAN	yasemin bahar.hassan 18@gmail.com	5322559582	1997-05-25	34	f	64652885066	0
5117	Thomas Ülkü	İĞCİ	thomas ülkü.iğci75@gmail.com	5535678147	2001-09-28	34	t	43677912189	0
5118	Seda	ACAR	seda.acar11@gmail.com	5371978296	1988-06-11	34	f	83001544965	0
5120	Serkan	EKİNCİ	serkan.ekinci39@gmail.com	5487082727	1987-07-12	34	t	53681293669	0
5121	Uğur	YALÇIN	uğur.yalçın28@gmail.com	5538326748	1999-06-22	53	f	49067211785	0
5122	Yazgı	ERGAN	yazgı.ergan42@gmail.com	5395472345	1992-05-16	34	f	61937402933	0
5123	Hatice Kübra	KOÇAK	hatice kübra.koçak46@gmail.com	5318992572	1994-08-20	34	f	79291701041	0
5126	Enis Barış	ÖZKOL	enis barış.özkol69@gmail.com	5447226469	1988-02-12	34	t	33261029276	0
5127	Güfte	ARIK DERİN	güfte.arık derin53@gmail.com	5497346960	1987-01-08	34	f	89458155467	0
5128	Damla	Y	damla.y17@gmail.com	5316481396	1990-04-23	34	f	51518660298	0
5129	Burcu	KARAÇAY	burcu.karaçay16@gmail.com	5587496648	1988-10-14	34	f	30511963099	0
5130	Mehmet Mert	ÇAKIR	mehmet mert.çakır80@gmail.com	5436209570	1996-08-24	34	t	95722986498	0
5131	Musab	ÖZER	musab.özer78@gmail.com	5603452639	1996-08-22	72	t	65223294502	7
5132	Fetullah	ŞİMŞEK	fetullah.şimşek57@gmail.com	5316122464	1993-09-11	13	t	99817238017	0
5133	Ebru Nur	ERAY	ebru nur.eray96@gmail.com	5564426975	1990-01-07	34	f	86595167055	0
5135	Mirey	ÖZBAYRAKTAR	mirey.özbayraktar94@gmail.com	5566316197	2002-03-09	34	f	39530400605	0
5138	Merve	GÜRBÜZ	merve.gürbüz13@gmail.com	5342903646	1986-01-04	34	f	98667712281	0
5139	Mehmet Emin	PATTI	mehmet emin.pattı76@gmail.com	5516919833	1994-11-07	47	t	56557405433	0
5140	Levent	HASSAN	levent.hassan40@gmail.com	5464496283	1999-11-16	36	t	55639973084	0
5141	Hilal	ÖRNEK	hilal.örnek10@gmail.com	5531228786	1989-02-23	34	f	67060852472	0
5143	Tuğba Ortay	TEKE	tuğba ortay.teke33@gmail.com	5394639715	1988-01-12	6	f	93603189527	0
5144	Evren	ALTUNBOZAR	evren.altunbozar90@gmail.com	5362228365	1983-03-28	6	t	86322196316	0
5146	Sezer	EREN	sezer.eren40@gmail.com	5394142508	1998-10-25	34	t	49053900664	0
5147	Adem	ÇOŞKUN	adem.çoşkun90@gmail.com	5562413963	1991-11-07	78	t	70645213110	0
5151	Şeyda	TUĞSAL	şeyda.tuğsal91@gmail.com	5314236532	1981-09-24	34	f	82433245767	0
5152	Ubeydullah	ABBAS	ubeydullah.abbas56@gmail.com	5445956516	2001-06-24	34	t	72540979094	0
5154	Gökhan Semih	KUL	gökhan semih.kul48@gmail.com	5573187502	1990-01-11	41	t	49492042091	0
5157	Emine	SAYIN	emine.sayın12@gmail.com	5425094981	1987-03-16	61	f	14674594537	0
5160	Seda	ALASTTAL	seda.alasttal30@gmail.com	5372126962	2003-04-23	10	f	44438489619	0
5162	Fuat	ARICA	fuat.arıca45@gmail.com	5501021715	1995-09-16	49	t	92229639937	0
5163	Elif	ULUTAŞ	elif.ulutaş39@gmail.com	5481328954	1981-04-06	35	f	41001265919	0
5165	Duygu	AY	duygu.ay87@gmail.com	5437979864	2003-08-01	34	f	66827295642	0
5166	Havva	YILMAZ ELBAŞI	havva.yılmaz elbaşı32@gmail.com	5376825650	1991-01-25	34	f	57579224296	0
5167	Fatma	DİRİL	fatma.diril13@gmail.com	5547123841	1998-08-06	7	f	19671866111	0
5168	Zafer	DEDE	zafer.dede42@gmail.com	5312881828	2001-09-18	6	t	43852271568	0
5169	Havva	ABDUL	havva.abdul34@gmail.com	5473420575	1994-03-11	68	f	31771678171	0
5170	Yasemin	ALI	yasemin.alı77@gmail.com	5375709826	1998-06-16	34	f	55986634600	0
5171	Sema	MULAJIDING	sema.mulajıdıng56@gmail.com	5502851771	1995-09-28	34	f	66752082228	0
5172	Ömer Tuğsal	YUHANNAN	ömer tuğsal.yuhannan57@gmail.com	5352762981	1994-01-08	1	t	27560680633	0
5174	Hicran	DURMAZ	hicran.durmaz95@gmail.com	5527848684	1983-02-14	6	f	50453977133	0
5176	Gökberk	KAYA	gökberk.kaya83@gmail.com	5562380324	2003-06-03	34	t	79569422216	0
5177	Selen	YILMAZ	selen.yılmaz47@gmail.com	5398611723	1983-06-13	8	f	49279323219	0
5178	Benazir	MALKOÇ	benazir.malkoç70@gmail.com	5361020539	1981-09-08	34	f	95247147124	0
5179	Simge	YEŞİLIRMAK	simge.yeşilırmak86@gmail.com	5378832577	1982-12-10	48	f	89843620995	0
5181	Volkan	AZİZOV	volkan.azizov18@gmail.com	5455265816	1987-11-04	61	t	22068316981	0
5182	Mürşide Beyza	ÇİÇEK	mürşide beyza.çiçek54@gmail.com	5543689524	1981-06-06	34	f	76447377115	7
5184	Fatma	SELİMOVİC	fatma.selimovic97@gmail.com	5383525174	1987-10-01	75	f	81554065213	0
5185	Zeynep	ÖMER	zeynep.ömer71@gmail.com	5375150100	2003-08-06	7	f	60597459306	0
5186	Hanifi Yunus	GÜÇLÜ	hanifi yunus.güçlü59@gmail.com	5426639392	1984-06-14	34	t	53614755135	0
5195	Aslı	AYDIN	aslı.aydın17@gmail.com	5405613851	1992-06-17	34	f	63002451228	0
5198	Sidar	TAŞAN	sidar.taşan19@gmail.com	5391059768	2001-06-04	13	t	68825514209	0
5199	Ersin	YETER	ersin.yeter96@gmail.com	5452763494	1997-06-26	34	t	57071994011	0
5200	Vildan	İMAMOĞLU	vildan.imamoğlu36@gmail.com	5335732319	1992-08-10	16	f	85298467676	0
5201	Hande Zeynep	IDRISS	hande zeynep.ıdrıss95@gmail.com	5587049575	1985-04-09	2	f	24603402269	0
5203	Gökhan Işık	BÖCEKÇİ	gökhan ışık.böcekçi68@gmail.com	5351315377	1982-06-27	34	t	52781474290	0
5205	Abdulkadir	ABULIKEMU	abdulkadir.abulıkemu35@gmail.com	5597720755	2000-02-03	63	t	58425084444	0
5206	İdil	ÖZ İBİŞ	idil.öz ibiş30@gmail.com	5378084903	1990-06-07	34	f	56430841873	0
5207	Saniye Didem	TURAN	saniye didem.turan42@gmail.com	5563328396	1993-11-05	77	f	96893065301	0
5209	Betül Nur	KILIÇ	betül nur.kılıç94@gmail.com	5357198942	1981-11-13	52	f	46372545844	0
5211	Uğur Deniz	SOLAK	uğur deniz.solak71@gmail.com	5467103609	1998-02-08	14	t	17922939698	0
5212	Mehmet Sait	ATALAY	mehmet sait.atalay92@gmail.com	5334898343	1999-04-25	63	t	14480439850	0
5214	Özlem	CAN	özlem.can16@gmail.com	5607246622	2001-03-19	34	f	87813156103	0
5217	Bilge	KARAHAN	bilge.karahan22@gmail.com	5565111338	1981-02-15	34	f	15339340581	0
5219	Ahmet Turan	KARAJ	ahmet turan.karaj50@gmail.com	5388874507	2001-07-12	58	t	84873222717	0
5221	Feyza	MIZRAK	feyza.mızrak70@gmail.com	5595366150	1986-02-26	34	f	72492374129	0
5222	Anıl	QOZAT	anıl.qozat10@gmail.com	5568493152	1992-12-08	37	t	61018329901	0
5223	Duygu	YILDIZ	duygu.yıldız89@gmail.com	5385123987	1986-08-05	34	f	78749225026	0
5224	Dilek	BANIŞTA	dilek.banışta24@gmail.com	5564571639	1998-09-17	34	f	31732509861	0
5225	Orçun	ÖZER	orçun.özer67@gmail.com	5375080915	2002-09-21	34	t	34943049486	0
5226	Gülşah	OMAR	gülşah.omar16@gmail.com	5415596431	2002-04-19	20	f	91768070710	0
5227	Osman	KÜÇÜKAŞÇI	osman.küçükaşçı31@gmail.com	5533482276	2002-10-20	34	t	33504133872	0
5228	Muhammed Çağrı	YONAR	muhammed çağrı.yonar95@gmail.com	5383219183	2003-09-10	41	t	48492214447	0
5231	Şafak	ESER	şafak.eser28@gmail.com	5478917871	2003-12-13	23	t	12509578977	0
5232	Tuğba	KHAIREH  OBSIEH	tuğba.khaıreh  obsıeh14@gmail.com	5398391951	2000-03-11	58	f	14007517302	0
5233	Yasin Emin	IYOUN SOUD	yasin emin.ıyoun soud76@gmail.com	5394443630	1995-07-14	16	t	50805395946	3
5235	Handan Mesude	TOKEL	handan mesude.tokel28@gmail.com	5342392941	1996-10-05	28	f	64669285163	0
5237	Uğur	İZGİ	uğur.izgi77@gmail.com	5441444379	1982-11-26	16	t	50524864678	0
5238	Hamdi Tolga	BALTALI	hamdi tolga.baltalı85@gmail.com	5322865846	1992-07-10	34	t	38085208702	0
5241	nca	PEKİN	nca.pekin79@gmail.com	5412911323	1999-09-18	6	f	75422259826	0
5243	Nurdan	KAPLİ	nurdan.kapli73@gmail.com	5322358514	1993-03-15	34	f	37013000068	0
5245	Nur	KAVAK	nur.kavak31@gmail.com	5423255127	2000-11-20	34	f	51153838832	0
5246	Mehmet Cem	Y	mehmet cem.y94@gmail.com	5413201579	1997-03-26	34	t	51499874342	0
5249	Leyla	ABDIRAHMAN	leyla.abdırahman38@gmail.com	5363542101	1982-03-27	36	f	54612454513	0
5250	Neslihan	KINIK	neslihan.kınık53@gmail.com	5553550508	1985-06-11	6	f	13356504025	0
5251	Seyit Yunus	KOZANHAN	seyit yunus.kozanhan24@gmail.com	5383899776	1990-01-09	49	t	84584413301	0
5252	Çiğdem	ÖZPINAR	çiğdem.özpınar77@gmail.com	5324896776	1981-03-28	34	f	41962052194	0
5253	Pınar	AHMED	pınar.ahmed20@gmail.com	5508981538	1983-08-15	7	f	38852654720	0
5256	Mertkan	ERGÜN	mertkan.ergün11@gmail.com	5498430399	1989-05-18	34	t	48879543597	5
5258	Elif	MISIRLI	elif.mısırlı23@gmail.com	5578610677	1983-02-16	29	f	11114654535	0
5260	Songül	POLAT	songül.polat52@gmail.com	5466396110	2001-03-18	28	f	15509286136	0
5262	Celaleddin	ZENGİN	celaleddin.zengin56@gmail.com	5407216775	2002-06-10	34	t	81403526542	0
5263	Zeynep	ÇOLAKOĞLU	zeynep.çolakoğlu69@gmail.com	5503069420	1993-12-03	34	f	68654139514	0
5264	Çağan Cem	ADEMOĞULLARI	çağan cem.ademoğulları18@gmail.com	5562268766	2001-04-04	27	t	35760594914	0
5267	Esra Pınar	TOMBUL	esra pınar.tombul32@gmail.com	5354925257	1994-08-15	40	f	52070072963	0
5270	Sezai	KARAALİOĞLU	sezai.karaalioğlu92@gmail.com	5516927680	2003-01-11	26	t	20614510046	0
5272	Nehir	İŞBİLİR	nehir.işbilir10@gmail.com	5347229339	1988-04-15	34	f	96624727241	0
5275	İlker	BERBER	ilker.berber28@gmail.com	5464052207	1992-09-09	59	t	88750877268	0
5276	Serkan	MOHAMAD FAUZI	serkan.mohamad fauzı73@gmail.com	5367459865	1998-08-06	34	t	70016301467	7
6486	Elif	DAUT	elif.daut52@gmail.com	5381440411	1991-05-26	34	f	50595365044	0
5278	Tuğçe	KARTUM	tuğçe.kartum35@gmail.com	5416921934	1996-04-05	48	f	96897331146	0
5279	Arzu	ÖZCAN	arzu.özcan57@gmail.com	5351942543	1985-08-13	34	f	48491907618	0
5280	Merve	PARLAK	merve.parlak95@gmail.com	5521187484	1984-12-20	34	f	44457490920	0
5283	Dilek	ALİYEV	dilek.aliyev88@gmail.com	5377249285	1984-05-05	52	f	12369136272	0
5284	Esin	TOP	esin.top43@gmail.com	5312020674	1995-08-28	34	f	54251736666	0
5285	Zeynep	AKSOY	zeynep.aksoy61@gmail.com	5301918723	1992-06-16	34	f	85998620820	0
5288	Mervan	TURAN	mervan.turan84@gmail.com	5392925135	1983-05-15	30	t	46818709144	0
5290	Şerafettin Okan	ERDÖNMEZ	şerafettin okan.erdönmez77@gmail.com	5324461703	1991-07-09	6	t	44295784164	0
5292	Dondu Ezgi	ÖZCAN	dondu ezgi.özcan24@gmail.com	5452744938	1988-03-03	70	f	74087644083	0
5293	Yalçın	KARABULUT	yalçın.karabulut56@gmail.com	5588847317	1981-12-17	34	t	16080220072	0
5294	Mahmut	BİN ALİ	mahmut.bin ali50@gmail.com	5303121827	1987-10-22	12	t	29784379983	0
5296	Aylin	KOÇ	aylin.koç13@gmail.com	5487077696	1985-05-17	34	f	99703439120	0
5299	Meryem	BOZYEL	meryem.bozyel38@gmail.com	5394617963	1985-01-22	71	f	47233906736	0
5300	Ziyada	ERSOY	ziyada.ersoy65@gmail.com	5463083149	1984-08-09	10	f	84674857730	7
5301	Saiding	GÜLBAHAR	saiding.gülbahar46@gmail.com	5302674613	1992-08-13	37	t	19789883645	0
5303	Cansu	ZEREN	cansu.zeren61@gmail.com	5305271897	1991-02-26	34	f	44228595264	0
5304	Filiz	ÜNSAL	filiz.ünsal41@gmail.com	5565007428	1994-10-24	34	f	26764995058	0
5306	Elif	KANTARCI	elif.kantarcı75@gmail.com	5443429522	1993-07-11	34	f	82448451185	0
5307	Emine	TANRIKULU	emine.tanrıkulu77@gmail.com	5412799842	2002-06-07	34	f	53520351485	0
5313	Büşra	ÇETİN	büşra.çetin92@gmail.com	5424867513	1991-11-28	35	f	17411363194	0
5315	Dilek	ERGÜL	dilek.ergül34@gmail.com	5463228333	1989-06-07	20	f	36449088369	0
5325	Merve Nur	YILDIRIM	merve nur.yıldırım49@gmail.com	5599099430	1981-08-07	21	f	22582978776	0
5327	Merve	GENÇ	merve.genç34@gmail.com	5391970209	1985-09-11	34	f	87977554281	0
5328	Tuğba	ARSLAN	tuğba.arslan62@gmail.com	5504142708	1996-09-04	6	f	10842355889	0
5333	Abuzer	ÖZTÜRK	abuzer.öztürk85@gmail.com	5308754969	1993-09-18	34	t	31216314788	0
5339	Fatma	TÜREGÜN	fatma.türegün98@gmail.com	5573498340	1995-10-01	17	f	22635958038	0
5341	Osman	ŞENCAN	osman.şencan51@gmail.com	5455812322	2002-08-08	66	t	41261801507	0
5344	Derya	DİAGNE	derya.diagne97@gmail.com	5516350958	1993-11-09	78	f	19166479868	0
5346	Ahmet Göksel	AVKOVAN	ahmet göksel.avkovan25@gmail.com	5312307964	2002-09-16	34	t	85810399173	0
5347	Neslihan	Vural	neslihan.vural73@gmail.com	5308562827	1995-05-19	52	f	74536948485	0
5350	Mesut	DÖNMEZER	mesut.dönmezer85@gmail.com	5486250590	1990-02-21	50	t	42938791182	0
5352	Özge Deniz	AYKIN	özge deniz.aykın27@gmail.com	5602822537	1997-10-16	34	f	72565954048	7
5355	Muhammed Rasih	YALÇINKAYA	muhammed rasih.yalçınkaya40@gmail.com	5521018920	1992-09-15	42	t	73970092943	0
5357	Yusuf	TEKBAŞ	yusuf.tekbaş15@gmail.com	5498284739	2003-04-24	61	t	76515457417	0
5359	Esra	GİRGİN	esra.girgin86@gmail.com	5439079503	1990-04-07	25	f	27954889005	0
5360	Zeliha	BOSTAN (ATLAY)	zeliha.bostan (atlay)29@gmail.com	5553347386	1994-12-16	34	f	44434619979	0
5364	Emel	GEZER	emel.gezer97@gmail.com	5546995943	1987-06-14	5	f	12476190964	3
5365	Emine Cigdem	DAĞBAŞI	emine cigdem.dağbaşı32@gmail.com	5498523444	1986-08-05	25	f	55384521300	0
5366	Ecem	YILMAZ	ecem.yılmaz37@gmail.com	5457101133	1988-12-17	26	f	56192298981	0
5368	Merve	ASLANTAŞ	merve.aslantaş54@gmail.com	5443234497	1995-08-20	34	f	38807553264	0
5369	Gözde Nur	ÇİÇEK	gözde nur.çiçek73@gmail.com	5572723463	1980-01-06	34	f	14458968545	0
5371	Büşra	SERSEMİ	büşra.sersemi43@gmail.com	5444254901	1986-06-16	65	f	50367474407	0
5372	Semra	SARIHAN	semra.sarıhan51@gmail.com	5524071178	1993-12-11	34	f	79246372300	0
5375	Fatma	KOL	fatma.kol35@gmail.com	5588154353	1994-12-15	34	f	75017262525	0
5376	Tomris Başak	ÖZSÜER	tomris başak.özsüer72@gmail.com	5562954296	1986-02-27	45	f	63987814463	0
5378	Sevim Bilge	KIZILKAN	sevim bilge.kızılkan52@gmail.com	5601332353	1989-05-20	31	f	96743356030	0
5380	Mehmet	YAMAN	mehmet.yaman65@gmail.com	5422181510	1981-04-11	34	t	97772212174	0
5381	Sertaç	YAVUZER	sertaç.yavuzer47@gmail.com	5544579446	2001-12-13	34	t	89139894641	0
5382	Burçin	AKPINAR	burçin.akpınar70@gmail.com	5557811624	1990-05-27	42	f	55654258848	0
5383	Ahmet Can	ŞİŞLİ	ahmet can.şişli72@gmail.com	5572906775	1995-01-10	52	t	78253900103	0
5384	Ayşenur	ŞİMŞEK	ayşenur.şimşek87@gmail.com	5591182434	1988-04-14	34	f	76991146250	0
5385	Canan	MUADİLİ	canan.muadili96@gmail.com	5581363254	1997-02-15	44	f	42484092802	0
5389	Enes	PELİSTER	enes.pelister57@gmail.com	5504977996	1988-10-18	38	t	96729075009	0
5393	Melike	AKÇİN	melike.akçin43@gmail.com	5511563700	1997-02-14	34	f	63888616173	0
5396	Çiğdem	YEŞİL	çiğdem.yeşil68@gmail.com	5352294436	1980-04-28	34	f	98814029171	0
5397	Kadir	ELÇEOĞLU MERCAN	kadir.elçeoğlu mercan46@gmail.com	5454998782	1991-04-01	34	t	31311229926	0
5399	Selin	ÖZDEMİR	selin.özdemir48@gmail.com	5415828183	1986-05-01	34	f	74577107261	8
5400	Mervegül	ÇOLAK DEMİR	mervegül.çolak demir63@gmail.com	5325353541	1985-05-15	38	f	29696129997	0
5402	Gizem	ALAM	gizem.alam17@gmail.com	5308068995	1987-10-22	39	f	75573035670	0
5404	Canan	TURA	canan.tura12@gmail.com	5508279460	1989-02-18	6	f	12971420595	3
5405	Sılanur	AĞ	sılanur.ağ88@gmail.com	5514455919	1999-05-03	7	f	19325787007	0
5406	Çağatay	KOÇAK	çağatay.koçak19@gmail.com	5503469617	1981-01-07	16	t	52893198173	0
5410	Esra	NAR	esra.nar73@gmail.com	5479030892	1996-12-25	16	f	91046761515	7
5416	Firuze Pelin	ÇAKIR	firuze pelin.çakır58@gmail.com	5466966402	2000-08-02	34	f	60192809408	5
5420	Abdullah	Y	abdullah.y69@gmail.com	5602785241	1986-02-17	34	t	89126822209	0
5421	Seçil	ARGINI	seçil.argını64@gmail.com	5594829743	1994-12-08	34	f	46858736248	0
5423	Rıdvan	ESİN	rıdvan.esin35@gmail.com	5577564772	1985-12-09	41	t	30603304805	0
5424	Aslı	BUSHAREMU	aslı.busharemu18@gmail.com	5326294409	2001-08-22	34	f	70367604372	0
5425	Mesut	MUSA	mesut.musa86@gmail.com	5399073531	1994-10-03	34	t	54510543382	0
5427	Ayşin	SEFEROĞLU	ayşin.seferoğlu83@gmail.com	5528966624	1994-04-06	6	f	34496838200	0
5428	Tuğba	ÖZKAN	tuğba.özkan94@gmail.com	5546637421	2001-04-05	49	f	99379239648	0
5429	Talha Serdar	BATUR	talha serdar.batur52@gmail.com	5491318156	1990-10-20	16	t	36458588057	0
5431	Erdem	DÜLGER	erdem.dülger44@gmail.com	5463542508	1998-12-22	31	t	24186697825	0
5432	Özlem	KENDİR	özlem.kendir42@gmail.com	5313759944	1987-08-22	49	f	44486289325	0
5433	Muharrem	GÖKÇE	muharrem.gökçe40@gmail.com	5605103229	1995-09-27	76	t	39498512797	0
5434	Sencan	KÖSE	sencan.köse49@gmail.com	5303916903	1988-10-12	6	f	26314791219	0
5437	Furkan Cem	ALTUNDİS	furkan cem.altundis95@gmail.com	5461088358	1998-10-15	34	t	17083993209	0
5438	Özgür	USMAN IMAM	özgür.usman ımam73@gmail.com	5455359738	1999-11-26	2	t	94212955283	0
5441	Macide	CEBECİ	macide.cebeci80@gmail.com	5511476868	1985-01-04	31	f	30492048193	0
5443	Dilberay	ÇANKAYA	dilberay.çankaya78@gmail.com	5493755917	1981-12-22	35	f	70631011718	0
5446	Zehra	SARI	zehra.sarı64@gmail.com	5407423787	1989-03-22	34	f	80355176205	0
5448	Giray	ŞENTÜRK	giray.şentürk67@gmail.com	5565608605	1995-01-13	34	t	21085301331	0
5449	Arzu	AYVAZ	arzu.ayvaz35@gmail.com	5407910755	1983-03-28	78	f	38628945131	0
5453	Selim	SOR	selim.sor57@gmail.com	5501962757	2001-04-17	34	t	30190495431	0
5455	Tuğba	KURT	tuğba.kurt76@gmail.com	5475209557	1987-09-22	34	f	94425980050	0
5456	Safiye Gökçe	YALÇINTAŞ	safiye gökçe.yalçıntaş77@gmail.com	5444680707	1998-09-20	34	f	18290711785	0
5458	Tunç	ŞENOĞLUGİL	tunç.şenoğlugil66@gmail.com	5536249897	1982-02-08	34	t	24868328913	0
5460	Ömercan	ZENGİN	ömercan.zengin12@gmail.com	5591620394	1990-10-18	67	t	38968600842	0
5464	Orçun	KÜÇÜKSOLAK	orçun.küçüksolak29@gmail.com	5436749661	1992-01-23	35	t	79115703587	0
5465	Bahar	DAŞBİLEK	bahar.daşbilek39@gmail.com	5513263696	2000-08-19	34	f	37025259366	0
5469	Ahmet	YILDIRIM	ahmet.yıldırım77@gmail.com	5473969761	1993-02-26	34	t	45230292783	0
5470	Eren	FAZLIOĞLU	eren.fazlıoğlu52@gmail.com	5408684758	1990-11-12	34	t	69391978175	0
5471	Alper	BAYRAM	alper.bayram14@gmail.com	5447392523	1983-01-07	35	t	17796857591	0
5473	Işıl	ERALP	ışıl.eralp38@gmail.com	5554339407	2002-03-12	35	f	47032508823	0
5474	Asım Can	AKSÖZ	asım can.aksöz58@gmail.com	5421395236	1987-03-08	63	t	34706034550	0
5476	Seda	SHAYAKHMET	seda.shayakhmet25@gmail.com	5371409185	1982-11-24	23	f	28493297743	0
5477	Cengiz	KILIÇ	cengiz.kılıç87@gmail.com	5552390558	1981-02-07	34	t	21223153533	0
5478	İpek	ESEN	ipek.esen59@gmail.com	5384871461	1999-12-10	54	f	73427870983	0
5480	Muhammet Fatih	ÖZDEMİR	muhammet fatih.özdemir26@gmail.com	5391529320	1982-03-04	21	t	19726025597	0
5481	Buket	SUNALP	buket.sunalp18@gmail.com	5483127321	1981-01-01	6	f	56650423023	0
5482	Eyüp	LODDO	eyüp.loddo64@gmail.com	5452659428	1999-09-06	58	t	98464310610	0
5483	Burak	GÜNAYDIN	burak.günaydın57@gmail.com	5413621515	1997-10-24	34	t	10526712812	0
5484	Süleyman	ÖNCEL	süleyman.öncel90@gmail.com	5481060430	1990-04-21	21	t	78391374052	0
5486	Melek	AYDOĞDU	melek.aydoğdu30@gmail.com	5421407848	1989-12-14	38	f	71160686473	0
5488	Kübra	BALIKCI	kübra.balıkcı70@gmail.com	5317737441	1990-12-24	6	f	25479617970	0
5491	Cansu	ABU AWWAD	cansu.abu awwad46@gmail.com	5405327881	1983-11-09	34	f	58048001131	0
5492	Yıldız	BALCI FİSUNOĞLU	yıldız.balcı fisunoğlu62@gmail.com	5568795406	1998-03-03	34	f	25593812310	0
5493	Sena Hatun	ÇAPKIN	sena hatun.çapkın49@gmail.com	5557905613	1999-08-04	34	f	82575593168	0
5494	Ercan	ÖZDEMİR	ercan.özdemir62@gmail.com	5508400108	1982-09-02	65	t	60087029338	0
5496	Haluk	YILMAZ	haluk.yılmaz91@gmail.com	5398227709	2002-08-12	34	t	15494625196	0
5497	Ertan	ÖNER	ertan.öner74@gmail.com	5554543363	1987-08-10	34	f	41415864076	0
5498	Osman	YILMAZ	osman.yılmaz77@gmail.com	5417743825	2001-04-26	10	t	12298374237	0
5499	Gizem	BULUT	gizem.bulut66@gmail.com	5498774999	2003-06-15	16	f	56033581837	0
5500	Özlem	BİLGEN	özlem.bilgen16@gmail.com	5353415393	1986-09-10	16	f	93683823478	0
5501	Cihat	SELAHİ	cihat.selahi91@gmail.com	5393122407	1983-07-22	38	t	75142598587	0
5502	Ümra Cenan	AYTEKİN	ümra cenan.aytekin80@gmail.com	5509012181	1986-09-15	34	f	92515262063	0
5503	Ahmet Can	MEMİŞ	ahmet can.memiş27@gmail.com	5366083259	2001-08-02	45	t	80478979751	0
5504	Türküler	BALCI	türküler.balcı89@gmail.com	5502872274	1990-09-08	34	f	88493409340	0
5506	Murat	GÜLTUNCA	murat.gültunca66@gmail.com	5461701624	2001-07-15	60	f	33226441806	0
5507	Kerem	TÜYSÜZ	kerem.tüysüz29@gmail.com	5482168787	1990-04-06	6	t	83422289588	0
5508	Betül	KOÇ	betül.koç21@gmail.com	5447984916	1995-11-27	34	f	37011426837	0
5509	Funda	OYLUM	funda.oylum61@gmail.com	5324466804	1993-01-10	34	f	56905281744	0
5510	Abdulkadir Can	TANRIKUT	abdulkadir can.tanrıkut72@gmail.com	5342826183	1992-02-01	2	t	36935776275	0
5513	Musa	YAVAŞ	musa.yavaş89@gmail.com	5332224715	1981-04-22	52	t	33261703811	0
5514	Engin	VARINCA	engin.varınca79@gmail.com	5414723579	1982-09-10	41	t	25717790809	0
5516	Evrim	Y	evrim.y59@gmail.com	5362725990	1997-06-02	34	f	22777800010	0
5518	Betül	KARAMAN	betül.karaman18@gmail.com	5432804188	1996-12-01	34	f	43669034488	0
5519	Gamze	SAÇLİ	gamze.saçli94@gmail.com	5445925998	1999-11-23	34	f	54296627307	0
5523	Bengü Su	BEYAZÇİÇEK	bengü su.beyazçiçek70@gmail.com	5476875954	1982-06-16	16	f	15954805378	0
5526	Sibel	TURAN	sibel.turan19@gmail.com	5558535757	1986-10-19	34	f	68429320863	0
5528	Erdem	YAZICI	erdem.yazıcı11@gmail.com	5371146288	1998-12-27	34	t	42638691229	0
5529	Satı	KALKAVAN	satı.kalkavan36@gmail.com	5383819401	1985-01-21	66	f	45233628558	0
5532	SERAP	ÇAKIR	serap.çakır72@gmail.com	5339015713	1985-01-20	58	f	15394956492	0
5535	Selçuk	BULUT	selçuk.bulut65@gmail.com	5344516551	1984-08-08	42	t	45590228585	0
5537	Halis	PARLAK	halis.parlak59@gmail.com	5421351744	2000-02-28	34	t	59519832606	7
5538	Şükrü	ERKAN	şükrü.erkan42@gmail.com	5561108469	1985-07-25	34	t	73134636444	0
5539	Ali Aydın	USTA	ali aydın.usta91@gmail.com	5487059235	1991-01-14	58	t	57907780660	0
5543	Mehriban	BAYLAN	mehriban.baylan24@gmail.com	5442760179	1994-02-23	1	f	73920689696	0
5544	Eser	Y	eser.y49@gmail.com	5396762227	2001-01-18	56	f	53397272624	0
5546	Tuğçe	IŞIKÖZLÜ	tuğçe.ışıközlü40@gmail.com	5573101254	1996-08-25	34	f	54600789068	0
5548	Çiğdem	SAĞCAN	çiğdem.sağcan77@gmail.com	5306236939	1980-07-12	81	f	53800731819	0
5553	Ayşe Betül	KAYA	ayşe betül.kaya52@gmail.com	5307388893	1982-06-23	34	f	22200043424	0
5555	Pelin	ÖZTÜRK	pelin.öztürk24@gmail.com	5583286909	2000-09-16	23	f	76683100242	0
5556	Hande	CYSE	hande.cyse12@gmail.com	5381710176	1986-02-27	34	f	62357862218	0
5557	Feyza	FİRUZAN	feyza.firuzan53@gmail.com	5345380128	1990-04-13	5	f	67035315282	8
5558	Burcu	BİLGİLİ	burcu.bilgili96@gmail.com	5422700399	1990-03-24	41	f	52371032308	0
5560	Abdurrahman	PAYDAŞ	abdurrahman.paydaş65@gmail.com	5568318437	1980-12-20	63	t	34936940003	0
5561	Burcu	GRANT	burcu.grant93@gmail.com	5538118806	1981-02-28	34	f	81118487650	0
5562	Kadir	ÖZYALÇIN	kadir.özyalçın32@gmail.com	5426360979	2003-03-25	34	t	88645548940	0
5564	Gökhan	EYUBOĞLU	gökhan.eyuboğlu26@gmail.com	5352540536	2000-01-28	58	t	26537749169	0
5566	Mustafa	ZEYTİNOĞLU	mustafa.zeytinoğlu86@gmail.com	5557843134	1982-06-21	42	t	32922601245	0
5568	Mustafa	İBRAHİM MOHAMED	mustafa.ibrahim mohamed16@gmail.com	5564799687	1996-12-01	7	t	67785087057	0
5569	Şura	FEEHLY	şura.feehly40@gmail.com	5512850213	2001-12-25	21	f	67363513920	0
5573	Cemre Arif	PEKER	cemre arif.peker56@gmail.com	5488700428	1990-06-11	34	t	90374135983	0
5575	Merve	IBRAHIMLI	merve.ıbrahımlı18@gmail.com	5527679941	1985-03-12	41	f	85027098185	0
5581	Özge	ÇALİN	özge.çalin22@gmail.com	5413583463	1995-02-03	34	f	85505366728	0
5582	Tuğba	KAŞMER	tuğba.kaşmer11@gmail.com	5487541281	1998-07-28	22	f	66620100253	0
5583	Osman	KAPLAN	osman.kaplan20@gmail.com	5337611949	2000-05-10	34	t	45602183831	0
5584	Sezgi	KUVVETLİ	sezgi.kuvvetli98@gmail.com	5443759337	1994-05-20	77	f	22628818456	0
5586	Ferda	BOZAN	ferda.bozan97@gmail.com	5366857126	1984-10-14	1	f	13248288922	0
5588	Berker	ZAİM	berker.zaim61@gmail.com	5512950439	2001-04-15	41	t	72552495642	0
5589	Sezer	AYDIN	sezer.aydın54@gmail.com	5588499130	1992-04-08	25	t	62999637140	0
5590	Ahmet Emin	DEMİRBAŞ	ahmet emin.demirbaş61@gmail.com	5377699567	2000-02-18	34	t	87821569209	7
5591	Yaşar	BACAK	yaşar.bacak74@gmail.com	5407164312	1983-12-25	33	t	33704278322	0
5593	Ecem	Y	ecem.y33@gmail.com	5307777403	1993-10-17	34	f	73954736433	0
5597	Selma	ÖZLER	selma.özler98@gmail.com	5445103659	1993-12-19	11	f	16719337925	0
5598	Yavuz	PEKER	yavuz.peker10@gmail.com	5353389344	1980-01-11	7	t	45183899871	7
5599	Pelin	AİZEZİ	pelin.aizezi78@gmail.com	5367387181	1991-07-26	34	f	41051173227	0
5602	Nail	KÜLÇÜR	nail.külçür39@gmail.com	5518947149	1987-09-04	34	t	36985769774	0
5603	Aleyna	RAZEGHİ	aleyna.razeghi27@gmail.com	5588742597	1980-12-19	1	f	67714457042	0
5604	Binnur	TOSYALI	binnur.tosyalı93@gmail.com	5497224347	1999-12-14	74	f	81523422245	0
5607	Vahdet Hüseyin	BOZKIR	vahdet hüseyin.bozkır57@gmail.com	5313682966	1985-05-14	34	t	34442887569	0
5609	Mehmet Nuri	MERT	mehmet nuri.mert25@gmail.com	5499085821	2002-08-12	4	t	74548209686	0
5610	Nesibe	CHALİMBA	nesibe.chalimba53@gmail.com	5503703501	2002-08-17	25	f	19106489552	0
5611	Erkan	DİNCER	erkan.dincer95@gmail.com	5494053116	1983-09-28	12	t	70128104572	0
5612	İlknur	GÜR	ilknur.gür62@gmail.com	5442547612	1991-09-10	17	f	11286056591	0
5616	Emine Kevser	GÖKGÖZ	emine kevser.gökgöz23@gmail.com	5443734430	1981-01-20	34	f	82064712479	0
5617	Özge Hande	MERİÇ	özge hande.meriç50@gmail.com	5348224222	1990-02-15	34	f	19292866449	0
5618	Muhammet	ODABAŞI	muhammet.odabaşı73@gmail.com	5351804562	1996-05-09	34	t	49104982479	0
5621	Serap	TEKİN	serap.tekin27@gmail.com	5353668108	1981-01-10	34	f	38325706207	0
5624	Mehmet	İÇEL	mehmet.içel61@gmail.com	5567252241	1997-07-03	34	t	89321049024	0
5625	Suheyla	YILDIZOĞLU	suheyla.yıldızoğlu29@gmail.com	5382721578	1983-10-05	34	f	82404302460	0
5629	Süleyman Girayhan	SAĞMAN	süleyman girayhan.sağman48@gmail.com	5465928243	1999-11-10	52	t	28734269907	0
5630	Merve	YARIMOĞLU	merve.yarımoğlu85@gmail.com	5562967632	1992-10-16	34	f	63969446124	0
5631	Fürüzan	ÖZBEK	fürüzan.özbek54@gmail.com	5561296959	1990-06-18	34	f	96550161743	0
5633	Hülya	AKSAK	hülya.aksak22@gmail.com	5505907390	1991-06-03	34	f	63214372920	0
5634	Aziz Sancar	BAL	aziz sancar.bal73@gmail.com	5475333787	2001-09-09	54	t	84309674545	0
5636	Meliha	GÜRBÜZ	meliha.gürbüz66@gmail.com	5504286359	1995-06-20	34	f	30265984384	1
5641	Esendal	GULIZIRE	esendal.gulızıre41@gmail.com	5502239256	1992-01-03	19	f	89903634589	0
5642	Abdullah	KARAKURT	abdullah.karakurt67@gmail.com	5456315827	2001-05-27	74	t	41664482982	0
5643	Elçin	PAZARÇEVİREN	elçin.pazarçeviren31@gmail.com	5533772987	1987-08-11	34	f	54742607315	0
5644	Emine Benan	GÜNEŞ	emine benan.güneş63@gmail.com	5416996670	1998-09-07	34	f	65638016959	0
5645	Çetin	AKAY	çetin.akay78@gmail.com	5571373728	2003-04-08	25	t	14154712409	0
5646	Zehra	EZZALDEEN SERAG MEKKİ	zehra.ezzaldeen serag mekki79@gmail.com	5474585323	1982-04-22	31	f	52698618146	0
5647	Talha Yiğit	ŞENSÖZ	talha yiğit.şensöz88@gmail.com	5321294778	1984-08-09	42	t	25122758544	0
5648	Süleyman	YILMAZ	süleyman.yılmaz19@gmail.com	5578586204	1990-07-25	7	t	31693157595	0
5649	Şeyma	SARAR	şeyma.sarar73@gmail.com	5323239231	1989-02-26	34	f	12553276361	0
5650	Vedat	ALAEV	vedat.alaev57@gmail.com	5487276269	1984-01-27	21	t	40126395427	0
5652	Merve	KOTİLOĞLU	merve.kotiloğlu56@gmail.com	5458895102	1994-06-16	34	f	38293663855	0
5655	Ceyda	ŞİRİNOĞLU	ceyda.şirinoğlu70@gmail.com	5402778762	1983-12-10	22	f	62771004035	0
5656	Okan	AKTAŞ	okan.aktaş17@gmail.com	5377516172	1994-06-04	34	t	76772092112	0
5657	Gönül	KIRIK	gönül.kırık73@gmail.com	5476888360	1985-02-22	6	f	67151843903	0
5658	Cansu	HASSANI	cansu.hassanı17@gmail.com	5317536789	2000-08-23	9	f	45222919517	0
5661	Gözde	UĞURLUOĞLU	gözde.uğurluoğlu 22@gmail.com	5357785455	1997-01-01	34	f	13860067972	0
5663	Gulfer	YARKIN	gulfer.yarkın29@gmail.com	5494509329	1999-07-02	34	f	17819871909	0
5664	Cihan	BÜYÜKBOSTANCI	cihan.büyükbostancı75@gmail.com	5327184231	1990-08-16	34	t	10483578857	0
5665	Ali İhsan	ÇAYHAN	ali ihsan.çayhan96@gmail.com	5532540472	1989-03-07	1	t	60036857116	0
5666	Miraç	BİLGİÇ	miraç.bilgiç57@gmail.com	5372951570	1993-06-17	53	t	12569300788	0
5667	Remzi	BULDU	remzi.buldu28@gmail.com	5525221782	2002-01-17	17	t	84517156561	0
5668	Ramazan	GÜLTAKAN	ramazan.gültakan79@gmail.com	5563351679	1988-10-27	31	t	92262935095	0
5669	Eser	YILDIRIM	eser.yıldırım96@gmail.com	5504592497	2000-05-20	52	t	42584976670	0
5672	Erdinç Anıl	AYDIN	erdinç anıl.aydın93@gmail.com	5322361516	1987-05-22	34	t	79714438582	1
5674	Volkan	TARCAN	volkan.tarcan58@gmail.com	5322877148	1996-11-04	25	t	81562840825	0
5676	Aynur	ÇİZMECİOĞLU	aynur.çizmecioğlu26@gmail.com	5594035483	1998-01-17	41	f	63482597709	0
5677	Jülide Başak	ONUR	jülide başak.onur41@gmail.com	5561868574	1980-07-08	16	f	45820267676	0
5680	İbrahim Kaan	CANSU	ibrahim kaan.cansu89@gmail.com	5308325418	1984-03-12	33	t	46755896854	0
5683	Nursel	ALKURU	nursel.alkuru63@gmail.com	5321199161	1998-09-18	28	f	34755788879	0
5685	Emine Tomrun	GÜLEN	emine tomrun.gülen46@gmail.com	5573896968	1996-11-14	75	f	13814217033	0
5688	Tolga	ÇAĞLAYAN	tolga.çağlayan16@gmail.com	5472668152	1985-06-12	35	t	85319791667	0
5689	Zeynep	DERE	zeynep.dere69@gmail.com	5332435243	2003-08-18	16	f	64889135015	0
5690	Kamil Hakan	Y	kamil hakan.y35@gmail.com	5546876687	1993-07-28	44	t	39555890019	0
5692	Emre	TEKNEOĞLU	emre.tekneoğlu89@gmail.com	5575607603	1988-01-26	34	t	97477098938	8
5693	nca	SAATÇİOĞLU	nca.saatçioğlu69@gmail.com	5608279934	1990-01-07	28	f	75492454382	0
5694	Ümmü Gülsüm	İVECEN	ümmü gülsüm.ivecen91@gmail.com	5435696807	2001-04-08	34	f	44051832627	0
5695	İlknur	ARSLAN	ilknur.arslan99@gmail.com	5547957220	1996-09-01	34	f	90858697944	0
5696	Betül	ÖZCAN	betül.özcan30@gmail.com	5446870309	1980-06-27	27	f	36197945775	0
5698	Kasım Can	TAN	kasım can.tan17@gmail.com	5442855154	1993-12-22	54	t	16924851226	0
5701	Yekta	WUMAIERJIANG	yekta.wumaıerjıang80@gmail.com	5441024657	1994-11-09	47	f	39588425044	0
5702	Hayal	DEMİRKAYNAK	hayal.demirkaynak84@gmail.com	5335718235	1985-04-24	48	f	80379853845	0
5703	Gamze	AKKOÇ	gamze.akkoç65@gmail.com	5325224811	2002-12-24	1	f	50432116887	0
5705	Gurbet	GİRİT	gurbet.girit42@gmail.com	5337512208	1989-06-27	38	f	34549546652	0
5707	Nurver	AÇIL	nurver.açıl31@gmail.com	5431107621	1993-03-11	59	f	94501412814	0
5708	Emre	VONA GERÇİK	emre.vona gerçik99@gmail.com	5514622217	2003-08-25	35	t	20831236620	0
5713	Mümin	DEMİR	mümin.demir77@gmail.com	5548502531	1989-07-25	77	t	91370649116	1
5714	Suat Can	KHUANGANOV	suat can.khuanganov90@gmail.com	5314615479	1992-12-23	34	t	95548645928	0
5716	Merve	UNGEVER	merve.ungever50@gmail.com	5486560784	1996-02-10	34	f	37323735945	0
5717	Burcu	SAĞLAM	burcu.sağlam41@gmail.com	5412030574	1998-04-28	34	f	38797079693	0
5718	Betül	ALİ HASSANİ	betül.ali hassani79@gmail.com	5607875428	1986-05-05	72	f	57763178249	0
5719	Oya	AKSOY	oya.aksoy64@gmail.com	5436154636	1988-08-12	34	f	89563125859	0
5723	Betül	ABDULLAH	betül.abdullah47@gmail.com	5377337851	1996-06-08	32	f	56477281600	0
5724	Hali,me Çiğdem	TEKİN	hali,me çiğdem.tekin32@gmail.com	5501557510	1989-10-11	6	f	28421675207	0
5728	Ezgi	TURAN	ezgi.turan99@gmail.com	5367700314	1994-06-04	34	f	23911165489	0
5729	Gökhan	ÜNLÜ	gökhan.ünlü76@gmail.com	5362034824	1991-02-04	10	t	34512660667	0
5730	Aysu	ŞAFAK	aysu.şafak16@gmail.com	5608589630	1986-08-22	67	f	29017649561	0
5731	Elif	SEVİÇ	elif.seviç45@gmail.com	5463073880	1988-04-10	53	f	89309428793	0
5733	Gökhan	ÇOLAK	gökhan.çolak48@gmail.com	5478387122	1994-11-17	50	t	35646608219	0
5735	Yunus Emre	AVCI	yunus emre.avcı41@gmail.com	5356606405	1998-01-25	34	t	84919416545	0
5736	Ahmet	GÜNGÖR	ahmet.güngör45@gmail.com	5454550621	1994-11-15	55	t	72675042220	0
5737	Uğur	Y	uğur.y90@gmail.com	5441519546	1995-11-24	10	t	28919109202	0
5740	Özde	ÇAY	özde.çay12@gmail.com	5548074168	2001-02-06	17	f	80101541829	0
5741	Irmak Refika	MUSTAFA	ırmak refika.mustafa77@gmail.com	5584143929	1995-10-23	48	f	27733819936	0
5742	Metehan	BAŞOL	metehan.başol79@gmail.com	5438883342	2001-07-12	34	t	75572475327	0
5744	Özden	BOYACIOĞLU	özden.boyacıoğlu61@gmail.com	5301079144	2001-06-11	34	f	94698941434	0
5747	Hazal	EYİ	hazal.eyi12@gmail.com	5447933182	1980-02-28	34	f	93704114380	0
5748	Ömer	VURAN	ömer.vuran12@gmail.com	5406309113	1985-02-10	31	t	38234705976	0
5750	Haldun	ONUR	haldun.onur54@gmail.com	5504142909	2002-10-19	34	t	98405651288	0
5754	Zelhen	KERTİŞ	zelhen.kertiş68@gmail.com	5303472731	2002-11-28	34	f	42130459764	0
5755	Ilkem Ayşe	KAZANCIOĞLU	ılkem ayşe.kazancıoğlu48@gmail.com	5547152341	1981-01-24	22	f	66002239499	0
5760	Sami	Orta	sami.orta16@gmail.com	5568950287	1992-09-15	60	t	29195922171	0
5761	Yusuf	ALTINTAŞ	yusuf.altıntaş53@gmail.com	5492858493	1981-12-07	34	t	99158390242	0
5763	Fatih	BAŞAR	fatih.başar23@gmail.com	5593182388	1985-08-12	34	f	15422595894	0
5765	Hande	KUROĞLU	hande.kuroğlu28@gmail.com	5394784615	2002-05-14	34	f	18331882611	0
5766	Sinan	ERDOĞAN	sinan.erdoğan74@gmail.com	5576500723	2000-12-03	34	t	13018583248	7
5768	Harun Zeki	TÜTENK	harun zeki.tütenk79@gmail.com	5528758259	1987-03-08	52	t	63444899111	1
5772	Lokman	KAYA	lokman.kaya67@gmail.com	5461240817	1996-06-21	29	t	62040204860	0
5773	Kürşat Hakan	KARA	kürşat hakan.kara72@gmail.com	5388557542	1998-06-12	34	t	20858259327	0
5778	Emin Bünyamin	KAYA	emin bünyamin.kaya50@gmail.com	5345571542	1983-01-13	33	t	27385904359	0
5780	Ahmet Selim	Y	ahmet selim.y71@gmail.com	5327381760	1991-12-22	55	t	64340981911	0
5781	İlhan	ECEVİŞ	ilhan.eceviş44@gmail.com	5344402429	1988-07-20	55	t	44538047329	0
5782	Dursun Ogün	SARIHAN	dursun ogün.sarıhan29@gmail.com	5306748520	1985-06-07	55	t	18886367400	0
5784	Gamzenur	ÖNDER	gamzenur.önder43@gmail.com	5504285656	1980-09-07	25	f	52191527850	0
5789	Döndü	KİLİC	döndü.kilic63@gmail.com	5408891505	1995-08-25	70	f	30223971176	0
5793	Mustafa	AKBAĞ	mustafa.akbağ11@gmail.com	5454982158	1986-09-21	42	t	84954666523	0
5794	Burak	YILMAZ	burak.yılmaz13@gmail.com	5576428266	1999-02-19	28	t	65972011731	0
5795	Atilla	ARSLAN	atilla.arslan94@gmail.com	5396616974	1995-12-13	41	t	56280247114	0
5797	Burcu	KARAKAYA	burcu.karakaya30@gmail.com	5556781240	2003-05-07	34	f	66396980565	0
5799	Aliye	ÖZDEMİR	aliye.özdemir52@gmail.com	5431403779	1995-04-05	9	f	53298773921	5
5800	Özlem	EVCİ	özlem.evci95@gmail.com	5507905442	1991-04-07	34	f	35408702523	0
5804	Gamze	MENTEŞE	gamze.menteşe64@gmail.com	5324154145	1994-10-13	34	f	54260302267	0
5806	Pelin	ERGİNSOY	pelin.erginsoy61@gmail.com	5342129781	1987-10-15	34	f	42091156243	0
5807	Nur Sema	ALTINKAYA ULUĞ	nur sema.altınkaya uluğ12@gmail.com	5377314264	2000-07-10	34	f	30482318349	0
5809	Mehmet	PEHLİVAN	mehmet.pehlivan30@gmail.com	5328570651	1998-06-23	2	t	20143932890	0
5810	Cihangir	KAMIŞLI	cihangir.kamışlı27@gmail.com	5585399277	1990-09-11	58	t	17331199224	0
5811	Hasan Ülvi	YILDIRIM	hasan ülvi.yıldırım25@gmail.com	5563481854	1995-01-01	61	t	28924006249	0
5814	Serhat	AKYOKUŞ	serhat.akyokuş47@gmail.com	5443670305	2003-02-06	31	t	91139761184	0
5816	Necmettin	ÇELİK	necmettin.çelik79@gmail.com	5413384906	1990-10-10	34	t	81177909611	0
5818	Zeynep	MIRZAYEVA	zeynep.mırzayeva92@gmail.com	5606974233	1997-01-13	6	f	66898973830	6
5819	Resul	KATI	resul.katı81@gmail.com	5468590982	1996-02-17	34	t	70979280509	0
5821	Burcu	ATAŞ	burcu.ataş 65@gmail.com	5351382719	1999-01-02	34	f	74087487951	0
5823	Ayşe	TAŞÇI	ayşe.taşçı15@gmail.com	5415267481	2000-05-28	35	f	89560779260	0
5824	Yunus	ÖZTÜRK	yunus.öztürk28@gmail.com	5334251667	1989-11-22	34	t	72306039270	0
5829	Seda	ERDOĞAN	seda.erdoğan40@gmail.com	5477904812	1987-10-13	1	f	85209238395	0
5830	Sena Işıl	İLTER	sena ışıl.ilter92@gmail.com	5494343403	2001-01-05	34	f	29293773825	0
5832	Seray	ŞAHİN	seray.şahin73@gmail.com	5496072561	1987-09-03	22	f	81411768676	0
5834	Büşra Nur	ÇAĞLAYAN CAN	büşra nur.çağlayan can38@gmail.com	5537333479	2001-01-09	67	f	58906349344	0
5835	Raşit	ÖZTÜRK	raşit.öztürk79@gmail.com	5315952402	1999-09-05	34	t	56419001588	0
5836	Burhan	ÇELEBİ	burhan.çelebi59@gmail.com	5337088958	1989-04-01	6	t	97896791424	0
5837	Mavi Bulut	KIRATLI	mavi bulut.kıratlı77@gmail.com	5441163568	1988-11-28	6	t	13834302993	0
5838	Serra	MELİOKĞLU	serra.meliokğlu12@gmail.com	5471119480	1991-12-04	5	f	34479143499	0
5841	Aydın	GÜNEL	aydın.günel95@gmail.com	5513105468	2002-11-20	34	t	67116069175	0
5842	Ayşe	DEMİRTAŞ	ayşe.demirtaş88@gmail.com	5536283564	2003-02-18	45	f	68044492086	0
5843	Mustafa	KANDEMİR	mustafa.kandemir16@gmail.com	5583153591	2003-11-16	46	t	51636205686	0
5844	Sunay	KÖSEM	sunay.kösem93@gmail.com	5404548815	1994-06-15	21	f	26937456968	0
5847	Hasip Onur	GÜLTEKİN	hasip onur.gültekin12@gmail.com	5367073973	1983-02-05	27	t	89961852103	0
5848	Mesut	Y	mesut.y89@gmail.com	5491649757	1997-09-07	34	t	30807040257	0
5849	Nihan	ARSLAN	nihan.arslan59@gmail.com	5334784455	1989-05-26	57	f	31254917852	0
5850	Halil Burak	BUNSUZ	halil burak.bunsuz88@gmail.com	5572417435	2002-10-17	34	t	12174486005	0
5851	Gökmen	BEKAROĞLU	gökmen.bekaroğlu98@gmail.com	5494997536	1993-01-08	34	t	20232109944	0
5854	Gülnur	MAIMAITI	gülnur.maımaıtı12@gmail.com	5345054100	1991-03-24	34	f	68268525913	0
5856	Mustafa	BOZ	mustafa.boz35@gmail.com	5554811452	1996-08-08	2	t	30821359642	0
5857	Fatih	SAYGAN	fatih.saygan10@gmail.com	5504320374	1999-10-07	40	f	87246048802	0
5859	Betül	Y	betül.y33@gmail.com	5524044408	2000-06-28	67	f	68117688588	2
5860	Dilek	GERGİN	dilek.gergin56@gmail.com	5492034354	1980-09-14	55	f	12690543975	0
5861	Melterm	ŞENVER	melterm.şenver66@gmail.com	5582211513	1986-09-26	26	f	32736664174	0
5862	Ali	ŞEMİEOĞLU	ali.şemieoğlu82@gmail.com	5558135665	1986-12-17	34	t	58943606777	0
5864	Kiper	KAYAALP	kiper.kayaalp36@gmail.com	5424610247	1987-04-24	34	t	75952398451	0
5867	Esra	ARSLAN	esra.arslan80@gmail.com	5396847508	1997-06-02	71	f	96339108128	0
5868	Korcan	KAYA	korcan.kaya82@gmail.com	5303118178	1991-09-22	6	f	84013936402	0
5869	Onur Alp	SEZER	onur alp.sezer60@gmail.com	5385319175	1982-04-01	54	t	75638855533	0
5871	İrem	ELHAN	irem.elhan97@gmail.com	5503250475	1991-08-13	34	f	80984683008	0
5872	Aytaç	ÇEMBERCİ	aytaç.çemberci96@gmail.com	5503817834	1989-06-21	34	t	49246360113	0
5873	Kutluğ	AKÜN	kutluğ.akün29@gmail.com	5555717117	1998-02-06	34	t	73268274469	0
5874	Okan	SOYADI	okan.soyadı54@gmail.com	5526054971	1992-01-27	34	t	37895863032	0
5875	Seher	KOÇ	seher.koç38@gmail.com	5377265857	1997-06-07	33	f	44556135660	0
5877	Muhsin	YILDIZ	muhsin.yıldız55@gmail.com	5301260924	1983-12-04	4	t	93998658116	0
5879	Abdullah Engin	NI SULTAN	abdullah engin.nı sultan12@gmail.com	5567557201	1998-04-05	61	t	93207357228	0
5881	Fatih	KAYACAN	fatih.kayacan57@gmail.com	5353113837	1999-11-02	80	t	23043438529	0
5882	Abdulkadir	YILMAZ	abdulkadir.yılmaz73@gmail.com	5468828960	1995-05-28	47	t	13573371365	0
5883	Hande	ERDOĞUŞ	hande.erdoğuş21@gmail.com	5377262920	1994-03-08	34	f	48889287127	0
5884	Mehmet	HEKİMOGLU	mehmet.hekimoglu16@gmail.com	5498260228	1999-07-15	9	t	18824737256	2
5885	Zahide Zehra	Y	zahide zehra.y47@gmail.com	5423562355	1993-02-21	34	f	93542883486	0
5886	Şehriban	ÇOBAN	şehriban.çoban76@gmail.com	5606515476	1989-07-07	32	f	84656515913	0
5888	Çağla	KHATSIANOVICH	çağla.khatsıanovıch71@gmail.com	5405536244	1983-01-15	34	f	54211319789	0
5889	Ata Özgür	MAMUTOVA	ata özgür.mamutova85@gmail.com	5393448164	1993-02-22	6	t	14829863735	0
5890	Seden	DEMİRCİ	seden.demirci70@gmail.com	5563526159	1992-06-28	35	f	25153422275	0
5891	Elçin	YİĞİT	elçin.yiğit55@gmail.com	5596694999	1984-08-05	34	f	76091165205	0
5892	Muhammet Fatih	ÇOKAY	muhammet fatih.çokay99@gmail.com	5342913662	1997-02-24	34	t	71612610716	0
5893	Hatice	ÇİÇEK	hatice.çiçek51@gmail.com	5502839766	1993-11-22	37	f	51665187615	0
5894	Şeyma	SOYDAN	şeyma.soydan68@gmail.com	5564614281	1998-01-06	34	f	10191734571	0
5897	Merve	ÖZDEMİR	merve.özdemir57@gmail.com	5601063638	1988-10-19	34	f	29189007092	0
5898	Nadi	AYANA	nadi.ayana20@gmail.com	5353470388	2003-04-20	54	t	86640281343	0
5899	Hazal	ÖZCAN	hazal.özcan71@gmail.com	5348136730	1996-10-28	6	f	19174432656	0
5904	Fatima	ATAKAN	fatima.atakan47@gmail.com	5395808453	2001-11-06	34	f	17421062941	0
5905	Dersim	BORAT	dersim.borat23@gmail.com	5307289728	1982-06-19	47	f	77088072729	0
5906	Mehtap	ÖZTÜRK	mehtap.öztürk42@gmail.com	5382679804	1985-03-25	34	f	51614222127	0
5907	Tuğçe	GÜLBEK	tuğçe.gülbek99@gmail.com	5427288737	1984-07-21	34	f	89504971153	0
5908	Adem Yasin	GÖZKARA	adem yasin.gözkara52@gmail.com	5486354272	1991-09-13	34	t	26587910806	0
5909	Semi	YÜCEKAL	semi.yücekal12@gmail.com	5564974278	1993-09-01	67	t	35950842198	0
5911	Rıfat	KARCI	rıfat.karcı51@gmail.com	5303941924	1994-01-07	44	t	64637126529	0
5912	Mevre	CEYLAN	mevre.ceylan72@gmail.com	5336262387	1990-05-14	1	f	68348226490	1
5913	Yıldız	YÜCEL	yıldız.yücel93@gmail.com	5524290848	1989-10-13	25	f	26164692788	0
5914	Nurşah	POLAT	nurşah.polat20@gmail.com	5593436734	1992-10-10	16	f	69029393097	0
5916	Yunus	YILDIRIM	yunus.yıldırım36@gmail.com	5534323775	1989-04-19	7	t	56972171234	0
5917	Tuğçe	BENZER	tuğçe.benzer24@gmail.com	5324300146	1988-04-16	60	f	78917643931	0
5921	Sinem	ÇAYCI	sinem.çaycı28@gmail.com	5524417593	1985-05-25	34	f	57965854044	0
5922	Ceren	KURŞUNOĞLU	ceren.kurşunoğlu49@gmail.com	5391860900	1985-07-03	55	f	73979798294	0
5924	Hülya	TEKİNALP	hülya.tekinalp12@gmail.com	5361216167	1981-05-18	34	f	98710461380	0
5927	Fehim	LAFCI	fehim.lafcı66@gmail.com	5378419302	1994-12-11	24	t	96102246243	0
5929	İlker	BAYAM	ilker.bayam20@gmail.com	5332349674	1987-03-14	34	t	50161186368	0
5930	Aydın	ŞANLI	aydın.şanlı66@gmail.com	5485682750	1992-10-20	34	t	52372543467	0
5931	Hande	ASSAİED	hande.assaied69@gmail.com	5304349890	2000-03-03	39	f	52565532865	0
5932	Dilara	BALCIOĞLU	dilara.balcıoğlu18@gmail.com	5456941842	1984-03-14	16	f	15420314190	0
5934	Mustafa K.	KARATAŞ	mustafa k..karataş15@gmail.com	5341880894	1992-09-04	34	t	65196717545	0
5935	Sena	SAK	sena.sak81@gmail.com	5454978232	1996-02-11	34	f	75962068681	0
5936	Aydan	ERGÜN	aydan.ergün25@gmail.com	5463916535	1999-05-10	10	f	90587221396	0
5937	Özgür	YILMAZ	özgür.yılmaz72@gmail.com	5478419652	1988-05-09	28	t	20799747816	0
5938	Murat	ABUDUAİNİ	murat.abuduaini35@gmail.com	5447548729	1984-07-20	3	t	64521799199	0
5939	Seyfettin	DOĞAN	seyfettin.doğan82@gmail.com	5584405312	2002-11-28	33	t	88941966505	0
5943	Elif	GÜNER ZÜLFİKAR	elif.güner zülfikar89@gmail.com	5371530920	1993-02-03	61	f	37631715580	0
5945	Ferhat	CİHANGİR	ferhat.cihangir37@gmail.com	5558310644	1998-09-15	2	t	14302948627	0
5947	Leyla	YAŞAR	leyla.yaşar50@gmail.com	5498662757	1995-03-10	54	f	91873445332	0
5950	İhsan Cem	ÖZTÜRK	ihsan cem.öztürk46@gmail.com	5431080961	1993-08-27	34	t	87621075361	0
5951	Ceyda	MUSTAFAEV	ceyda.mustafaev39@gmail.com	5501461199	1988-04-11	54	f	33364107415	0
5952	Mustafa Cihat	KIRKİÇ	mustafa cihat.kırkiç74@gmail.com	5594063511	1986-10-27	61	t	79178295112	0
5955	Ercüment	BİRDOĞDU (ÖZDEMİR)	ercüment.birdoğdu (özdemir)64@gmail.com	5393948374	1980-07-15	41	t	87394107153	0
5957	Oğuz	Yüce	oğuz.yüce83@gmail.com	5464723518	1993-03-23	10	t	22685637537	0
5958	Tuğba	ÖZKAN	tuğba.özkan34@gmail.com	5538070847	1991-06-24	23	f	46827988811	0
5960	Orhan	ERSOY	orhan.ersoy92@gmail.com	5301490150	1986-11-21	55	t	46712670000	0
5961	Zeynep	KUŞOĞLU	zeynep.kuşoğlu64@gmail.com	5418229475	1988-04-11	63	f	95662108765	0
5963	Pınar	DANIŞ	pınar.danış62@gmail.com	5449020119	1990-03-08	44	f	92635400685	0
5964	Nurbaki	Y	nurbaki.y64@gmail.com	5444370549	2003-03-06	38	t	24627803206	0
5965	Gizem	ALİYEV	gizem.aliyev59@gmail.com	5579084571	2000-10-01	34	f	41326846934	0
5967	Buse	DEMİRAL	buse.demiral43@gmail.com	5443231879	1991-05-05	10	f	27143652360	0
5968	Ebru	ÇAKIR	ebru.çakır12@gmail.com	5335201867	1980-01-20	34	f	98629892838	0
5969	Çağtay Ozan	ÇAKIR	çağtay ozan.çakır54@gmail.com	5607003954	1998-05-04	34	t	63155769927	0
5970	Abdulsamet	YILDIZ	abdulsamet.yıldız85@gmail.com	5402006434	1980-01-24	19	t	70375282492	3
5971	Mustafa Hilmi	AYDIN	mustafa hilmi.aydın73@gmail.com	5524077657	1987-09-20	18	t	21295158661	0
5975	Mahmut	AKBULAK	mahmut.akbulak23@gmail.com	5477762870	1986-02-09	44	t	50010824457	0
5976	İpek	ŞAHİN	ipek.şahin69@gmail.com	5563062955	1994-02-15	6	f	87237861879	0
5977	Abdülkerim	GÜRSEL ÇETİNER	abdülkerim.gürsel çetiner46@gmail.com	5435074607	2002-06-03	81	t	58768284566	0
5978	Sena Nur	AVŞAR	sena nur.avşar10@gmail.com	5359009598	1988-05-06	34	f	66232002299	0
5980	Hasan	MEHMETİ	hasan.mehmeti82@gmail.com	5413957587	1985-05-05	2	t	87932276025	0
5981	Meryem	ÇAĞLAYAN	meryem.çağlayan76@gmail.com	5553225348	2003-01-01	34	f	58466867848	0
5983	Nesrin	TURAN	nesrin.turan99@gmail.com	5517256800	1988-12-03	47	f	17202947632	0
5984	Orçun Kaan	BALCI	orçun kaan.balcı64@gmail.com	5354164911	1980-01-28	34	t	28827802489	0
5985	Tunç	AĞIR	tunç.ağır81@gmail.com	5594901829	2001-08-24	6	t	83764162691	0
5987	Sezer	İBRAHİM	sezer.ibrahim62@gmail.com	5305130620	1985-11-12	59	t	95063498026	0
5991	Ezgi	DEMİRCİ	ezgi.demirci14@gmail.com	5548265172	1982-12-12	34	f	66955298407	0
5992	Emir	AŞAR	emir.aşar97@gmail.com	5492562196	1983-04-07	34	t	16212218249	0
5993	Ece	ÜREK	ece.ürek15@gmail.com	5434338109	2002-03-26	34	f	34245733133	0
5994	Ocan	Y	ocan.y23@gmail.com	5564900490	1981-12-07	34	t	73384725856	0
5995	Şenay	Y	şenay.y51@gmail.com	5507870794	1985-06-08	63	f	11949513770	0
5997	Ayşin	EKE	ayşin.eke32@gmail.com	5542515964	1987-07-28	67	f	21974153669	0
5998	Sadık Şevki	EROĞLU	sadık şevki.eroğlu17@gmail.com	5387230738	2002-03-21	34	t	84401863834	0
6002	Songul	SULTANA	songul.sultana15@gmail.com	5302388399	1998-06-21	2	f	63031598803	0
6003	Oğuz	RECEP	oğuz.recep58@gmail.com	5326141636	1994-11-21	53	t	59131940874	0
6005	Görkem	YAŞAR	görkem.yaşar57@gmail.com	5412280858	1990-02-01	16	t	12438752339	0
6006	Mehmet	DEVLET	mehmet.devlet43@gmail.com	5571984868	1986-08-04	23	t	40396672708	0
6008	Ömer	ÖZGAN	ömer.özgan79@gmail.com	5607976254	1996-04-16	61	t	86375149053	1
6009	Sibel	YALÇIN	sibel.yalçın64@gmail.com	5393782661	1982-07-24	75	f	72687679250	0
6013	Savaş	TOPRAK	savaş.toprak35@gmail.com	5313581476	1988-10-20	31	t	50138806032	0
6014	Mustafa	SÖKEN	mustafa.söken16@gmail.com	5413396616	1991-09-19	34	t	82722903331	0
6015	Neziha	BAYTAR	neziha.baytar61@gmail.com	5328282516	1995-10-25	45	f	91359105116	0
6016	Selvi	YİĞİT	selvi.yiğit38@gmail.com	5471047921	1998-08-04	19	f	95320264631	0
6018	Gizem	İDE	gizem.ide28@gmail.com	5494535258	2003-02-07	7	f	98560045286	0
6021	Meryem	ERTÜRK	meryem.ertürk60@gmail.com	5544297490	1985-12-26	1	f	90888891123	0
6022	Büşra	KOÇAK	büşra.koçak99@gmail.com	5544143476	1981-03-15	81	f	69403994696	0
6023	Mervenur Gizem	OKAY	mervenur gizem.okay40@gmail.com	5315999173	1997-12-27	54	f	87157327052	0
6026	Sedef	ABUBAKAR	sedef.abubakar48@gmail.com	5521776216	1992-08-08	55	f	22502099017	0
6027	Fazli	YALÇIN	fazli.yalçın17@gmail.com	5303660124	1990-06-28	2	t	51469884253	0
6029	Aziz Burak	KURTUL	aziz burak.kurtul22@gmail.com	5447009943	1992-11-14	34	t	40193363691	0
6032	Gönül	KASAPBAŞI	gönül.kasapbaşı56@gmail.com	5351100315	1983-04-09	34	f	77807272669	0
6033	Osman	ÖZER	osman.özer16@gmail.com	5404943312	1998-09-16	3	t	65081789495	0
6034	Cengiz	TURAN	cengiz.turan53@gmail.com	5493209204	1997-03-04	34	t	83377930574	0
6037	Funda	YAŞAR	funda.yaşar15@gmail.com	5303516290	1998-11-23	25	f	39303161897	0
6038	Sadık	ÖZER	sadık.özer96@gmail.com	5471890655	1981-11-05	34	t	38061941405	0
6039	Serhat	KÖSE	serhat.köse15@gmail.com	5461283174	1994-05-24	72	t	10857677282	0
6040	Gökhan	HASANOVA	gökhan.hasanova37@gmail.com	5401396513	1988-05-04	39	t	92192000613	0
6044	Bektaş	İNAL	bektaş.inal79@gmail.com	5363510515	1991-11-25	44	t	80540755448	0
6050	Burcu	ŞİRİNOVA	burcu.şirinova32@gmail.com	5477413542	1994-06-23	34	f	82968760452	0
6051	Barış	KOUASSİ	barış.kouassi55@gmail.com	5596126722	1986-02-02	34	t	45531879497	0
6055	Damla	KAYA	damla.kaya16@gmail.com	5486581303	1994-10-05	34	f	42789180992	0
6056	Şebnem	GÜNER	şebnem.güner52@gmail.com	5542647955	1994-08-28	34	f	97403915361	0
6057	Erkan	KARABIYIK	erkan.karabıyık85@gmail.com	5609194390	1987-04-05	34	t	45870534092	0
6059	Gülşah	AKÇAKAYA	gülşah.akçakaya24@gmail.com	5531901164	1983-11-16	71	f	86147624031	0
6060	Elif Zeynep	SADE	elif zeynep.sade43@gmail.com	5539164256	1992-05-15	38	f	50140613682	0
6062	Yunus Ali	DURMAZ	yunus ali.durmaz10@gmail.com	5433014370	1980-03-19	34	t	74969208583	0
6063	Burak	SHEHADA	burak.shehada45@gmail.com	5448905468	1994-08-25	3	t	32072677483	0
6065	Tuğba	GÜZEL	tuğba.güzel46@gmail.com	5578913125	2000-07-28	52	f	49352230152	0
6066	Ibrahım	IŞKIN	ıbrahım.ışkın19@gmail.com	5565401261	1998-12-02	52	t	90950062648	0
6067	Cihad Furkan	ERKASAP	cihad furkan.erkasap39@gmail.com	5434767342	1995-01-06	38	t	19824599219	0
6068	Mehmet Emin	KARAYAZGAN	mehmet emin.karayazgan87@gmail.com	5445212515	1996-01-19	56	t	83453182126	0
6069	Sevgül	ÖZTÜRK	sevgül.öztürk52@gmail.com	5347984759	1986-06-19	7	f	65644459063	0
6071	Furkan	ÜMMET	furkan.ümmet23@gmail.com	5318221345	1987-04-20	10	t	23276538105	0
6072	Esra	KÖMBE	esra.kömbe47@gmail.com	5593424148	1995-06-14	66	f	82996306157	0
6074	Beytullah	TANGÖREN	beytullah.tangören12@gmail.com	5584622434	1984-06-07	67	t	17681109714	0
6075	Nur	DEMIR	nur.demır54@gmail.com	5511008103	1994-12-13	20	f	12216722044	0
6076	Furkan	ALKIN	furkan.alkın13@gmail.com	5602158787	1989-09-11	34	t	24065486827	0
6077	Rabia İclal	KARAKAYA	rabia iclal.karakaya38@gmail.com	5348340815	2000-12-19	34	f	19281005714	0
6078	Yusuf	AKAR	yusuf.akar21@gmail.com	5358146441	1993-09-22	63	t	21172707726	0
6079	Servet Celadet Resaı Hayrettın	AMANTAY	servet celadet resaı hayrettın.amantay22@gmail.com	5565534535	2001-11-27	34	t	18282726120	0
6081	Burak	OKUMUŞ	burak.okumuş83@gmail.com	5443084439	2001-01-16	59	t	21205852682	5
6085	Serkan	İPEKÇİ	serkan.ipekçi32@gmail.com	5602222879	1989-11-15	34	t	17245560655	0
6087	Cemal	ALBAYRAK	cemal.albayrak56@gmail.com	5574285507	1990-07-03	68	t	15372187432	0
6089	Yunus Can	KARA	yunus can.kara42@gmail.com	5427645762	1981-01-17	34	t	57159545708	0
6093	Uğur	ÖZ	uğur.öz11@gmail.com	5388050843	1990-02-01	35	t	24899024864	0
6097	Kudret	KALCI	kudret.kalcı65@gmail.com	5552366540	2002-08-20	63	f	57896800710	0
6098	Sabire	SEÇGİNLİ	sabire.seçginli92@gmail.com	5541424470	2003-01-08	40	f	40073292894	0
6099	Sinan	ÖZDEMİR	sinan.özdemir89@gmail.com	5514801412	1989-05-24	52	t	18465082030	0
6100	Tarkan	KAYA	tarkan.kaya78@gmail.com	5386941421	1986-02-19	61	t	78453591904	0
6101	nul	ERCİYES	nul.erciyes95@gmail.com	5585000696	1986-08-22	44	f	29625794240	0
6102	Aydın	ÖZKAYA	aydın.özkaya24@gmail.com	5388734500	1987-02-20	61	t	56733642214	0
6103	Cansu	DOĞAN	cansu.doğan29@gmail.com	5495643774	1992-04-21	34	f	55605067314	0
6106	İsmail Burak	AKPULAT	ismail burak.akpulat27@gmail.com	5451414299	1980-08-06	34	t	22284015610	1
6107	Özge Büşra	BOZKIR	özge büşra.bozkır40@gmail.com	5511013455	1984-03-11	34	f	72518701554	0
6108	Fahri Kaan	HATİPOĞLU	fahri kaan.hatipoğlu71@gmail.com	5526857559	1999-07-27	34	t	84209021298	0
6110	Selahattin Armağan	BERBEROĞLU	selahattin armağan.berberoğlu70@gmail.com	5435093634	1992-09-16	33	t	65299195375	0
6111	Ömer Faruk	BİNATLI	ömer faruk.binatlı47@gmail.com	5568452634	1984-03-23	3	t	76132512288	0
6112	Eda	YÖRÜBAS	eda.yörübas97@gmail.com	5352686338	1994-08-19	34	f	54492632578	0
6113	Teoman	YILDIZ	teoman.yıldız55@gmail.com	5536840174	1989-07-04	27	t	29079347603	0
6115	Mehtap	ÇETİNER	mehtap.çetiner78@gmail.com	5359065767	1993-11-02	23	f	85087223651	0
6116	Tolga	KARABAY	tolga.karabay26@gmail.com	5587765654	1980-02-25	34	t	33111432394	0
6118	Gizem	ALKHATIB	gizem.alkhatıb12@gmail.com	5594744416	1989-08-28	34	f	86126231264	0
6120	Samet	ÇAKMAKCI	samet.çakmakcı84@gmail.com	5338911184	1980-01-06	34	f	75473523765	0
6121	Burcu	KAYA	burcu.kaya25@gmail.com	5351387453	1991-10-01	16	f	89809235126	0
6122	Derya	ABUDUREYIMU	derya.abudureyımu95@gmail.com	5516732597	1992-12-06	42	f	13379574146	0
6123	Buğra	BAKIŞ	buğra.bakış47@gmail.com	5331234667	1992-11-27	81	t	36349828512	0
6130	Begum	ÇUBUKÇUOĞLU	begum.çubukçuoğlu54@gmail.com	5345912577	2000-01-01	34	f	26908246068	0
6133	Canan	AKSOY	canan.aksoy71@gmail.com	5341435513	1995-12-28	16	f	36243240251	0
6138	Resul	TAŞKIN	resul.taşkın92@gmail.com	5524898537	1982-04-28	18	t	60107553795	0
6139	Emre	TEKTAŞ	emre.tektaş23@gmail.com	5538895564	1987-08-23	59	t	25565237755	0
6140	Muhammet	NAZLI	muhammet.nazlı82@gmail.com	5556871126	2003-11-12	61	t	19253596485	0
6141	Belin	DURDAĞ	belin.durdağ13@gmail.com	5571301636	2003-06-11	34	f	80761396555	0
6144	Kezban	ALSHEKHI	kezban.alshekhı61@gmail.com	5595589357	1981-06-09	19	f	80627973311	8
6146	Yiğit	İÇİN	yiğit.için56@gmail.com	5365452921	1988-11-04	6	t	10207954440	0
6148	Vasfiye Tuba	VAROĞLU	vasfiye tuba.varoğlu50@gmail.com	5481860508	1993-10-16	21	f	60083734993	0
6150	Murat	KAYA	murat.kaya69@gmail.com	5558380875	1980-04-08	16	t	97007191273	0
6151	Şeyma	Y	şeyma.y61@gmail.com	5525654762	2003-05-02	60	f	46185926617	0
6152	Muzeyyen	GÖK	muzeyyen.gök55@gmail.com	5453333571	1993-04-27	67	f	51900172707	0
6153	Özlem	TECER	özlem.tecer86@gmail.com	5463256490	1997-12-26	34	f	34723540065	0
6154	Hakan	AMCHA	hakan.amcha13@gmail.com	5328085823	1989-09-27	34	t	42796664629	1
6155	Bora	TOSUN	bora.tosun74@gmail.com	5608633113	1987-05-17	34	t	31195701262	0
6156	Ömer	KAYA	ömer.kaya98@gmail.com	5593215609	1991-01-15	34	t	21462558458	0
6157	Fatma Nur	CZERW	fatma nur.czerw71@gmail.com	5351142407	1984-02-27	42	f	64409016175	0
6159	Mehmet Alper	MAMMADOV	mehmet alper.mammadov75@gmail.com	5403273621	1999-05-07	52	t	66517761468	1
6161	Emel	ABDİLLAHİ	emel.abdillahi27@gmail.com	5332599629	2001-03-19	6	f	48525852104	0
6163	Murat	BAŞAL	murat.başal63@gmail.com	5506737731	1995-02-21	3	t	48381448870	0
6164	Ebru	ÖZTÜRK	ebru.öztürk74@gmail.com	5456070664	1997-04-28	34	f	24115585178	0
6165	Cihan	SULEYMENLİ	cihan.suleymenli41@gmail.com	5455088626	1997-01-06	34	t	76290679145	0
6166	Cem Naci	ERDEMİR	cem naci.erdemir91@gmail.com	5373330325	1981-09-10	34	t	95203840144	0
6168	Gamze	TAHMAZ	gamze.tahmaz60@gmail.com	5317852918	1996-12-27	34	f	16500958192	0
6171	Merve	ÖZEN	merve.özen96@gmail.com	5482615476	2001-02-22	34	f	62505656281	0
6172	İlknur	Y	ilknur.y88@gmail.com	5329198770	1984-04-04	10	f	38338187556	3
6173	Ayşe Sümeyra	KASIMOĞLU	ayşe sümeyra.kasımoğlu93@gmail.com	5526988602	1984-04-24	34	f	65293002606	0
6175	Gizem	MAZLUM	gizem.mazlum51@gmail.com	5437275601	1986-06-19	65	f	30212151782	0
6176	Mustafa Kemal	AYDOĞDU	mustafa kemal.aydoğdu71@gmail.com	5596915199	1991-06-21	34	t	63565714390	0
6177	Mustafa Kaan	ASİLTÜRK	mustafa kaan.asiltürk76@gmail.com	5437348748	1984-01-23	80	t	58470432214	1
6178	Mustafa	ÖZTAN	mustafa.öztan31@gmail.com	5401686663	1984-12-26	10	t	61425771023	0
6182	Mustafa Afşin	ÇETİNKAYA	mustafa afşin.çetinkaya55@gmail.com	5533252978	1993-04-02	34	t	39090866565	0
6184	Serkan	MULATİ	serkan.mulati66@gmail.com	5391869849	2001-08-23	34	t	55991939878	0
6185	Ahmet Sina	KÜTÜĞ	ahmet sina.kütüğ49@gmail.com	5412575946	2003-02-23	34	t	52846940086	0
6187	Ceren	YÖNTEN	ceren.yönten65@gmail.com	5444220577	1988-11-15	6	f	24160875717	0
6188	Cemalettin	KILINÇ	cemalettin.kılınç62@gmail.com	5552840759	1996-01-19	72	t	93006500504	0
6194	Arif	EKŞİOĞLU	arif.ekşioğlu31@gmail.com	5506847130	1998-08-01	59	t	14813592259	0
6195	Melike	İNCEBACAK	melike.incebacak79@gmail.com	5403978241	1987-01-05	34	f	40126229090	0
6197	Hayrullah	KOCA	hayrullah.koca27@gmail.com	5502867330	1981-12-23	65	t	70617641114	0
6198	Mehmet Akif	ILDIR	mehmet akif.ıldır51@gmail.com	5383614923	1984-06-20	34	t	26918522743	0
6199	Ozan Hakkı	ÇOR	ozan hakkı.çor33@gmail.com	5405607337	1990-04-19	35	t	46536270198	7
6201	Emel	VANLI	emel.vanlı37@gmail.com	5328353162	1995-12-15	63	f	89616477825	0
6205	Yunus Emre	KONDU	yunus emre.kondu14@gmail.com	5431711799	1990-07-01	71	t	17309943651	0
6207	Füsun	İSTANBULLUOĞLU	füsun.istanbulluoğlu26@gmail.com	5524778242	2003-01-13	16	f	25411870082	0
6209	Serpil	HASSAN	serpil.hassan34@gmail.com	5355100707	1996-07-21	39	f	35838034845	0
6212	Ömer Faruk	ŞİRİN	ömer faruk.şirin59@gmail.com	5371338660	2001-09-04	75	t	20798147397	1
6214	Turhan Mert	YAZICIOĞLU	turhan mert.yazıcıoğlu42@gmail.com	5536047864	2000-07-11	34	t	44288775393	0
6216	Tuğçe	ERDOĞMUŞ	tuğçe.erdoğmuş28@gmail.com	5514632375	1999-02-23	34	f	59544564338	0
6219	Serhat	KAPLAN	serhat.kaplan43@gmail.com	5365625164	1981-07-12	13	t	67041678142	0
6220	Fatih	KABA EMNİYETLİ	fatih.kaba emniyetli93@gmail.com	5502640351	2000-12-28	6	t	23840774163	0
6221	Ömer	GÖZÜTOK	ömer.gözütok10@gmail.com	5481439525	1985-03-12	61	t	77307079079	0
6222	Gizem	SABUN	gizem.sabun94@gmail.com	5381522900	2000-12-03	35	f	79023577739	0
6224	Aynur	DÜNDAR	aynur.dündar67@gmail.com	5362760760	1995-10-22	48	f	29374152028	0
6225	Şenol	ÜNLÜ	şenol.ünlü81@gmail.com	5464393465	1986-08-09	41	t	69690405365	0
6226	Korkmaz	ÖZGÜN	korkmaz.özgün53@gmail.com	5425192730	1982-07-07	75	t	63342084790	0
6228	Cüneyt	ARSLAN	cüneyt.arslan88@gmail.com	5381428592	2000-07-16	53	t	52117355226	0
6229	Ebru	ÖNAL	ebru.önal36@gmail.com	5582091538	2002-03-21	46	f	47067671822	0
6231	Zeynep	ZAKARİA FARAH	zeynep.zakaria farah60@gmail.com	5543532205	1998-09-18	34	f	64869227451	0
6232	Mesut	ULU	mesut.ulu80@gmail.com	5474042349	1985-03-26	78	t	35374327726	0
6233	Eren	BALKI	eren.balkı16@gmail.com	5351801996	2001-06-04	34	t	24802839894	0
6235	Gökmen Cengiz	NEGİŞ	gökmen cengiz.negiş40@gmail.com	5515344496	2000-06-16	44	t	46474803846	0
6237	Neşe	PURUTÇUOĞLU	neşe.purutçuoğlu82@gmail.com	5433658960	1988-04-18	61	f	21049295329	0
6239	Yasemin	AIHEMAITIJIANG	yasemin.aıhemaıtıjıang84@gmail.com	5566288347	1995-06-17	7	f	55948434564	0
6240	Ahmet	RUSTAMOV	ahmet.rustamov55@gmail.com	5381073580	2003-02-10	58	t	46007240339	0
6241	Mustafa	TÜTÜNCÜ	mustafa.tütüncü43@gmail.com	5594956844	1995-02-18	34	t	23015924846	0
6243	Aslı	SOYSAL	aslı.soysal19@gmail.com	5573536610	1984-07-19	59	f	84252145879	0
6244	Figen	SKREBO	figen.skrebo81@gmail.com	5598046283	1991-03-26	21	f	98808424065	0
6246	Seyit Ahmet	ÖNER	seyit ahmet.öner56@gmail.com	5554739375	1994-06-14	5	t	19545989387	0
6247	Mehmet Ali	PEÇE	mehmet ali.peçe52@gmail.com	5525527964	1998-07-18	12	t	50068942145	0
6248	Kasım	BOZKURT	kasım.bozkurt38@gmail.com	5406941678	1998-02-18	34	t	69542325928	0
6251	Kübra	KUTLAN	kübra.kutlan12@gmail.com	5474485135	1989-09-16	41	f	65029677892	0
6252	Cansu	BOZYEL	cansu.bozyel26@gmail.com	5587376544	1996-05-23	34	f	50699045693	3
6254	Ela	YILMAZ	ela.yılmaz54@gmail.com	5422030446	1985-04-22	47	f	66654176698	0
6258	Feyzi	ÖZCAN	feyzi.özcan37@gmail.com	5603249532	1997-11-20	47	t	57674414053	0
6259	Ahmet	MALAJ	ahmet.malaj30@gmail.com	5488198636	1981-03-21	6	t	97876892563	0
6260	Can	SAN	can.san40@gmail.com	5353118691	1989-12-13	34	t	34130077318	0
6262	Sinan	KAWEILI	sinan.kaweılı38@gmail.com	5333727521	1980-07-20	23	t	35093651980	0
6267	Burak	TÜRKOĞLU	burak.türkoğlu89@gmail.com	5581583434	1989-02-15	21	t	55203088608	0
6270	Zümrüt	GÜMÜŞ	zümrüt.gümüş22@gmail.com	5441027985	1992-02-03	16	f	27685624081	0
6271	Elif	ÇEVİK	elif.çevik76@gmail.com	5435269753	1990-09-12	16	f	70475066478	0
6272	Erhan	BARIŞ	erhan.barış36@gmail.com	5431676190	1992-10-03	65	t	12847857662	0
6274	Deniz	TURAN	deniz.turan83@gmail.com	5323667583	1981-07-14	35	t	38674304829	0
6275	İhsan Özgür	GÜREDİN	ihsan özgür.güredin33@gmail.com	5327819250	1981-01-02	34	t	82665649808	0
6276	İbrahim Cenk	ZERENGİL	ibrahim cenk.zerengil13@gmail.com	5521635635	2001-04-23	34	t	72943003340	0
6278	Zeliha Günay	KAYA	zeliha günay.kaya31@gmail.com	5519117690	1991-07-07	34	f	80391873364	0
6280	Mutlu	TANRIVERDİ	mutlu.tanrıverdi78@gmail.com	5542509865	1992-05-27	6	t	33951349130	0
6282	Namig	ÇEBİ	namig.çebi72@gmail.com	5383247863	1995-01-14	34	t	10969797362	0
6283	Mehmet	KÜLLÜOĞLU	mehmet.küllüoğlu97@gmail.com	5549121677	1986-05-01	4	t	64441734579	0
6284	Nurcan	BÜLBÜL	nurcan.bülbül17@gmail.com	5518122160	1992-04-27	34	f	77305862728	0
6285	Ender	KADRİ	ender.kadri16@gmail.com	5309167896	1989-04-27	31	t	93323310749	0
6288	Emine	ÇELİK	emine.çelik13@gmail.com	5403778599	2000-11-04	34	f	85389291895	0
6290	Mustafa	KARABİBER	mustafa.karabiber28@gmail.com	5372710583	1989-11-17	72	t	31924835343	0
6294	Kıymet	GENÇ	kıymet.genç99@gmail.com	5571316729	1989-09-21	45	f	93430299711	0
6295	Ayhan	SALTABAŞ	ayhan.saltabaş75@gmail.com	5367441271	1990-07-16	41	t	57059736907	0
6296	Ali	BENLİ	ali.benli49@gmail.com	5398990275	1983-03-23	2	t	63800428448	0
6297	Semih	AĞGÜL	semih.ağgül55@gmail.com	5351536849	1992-06-16	34	t	79822485640	0
6299	Serkan	ÜÇGÜN	serkan.üçgün35@gmail.com	5585979259	1988-06-06	16	t	61903828963	7
6301	Didem	CEBECİ	didem.cebeci11@gmail.com	5529090895	1990-09-06	35	f	95488678493	0
6305	Nihan	YAZICIOĞLU	nihan.yazıcıoğlu22@gmail.com	5326027745	1999-03-05	34	f	38479156016	0
6306	Hacı Latif	ŞEKER	hacı latif.şeker38@gmail.com	5307963922	1997-09-28	81	t	46567414497	0
6307	Yağız	KORKMAZ	yağız.korkmaz29@gmail.com	5404099778	1981-08-19	34	t	50266131381	0
6308	Suat	DOĞUER	suat.doğuer58@gmail.com	5438040655	1981-03-05	34	t	54668044740	0
6309	Gökhan	AKGÜN	gökhan.akgün88@gmail.com	5387269751	2003-06-21	31	t	25439387368	0
6312	İsmail Hakkı	Y	ismail hakkı.y72@gmail.com	5366018901	1999-04-09	61	t	40219889824	0
6313	Mesut	COOTE	mesut.coote57@gmail.com	5301345731	1987-03-28	34	t	28318628465	0
6314	Sezen	OĞUZ	sezen.oğuz83@gmail.com	5567519863	2002-03-20	29	f	38697401965	0
6315	Mahir	ÇANAKÇI	mahir.çanakçı16@gmail.com	5302751203	1997-12-06	6	t	94262773351	0
6317	Özgür	AMET	özgür.amet64@gmail.com	5335648495	1993-05-13	34	t	24384369697	0
6319	Hasan Hilmi	ŞAHBAZ	hasan hilmi.şahbaz34@gmail.com	5344764609	1989-08-21	6	t	59601265138	0
6320	Şule	KÖSEM	şule.kösem20@gmail.com	5398738432	1997-02-11	53	f	98477694289	0
6321	Tevfik	UĞUZLUOĞLU	tevfik.uğuzluoğlu88@gmail.com	5415539326	1980-09-03	7	t	70447437350	0
6324	Özgür	ÖZKAYA	özgür.özkaya71@gmail.com	5381013438	1987-12-21	28	t	59334768746	0
6325	Gulben	GERİTLİ	gulben.geritli98@gmail.com	5452546675	1985-01-24	27	f	42034574465	0
6326	Fatma	ABULIKENMU	fatma.abulıkenmu78@gmail.com	5476809257	1997-03-06	66	f	54798294941	0
6327	Ubeydullah Enes	YILDIZ	ubeydullah enes.yıldız54@gmail.com	5387634236	2003-10-06	41	t	18797364721	0
6328	Sema	YENEN	sema.yenen42@gmail.com	5407227935	1983-11-19	34	f	48823457140	0
6329	Selda	ARIKOĞLU	selda.arıkoğlu10@gmail.com	5384420453	1984-12-09	60	f	42158645119	0
6330	Caner	SHEIKH HAMDO	caner.sheıkh hamdo48@gmail.com	5581916990	1999-04-08	35	t	53717787167	0
6332	Özlem	SUCU	özlem.sucu45@gmail.com	5524462670	1996-08-11	81	f	87654375655	0
6333	Füsun	ŞİMŞEK	füsun.şimşek70@gmail.com	5346081109	1987-09-06	10	f	47802549844	0
6336	İbrahim	SALEH	ibrahim.saleh98@gmail.com	5511766592	1989-10-05	38	t	49400527283	0
6337	Elif Büşra	ÇAM	elif büşra.çam10@gmail.com	5558833106	2000-12-28	34	f	69834258142	0
6338	Ünsal	ÖZCAN	ünsal.özcan72@gmail.com	5568496888	1991-11-26	44	t	73186662622	0
6339	Alper	ERSUBAŞI	alper.ersubaşı99@gmail.com	5377141374	1998-10-21	34	t	16758856132	0
6343	Emre	CORUH	emre.coruh14@gmail.com	5523895647	2003-03-27	34	t	55096669866	0
6344	Bülent Senol	MASHAHRE	bülent senol.mashahre85@gmail.com	5488403603	1980-03-07	39	t	59096534017	0
6345	Mehmet Mert	ACAR	mehmet mert.acar60@gmail.com	5396533654	2001-02-25	34	t	12381224981	0
6346	Abdulkadir	AYDIN	abdulkadir.aydın60@gmail.com	5521503280	1980-03-27	12	t	56593965463	0
6347	Huseyin	FİDAN	huseyin.fidan74@gmail.com	5357395492	1985-02-22	25	t	83857257630	0
6349	Savaş	UYSAL	savaş.uysal27@gmail.com	5553642845	2001-06-19	1	t	47228592817	0
6350	Şükriye	SALTABAŞ	şükriye.saltabaş88@gmail.com	5342956734	1992-07-16	34	f	63614756004	0
6351	Semih	RÜZGAR	semih.rüzgar30@gmail.com	5382287311	1998-03-10	49	t	30128003370	0
6352	Ercüment	KARABİBER	ercüment.karabiber87@gmail.com	5605412295	2003-11-02	34	t	38222123522	0
6353	Tülay	YAYAN	tülay.yayan58@gmail.com	5407486750	1992-01-25	34	f	21366364677	0
6355	Berivan	DOĞAN	berivan.doğan58@gmail.com	5511185963	1996-08-10	5	f	73474490351	0
6357	Eyyüp	TOLEDO	eyyüp.toledo40@gmail.com	5367441276	1990-03-19	6	t	60634721345	0
6358	Selda	AKIN	selda.akın72@gmail.com	5362724685	1989-07-13	60	f	11177272852	0
6359	Özlem	Y	özlem.y40@gmail.com	5516016497	1981-04-21	45	f	68583743553	0
6360	Mehmet Suphi	SEVİLMİŞ	mehmet suphi.sevilmiş28@gmail.com	5596419944	1995-01-12	34	t	44235941585	3
6361	Nadir	TIRPAN	nadir.tırpan58@gmail.com	5552475774	2002-07-12	25	t	44803641479	0
6362	Gizem	YAVAŞBAY	gizem.yavaşbay16@gmail.com	5494510947	2001-11-26	34	f	13308931398	0
6366	Rıdvan	DEMİREL	rıdvan.demirel19@gmail.com	5386812985	1996-02-16	36	t	42213374134	0
6367	Mucella	BİLGİN	mucella.bilgin10@gmail.com	5481388458	1990-01-24	34	f	46834432423	0
6369	Ali	ATAŞ	ali.ataş90@gmail.com	5383618285	2003-04-24	10	t	13470546041	1
6371	Semih	DANGKOMEN	semih.dangkomen15@gmail.com	5501004884	1995-10-07	34	t	63552796190	0
6373	Sefa	ÖZKEÇECİ	sefa.özkeçeci41@gmail.com	5402964351	1999-11-18	61	t	59695517592	0
6374	Ramazan	OPKPOP	ramazan.opkpop45@gmail.com	5481513342	1987-12-19	68	t	23756480766	2
6375	Nedret	ÇAKMAK	nedret.çakmak41@gmail.com	5423793834	1983-11-18	34	f	81493495891	0
6376	Ali Osman	DEMİREL	ali osman.demirel93@gmail.com	5574875673	1988-05-10	45	t	61215744601	0
6377	Yücel	ERDOĞAN	yücel.erdoğan49@gmail.com	5416265302	1982-12-23	34	t	33324889412	0
6378	Gökçe	DURAN	gökçe.duran95@gmail.com	5355875379	2003-01-18	34	f	99590373449	0
6379	Semra	KANDEMİR	semra.kandemir91@gmail.com	5397696557	1991-05-07	34	f	54156994426	0
6380	Sanberk	ADAN	sanberk.adan21@gmail.com	5524906287	1997-01-28	17	t	96114405908	0
6382	Sevgi	EREN	sevgi.eren59@gmail.com	5471786476	1990-04-11	34	f	25688709491	0
6383	İbrahim	VARHAN	ibrahim.varhan22@gmail.com	5345430104	1987-01-06	56	t	71417074114	0
6384	Buse Ecem	SELVİ	buse ecem.selvi43@gmail.com	5581801251	1998-11-19	34	f	54950974783	1
6385	Demet	ALP	demet.alp98@gmail.com	5486226889	1996-04-26	24	f	93326798102	0
6386	Oguz Kagan	ÜNAL	oguz kagan.ünal49@gmail.com	5498343236	1982-09-02	44	t	88612322814	0
6388	Nida	AVCIOĞLU	nida.avcıoğlu61@gmail.com	5491211454	1994-11-28	34	f	12690314819	0
6389	Seher Büşra	ARIKAN	seher büşra.arıkan14@gmail.com	5363567414	1988-09-28	60	f	87693358193	0
6390	Mesut	KIRAT	mesut.kırat18@gmail.com	5366005830	1987-08-05	44	t	13299240757	0
6391	Merve	ELBAŞI	merve.elbaşı87@gmail.com	5554867647	1986-07-14	16	f	53568898400	0
6393	Okan	Y	okan.y95@gmail.com	5323210857	2001-01-09	61	t	44975256768	0
6395	Gızem	ALTUNBOZAR	gızem.altunbozar16@gmail.com	5362647717	2001-12-07	38	f	31949471957	0
6396	Ömer	ÇELİK	ömer.çelik26@gmail.com	5515941367	1982-07-22	58	t	49477697824	0
6397	Neslihan	KODRA	neslihan.kodra20@gmail.com	5483743216	2001-09-05	1	f	20278441595	0
6398	Ömer	GÜNDOĞAN	ömer.gündoğan57@gmail.com	5344195968	1995-11-20	34	t	83316979382	0
6399	Selcan	AHEMAITI	selcan.ahemaıtı27@gmail.com	5579154818	1989-03-06	34	f	81880995020	0
6400	Zeynep	ERÖZALP	zeynep.erözalp10@gmail.com	5467919496	1996-07-06	44	f	89197877473	0
6403	Hülya	KARCI	hülya.karcı62@gmail.com	5302877580	1992-02-17	25	f	43846432073	0
6406	Baturhan	GÜNAYDIN	baturhan.günaydın27@gmail.com	5501301172	1983-04-27	44	t	97279679083	7
6410	Zehra	GÖNCÜOĞLU	zehra.göncüoğlu49@gmail.com	5349151318	1995-06-01	34	f	85467053517	0
6411	Emine	ARMAĞAN	emine.armağan22@gmail.com	5608082791	2000-08-16	52	f	81854627344	0
6412	Ayşe Burcu	ERDOĞAN	ayşe burcu.erdoğan42@gmail.com	5461920844	1997-04-08	9	f	98400540674	0
6413	Hatice	ABDULLAEV	hatice.abdullaev62@gmail.com	5431663347	1990-04-14	33	f	68394774036	0
6414	Günay	BAŞAR	günay.başar11@gmail.com	5452766345	1980-04-26	34	f	34269754101	0
6415	İlker	ABA	ilker.aba94@gmail.com	5311375554	1983-01-10	6	t	78316860238	0
6416	Mustafa	DEMİR	mustafa.demir66@gmail.com	5307246424	1998-10-17	31	t	67901907865	0
6418	Barış Can	Y	barış can.y50@gmail.com	5496412473	1980-11-10	34	t	47098368287	0
6419	Yağız Can	BEKÇİ	yağız can.bekçi13@gmail.com	5431816710	1984-05-21	34	t	45996940671	0
6420	.murat	YENİKAYA	.murat.yenikaya 56@gmail.com	5561115153	1988-07-17	34	f	37726983411	0
6422	Mert	YILMAZ	mert.yılmaz27@gmail.com	5314844500	1985-12-05	1	t	80964011106	0
6423	Vedat Gökhan	ILMAN	vedat gökhan.ılman99@gmail.com	5582627503	1994-10-13	34	t	14565223797	0
6424	Filiz	DENİZ	filiz.deniz39@gmail.com	5444616511	1984-07-23	16	f	34999297042	0
6425	Murat	KILIÇ	murat.kılıç49@gmail.com	5307604297	1999-10-27	34	t	74667588184	0
6427	Sinem	SADIR	sinem.sadır10@gmail.com	5555319946	1999-06-19	34	f	75288894025	0
6429	Arif Anıl	KORKMAZ	arif anıl.korkmaz58@gmail.com	5404162607	1998-07-06	34	t	67001813587	0
6430	Ahmet	ELMAS (ÖZFİDAN)	ahmet.elmas (özfidan)21@gmail.com	5538849205	1996-07-04	34	t	52014721159	0
6431	Umut	ALTUN	umut.altun52@gmail.com	5522240770	1986-06-26	35	t	44833132810	0
6432	Selen	TURAN	selen.turan60@gmail.com	5486308917	1991-06-03	38	f	82461500465	0
6433	Sinem	ÇAKMAK	sinem.çakmak11@gmail.com	5602025205	1984-01-19	34	f	32435023953	7
6434	Pınar	BAŞKAN	pınar.başkan22@gmail.com	5532113372	1994-11-19	34	f	22771185047	0
6435	Gökhan	ÖZTÜRK	gökhan.öztürk44@gmail.com	5336555832	1990-04-05	19	t	69739926265	0
6437	Ecem	ABUGHANAM	ecem.abughanam80@gmail.com	5366679481	1990-08-04	16	f	87565443915	0
6439	Halil	ABULAITI	halil.abulaıtı21@gmail.com	5377112157	2001-06-23	46	t	69445313844	0
6440	Mustafa	ÇULHALIK	mustafa.çulhalık47@gmail.com	5474208771	1996-09-19	75	t	66377907095	0
6441	Muhammed Recai	Y	muhammed recai.y63@gmail.com	5601365255	1981-08-28	67	t	30652752551	0
6442	İbrahim	AKDAĞ	ibrahim.akdağ63@gmail.com	5434166211	1994-11-28	28	t	45013881443	0
6443	Hatice Kübra	KARAHAN	hatice kübra.karahan40@gmail.com	5461880674	1998-02-12	55	f	76072821044	0
6445	Ahmet	ER	ahmet.er16@gmail.com	5407075639	1983-11-13	16	t	44401507944	0
6447	Can	YILMAZ	can.yılmaz70@gmail.com	5316311367	1996-07-21	34	t	62314897648	0
6448	Seval	ÇAĞLAK	seval.çağlak30@gmail.com	5531408330	1993-09-03	63	f	39070786271	0
6449	Narot	SILVERSTEIN	narot.sılversteın82@gmail.com	5428953941	1980-05-09	34	f	82539277508	0
6450	Zeynep Mine	ATALAY	zeynep mine.atalay33@gmail.com	5487652504	1980-12-07	34	f	74894957583	0
6452	Meryem	AKTAŞ	meryem.aktaş18@gmail.com	5353581130	1984-03-26	25	f	71167744048	0
6453	İlkay	ANWAER	ilkay.anwaer37@gmail.com	5416385809	1980-06-17	34	t	21619575807	0
6454	Burak	KARAYEL	burak.karayel54@gmail.com	5371456513	2002-01-03	34	t	34586630649	0
6455	Emin	GURUŞCU	emin.guruşcu68@gmail.com	5417348942	2003-03-02	16	t	33866952392	0
6456	Erdinç	KİLERCİ	erdinç.kilerci47@gmail.com	5431440150	1987-06-27	26	t	97368478789	0
6457	Altay	MUTLU	altay.mutlu10@gmail.com	5606563757	1980-01-15	67	t	54162468366	0
6459	Ege Yiğit	ŞENTÜRK	ege yiğit.şentürk86@gmail.com	5478959503	1984-10-14	77	t	37360097200	0
6460	Yavuz Selim	TAĞTEKİN	yavuz selim.tağtekin92@gmail.com	5371797370	2003-07-23	34	t	54980020905	0
6461	Burak	AYDEMİR	burak.aydemir85@gmail.com	5565749200	1986-06-22	41	t	88334664299	0
6463	Enes	Y	enes.y17@gmail.com	5408086931	1984-12-15	34	t	22223374750	0
6465	Dilek	KARATİMUR ÇUTSAY	dilek.karatimur çutsay34@gmail.com	5334947223	1997-03-27	58	f	25725072886	0
6466	Coşkun	YILMAZ	coşkun.yılmaz60@gmail.com	5543349906	1986-08-02	34	t	52173892196	0
6468	Ahmet	ÇAKIR	ahmet.çakır77@gmail.com	5586170771	1990-03-09	21	t	91717752152	0
6469	Tarık	HOUSSEİN AHMED	tarık.houssein ahmed48@gmail.com	5365736305	1993-06-27	75	t	35612338568	0
6470	Zafer Ece	DİNÇOFLAZ	zafer ece.dinçoflaz96@gmail.com	5346344617	2000-02-10	22	f	23656810725	0
6471	Kübra	USLUCAN	kübra.uslucan40@gmail.com	5477928782	1988-07-10	34	f	63312798289	0
6472	Merve	ÇATALKAYA	merve.çatalkaya53@gmail.com	5441238742	1981-07-02	6	f	44848393550	0
6473	Büşra	AYDIN	büşra.aydın49@gmail.com	5416143845	1982-01-14	34	f	73139154795	0
6474	Fatma Bihter	İLALAN	fatma bihter.ilalan34@gmail.com	5347769578	2002-07-20	34	f	20447853366	2
6475	Fatma	ARICAN	fatma.arıcan23@gmail.com	5571586351	1989-08-15	35	f	24674851319	0
6476	Feride	KARAKAYA	feride.karakaya19@gmail.com	5504364383	1996-08-14	16	f	43660876806	0
6478	Sümeyya	GÖKSU	sümeyya.göksu31@gmail.com	5578914879	1994-05-16	44	f	91244986906	0
6479	Seda Gülben	ABDUL-AZIZ	seda gülben.abdul-azız41@gmail.com	5501263892	2002-03-02	39	f	22606093009	0
6481	Ali	SİNANOĞLU	ali.sinanoğlu70@gmail.com	5328629376	1990-07-14	7	t	73751677586	0
6482	Semih	KIRTAY	semih.kırtay21@gmail.com	5512255416	2000-01-26	41	t	64969811020	0
6483	Ecem Hazal	ÖZDEMİR	ecem hazal.özdemir18@gmail.com	5563511306	1983-11-25	34	f	90807999637	5
6484	Hümeyra	KAYTAZ	hümeyra.kaytaz48@gmail.com	5423787841	1994-11-13	78	f	41476486416	0
6485	Murat	TURHAN	murat.turhan27@gmail.com	5588088958	2002-08-10	35	t	41747470383	0
6487	Anıl	AYIMUGULI	anıl.ayımugulı66@gmail.com	5596984762	1987-02-09	34	f	87026883093	0
6488	Murat	YALÇIN	murat.yalçın58@gmail.com	5553583573	1999-02-25	34	t	51016862259	0
6489	Murat	CEYLAN	murat.ceylan42@gmail.com	5445381124	2003-02-22	34	t	15484779449	0
6490	Zafer	KAVAK	zafer.kavak19@gmail.com	5372025602	1993-02-08	67	t	78292334842	0
6493	Meryem	MUKTAR MOHAMED	meryem.muktar mohamed49@gmail.com	5452341931	1994-04-13	55	f	45679217434	0
6494	Hasan	YILMAZ	hasan.yılmaz77@gmail.com	5595218333	1986-12-19	10	t	74763968851	0
6495	Aydan	ÇAKARLI	aydan.çakarlı99@gmail.com	5372576117	1992-06-04	67	f	12149340361	0
6498	Hacıahmet	KARACAGÜN	hacıahmet.karacagün38@gmail.com	5364265544	1980-01-15	38	t	48535474737	0
6499	Efil Bengisu	Dilipak	efil bengisu.dilipak77@gmail.com	5401866403	1995-06-10	34	f	97578213612	0
6500	Funda	ARSLAN	funda.arslan47@gmail.com	5593771359	1980-01-25	67	f	90188870709	0
6502	Hazal	AKSEKİLİ	hazal.aksekili91@gmail.com	5487232553	1983-08-03	34	f	57457253835	0
6503	Nureddin	ERDOĞAN	nureddin.erdoğan64@gmail.com	5595719603	1995-12-15	65	t	13312498462	0
6505	Ömer	IŞIK	ömer.ışık50@gmail.com	5317773385	1999-10-18	34	t	31027548065	0
6507	Yavuz	SPAHİA	yavuz.spahia61@gmail.com	5483215510	1981-10-11	34	t	24927056102	1
6508	Mehmet	FATHI AMAGHANI	mehmet.fathı amaghanı74@gmail.com	5458196843	1997-05-23	68	t	69129861820	0
6510	Seray	ÖRNEK	seray.örnek46@gmail.com	5564166647	1982-11-18	34	f	71718185610	0
6511	Özgü	İNCELİ	özgü.inceli47@gmail.com	5555010405	2000-12-01	34	t	40181610398	0
6513	Fatih	SAYGINER	fatih.saygıner67@gmail.com	5363833329	1988-03-26	26	t	19580417262	0
6514	Muhammed Yunus	ÇOKAY	muhammed yunus.çokay84@gmail.com	5387961609	1997-01-14	34	f	50752381289	1
6516	Özgür	ÇEVİK	özgür.çevik12@gmail.com	5374731720	1991-05-02	34	t	75906153588	0
6517	Burcu	toraman	burcu.toraman33@gmail.com	5364770647	1987-03-01	35	f	99442278729	0
6518	Süheyl	DİRİCAN	süheyl.dirican87@gmail.com	5312649363	1991-07-05	31	t	98673438065	0
6519	Murat	KARAHAN	murat.karahan18@gmail.com	5423954449	2003-01-16	34	t	33141788423	0
6520	Sibel	ÇALIŞKAN	sibel.çalışkan20@gmail.com	5567957346	1989-05-11	9	f	35652035253	0
6521	Reyhan	İLTER	reyhan.ilter83@gmail.com	5322900212	1998-08-09	34	f	64023860876	0
6523	Ethem	GENÇ	ethem.genç13@gmail.com	5551485343	1999-04-19	63	t	78848181980	0
6525	Nuran	DAHMAN	nuran.dahman84@gmail.com	5491816157	1999-02-17	60	f	88999647446	0
6527	Özlem	ERTUĞRUL ÖZTÜRK	özlem.ertuğrul öztürk39@gmail.com	5374929533	1991-10-03	58	f	52770921770	0
6529	Yasin	CELBİŞ	yasin.celbiş16@gmail.com	5354068813	1982-07-14	57	t	14157338295	0
6530	Ercan	GİRAY	ercan.giray46@gmail.com	5444368533	1995-08-09	44	t	30089662941	0
6531	Hacı Yusuf	GÜLEÇ	hacı yusuf.güleç93@gmail.com	5456363404	1980-02-04	38	t	64533885513	0
6532	Burcu	ÇELİK	burcu.çelik22@gmail.com	5536376944	2002-03-25	34	f	56612901128	0
6533	Mine	UYSAL	mine.uysal21@gmail.com	5381536406	1981-05-04	34	f	13873494113	0
6534	Ahmet İlter	Y	ahmet ilter.y46@gmail.com	5552317277	1985-03-25	23	t	40723775988	0
6535	Murat	ŞENDİL	murat.şendil87@gmail.com	5421953618	1980-10-05	34	t	84051904252	0
6536	Burcu	ERSUN	burcu.ersun17@gmail.com	5545084808	2003-04-10	6	f	67650633008	1
6537	Kevser Fatma	YETGİN	kevser fatma.yetgin48@gmail.com	5502261585	1991-09-23	7	f	42021384981	0
6538	Mete	URAL	mete.ural91@gmail.com	5353298812	1996-02-25	32	t	59061914636	0
6541	Azize	KARAGÜL	azize.karagül20@gmail.com	5334905709	2001-10-13	34	f	15432424305	0
6542	İlayda	BAYLAN	ilayda.baylan68@gmail.com	5411416840	1981-02-27	34	f	86054590958	0
6543	Yunus Emre	Elbaşı	yunus emre.elbaşı60@gmail.com	5578766832	1994-05-19	55	t	48201180826	0
6544	Kasım Uğur	ARSLAN	kasım uğur.arslan33@gmail.com	5515931176	2001-05-15	44	t	32174789983	0
6545	Ayşe	MAIDINA	ayşe.maıdına29@gmail.com	5396032645	2001-01-25	34	f	29760699454	0
6546	Senem	KAYGUSUZ	senem.kaygusuz39@gmail.com	5315504478	1993-05-01	6	f	59552281542	0
6547	Halil İbrahim	YILDIZ	halil ibrahim.yıldız33@gmail.com	5333876683	1982-05-27	23	t	66796412298	0
6548	Ali	KHALVASHİ	ali.khalvashi51@gmail.com	5346155838	1993-07-01	27	t	22927670525	0
6549	Ömer	OMER	ömer.omer97@gmail.com	5547734623	1998-12-24	35	t	81247061409	0
6551	Hasan Melih	KAHVECİ	hasan melih.kahveci45@gmail.com	5328320308	1989-09-03	34	t	54458521850	0
6552	Başak	MERT	başak.mert61@gmail.com	5521375135	2003-01-18	34	f	29412581498	0
6555	Hakan	NAYMAN	hakan.nayman14@gmail.com	5457526357	1991-12-21	69	t	63250113869	0
6556	Mustafa	ATEŞ	mustafa.ateş36@gmail.com	5364893558	1983-01-20	34	t	39445062361	0
6557	Tekin	ÇOLAK	tekin.çolak94@gmail.com	5574317155	1983-08-02	36	t	35525921986	0
6558	Yurdagül	Y	yurdagül.y16@gmail.com	5347752623	1995-11-14	34	f	21103150679	0
6559	Mahmut Emin	KAPLAN	mahmut emin.kaplan82@gmail.com	5594648990	1984-09-09	5	t	96826536623	0
6560	Sevgi	AYTAŞ	sevgi.aytaş61@gmail.com	5303694852	1990-09-18	25	f	58703063826	0
6561	İsmail İlkay	DANIŞ	ismail ilkay.danış98@gmail.com	5587187238	1988-06-08	34	t	72636254741	0
6562	Furkan	MOHAMED	furkan.mohamed14@gmail.com	5581477774	1985-06-26	34	t	90281705482	0
6563	Merve zde	KARACA	merve zde.karaca79@gmail.com	5561711781	2003-09-21	6	f	90047874243	0
6564	Raziye	GÜNAY	raziye.günay88@gmail.com	5592601590	2003-10-08	7	f	21531024590	0
6565	Mehmet	MİRTO	mehmet.mirto70@gmail.com	5418642717	1998-12-08	27	t	31908770841	3
6566	Ali Levent	ABUDUXUKEER	ali levent.abuduxukeer95@gmail.com	5353826682	1993-03-18	34	t	28280962370	0
6567	Onur	SINMAZ	onur.sınmaz52@gmail.com	5432978255	1999-01-18	34	t	91473538024	0
6569	İsmail	DOUGHANGI	ismail.doughangı89@gmail.com	5533099286	1992-11-11	67	t	79621206946	0
6570	Ayşenur	TANELİ	ayşenur.taneli72@gmail.com	5301769326	1993-10-24	34	f	50218050784	0
6571	Burcu	GÜNDOĞAN	burcu.gündoğan17@gmail.com	5407471211	1993-02-28	34	f	28220328296	0
6572	Eda	GÜL	eda.gül65@gmail.com	5591968255	2001-11-17	34	f	87745381014	0
6574	Taner	CENGİZ	taner.cengiz58@gmail.com	5563338255	1987-05-07	34	t	45289309517	0
6575	Beşir	AKSOY	beşir.aksoy44@gmail.com	5574165564	1987-05-19	56	t	11361027345	0
6577	Selçuk	ÇALIŞKAN	selçuk.çalışkan53@gmail.com	5361940245	1983-03-20	1	t	41575502436	0
6578	Baran	ASCENSIO	baran.ascensıo22@gmail.com	5421105890	1998-01-15	6	t	33406055430	0
6579	Cevat Evren	ERGÜN	cevat evren.ergün86@gmail.com	5375513914	1989-05-12	34	t	48615352670	0
6581	Ceyda	PEKAK	ceyda.pekak92@gmail.com	5512546184	1989-06-12	22	f	86138469002	0
6582	Cansu	ÖZER	cansu.özer29@gmail.com	5493352292	1989-07-15	14	f	81136180583	0
6583	Ceren	KASUTO	ceren.kasuto17@gmail.com	5422976441	1988-11-08	6	f	75544219634	0
6584	Zeynep Meltem	VALISHOV	zeynep meltem.valıshov95@gmail.com	5371724707	2002-08-20	16	f	26170828328	0
6585	Emre	DABBAGH	emre.dabbagh31@gmail.com	5544234945	1993-01-10	34	t	95530970258	0
6586	Melek	ZEYLAN	melek.zeylan65@gmail.com	5411646340	1993-08-18	37	f	35993476596	0
6587	Tunay	ŞAHİN	tunay.şahin83@gmail.com	5312211303	2000-03-03	34	t	90472666797	0
6589	GÖZDE	KANDEMİR	gözde.kandemir94@gmail.com	5579066145	1983-01-14	34	f	27577637155	0
6590	Ezgi	ABUDUREXITI	ezgi.abudurexıtı91@gmail.com	5581012528	1981-05-03	34	f	79205093278	0
6592	Cevdet	ARICAK	cevdet.arıcak65@gmail.com	5585645762	1980-08-15	48	t	48011804826	0
6593	Fethiye Ceren	ALAYOĞLU	fethiye ceren.alayoğlu79@gmail.com	5494423260	1997-04-24	34	f	93330672207	0
6594	Sevim	ASKEROVA	sevim.askerova58@gmail.com	5541743781	1989-07-26	47	f	71531264298	0
6597	Ali Rıza	YÜCELİK	ali rıza.yücelik58@gmail.com	5473812827	1996-09-22	46	t	70304773469	0
6598	Alptuğ	KUNAKBAYEVA	alptuğ.kunakbayeva98@gmail.com	5353632976	1985-08-03	5	t	98802274966	0
6600	Burak	Y	burak.y58@gmail.com	5402137619	1991-02-20	10	t	13042525503	0
6601	Seher	QOZAT	seher.qozat12@gmail.com	5394226165	1991-11-11	34	f	29320616902	0
6602	Emre	CENGİZ	emre.cengiz99@gmail.com	5373139656	2003-03-11	34	t	34892410920	0
6604	Sevinç	ÇAM	sevinç.çam26@gmail.com	5404188822	1981-07-04	25	f	50407155710	0
6606	Aslı	RUSHEVİKJ	aslı.rushevikj98@gmail.com	5589194484	1984-10-11	71	f	37613169220	0
6607	Cengiz Barış	RAYMOND	cengiz barış.raymond29@gmail.com	5586473643	2002-01-25	30	t	69078448901	0
6608	Caner	KUZU	caner.kuzu40@gmail.com	5331760117	1994-03-05	31	t	20961880152	0
6609	Duygu	BOZKQPLAN	duygu.bozkqplan98@gmail.com	5357813165	1998-03-04	34	f	69531546221	0
6610	Cansu	ATEŞSÖNMEZ	cansu.ateşsönmez84@gmail.com	5576674899	1991-09-09	35	f	22250438936	0
6611	Fatma Mediha	OBALI	fatma mediha.obalı72@gmail.com	5382126829	1989-09-12	43	f	37675610851	0
6612	Anı	İNAL	anı.inal17@gmail.com	5454078703	1996-09-22	55	f	21123015131	0
6613	İbrahim	DİNÇSOY	ibrahim.dinçsoy37@gmail.com	5437881313	2003-10-09	16	t	24174740185	0
6614	Gizem	SAĞLAM	gizem.sağlam36@gmail.com	5416184629	1981-10-05	6	f	21657108188	0
6615	Ahmet Fevzi	KOŞAN	ahmet fevzi.koşan68@gmail.com	5443480302	1984-10-23	6	t	34792199323	0
6616	İlknur	UZUN	ilknur.uzun41@gmail.com	5425416134	2001-07-20	55	f	80902153508	0
6617	Seda	ÇİFTÇİ	seda.çiftçi32@gmail.com	5308664387	1983-06-02	28	f	58695382554	0
6618	Nihan	NIJIATI	nihan.nıjıatı69@gmail.com	5423088593	2003-12-20	16	f	38948678326	0
6619	Osman	Y	osman.y63@gmail.com	5576719648	1998-04-16	42	t	18090690145	0
6622	Güneş	ERYILMAZ	güneş.eryılmaz42@gmail.com	5467816854	1989-10-16	35	f	30442435015	0
6623	Nil	NAYLOR	nil.naylor21@gmail.com	5457538486	2002-08-04	34	f	48026307100	0
6624	Yıldız	ALKIŞ	yıldız.alkış60@gmail.com	5561282780	2002-09-10	34	f	83120586745	0
6625	Elif	AYDIN	elif.aydın82@gmail.com	5333688573	1987-05-17	59	f	25355646281	0
6626	Erbil	ÖNGÜDÜ	erbil.öngüdü98@gmail.com	5494001629	1992-03-19	34	t	97170799938	0
6627	İlknur	ÇAKMAKÇI	ilknur.çakmakçı13@gmail.com	5581171645	1999-03-09	34	f	38269705658	0
6628	İbrahim Sefa	ATAYUFUK	ibrahim sefa.atayufuk39@gmail.com	5311927423	1988-02-09	34	t	54980441440	0
6629	Mehmet	ONUR	mehmet.onur24@gmail.com	5402373785	1990-05-25	23	t	88575923863	0
6631	Yavuz	Y	yavuz.y45@gmail.com	5581344717	1982-05-02	28	t	98593270557	0
6632	Ömer	TUTAR	ömer.tutar35@gmail.com	5461078104	1995-11-04	34	t	91791482137	0
6633	İrem	KÖMÜRCÜ ÇAĞLAR	irem.kömürcü çağlar48@gmail.com	5512362504	2001-05-25	34	f	16566264311	0
6636	Ergin	BAYRAKTAR	ergin.bayraktar54@gmail.com	5536733954	1996-10-18	34	t	38811862911	0
6637	Ahmet Hakan	TÜRKER	ahmet hakan.türker92@gmail.com	5361314857	1982-08-24	34	t	81923124750	0
6639	Elçin	ÖDEMİŞ	elçin.ödemiş28@gmail.com	5403634826	1993-04-22	40	f	60987560619	0
6641	Nesibe	ÖZÇELİK	nesibe.özçelik66@gmail.com	5391284875	1986-07-25	38	f	59583522399	0
6642	Mehmet Resat	DİRİKOLU	mehmet resat.dirikolu94@gmail.com	5405351212	1996-02-06	63	t	42586893293	7
6643	Ceyhun	ÜNER	ceyhun.üner17@gmail.com	5508830344	1993-05-21	10	t	95619591126	0
6644	Raif Nabi	DEMİREL	raif nabi.demirel91@gmail.com	5452457593	1995-07-14	61	t	75344952831	0
6645	Halil İbrahim	YAKINDA	halil ibrahim.yakında11@gmail.com	5386937536	2001-06-26	1	t	62876224301	0
6646	Ömer	ERTÜRK	ömer.ertürk11@gmail.com	5596767422	1996-08-06	6	t	25819573450	0
6647	Gürel	BAYBURTLU	gürel.bayburtlu60@gmail.com	5336901307	1998-08-08	22	t	13868070649	0
6648	Furkan	BAŞKURT	furkan.başkurt34@gmail.com	5541991281	1999-07-25	34	t	59635157282	1
6650	Mete	TEZEL	mete.tezel77@gmail.com	5374783619	2001-03-23	6	t	26110253953	0
6652	Şengül	ERDİM	şengül.erdim90@gmail.com	5385799213	2003-04-20	59	f	87321562208	0
6653	Ahmet Samet	ADIGÜZEL	ahmet samet.adıgüzel58@gmail.com	5594397592	1985-08-27	26	t	13487617715	0
6657	Nihan	GÖRÜM	nihan.görüm39@gmail.com	5321701748	1994-05-01	34	f	52012619425	0
6658	Ömer Ali	HAJİZADE	ömer ali.hajizade59@gmail.com	5577060880	1995-10-27	13	t	72596789617	0
6659	Ezgi	ÜNLÜ	ezgi.ünlü13@gmail.com	5566825544	1986-09-14	44	f	35429650573	0
6661	Türkan Leman	KILIÇ	türkan leman.kılıç30@gmail.com	5301605882	1994-06-13	34	f	38777950201	0
6662	Açelya	GÖGEBAKMAZ	açelya.gögebakmaz76@gmail.com	5388015866	1988-05-25	67	f	87325583251	1
6663	Şirin	ÖZKAN	şirin.özkan95@gmail.com	5585045946	1995-01-20	16	f	12711797438	0
6664	Tolga	DUMANTEPE	tolga.dumantepe87@gmail.com	5474229821	1987-07-09	40	t	66578742599	0
6665	Mehmet Fatih	ÖZTOPRAK	mehmet fatih.öztoprak58@gmail.com	5362535414	1989-04-26	13	t	47659157392	0
6666	Berk	İZÇINAR	berk.izçınar30@gmail.com	5325685958	1993-05-25	34	t	16642241194	0
6667	Pelin	ABUHMAİD	pelin.abuhmaid14@gmail.com	5541093701	1982-01-04	33	f	26379180810	0
6668	İclal	DORUK	iclal.doruk81@gmail.com	5485828393	2002-07-18	46	f	41496011100	0
6669	Mehmet Arda	MERDAN	mehmet arda.merdan59@gmail.com	5344066685	1981-09-20	34	t	51346211167	0
6670	Ebru	YİĞİT	ebru.yiğit54@gmail.com	5608321510	2000-06-14	75	f	13489604631	0
6671	Erman	ERGÜN	erman.ergün76@gmail.com	5424354277	1994-01-28	7	t	50066063173	0
6672	Erhan	İBRİŞİM	erhan.ibrişim37@gmail.com	5556066354	2002-01-03	36	t	90759932249	0
6673	Sumeyye Dilruba Nur	TUNA	sumeyye dilruba nur.tuna41@gmail.com	5581649561	1997-09-26	34	f	86571019540	0
6674	Ömer	ATAR	ömer.atar35@gmail.com	5464270131	1997-09-15	34	t	53339348864	7
6675	Esra	KALELİOĞLU	esra.kalelioğlu61@gmail.com	5472231411	1986-08-25	34	f	29944992633	0
6676	Ceren	GÜLER	ceren.güler91@gmail.com	5446438410	1988-02-03	31	f	22404597610	0
6678	Cengiz	GÜRDAL	cengiz.gürdal62@gmail.com	5582664161	2000-05-05	24	t	99446300372	0
6679	Hanife	KAHVECİ	hanife.kahveci96@gmail.com	5306450679	1993-01-08	26	f	82450774359	0
6681	Ali	PEKTAŞ	ali.pektaş39@gmail.com	5608560126	1995-12-28	2	t	75822583435	3
6682	Suphi Sertaç	ERKÖSE	suphi sertaç.erköse69@gmail.com	5332913313	1981-03-09	74	t	41693714523	0
6684	Mesut	ÇİÇEK	mesut.çiçek81@gmail.com	5537705117	2001-11-24	24	t	32097138742	0
6685	Kübra	AKBULUT	kübra.akbulut10@gmail.com	5355357379	1982-07-16	34	f	47117075350	7
6686	TELAT GÜL	MEHAMMED	telat gül.mehammed83@gmail.com	5522394803	1985-06-01	34	f	32853851175	7
6687	YÜCEL	DENİZ	yücel.deniz55@gmail.com	5561406889	1985-07-22	34	t	84020014650	1
6688	AYŞE	SEYİDOĞLU	ayşe.seyidoğlu45@gmail.com	5434399272	1982-12-03	34	f	91019875751	1
6689	OYA	KAYA	oya.kaya41@gmail.com	5436173608	1995-05-13	34	f	20441782972	7
6690	MURAT	ARICAN	murat.arıcan64@gmail.com	5433329299	1993-04-05	69	t	19991779828	7
6691	HAKAN	Güneş	hakan.güneş87@gmail.com	5413474787	1991-09-02	34	t	11039360406	1
6692	OLCAY	IAMN	olcay.ıamn21@gmail.com	5543294632	1994-03-17	23	t	29597255208	1
6693	OKAN	ÇELİKKAN	okan.çelikkan29@gmail.com	5394163201	1980-08-07	22	t	54658041224	7
6694	BURA SABİHA	TROST	bura sabiha.trost73@gmail.com	5387621608	1987-07-11	34	f	13670443787	1
6695	FERNAZ	TAHBAZFAR	fernaz.tahbazfar61@gmail.com	5487510481	2002-01-26	38	f	58112532847	1
6696	AYŞEM GÜLİN	EKİZ	ayşem gülin.ekiz66@gmail.com	5608787566	2002-04-28	34	f	32952338226	8
6697	MİNE	SET	mine.set62@gmail.com	5586880408	1995-08-05	34	f	56829169206	1
6698	MUZAFFER	IBRAHIM	muzaffer.ıbrahım51@gmail.com	5378352804	1998-04-12	58	t	61869126515	2
6699	ARZU	ÖZGÜLŞEN	arzu.özgülşen66@gmail.com	5446165263	1996-02-15	32	f	90479356594	2
6700	GÖZDE EDA	İSLAMOĞLU	gözde eda.islamoğlu75@gmail.com	5336166771	1982-01-26	34	f	20248542441	1
6701	AYLİN	IŞTIN	aylin.ıştın58@gmail.com	5331310991	1995-06-01	81	f	29415240736	7
6702	LEYLA	CEYLAN	leyla.ceylan84@gmail.com	5508299382	1997-12-06	58	f	23859421902	7
6703	YAVUZ	ŞAHİN	yavuz.şahin67@gmail.com	5556893418	1984-08-21	34	t	42142354865	5
6704	BEDİA	ABDULKADİR ALİ	bedia.abdulkadir ali47@gmail.com	5337760511	1994-10-02	31	f	91606322859	2
6705	ÖZGÜL	HUSSEİN	özgül.hussein27@gmail.com	5564521900	1993-03-17	41	f	68798774100	1
6706	AHMET TURAN	İNCE	ahmet turan.ince87@gmail.com	5434221916	1983-10-15	58	t	19241433357	1
6707	GÜRKUT	KURT	gürkut.kurt95@gmail.com	5313522134	2002-06-07	16	t	13583714205	1
6708	IRMAK	ERDEM	ırmak.erdem90@gmail.com	5408119439	1998-07-01	25	f	43789649635	0
6709	PETEK	BİRDEN	petek.birden70@gmail.com	5423320383	1981-01-08	16	f	66827938812	7
6710	MUSTAFA ERCAN	CANOĞLU	mustafa ercan.canoğlu92@gmail.com	5321454566	2003-06-25	34	t	78306824705	7
6711	HALİL MURAT	AHMAD	halil murat.ahmad57@gmail.com	5397326565	1998-08-09	34	t	90811544444	1
6712	FULYA	ATIL	fulya.atıl23@gmail.com	5392396171	2000-01-15	34	f	70668526144	1
6713	MUHAMMET	KÜÇÜK	muhammet.küçük49@gmail.com	5425111562	1982-11-09	34	t	64212963478	1
6714	HÜSEYİN	SIPCIKOĞLU	hüseyin.sıpcıkoğlu57@gmail.com	5584868287	1991-08-21	34	t	88915683507	7
6715	NEŞE	EREN	neşe.eren45@gmail.com	5579028387	2003-02-08	6	f	27800627385	1
6716	SELMA	KULKUL	selma.kulkul55@gmail.com	5363347173	2001-11-21	6	f	50571721314	1
6717	FUAT	ŞİMŞEK	fuat.şimşek65@gmail.com	5347567275	1986-05-06	6	t	72764994404	1
6718	MUSTAFA	TANK	mustafa.tank62@gmail.com	5485217759	1985-06-16	15	t	86654568455	1
6719	HÜSEYİN	YENİGÜN	hüseyin.yenigün91@gmail.com	5366215290	1992-11-26	19	t	40075101282	1
6720	METİN	ASKAN	metin.askan79@gmail.com	5506014312	1992-06-13	34	t	90348803200	8
6721	KÜBRA	ŞENALP	kübra.şenalp30@gmail.com	5368002262	1999-02-27	5	f	75419237181	0
6722	VAHDETTİN	KAHRAMAN	vahdettin.kahraman70@gmail.com	5305055851	1988-05-20	60	t	56265326004	1
6723	Savaş	TEKİNALP	savaş.tekinalp70@gmail.com	5304527194	2003-06-02	34	t	86123567184	3
6724	ALAATTİN	BİLGEHAN	alaattin.bilgehan90@gmail.com	5311736658	1983-09-18	6	t	34040281489	1
6725	ZAFER	ÇELEBİOĞLU	zafer.çelebioğlu19@gmail.com	5325631201	1983-04-02	34	t	14729452515	5
6736	Fatmasu	TERZİ	fatmasu.terzi27@gmail.com	5372623956	1982-06-13	1	f	21659605321	0
6737	Dılala	DEDEKLİ	dılala.dedekli90@gmail.com	5505925877	1993-07-08	11	f	85928696638	0
6885	GÖKHAN	Y	gökhan.y74@gmail.com	5386515988	1995-06-18	34	t	40510523250	1
6886	YASEMİN	PARILTI	yasemin.parıltı36@gmail.com	5446610428	2003-02-26	81	f	72825480291	1
6887	ÖZLEM	ÖZTÜRK	özlem.öztürk71@gmail.com	5407412360	1991-09-27	34	t	70600998325	6
6888	İSMET	QADERİ	ismet.qaderi41@gmail.com	5455794858	1982-11-26	67	t	72599999933	7
6889	FAZIL	Y	fazıl.y56@gmail.com	5418123630	1984-04-12	34	t	96410654762	1
6890	MİNE	Y	mine.y38@gmail.com	5547223211	1989-04-19	34	f	20533884967	1
6891	SELİN	AL-ABDULRAZZAQ	selin.al-abdulrazzaq25@gmail.com	5481968448	1999-08-23	34	f	70825230149	1
6892	SEVTAP	USLU	sevtap.uslu23@gmail.com	5383705299	1997-08-28	34	f	23055984778	1
6897	ŞEYDA	AYDINER	şeyda.aydıner33@gmail.com	5503495154	1998-08-04	34	f	93813977059	5
6898	BARRY ROBERT	MAİREBA	barry robert.maireba27@gmail.com	5426171752	1987-03-13	34	t	76326034620	3
6899	MÜNİR	BATUR	münir.batur14@gmail.com	5325917997	2002-12-08	48	t	46397747109	1
6900	MELODİ	AKGÜL	melodi.akgül64@gmail.com	5561548805	1988-08-05	35	f	86409756841	1
6901	MEHMET İZZET	ÖZTİMUR	mehmet izzet.öztimur24@gmail.com	5303930612	1988-01-01	6	t	84800776375	5
6902	Nesrin	KAYA	nesrin.kaya82@gmail.com	5507094280	1996-08-08	16	f	58320200477	1
6903	Nevin	SHAJIDA	nevin.shajıda71@gmail.com	5453515282	2002-02-23	34	f	72288318740	7
6905	SERKAN	SOY	serkan.soy21@gmail.com	5436725615	1981-06-19	20	t	49677165329	1
6906	İSMAİL	YILDIRIM KAYA	ismail.yıldırım kaya40@gmail.com	5545828198	1984-10-14	1	t	52040928988	0
6907	Adnan Veysel	HADZHIEVA	adnan veysel.hadzhıeva11@gmail.com	5498959250	2002-03-01	56	t	90190497192	1
6908	NURGÜL	UZUNOĞLU	nurgül.uzunoğlu15@gmail.com	5557324161	2002-05-07	6	f	66586645865	7
6909	AŞKIM NURDAN	GENÇAL	aşkım nurdan.gençal11@gmail.com	5541556765	2001-06-16	34	f	90827509215	7
6912	MELİKE AYŞE	KARAHASANOĞLU	melike ayşe.karahasanoğlu99@gmail.com	5491369722	1991-07-19	34	f	60245259667	1
6914	ÜMİT	KISKAÇ	ümit.kıskaç13@gmail.com	5422723218	2002-03-01	10	f	97373072921	0
6915	ERKAN	ÖZER	erkan.özer40@gmail.com	5355883358	1995-12-23	10	t	35442505231	1
6916	AYNUR	KARAHAN	aynur.karahan49@gmail.com	5318048528	1999-04-12	34	f	68434802648	0
6917	BEGÜM İREM	WASEEM	begüm irem.waseem30@gmail.com	5478835417	1989-01-20	34	f	85097774129	1
6918	GÜL	SADAS	gül.sadas63@gmail.com	5401785423	1985-06-11	10	f	37810285763	0
6919	AYDIN	TEMÜR	aydın.temür15@gmail.com	5363955737	1998-06-02	6	t	75525820961	0
6920	MEHMET	BAŞ	mehmet.baş56@gmail.com	5504813647	1989-10-26	42	f	68181668583	0
6921	ŞENAY	ACAROL	şenay.acarol19@gmail.com	5586589157	1998-10-23	34	f	14568692287	0
6922	Elif	TOLUNGÜÇ	elif.tolungüç55@gmail.com	5312875331	1998-06-26	28	f	67783398848	0
6923	MURAT	KOLAY	murat.kolay55@gmail.com	5371373544	2002-04-22	65	t	21915588122	2
6924	YİĞİT EMRE	FARAH	yiğit emre.farah44@gmail.com	5365904503	2001-12-26	34	t	82391460704	0
6925	ALPER	AYDEMİR	alper.aydemir12@gmail.com	5382309220	1991-12-19	34	t	83061326472	0
6926	SÜMEYRA	GENÇ	sümeyra.genç80@gmail.com	5563980683	1983-06-12	53	f	30905854838	0
6928	Ümit	ÇIKIKÇI	ümit.çıkıkçı93@gmail.com	5307594176	1988-12-23	58	t	82108798978	0
6929	Fuat	MARMARA	fuat.marmara40@gmail.com	5585023346	1994-09-06	23	t	21857473605	0
6931	ELANUR	ŞENOL	elanur.şenol31@gmail.com	5335298357	1996-12-02	44	f	56879800982	0
6932	BERNA	ÜNAL	berna.ünal32@gmail.com	5488496471	1995-10-04	34	f	35501431483	0
6933	ELİF	ERDEM	elif.erdem54@gmail.com	5385089527	1995-06-18	34	f	41559301687	0
6934	MUHAMMED	ESEN	muhammed .esen54@gmail.com	5501190446	1984-11-12	41	t	19953533713	0
6935	GÜLİZAR GÜLENAY	CELAYİR	gülizar gülenay.celayir65@gmail.com	5528224862	1984-01-19	1	f	26003980655	0
6937	ÖMER FARUK	MIHCI AYDIN	ömer faruk.mıhcı aydın10@gmail.com	5383679516	1998-03-24	61	t	58790972998	0
6938	Zahide	YUSUFOĞLU	zahide.yusufoğlu47@gmail.com	5394966385	1988-02-18	34	f	71435814071	0
6939	Muhammed Taha	KÜÇÜKGÖKSU	muhammed taha.küçükgöksu87@gmail.com	5399121794	1985-09-06	4	t	94531902851	0
6942	Fatih Rüştü	DEMİREL	fatih rüştü.demirel27@gmail.com	5365102355	1982-12-18	71	t	81343172881	0
6944	MUSTAFA YİĞİTHAN	TANER	mustafa yiğithan.taner40@gmail.com	5308583350	1994-09-02	52	t	60933176790	0
6945	Aslı	CICEK	aslı.cıcek51@gmail.com	5404362481	1984-01-19	34	f	23089392327	0
6946	Hatice	Y	hatice.y12@gmail.com	5323696197	1999-07-05	54	f	17791775442	0
6947	Nurettin	ATASEVEN	nurettin.ataseven98@gmail.com	5496319833	1982-06-02	34	t	81700358480	0
6948	Enes	PEHLİVANOĞLU	enes.pehlivanoğlu57@gmail.com	5577510419	1999-07-24	34	t	16102218685	0
6951	Erdal	DEMİRCİOGLU	erdal.demircioglu87@gmail.com	5563850689	1982-04-25	34	t	26370304930	0
6952	GÖRKEM	DEMİRCİ	görkem.demirci38@gmail.com	5428303261	1984-05-05	16	t	67382331762	0
6953	Soner	ÇELEBİ	soner.çelebi16@gmail.com	5608574457	1989-01-08	34	t	49675572744	0
6954	Ceyhun	UZUN	ceyhun.uzun38@gmail.com	5387797373	1999-01-17	59	t	68670575949	0
6955	Ezgi	ÇEÇEN	ezgi.çeçen34@gmail.com	5343472168	1989-03-19	34	f	62166508842	0
6956	Beris Begüm	ÖZKANCA	beris begüm.özkanca31@gmail.com	5529018199	1992-04-28	59	f	58123132168	0
6958	Fatma	TÜZ	fatma.tüz60@gmail.com	5353393567	1982-03-07	55	f	64707139211	0
6959	Tuğçe	ÖZBAY	tuğçe.özbay59@gmail.com	5572534723	1986-05-17	74	f	82109094371	0
6960	Hürü	ENER	hürü.ener34@gmail.com	5389085418	2002-07-16	1	f	31701649087	0
6961	Yusuf	DİNÇER	yusuf.dinçer55@gmail.com	5555940718	1984-03-14	6	t	31689788170	7
6963	Mehmet	CHALİLOGLU	mehmet.chaliloglu33@gmail.com	5404726881	2000-05-18	2	t	13439943946	0
6965	Burak	KILIÇ	burak.kılıç93@gmail.com	5473499549	1999-09-22	34	t	12517653691	0
6966	Sibel	GÜVENDİK ALI	sibel.güvendik alı73@gmail.com	5412940682	1996-02-04	34	f	59743889178	0
6968	MURAT	IŞIKLAR	murat.ışıklar82@gmail.com	5452037318	1993-08-21	10	t	58234561908	7
6969	AYDAN	TOKSOY	aydan.toksoy31@gmail.com	5363143620	1984-03-17	19	f	89515989692	0
6970	HAMİT SADULLAH	BAĞATIR	hamit sadullah.bağatır23@gmail.com	5548882715	2002-07-08	44	t	43639458400	0
6971	SERHAN	DURMAZ	serhan.durmaz37@gmail.com	5495366765	1987-02-08	16	t	93546404678	8
6972	FEHİME	AYDIN	fehime.aydın28@gmail.com	5378584600	1985-01-13	32	f	90392891436	0
6975	Ercan	BÜYÜKALTUNEL	ercan.büyükaltunel45@gmail.com	5417185809	1997-08-14	34	t	45905837962	0
6976	Engin	ARABACI	engin.arabacı47@gmail.com	5363750760	1981-12-01	34	t	70247198870	1
6977	Fırat	YURTCU	fırat.yurtcu23@gmail.com	5332059954	1981-11-20	67	t	33812187209	6
6979	Fatih	TAXIAJI	fatih.taxıajı28@gmail.com	5452884795	1982-09-24	8	t	95195186414	0
6980	Elif	WAISIMAN	elif.waısıman70@gmail.com	5361373205	1984-12-25	34	f	71760096943	0
6981	Ümmügülsüm	AYGAN	ümmügülsüm.aygan93@gmail.com	5383989830	1980-07-26	1	f	16053956083	0
6983	Ahmet Anıl	ULUPINAR	ahmet anıl.ulupınar68@gmail.com	5376422896	2000-12-04	34	t	28424167506	0
6984	Ali Emre	TEMEL	ali emre.temel82@gmail.com	5407912562	1983-04-09	34	t	49868835193	0
6985	Begüm	ÖNGEL	begüm.öngel66@gmail.com	5385590929	1994-05-15	34	f	56348381359	0
6986	ŞERİFE SEMA	KAVANOZ	şerife sema.kavanoz15@gmail.com	5345137625	1993-12-25	34	f	16418507597	7
6988	ELİF	TURGUT	elif.turgut63@gmail.com	5416743398	1985-11-08	34	f	18545666088	3
6989	OSMAN TOLGA	CEBE	osman tolga.cebe14@gmail.com	5557392193	2002-12-07	44	t	18435760562	1
6990	DURMUŞ	ÖZDEMİR	durmuş.özdemir85@gmail.com	5315165585	1991-08-25	79	t	23572457947	1
6991	VEYSİ TAMER	ADANIR	veysi tamer.adanır85@gmail.com	5427829292	1991-07-19	1	f	28565567326	3
6992	Elif	UYAR	elif.uyar33@gmail.com	5367171840	1987-12-25	28	f	13982260692	0
6994	Selen	Y	selen.y38@gmail.com	5478920855	2003-08-27	34	f	55419836009	0
6995	İbrahim	DIVRAK	ibrahim.dıvrak91@gmail.com	5318548950	1999-04-25	26	t	20859714612	7
6997	SÜHEYLA	Y	süheyla .y96@gmail.com	5567680495	1992-03-04	8	f	75097487184	0
6999	ÇİĞDEM	ELLİALTI	çiğdem.ellialtı30@gmail.com	5313946214	1989-05-03	6	f	30068897553	1
7000	OYLUM	Y	oylum.y81@gmail.com	5311601733	1990-04-28	34	f	64107396542	1
7001	FATMA NUR	OKAN	fatma nur.okan91@gmail.com	5557679614	1999-11-06	34	f	13188256261	7
7002	EMİNE	ER	emine.er16@gmail.com	5392366966	2003-07-23	9	f	26097656768	8
7003	MEHMET ALİ	YILMAZ	mehmet ali.yılmaz18@gmail.com	5356994181	1986-03-10	7	t	77126422958	0
7004	CENK	ÖZEN	cenk.özen72@gmail.com	5441811389	1993-10-07	34	t	30813323508	0
7005	Utku Berkay	Y	utku berkay.y57@gmail.com	5492297146	1984-08-28	34	t	66890670022	0
7006	Ziya	SAVAŞ	ziya.savaş12@gmail.com	5335694651	1998-10-16	33	t	82807421455	0
7008	Hanife	ÜLKÜ USLU	hanife.ülkü uslu79@gmail.com	5601463604	2001-05-27	37	f	33593565417	0
7009	PINAR	KOYUNCU	pınar.koyuncu96@gmail.com	5334571769	1997-02-01	52	f	40473076884	1
7010	SERKAN	GÜNDÜZ	serkan.gündüz85@gmail.com	5367080402	1994-04-06	34	t	93157028915	1
7011	İsmail Çağlar	ÖZÇELİK	ismail çağlar.özçelik59@gmail.com	5485601482	1991-05-03	19	t	78845546875	0
7012	İlknur	KIRIKKANAT	ilknur.kırıkkanat97@gmail.com	5429138736	1984-07-14	34	f	32965728657	0
7015	Burak	KURUMAHMUT	burak.kurumahmut65@gmail.com	5475773112	1994-03-06	36	t	48405616867	0
7017	Mustafa İhsan	EKİNCİ DURAN	mustafa ihsan.ekinci duran84@gmail.com	5313356391	1982-04-09	6	t	30629433599	0
7018	Hatice	PINAROĞLU	hatice.pınaroğlu81@gmail.com	5556272537	2002-05-15	34	f	86613230233	0
7020	Alican	NEBİOĞLU	alican.nebioğlu82@gmail.com	5324395120	2002-07-10	34	t	48627667310	0
7021	Sinan	DÜZ	sinan.düz49@gmail.com	5531496818	1997-09-07	75	t	71005557359	1
7024	Adem	YAHYA	adem.yahya97@gmail.com	5537524541	1993-07-12	7	t	44387985076	0
7026	Ebuzer	AKPINAR	ebuzer.akpınar75@gmail.com	5552642252	2000-02-03	34	t	86683002724	0
7028	Ezgi	YURDAKUL	ezgi.yurdakul94@gmail.com	5407171745	1999-03-14	31	f	80489629790	0
7029	Mustafa	İBRAHİMOV	mustafa.ibrahimov27@gmail.com	5543021496	2001-04-18	34	t	86820011697	0
7031	Uğur	YILDIRIM	uğur.yıldırım98@gmail.com	5481390480	2003-01-27	44	t	74752691738	0
7032	Tuğba	SAKLAKOĞLU	tuğba.saklakoğlu25@gmail.com	5386395178	1994-09-19	45	f	98986724384	0
7033	Başak	GÜVEN	başak.güven55@gmail.com	5573945983	1996-11-07	34	f	87826123147	0
7034	Tuba	ÇAĞATAY	tuba.çağatay70@gmail.com	5368145472	2001-03-25	31	f	85709257762	0
7035	Emre	KIZILÇİM	emre.kızılçim53@gmail.com	5316268312	1997-02-08	16	t	80177580229	0
7037	Zeynep	KAYRAN	zeynep.kayran13@gmail.com	5352985868	1994-07-13	34	f	15951550678	0
7038	Selim	KILIÇ	selim.kılıç22@gmail.com	5426778474	1982-08-23	61	t	20786627254	0
7040	Abdulhamit	DAĞBAŞI	abdulhamit.dağbaşı63@gmail.com	5582610244	1993-06-09	34	t	72020477009	0
7041	Gizem	DENİZ	gizem.deniz49@gmail.com	5565431713	1993-09-25	71	f	96006903930	0
7043	Gökhan	BAYRAMOĞLU	gökhan.bayramoğlu46@gmail.com	5373895153	2000-11-06	34	t	28596356681	0
7044	Hülya	ANT AKBIYIK	hülya.ant akbıyık24@gmail.com	5375718224	2003-08-02	56	f	27715086832	0
7045	Coşkun	BULUT	coşkun.bulut50@gmail.com	5416398971	1997-10-11	53	t	75656481443	0
7046	Uğur	YILMAZ	uğur.yılmaz58@gmail.com	5571460147	1990-07-06	34	t	72467765431	0
7047	HALİT	GÜVEN	halit.güven52@gmail.com	5418862543	1999-03-23	61	t	37531287722	0
7049	Aysu	ŞAHİN	aysu.şahin73@gmail.com	5582498679	1991-11-22	6	f	45427064430	0
7051	Kaplan	ÜREN	kaplan.üren96@gmail.com	5562343354	1984-09-16	34	t	49718174869	0
7052	Hakan	TOZLU	hakan.tozlu91@gmail.com	5371730388	2002-09-03	34	t	66861340803	0
7053	Emine	KIZILAY	emine.kızılay99@gmail.com	5391893911	1996-11-27	16	f	14451257070	0
7054	Tarık	YILMAZ	tarık.yılmaz29@gmail.com	5424644835	1989-02-08	34	t	87314818477	0
7055	Zeynep	TÜRKEL	zeynep.türkel32@gmail.com	5373476819	1982-05-11	26	f	54646218288	0
7056	Seda	YÜKSEL	seda.yüksel82@gmail.com	5572214154	1988-10-24	34	f	84931135639	0
7058	Burak	IŞIK	burak.ışık50@gmail.com	5585714209	1998-06-01	6	t	96749258171	0
7060	Yücel	KARADİŞ	yücel.karadiş83@gmail.com	5512452459	1989-04-15	34	t	18698211779	0
7062	Yunus	DOĞAN	yunus.doğan64@gmail.com	5415746922	1994-06-08	34	t	77876316208	0
7064	Ayçe	ALPMAN	ayçe.alpman45@gmail.com	5601060674	1994-09-12	34	f	45957172536	0
7065	Merve	ALKAN	merve.alkan18@gmail.com	5306212856	1988-06-10	41	f	57134964324	0
7066	Suzan	GÜZEL	suzan.güzel16@gmail.com	5414507735	1995-11-02	31	f	86165036055	0
7069	ESRA	DURMUŞ	esra.durmuş37@gmail.com	5343367957	1999-11-12	34	f	25777195304	0
7070	NESİBE	YARAŞ	nesibe .yaraş51@gmail.com	5499159735	1981-06-03	19	f	38791430648	0
7073	GÖKHAN	ÖZCAN	gökhan.özcan33@gmail.com	5413296485	1992-04-15	34	t	31834159453	0
7074	Muhammet İbrahim	İNAN	muhammet ibrahim.inan37@gmail.com	5526915787	1991-09-19	2	t	79885410823	0
7075	Neriman	KOÇ	neriman.koç63@gmail.com	5507380989	1990-10-11	6	f	43219825621	0
7076	Kemal Eren	ŞENYAPRAK	kemal eren.şenyaprak27@gmail.com	5467546753	1996-01-06	34	t	53826595649	0
7078	Serkan Saruhan	YİĞİTTÜRK	serkan saruhan.yiğittürk57@gmail.com	5545618654	1986-07-24	34	t	19540109586	0
7079	Zafer	YILMAZTEKİN	zafer.yılmaztekin60@gmail.com	5585164177	1987-03-15	34	t	75692711112	0
7080	ESRA	ÖZER	esra.özer37@gmail.com	5482814896	1982-07-24	51	f	32487226833	0
7081	ONUR İSLAM	SARILAR	onur islam.sarılar94@gmail.com	5597570465	1998-02-16	55	t	59770622050	0
7082	Derya	YALÇIN	derya.yalçın64@gmail.com	5366129233	1991-01-16	1	f	37377414046	0
7084	Mustafa Yiğit	TÜRKDAL	mustafa yiğit.türkdal29@gmail.com	5573365351	1989-09-18	35	t	47264215159	0
7085	Efza	GEREN	efza.geren21@gmail.com	5574733240	1993-03-07	34	f	55603347822	0
7086	Ne Muhammet	KILIÇ	ne muhammet.kılıç71@gmail.com	5476609427	1994-04-09	34	t	89231555180	0
7087	Seçil	ŞEN	seçil.şen92@gmail.com	5572265446	1983-11-08	40	f	10449207707	0
7089	Şaziye	TURAL	şaziye.tural16@gmail.com	5346847698	1991-02-10	34	f	83057291591	5
7090	Duygu	KELLECİ	duygu.kelleci60@gmail.com	5357725150	1997-10-05	34	f	50056724093	0
7091	Hatice Kübra	MURAT	hatice kübra.murat47@gmail.com	5376634896	1996-05-13	34	f	62235271813	0
7092	Metin	ŞAHİN	metin.şahin33@gmail.com	5451044759	2003-10-25	34	t	75340803109	0
7093	Beste	ÖNEL	beste.önel81@gmail.com	5607977587	1990-10-06	34	f	47925498939	0
7094	İhsan	ECİN	ihsan.ecin39@gmail.com	5381492782	1996-06-20	63	t	24893728538	0
7095	Seda	KILIÇ	seda.kılıç92@gmail.com	5403478938	1994-07-24	34	f	75374653232	0
7096	Bahar Cansu	AKOLPOGLU	bahar cansu.akolpoglu28@gmail.com	5485110462	2000-07-19	34	f	44890342891	0
7097	Zehra	SANCAK	zehra.sancak50@gmail.com	5606265653	1987-07-09	34	f	52104571623	0
7098	Volkan Hüseyin	NURDAN	volkan hüseyin.nurdan82@gmail.com	5399030168	1998-10-16	34	t	20009825249	0
7099	Yeliz	EREN	yeliz.eren68@gmail.com	5486585108	1987-06-13	34	f	92307284612	0
7100	Veysel Çağan	KARADENİZ	veysel çağan.karadeniz15@gmail.com	5443794942	1987-02-18	23	t	48907272396	0
7101	Emrah	PARLAN	emrah.parlan70@gmail.com	5332543888	1987-01-21	45	t	11050804213	0
7102	Uğur	ARSLAN	uğur.arslan22@gmail.com	5561001291	1997-07-27	17	t	28733681164	1
7103	Yeliz	YALIN	yeliz.yalın63@gmail.com	5463423532	1986-04-12	34	f	84324885858	0
7104	Orkun	ÖLÇEKCİ	orkun.ölçekci73@gmail.com	5603970909	1983-09-23	34	t	79749318360	0
7105	Mehmet	ERŞEN	mehmet.erşen62@gmail.com	5407316853	1995-07-16	34	t	27062140954	0
7106	Derya	ÇOKYAŞAR	derya.çokyaşar34@gmail.com	5401344441	1980-02-27	1	f	96334736963	0
7107	Zeynep	ATEŞ	zeynep.ateş86@gmail.com	5343584366	1994-10-22	27	f	96051111794	0
7108	İlker Bora	YARGIÇ	ilker bora.yargıç11@gmail.com	5366162349	1983-08-09	34	t	45305838406	0
7109	Mücahit Abdullatif	AZİM	mücahit abdullatif.azim76@gmail.com	5427550170	1980-01-20	34	t	50365988855	0
7110	Zeynep Özge	ÜNAL	zeynep özge.ünal22@gmail.com	5452967558	1998-02-24	34	f	77475584714	0
7111	Yenal	YIĞRIK	yenal.yığrık82@gmail.com	5596047359	1984-07-25	34	t	13945451975	0
7112	Kadir	CENGİZ	kadir.cengiz16@gmail.com	5512000962	1997-11-15	34	t	70673273981	0
7113	Ayşe Nur	SAĞIROĞLU	ayşe nur.sağıroğlu16@gmail.com	5556725617	1983-03-21	60	f	30560428800	0
7114	Leyla	ARTUK	leyla.artuk70@gmail.com	5491046330	2001-10-04	49	f	64268241446	0
7115	Eyup	TEKECE	eyup.tekece68@gmail.com	5498815207	1998-04-15	34	t	17998656071	0
7116	Alp	ASLAN	alp.aslan73@gmail.com	5432087394	2000-12-18	34	t	57704065929	0
7118	Derya	DAŞTAN	derya.daştan43@gmail.com	5534675158	1986-04-01	66	f	78434515088	0
7119	Ali	DEMİREL	ali.demirel91@gmail.com	5571634844	1985-11-02	31	t	61583351232	0
7120	Cemre	OKAN	cemre.okan21@gmail.com	5484897450	1993-01-02	34	f	30344466979	0
7121	Ahmet Furkan	KAYAN	ahmet furkan.kayan12@gmail.com	5342048151	1999-04-10	32	t	15961037659	0
7124	Yiğitcan	KİRMAN	yiğitcan.kirman32@gmail.com	5491639456	2003-12-13	34	t	53583031859	0
7125	Özlem	AFACAN ERBAŞLAR	özlem.afacan erbaşlar11@gmail.com	5567894193	2001-01-05	10	f	14999394906	0
7126	Nurhan	CEZLAN	nurhan.cezlan70@gmail.com	5546622493	1983-04-27	34	f	52532597856	0
7127	Seniha	FIRAT	seniha.fırat33@gmail.com	5396370632	1985-07-20	34	f	70820203094	0
7130	Ergin	ERŞİN	ergin.erşin87@gmail.com	5522743420	1980-02-07	60	t	21644773059	0
7131	Funda	ERGENEKON	funda.ergenekon29@gmail.com	5356099871	2003-10-18	6	f	91293234502	0
7133	Cansu	ÇUTOK	cansu.çutok59@gmail.com	5341551663	1985-06-24	59	f	74197551234	0
7134	Sezer	KARİ	sezer.kari46@gmail.com	5528263891	1984-09-11	34	t	34500092604	0
7135	Nezihe Cansu	OKUTAY	nezihe cansu.okutay79@gmail.com	5477383192	1999-02-11	34	f	83113299349	0
7137	Meray	AYNE	meray.ayne18@gmail.com	5421638999	2000-11-09	34	f	57652835637	0
7138	İrem	ÖZDEMİR	irem.özdemir74@gmail.com	5387956686	1983-04-17	51	f	66790554036	0
7139	İsa	ARSLAN	isa.arslan49@gmail.com	5404314177	1991-02-01	20	t	79237131270	0
7140	Başak	KARA	başak.kara20@gmail.com	5378890538	1988-12-10	34	f	85502617776	0
7141	Kübra	DEMİR	kübra.demir95@gmail.com	5527163695	1982-08-26	34	f	89730405985	0
7142	Fatih Ahmet	ÇUHADAR	fatih ahmet.çuhadar97@gmail.com	5327792578	1980-06-01	80	t	27238176732	0
7143	Serol	ÖZTÜRK	serol.öztürk17@gmail.com	5311455471	1987-12-22	18	t	86278210395	0
7145	Mehmet Akif	KARAKAYA	mehmet akif.karakaya99@gmail.com	5495675642	1987-10-22	25	t	90917013080	0
7146	GÖNÜL	AYAZ	gönül.ayaz70@gmail.com	5472826733	2002-10-19	61	f	63527376685	0
7147	Şeyma	AKTAŞ	şeyma.aktaş49@gmail.com	5496313726	1980-04-17	34	f	20839372872	0
7148	Volkan	OĞUZORHAN	volkan.oğuzorhan23@gmail.com	5385938845	1985-04-16	75	t	74083398721	0
7149	Buğra	ERKE	buğra.erke79@gmail.com	5452824403	1999-11-09	31	t	20148168515	0
7150	Özlem İrem	KİBAR	özlem irem.kibar68@gmail.com	5324316233	1993-02-19	28	f	40529458352	0
7151	Aliekber	ÖZDEMİR	aliekber.özdemir47@gmail.com	5368452298	1988-01-17	24	t	99102773557	0
7152	Duygu	AŞIKOĞLU	duygu.aşıkoğlu60@gmail.com	5503601573	1985-05-04	34	f	44066882112	0
7153	Faruk	AÇMALI	faruk.açmalı23@gmail.com	5365956495	1996-05-03	78	t	67586918013	0
7154	Mehmet Berkan	BİCEROGLU	mehmet berkan.biceroglu53@gmail.com	5413046633	1994-01-01	35	t	44467820093	0
7157	Ozan	YILDIRIM	ozan.yıldırım44@gmail.com	5496155107	1983-01-25	34	t	96253921376	0
7159	Bekir	UÇURUM	bekir.uçurum25@gmail.com	5478737613	1990-03-03	34	t	20958991806	0
7163	Ayşe	DÖNMEZ	ayşe.dönmez78@gmail.com	5346337807	1989-07-02	34	f	35713383797	0
7164	İbrahim Ethem	AFACAN	ibrahim ethem.afacan91@gmail.com	5524032423	1988-08-05	10	t	13847470847	0
7165	Pınar	ACAR ÜZELYAŞADIR	pınar.acar üzelyaşadır45@gmail.com	5563711491	1990-04-27	24	f	52590905109	0
7166	Büşra	OBUZ	büşra.obuz21@gmail.com	5442105898	2001-09-17	34	f	34354965429	0
7168	Burcu Hazal	BAYDUR	burcu hazal.baydur31@gmail.com	5377435219	1984-01-13	34	f	42700926490	0
7169	Recep Hakan	DÖNMEZ	recep hakan.dönmez84@gmail.com	5333836210	1997-01-22	24	t	25500868867	0
7170	Ayşe	DEMİR	ayşe.demir75@gmail.com	5392260822	1999-05-28	53	f	56393111078	0
7171	Onur	AYSEL	onur.aysel71@gmail.com	5546620945	1997-12-20	16	t	70268103766	0
7172	Oğuzhan	İLHAN	oğuzhan.ilhan67@gmail.com	5594967396	1993-12-23	58	t	73936315724	0
7173	Emine	DEMİR	emine.demir51@gmail.com	5505060815	1983-08-01	34	f	56652618893	0
7174	Dilan	APATAY	dilan.apatay59@gmail.com	5472717718	1995-10-23	6	f	79492844629	0
7176	Halit	AHBAB	halit.ahbab66@gmail.com	5526211726	1982-10-06	34	t	95566740646	0
7177	Ömür Yalçın	MUTLU	ömür yalçın.mutlu94@gmail.com	5322086649	1993-11-19	35	t	19569365165	0
7178	Emre	BOZKURT	emre.bozkurt96@gmail.com	5575836562	1997-06-04	6	t	95622738928	1
7179	Hüseyin	TAŞKIRAN	hüseyin.taşkıran75@gmail.com	5458586517	2002-05-05	34	t	31724517619	0
7180	Fatma	AR BOZTAŞ	fatma.ar boztaş71@gmail.com	5581542355	1992-06-10	28	f	21961265870	0
7181	İlker	BOZTAŞ	ilker.boztaş52@gmail.com	5573121221	1996-11-13	34	t	47405173004	0
7183	Pelin	MUTLU EKİNCİ	pelin.mutlu ekinci12@gmail.com	5352966933	1991-01-01	34	f	36335612833	0
7184	Fatma	ERGÜN	fatma.ergün43@gmail.com	5469040382	1985-12-18	34	f	97385974080	0
7185	Merkut	ODEMİS	merkut.odemis17@gmail.com	5456477641	2003-02-03	6	f	37832544023	7
7186	Şeyda	OĞUZ	şeyda.oğuz22@gmail.com	5323134325	1999-09-25	24	f	19269159372	0
7187	Yavuz Selim	ŞENGÜN	yavuz selim.şengün49@gmail.com	5342123140	1981-05-15	28	t	98733086885	0
7188	Nazlı	DERVENT	nazlı.dervent60@gmail.com	5555444170	2000-12-28	45	f	38515606437	0
7189	Derya	ŞEN	derya.şen51@gmail.com	5303896233	2003-11-26	34	f	47005948938	0
7192	Demet	YILDIZ	demet.yıldız46@gmail.com	5537496739	1988-02-26	55	f	67214781234	0
7193	Ecem Gökçe	CANDAN	ecem gökçe.candan94@gmail.com	5436749937	1988-10-14	16	f	85305167839	7
7194	Nagihan	TUNA GÖKCEGÖZOG	nagihan.tuna gökcegözog84@gmail.com	5482729370	1990-12-26	34	f	40885997261	0
7195	Hüseyin	ÜÇTEPE	hüseyin.üçtepe64@gmail.com	5347958316	1991-07-10	60	t	68697667101	0
7196	Burak Tahir	ATEŞ	burak tahir.ateş94@gmail.com	5428531279	1997-07-19	34	t	79410636186	0
7197	Gürşah	SELKİN	gürşah.selkin47@gmail.com	5346145339	1981-06-11	16	f	57850901907	0
7198	Mustafa	DAKIN	mustafa.dakın68@gmail.com	5457565865	1998-12-01	34	t	86980941892	0
7199	Hiva	MİROĞLU	hiva.miroğlu10@gmail.com	5431647410	1992-04-04	21	f	17719739933	1
7200	Ali	DERVENT	ali.dervent70@gmail.com	5315293834	2000-03-18	45	t	40725037063	0
7202	İlker	DEMİRÖZ	ilker.demiröz57@gmail.com	5604185101	1999-05-10	34	t	35597274824	0
7204	Halil Enver	SOYLU	halil enver.soylu95@gmail.com	5562677457	1989-05-25	34	t	63577811194	0
7205	Semiha	ALTINKAYNAK SATILMIŞ	semiha.altınkaynak satılmış 49@gmail.com	5364280113	1987-10-27	25	f	56040263207	0
7206	Mehmet Zahid	ÖZSAĞIR	mehmet zahid.özsağır29@gmail.com	5602110246	2002-05-26	2	t	72183241844	0
7207	Şengül	AYYILDIZ	şengül.ayyıldız33@gmail.com	5446874432	1982-01-13	34	f	42529153587	0
7208	Selahattin Hakan	YILDIRIM	selahattin hakan.yıldırım30@gmail.com	5533818420	2002-11-24	35	t	77051747415	0
7209	Hilal	MEMİŞOĞLU	hilal.memişoğlu23@gmail.com	5491967734	1998-12-17	20	f	72940773125	0
7210	Murat	YİLMAZ	murat.yilmaz62@gmail.com	5343810950	1981-11-23	34	t	76089203572	0
7211	Ömer	SÖNMEZ	ömer.sönmez55@gmail.com	5381416710	1981-11-07	60	t	92333193858	0
7212	Merve	HANTAL	merve.hantal29@gmail.com	5457928897	1986-06-21	35	f	55436935771	0
7213	Mustafa Burak	KOTAN	mustafa burak.kotan45@gmail.com	5355944903	1982-02-06	34	t	12610279355	0
7215	Barış	DEMİR	barış.demir55@gmail.com	5519169311	1989-01-01	34	t	21858019897	0
7216	Uğur	YÜCE	uğur.yüce94@gmail.com	5446734842	1996-09-02	20	t	88468797957	0
7218	Mehmet Murat	OLUK	mehmet murat.oluk92@gmail.com	5498425884	1990-05-07	63	t	40198380083	0
7219	Kevser Zeynep	MERAL	kevser zeynep.meral26@gmail.com	5381909120	1997-10-12	34	f	53383621400	0
7220	Anıl	GÜLMEN	anıl.gülmen24@gmail.com	5445789570	1987-11-01	34	t	72138571160	0
7221	Abdülselam	KOÇAK	abdülselam.koçak80@gmail.com	5327883646	2003-05-26	36	t	43686750882	0
7222	İzzet	ARSLAN	izzet.arslan60@gmail.com	5514093264	1999-10-24	27	t	72624162159	0
7224	Umut Çağlar	UZUN	umut çağlar.uzun70@gmail.com	5415690827	1992-09-12	6	t	43778177410	0
7225	Aliye Betül	DENİZ	aliye betül.deniz46@gmail.com	5475416592	1992-08-14	7	f	78355385719	0
7226	Sibel	ATASOY	sibel.atasoy80@gmail.com	5362552588	2002-03-13	34	f	23032587688	0
7227	Göksun	DİNÇ	göksun.dinç84@gmail.com	5378204235	1997-02-22	34	f	18318314343	0
7228	Serap	ÖZTÜRK	serap.öztürk71@gmail.com	5581051383	2001-01-02	25	f	11417955804	0
7229	Amine	ARSLAN	amine.arslan10@gmail.com	5556188676	1986-02-10	48	f	34150538397	0
7231	Mehmet Mücahit	ÇIRACI	mehmet mücahit.çıracı33@gmail.com	5343982424	1989-09-05	34	t	18338468347	0
7233	Selim	KAPANCI	selim.kapancı69@gmail.com	5344403450	1999-01-14	26	t	62885375185	0
7234	Nurullah	COŞKUN	nurullah.coşkun21@gmail.com	5402790654	1992-12-16	12	t	68280569747	0
7235	Şule	TOSUN	şule.tosun49@gmail.com	5374533703	1990-08-03	34	f	86371582479	0
7236	Barış	ABACI	barış.abacı99@gmail.com	5353254779	1980-03-05	77	t	69880814130	0
7238	Rasit Can	BASARAN	rasit can.basaran11@gmail.com	5434611964	1996-10-15	34	t	42349518843	0
7239	Kübra	KUCUR	kübra.kucur15@gmail.com	5524413346	1991-04-16	32	f	64648564332	0
7240	Fatmanur	GÜR	fatmanur.gür63@gmail.com	5552896980	1991-12-08	53	f	23139670456	0
7241	Melike	ŞAHİN	melike.şahin52@gmail.com	5555523454	1999-08-14	7	f	53860133321	0
7242	Ergin	ŞAHİN	ergin.şahin51@gmail.com	5366986946	2001-10-25	34	t	27367211936	7
7243	Veli	ÇOLAK	veli.çolak89@gmail.com	5529131301	1987-12-18	46	t	65570030077	0
7245	Sinem	ÇUKURÇAYIR	sinem.çukurçayır90@gmail.com	5519176344	1996-01-26	42	f	48067979608	0
7246	Sefa	SAKA	sefa.saka25@gmail.com	5506870531	1992-03-20	61	t	86789957027	0
7248	Ufuk	ÇİÇEK	ufuk.çiçek18@gmail.com	5603697563	2002-11-28	60	t	87099766158	0
7249	Bartu	TURGUT	bartu.turgut56@gmail.com	5586144193	1984-09-01	34	t	90429120891	0
7250	Merve Nazlı	ALKAN	merve nazlı.alkan92@gmail.com	5404925408	1985-02-23	34	f	67993212752	0
7251	Kalender	KARAKOÇ	kalender.karakoç45@gmail.com	5411281595	1982-07-18	34	t	56545471994	0
7252	Asude Gül	KESKİN	asude gül.keskin 10@gmail.com	5333005233	1995-08-27	10	f	90021478787	0
7253	Leyla	YETİMOĞLU	leyla.yetimoğlu96@gmail.com	5548570729	1994-08-05	53	f	79364537733	0
7254	Ayse	DEMİR	ayse.demir17@gmail.com	5608330330	1993-06-13	40	f	70685089596	0
7256	Halil İbrahim	MOR	halil ibrahim.mor52@gmail.com	5597878382	1993-07-01	27	t	64805907204	0
7257	Emel Ezgi	İRAK	emel ezgi.irak66@gmail.com	5377498827	1986-06-25	6	f	16652515409	0
7258	Gülistan	TAŞ	gülistan.taş53@gmail.com	5458639713	1987-05-26	34	f	40498476447	0
7259	Mehmet Kadri	TEKİN	mehmet kadri.tekin13@gmail.com	5602409344	1990-11-27	21	t	47709609910	0
7261	Ülkem	ÖÇALAN	ülkem.öçalan38@gmail.com	5423126695	1999-04-08	6	f	26191925529	0
7262	Baran	ÖRS	baran.örs33@gmail.com	5573623180	1996-12-10	4	t	36957491749	0
7263	Yağızcan Yücel	ÇENDİK	yağızcan yücel.çendik78@gmail.com	5591926775	1991-01-10	34	t	33279119176	0
7264	Gökhan	DEMİRDÖVEN	gökhan.demirdöven14@gmail.com	5496148307	2002-10-14	34	t	15988075899	0
7267	Kazım	ALÇİÇEK	kazım.alçiçek12@gmail.com	5383489447	2000-01-28	76	t	14563823529	0
7268	Mert	SAYIN	mert.sayın83@gmail.com	5506201784	2002-04-25	34	t	88385960323	0
7269	Sedef Cansu	KALELİ	sedef cansu.kaleli35@gmail.com	5487295138	1981-02-13	34	f	23328359479	0
7270	Gizem	AKGÜN	gizem.akgün13@gmail.com	5428598904	1985-09-23	22	f	92823519027	0
7271	Mert Musa	SÖNMEZ	mert musa.sönmez42@gmail.com	5581077747	1993-12-20	57	t	64804861722	0
7272	Elifnur	SAMASTI	elifnur.samastı44@gmail.com	5322377249	1987-12-06	34	f	59618035517	0
7273	Emine	SANCAKLI	emine.sancaklı26@gmail.com	5328807937	1984-05-09	34	f	30736868903	0
7275	Özge	ÇETİNKAYA	özge.çetinkaya66@gmail.com	5362159499	1989-09-17	32	f	59403646273	0
7277	Ceyhan	UÇAN	ceyhan.uçan17@gmail.com	5383417497	1998-04-28	34	f	77791990975	0
7278	Şule	ÖZLÜ	şule.özlü51@gmail.com	5452878485	1997-03-03	42	f	48914619082	0
7279	Nuran	KESEN	nuran.kesen11@gmail.com	5605102820	1996-01-09	69	f	61141376982	0
7280	Büşra	DOĞAN	büşra.doğan51@gmail.com	5302299235	1981-06-08	34	f	73474627796	0
7281	Sami	ERGALİMİDİ	sami.ergalimidi91@gmail.com	5368212285	1990-09-08	34	t	52477856696	0
7282	Vedat	TUNÇTAN	vedat.tunçtan28@gmail.com	5608862291	1998-11-12	56	t	84045841900	0
7283	Müge	BULAT ÇETİNKAYA	müge.bulat çetinkaya10@gmail.com	5353005533	1998-07-14	6	f	30075909801	0
7284	Duygu	ÇİMEN	duygu.çimen96@gmail.com	5406422766	1993-07-02	41	f	97314269909	0
7285	Senem	KAYAKIRAN	senem.kayakıran46@gmail.com	5508097606	2002-02-16	17	f	71782439147	0
7286	Cansu	BAKİ YILMAZ	cansu.baki yılmaz19@gmail.com	5582693775	1981-09-05	34	f	12578713214	0
7287	Pelin	KÖFÜNCÜ	pelin.köfüncü44@gmail.com	5558300279	1982-06-21	16	f	55567837853	0
7288	Abdül	KOCATEPE	abdül.kocatepe97@gmail.com	5537994954	1986-09-05	34	t	67841299744	0
7291	Kerem	GÜMÜŞ	kerem.gümüş33@gmail.com	5544262273	1987-04-25	34	t	62966288510	0
7292	Sibel	DAVULCU	sibel.davulcu96@gmail.com	5438426921	2002-12-23	34	f	85920878726	0
7293	Naciye	BİREKUL	naciye.birekul34@gmail.com	5436593245	1993-06-26	42	f	44283316011	0
7294	Zeynep	ULUS GÖZÜM	zeynep.ulus gözüm39@gmail.com	5537594988	1988-12-22	6	f	72512970939	0
7296	Mustafa Oğuz	DEMİRCİ	mustafa oğuz.demirci22@gmail.com	5332121981	1980-03-25	6	t	39567212760	0
7297	Hande Ceylan	KARAN	hande ceylan.karan70@gmail.com	5412722954	1984-07-24	34	f	64817909861	0
7298	Hazel	ORUÇ	hazel.oruç12@gmail.com	5315320962	1998-12-02	67	f	60609160655	0
7299	Ali	DAĞDEVİREN	ali.dağdeviren22@gmail.com	5521737612	1994-05-22	27	t	47569564446	0
7300	Mustafa	AĞIR	mustafa.ağır75@gmail.com	5425483957	1983-11-17	46	t	91453214322	0
7301	Uğur	KARACA	uğur.karaca32@gmail.com	5427381220	1989-08-25	34	t	76481444187	0
7304	Ahmet Hamdi	ARIKAN	ahmet hamdi.arıkan20@gmail.com	5475121168	1988-06-04	25	t	18250649523	0
7306	Füsun	TAVUS	füsun.tavus 90@gmail.com	5322446668	1986-09-19	6	f	86020238852	0
7307	Baybars Selçuk	YAŞAR	baybars selçuk.yaşar52@gmail.com	5575227285	1997-11-19	14	t	37430390243	0
7308	Büşra	YILMAZ	büşra.yılmaz69@gmail.com	5524268366	1989-12-09	34	f	42276617347	0
7309	İnci Deniz	ULUTUĞ	inci deniz.ulutuğ89@gmail.com	5528290591	1980-12-16	34	f	90092567644	0
7310	Yiğit Ali	KATIER	yiğit ali.katıer12@gmail.com	5508181822	1999-02-01	20	t	36849134024	0
7311	Fatma Leman	ÇİNKILIÇ	fatma leman.çinkılıç64@gmail.com	5396530660	2001-06-07	34	f	78911048306	0
7312	Oğuzhan	BAYRAKTAR	oğuzhan.bayraktar61@gmail.com	5401062140	1982-10-12	34	t	47497400684	0
7313	Hasan Melih	EREN	hasan melih.eren46@gmail.com	5439166271	2001-05-10	34	t	89365903485	0
7314	Ensar	İSMAİLOĞLU	ensar.ismailoğlu48@gmail.com	5532742605	2003-05-23	34	t	34818459241	0
7316	Mehmet Burak	KUCUKİSLAMOGLU	mehmet burak.kucukislamoglu83@gmail.com	5574438622	1984-02-03	34	t	31700458343	0
7317	Fatih	ÇALKA	fatih.çalka35@gmail.com	5327700403	1990-12-08	34	t	16520052448	0
7318	Cüneyt Okan	KAYA	cüneyt okan.kaya43@gmail.com	5598961690	1991-09-19	34	t	87954067713	0
7319	Cafer	DELEN	cafer.delen28@gmail.com	5308931372	1989-06-24	65	t	89988712189	0
7320	Nurgül	ÖZTÜRK	nurgül.öztürk38@gmail.com	5314848421	1987-06-08	34	f	49280482526	0
7321	Enes	ARAN	enes.aran43@gmail.com	5342193442	1981-01-15	34	t	23040198706	0
7322	Aslı	ÖZAKTAN	aslı.özaktan53@gmail.com	5467274265	1987-07-12	17	f	36698503189	0
7323	Enver	AKBAŞ	enver.akbaş53@gmail.com	5473697318	1996-12-01	52	t	22973458375	0
7324	Melik Murat	AKBAŞ	melik murat.akbaş34@gmail.com	5321593792	2001-05-13	21	t	13634784164	0
7325	Eda Nur	CALIŞ	eda nur.calış21@gmail.com	5468396493	2003-10-08	52	f	57033649753	0
7327	Mehmet	YILDIRIM	mehmet.yıldırım89@gmail.com	5346532147	2002-05-02	21	t	35971830320	0
7328	Kerim	GURKAN	kerim.gurkan28@gmail.com	5336528133	1987-10-17	34	t	71026035191	0
7331	Ayşegül Yasemin	GÜL	ayşegül yasemin.gül 38@gmail.com	5341981963	1999-10-22	22	f	11028006113	0
7334	Volkan	BAYKAL	volkan.baykal11@gmail.com	5396174513	1986-03-28	34	t	90083453239	0
7335	Fatimetüz Zehra	AVAR	fatimetüz zehra.avar33@gmail.com	5392233458	1998-11-09	34	f	40945499713	0
7336	Kerime Nur	EJDEROĞLU	kerime nur.ejderoğlu64@gmail.com	5358195564	1983-07-05	26	f	23143950329	0
7337	Alper	IŞIK	alper.ışık23@gmail.com	5575790482	1987-02-02	28	t	27950045213	0
7338	Görkem	DERİN	görkem.derin89@gmail.com	5561878819	2001-07-06	22	t	54588222166	0
7341	Barış	KESİCİ	barış.kesici68@gmail.com	5573776225	2000-03-11	34	t	30810482215	0
7342	Samet	ÇOBAN	samet.çoban19@gmail.com	5324190866	1994-10-13	44	t	12554257183	0
7343	Erman	GÜLBAĞ	erman.gülbağ33@gmail.com	5366217670	1981-07-11	34	t	26464298040	0
7344	Derya	GÜMÜŞ	derya.gümüş72@gmail.com	5393376237	1994-05-06	53	f	89829306372	0
7345	Zeynep	TABAKCI	zeynep.tabakcı12@gmail.com	5302677482	1997-03-13	34	f	93831317147	0
7346	Ayşe	AKUYGUR	ayşe.akuygur90@gmail.com	5418175222	1992-06-22	45	f	41274112683	0
7347	Nilüfer	TIRPAN	nilüfer.tırpan65@gmail.com	5561277322	2002-07-03	34	f	80923741413	0
7348	Günay	BABA	günay.baba60@gmail.com	5397661813	1986-01-22	25	f	18330858735	0
7350	Serkan	YAĞŞİ	serkan.yağşi86@gmail.com	5445233844	1992-08-14	34	t	73946271063	0
7351	Yunus Emre	EKŞİ	yunus emre.ekşi91@gmail.com	5332070699	1990-08-25	34	t	89818452636	0
7352	İsmail	AK	ismail.ak99@gmail.com	5543055806	1996-11-21	55	t	30417032511	0
7353	Büşra	YURT	büşra.yurt49@gmail.com	5435401667	1999-08-03	34	f	50291424220	0
7354	Burak	KERT	burak.kert17@gmail.com	5517818970	1994-02-02	31	t	29667156987	3
7355	Koray	ÖZBAY	koray.özbay60@gmail.com	5608136991	1996-08-11	67	t	27874366203	0
7356	Mert Doğukan	MOROĞLU	mert doğukan.moroğlu21@gmail.com	5576030581	1991-07-03	35	t	96666074679	0
7357	Hande	YILDIRIM	hande.yıldırım13@gmail.com	5423600893	1994-10-25	34	f	19747185440	0
7358	İlyas	KELEŞ	ilyas.keleş45@gmail.com	5336604474	2002-06-19	25	t	60832032915	0
7359	Erol Borahan	BATUR	erol borahan.batur30@gmail.com	5404758850	1998-06-25	6	t	52881169375	0
7360	Filiz	ŞUGÜNEŞ	filiz.şugüneş88@gmail.com	5386583767	2002-05-13	34	f	48395945555	0
7361	Nazife	YAZICIOĞLU YILMAZ	nazife.yazıcıoğlu yılmaz61@gmail.com	5484897439	2002-01-18	6	f	89510045380	0
7362	Birant	HACIOĞULLARI	birant.hacıoğulları28@gmail.com	5476369607	1990-04-21	16	f	69875773848	0
7363	Esra	YILMAZ	esra.yılmaz69@gmail.com	5427442627	1988-06-10	34	f	44256128669	0
7364	Handan Sena	LEZGİOĞLU ÖZER	handan sena.lezgioğlu özer43@gmail.com	5494019965	1981-05-15	34	f	23167660503	0
7365	Eda	GÜLER	eda.güler46@gmail.com	5427498422	2003-09-22	34	f	11289373791	0
7366	Zeynep	İNAN	zeynep.inan79@gmail.com	5454111270	1992-08-16	34	f	59586091976	0
7369	Nur	SEZER	nur.sezer28@gmail.com	5548221741	1987-02-12	34	f	35908539361	0
7370	Nursel	OKUTAN	nursel.okutan95@gmail.com	5358763872	1988-09-13	34	f	90001161436	0
7371	Mehmet Ali	PARLAK	mehmet ali.parlak83@gmail.com	5415038248	1998-03-01	60	t	22397356575	0
7372	Ahmet Reha	DİNÇER	ahmet reha.dinçer36@gmail.com	5484784266	1997-08-09	70	t	18556721259	1
7373	Vedat	TUNÇTAN	vedat.tunçtan44@gmail.com	5326407281	2003-06-02	56	t	10644138786	0
7374	Ekrem	İŞÇİMEN	ekrem.işçimen22@gmail.com	5396383153	1988-11-05	38	t	50110587949	0
7376	Doğukan	GÜNERDEN	doğukan.günerden23@gmail.com	5333658411	1986-06-12	34	t	59490760791	0
7377	Hesna	MILLIK	hesna.mıllık57@gmail.com	5474207865	1994-01-25	64	f	47520871376	0
7378	Turgut	ÇATIK	turgut.çatık40@gmail.com	5302580663	1982-08-11	38	t	89959122404	0
7379	Veli Özgür	YURTDAŞSEVEN	veli özgür.yurtdaşseven80@gmail.com	5494599821	1999-03-22	17	t	18228169629	0
7380	Didem	TOPRAK	didem.toprak65@gmail.com	5422016923	1996-06-20	6	f	17879016262	0
7381	Ferhat	GİRGİN	ferhat.girgin72@gmail.com	5457725439	1995-10-04	34	t	21020700660	0
7382	Mehmet	ALTİNTAŞ	mehmet.altintaş19@gmail.com	5605245212	1980-12-06	13	t	22563665730	0
7384	Sevde Nur	İNDİ	sevde nur.indi92@gmail.com	5483779783	2003-02-11	35	f	43752470460	0
7385	Merve	ERGÜN	merve.ergün44@gmail.com	5414395310	1995-11-08	34	f	26712647807	0
7386	Engin	ZEKİ	engin.zeki33@gmail.com	5567268759	1990-09-14	6	t	26557962723	0
7387	Onur	AKBUDAK	onur.akbudak45@gmail.com	5566057644	1990-07-22	34	t	31361678901	0
7388	Şeydanur	AYDIN	şeydanur.aydın10@gmail.com	5522275284	1996-11-26	34	f	78655950461	0
7389	Seda	OKTAY	seda.oktay64@gmail.com	5485993249	1987-03-05	9	f	35756796423	0
7390	Handan Dicle	ERSUNAY	handan dicle.ersunay90@gmail.com	5323099271	1986-12-14	34	f	66965503744	0
7391	Gizem	TAŞKIRAN	gizem.taşkıran14@gmail.com	5431129274	2003-08-13	34	f	42222948585	0
7393	Cihan	KARABEL	cihan.karabel23@gmail.com	5604790345	1994-10-07	34	t	61879806989	0
7394	Ebru	TANRIVERDİ	ebru.tanrıverdi83@gmail.com	5508727606	1980-07-28	34	f	23158639449	0
7395	Güven	YILIDZ	güven.yılıdz44@gmail.com	5503088660	2000-10-19	35	t	91048279819	8
7398	Seda	ELMAZ	seda.elmaz94@gmail.com	5328622543	1989-11-13	34	f	51512998664	0
7399	İbrahim Alperen	YAVUZ	ibrahim alperen.yavuz77@gmail.com	5573812125	1995-07-10	34	t	47209693719	0
7401	Kayhan Sertel	AKKOYUNLU	kayhan sertel.akkoyunlu93@gmail.com	5468967602	1991-03-22	34	t	70437394594	0
7402	Muhammed Ali	ÇATALKAYA	muhammed ali.çatalkaya40@gmail.com	5392613476	1987-10-10	25	t	65816966171	0
7403	Gürkan	TÜZMEN	gürkan.tüzmen52@gmail.com	5346071674	2001-08-10	34	t	17360963806	0
7404	Eylül Müge	YILDIRIM	eylül müge.yıldırım75@gmail.com	5394536175	1995-04-10	34	f	25427639588	0
7405	Enis	ÖZBİLGİR	enis.özbilgir43@gmail.com	5585917157	1989-04-22	34	t	13378381866	0
7406	Sinan	KIZILIRMAK	sinan.kızılırmak80@gmail.com	5565343194	1986-09-02	34	t	67221885149	0
7407	Nuray	KOÇ	nuray.koç25@gmail.com	5393218326	1987-08-22	36	f	84709666042	0
7409	Yücel	SALAR	yücel.salar56@gmail.com	5404198143	1981-12-20	34	f	48405582474	0
7410	Yasemen	ERGÜN	yasemen.ergün57@gmail.com	5461333402	1988-12-13	34	f	82439903583	0
7411	Merve	KIZILKAN	merve.kızılkan19@gmail.com	5369188780	1995-06-07	6	f	69175357133	0
7414	Baran	GÜNEŞ	baran.güneş16@gmail.com	5448365683	1981-12-28	16	t	77570460975	0
7418	Hasan	ŞAHAN	hasan.şahan79@gmail.com	5527806778	1986-10-25	79	t	79167330211	0
7419	Aykut	MAYIN	aykut.mayın55@gmail.com	5478124793	1993-11-04	34	t	32021059569	0
7420	Yeşim	YILMAZ	yeşim.yılmaz96@gmail.com	5515520250	1994-04-13	34	f	37966435279	0
7421	İsmail	KARASOY	ismail.karasoy52@gmail.com	5418240267	1994-09-25	34	t	68356587211	0
7422	Saime	OCAK	saime.ocak89@gmail.com	5493848747	1985-04-03	44	f	64859675305	0
7423	Fidan	COŞKUN	fidan.coşkun70@gmail.com	5571057727	1980-02-12	34	f	31699620334	0
7424	Sıddık Samet	KARA	sıddık samet.kara67@gmail.com	5478189691	1983-04-07	34	t	13255625703	0
7425	Mustafa	AĞAÇCI	mustafa.ağaçcı43@gmail.com	5504349239	1991-09-22	34	t	22088559679	0
7426	Sinem	ÖZBEY	sinem.özbey33@gmail.com	5517329886	1990-04-01	34	f	92639373114	0
7427	Ahmet Furkan	SÜT	ahmet furkan.süt61@gmail.com	5537458106	2002-07-17	34	t	82023828641	0
7428	Seda	BAYCAN	seda.baycan40@gmail.com	5464703815	2000-12-07	34	f	82843486657	0
7429	Özden	ŞAHİN	özden.şahin33@gmail.com	5337362182	1997-09-26	34	f	35824416937	0
7430	Gökmen	GÜNDÜZ	gökmen.gündüz41@gmail.com	5375510715	1983-03-06	34	t	71275531527	0
7431	Duygu	EMANET	duygu.emanet44@gmail.com	5407663635	1988-05-17	1	f	28517431723	0
7434	Şafak	DARÇIN	şafak.darçın36@gmail.com	5593892114	1985-05-10	25	f	99874041873	0
7435	Ethemcan	UZUNKOL	ethemcan.uzunkol68@gmail.com	5527014783	1992-02-23	34	t	75781293776	0
7436	Hakan	YAZGAN	hakan.yazgan24@gmail.com	5563218320	1998-12-06	34	t	50694322797	0
7437	Tuğba	KOPUZ	tuğba.kopuz84@gmail.com	5423712881	1989-10-23	34	f	22386064689	0
7439	Seda	YELDAN	seda.yeldan32@gmail.com	5316541617	1989-07-03	27	f	86043069561	0
7440	Mehmet	TATLICILAR	mehmet.tatlıcılar21@gmail.com	5463915491	1999-07-22	33	t	96012816063	0
7441	Muhammed Sait	AKDOĞAN	muhammed sait.akdoğan94@gmail.com	5388882608	1999-02-08	34	t	59272144342	0
7442	Hakan	ÖZEL	hakan.özel49@gmail.com	5368125510	1981-05-11	6	t	86589007407	0
7443	Burcu	ÜZÜMCÜLER	burcu.üzümcüler97@gmail.com	5435206997	1999-05-27	16	f	63224246040	0
7444	Adem	MANİŞ	adem.maniş21@gmail.com	5327206221	2001-05-24	34	t	66601968211	0
7445	Gizem Hülya	DEMİR	gizem hülya.demir45@gmail.com	5536830800	2002-01-12	34	f	49064020778	0
7446	Ayşegül Hazer	TOYOĞLU	ayşegül hazer.toyoğlu36@gmail.com	5498034475	1995-07-10	34	f	85755104522	0
7449	Batuhan	ERDOĞAN	batuhan.erdoğan41@gmail.com	5305101471	1996-02-13	67	t	18022269740	0
7450	Beytullah	KARAKAŞ	beytullah.karakaş13@gmail.com	5398047917	1981-10-18	54	t	54520066946	0
7451	Beril	AYMA	beril.ayma38@gmail.com	5421979588	1985-11-10	16	f	14554132921	0
7453	Efe	KOCABAŞ	efe.kocabaş19@gmail.com	5417482940	1992-06-02	34	t	24143291518	0
7454	İrşadi	AKBAŞ	irşadi.akbaş23@gmail.com	5524308863	2003-01-06	69	t	71021033617	0
7455	Dogan	OZTAS	dogan.oztas37@gmail.com	5465372792	1999-07-05	16	t	74169614725	0
7456	Ege	KÜÇÜMEN	ege.küçümen91@gmail.com	5372997268	1998-07-20	34	f	16108727200	0
7457	Ayşegül	ÜNAL	ayşegül.ünal42@gmail.com	5531650406	1988-01-07	34	f	19654348668	0
7459	Muhammed Ramazan	EKEN	muhammed ramazan.eken93@gmail.com	5524726597	1995-12-05	49	t	14484575750	0
7460	Mesut	MUUTLU	mesut.muutlu16@gmail.com	5446178852	2000-07-13	49	t	19690058283	0
7461	Mülayim	MÜLAYİMOĞLU	mülayim.mülayimoğlu62@gmail.com	5417025932	2000-06-13	34	t	84527696011	0
7462	Anıl	ANBER	anıl.anber14@gmail.com	5592592321	1988-04-21	47	t	44719936930	0
7463	Özge	SAVAŞKURT	özge.savaşkurt14@gmail.com	5547699787	2000-01-15	34	f	21491096258	0
7464	Taha Hüseyin	ÇEBİ	taha hüseyin.çebi32@gmail.com	5401860525	1995-05-10	34	t	44296261168	0
7466	Onur	ÖZBAŞ	onur.özbaş86@gmail.com	5325124722	1999-12-27	34	t	99271316002	0
7467	Elif	ALGÜN	elif.algün35@gmail.com	5387879259	1980-06-12	34	f	57771202203	0
7468	Gözde	SAYGI	gözde.saygı31@gmail.com	5501960359	1991-03-12	45	f	13703040126	0
7469	Meltem	ŞİMŞEK	meltem.şimşek38@gmail.com	5397903918	1981-04-05	16	f	35196112236	0
7470	Erdem	ÖZBEY	erdem.özbey92@gmail.com	5593266669	1999-10-18	34	t	24723368118	0
7472	Oya	TATAROĞLU	oya.tataroğlu38@gmail.com	5563272394	1984-09-15	34	f	85605533696	0
7473	Rabia Şebnem	KETREZ	rabia şebnem.ketrez41@gmail.com	5565443172	1987-12-26	34	f	23646430890	0
7474	Murat	ŞENOL	murat.şenol68@gmail.com	5448437908	1983-05-11	6	t	65483234734	0
7478	Semih	AKSOY	semih.aksoy42@gmail.com	5354230218	1996-01-08	44	t	88441179984	0
7479	Mümin	DARIDERELİ	mümin.darıdereli55@gmail.com	5523496496	1985-03-01	34	t	69173784225	0
7480	Ezgi	ERGÜN	ezgi.ergün 69@gmail.com	5454708109	1990-12-03	34	f	16155663560	0
7481	Merve	AYDOĞAN	merve.aydoğan98@gmail.com	5346121824	2003-05-15	34	f	23584348989	0
7482	Dilan	KOCAN	dilan.kocan88@gmail.com	5599067393	1992-02-03	34	f	42456762928	0
7483	Ergun	ERDOĞAN	ergun.erdoğan82@gmail.com	5604435681	2002-02-04	34	t	85726522633	0
7484	Makbule Betül	ALTINDAĞ	makbule betül.altındağ93@gmail.com	5505467676	1989-02-08	33	f	34487058775	0
7485	Batuhan	LEVENT	batuhan.levent80@gmail.com	5491926821	1994-01-09	34	t	24821623821	0
7486	Emre	AKSOY	emre.aksoy53@gmail.com	5387044561	1984-07-24	34	t	11647703766	0
7487	İsmail	YALINKAYA	ismail.yalınkaya76@gmail.com	5504224103	1994-08-25	34	t	63140721173	0
7488	Nur Zeynep	KAYA	nur zeynep.kaya42@gmail.com	5458817576	1981-03-20	41	f	25158337759	0
7489	Şenay	KARATAŞ	şenay.karataş76@gmail.com	5593330345	2003-09-17	22	f	56366795952	0
7490	Suzra	BUYUKSIVACI	suzra.buyuksıvacı54@gmail.com	5442140556	1999-04-11	34	f	19734470516	0
7491	Aslıhan	YAVUZ	aslıhan.yavuz92@gmail.com	5376851236	1986-10-05	34	f	98090205681	0
7494	Özge	KANBAY AKSAK	özge.kanbay aksak60@gmail.com	5382714357	1997-08-09	34	f	96523389474	0
7495	Mehmet	ERDOĞAN	mehmet.erdoğan58@gmail.com	5305326475	1990-06-14	20	t	29864864233	0
7496	İsa	KENDİR	isa.kendir13@gmail.com	5579189942	1997-06-10	63	t	61089795637	0
7498	Tahir Turan	KAYA	tahir turan.kaya97@gmail.com	5483738775	1987-01-24	58	t	33032304212	0
7499	İbrahim Burak	ERYİĞİT	ibrahim burak.eryiğit10@gmail.com	5436095662	2001-10-21	27	t	20441577348	0
7500	İlhan	ARSLAN	ilhan.arslan48@gmail.com	5532903987	1993-08-08	34	t	22378162405	3
7501	Sebnem	AKMAN BALTA	sebnem.akman balta69@gmail.com	5554084561	1988-10-06	7	f	38415280104	0
7502	Onur	IŞIK	onur.ışık39@gmail.com	5321495427	1988-06-23	41	t	31339624424	0
7503	Yiğit Can	SEZER	yiğit can.sezer99@gmail.com	5504688551	1989-05-06	59	t	68229585983	0
7504	Cana	ÇÖMEZ	cana.çömez21@gmail.com	5317649611	2000-01-05	34	f	61312172988	0
7505	Cihan	AYDOĞAN	cihan.aydoğan16@gmail.com	5507949953	1998-12-16	53	t	67227670447	0
7506	Buğra Burak	BEŞLER	buğra burak.beşler91@gmail.com	5458617383	1989-11-12	6	t	59123178435	0
7507	Sevcan	ÇETİN	sevcan.çetin65@gmail.com	5417542897	2003-11-26	34	f	18567429385	0
7508	Mahmut	GÜNEY	mahmut.güney19@gmail.com	5422483382	1990-04-04	16	t	78906238083	1
7509	Miraç	ERDOĞAN	miraç.erdoğan90@gmail.com	5408169427	1982-03-18	23	t	56638533752	0
7510	Huriye	GÜN	huriye.gün11@gmail.com	5565456253	1980-03-10	34	f	20993780493	0
7511	Eda	AYDOĞAN	eda.aydoğan42@gmail.com	5381726149	1995-09-18	34	f	50922891927	0
7513	Nimet	GÜN	nimet.gün24@gmail.com	5513351319	2003-07-20	34	f	97689656380	0
7515	Ayça	GEÇTOGAN	ayça.geçtogan21@gmail.com	5573609136	1999-02-06	34	f	88271210440	0
7516	Sefa Kerim	DENİZ	sefa kerim.deniz17@gmail.com	5527053530	2003-08-17	19	t	74222434137	0
7517	Zekeriya	KARAKURT	zekeriya.karakurt23@gmail.com	5364212716	1987-12-05	34	t	90559382042	0
7518	Ecem	DEMİREL KIZILASLAN	ecem.demirel kızılaslan72@gmail.com	5438255307	1996-05-22	34	f	63813039118	0
7519	Tayfun Tuncay	TOSUN	tayfun tuncay.tosun84@gmail.com	5537326257	1997-04-16	61	t	28714148706	0
7520	Ömer Faruk	KİRAZ	ömer faruk.kiraz85@gmail.com	5566183421	1998-10-10	34	t	84835208629	0
7521	Fatih	ÇEVİK	fatih.çevik22@gmail.com	5607797326	1991-03-18	34	f	67395076454	0
7523	Hülya	ESKİ	hülya.eski19@gmail.com	5353307458	1992-04-13	52	f	11898195964	0
7524	Abdullah	KAYADUMAN	abdullah.kayaduman23@gmail.com	5513235364	1995-01-02	44	t	31615646522	0
7525	Eylül Bahar	DOĞAN	eylül bahar.doğan66@gmail.com	5564997694	1991-03-21	34	f	29351044342	0
7526	Açelya	ZENGİN ÇOLAK	açelya.zengin çolak28@gmail.com	5494426958	1994-09-04	34	f	91614781761	0
7527	Dilek	PALABIYIK	dilek.palabıyık83@gmail.com	5536786701	2000-01-04	22	f	17535614552	0
7528	Oğuzhan	ALAGÖZ	oğuzhan.alagöz85@gmail.com	5581289710	1993-06-25	34	t	24120410964	0
7529	Atilla	UÇAN	atilla.uçan60@gmail.com	5597994909	1983-10-22	34	t	40442858562	0
7531	Maral	SÜLÜN MİRİCANYAN	maral.sülün miricanyan64@gmail.com	5483406483	1986-12-02	34	f	12342500402	0
7532	Mehmet	DURGUN	mehmet.durgun67@gmail.com	5497943110	1995-07-16	27	t	62784251599	0
7533	Fatma	AYGÜL	fatma.aygül30@gmail.com	5441883895	1993-03-13	58	f	62025659869	0
7534	Fatih	ABANİK	fatih.abanik86@gmail.com	5307954260	1988-10-22	34	t	88500642988	0
7535	Erdem	KURU	erdem.kuru86@gmail.com	5477715743	1986-10-13	34	t	29943689246	0
7536	Anıl	AKDEMİR	anıl.akdemir82@gmail.com	5577857690	1983-06-01	21	t	54420376750	0
7537	Ebru	İSKENDER	ebru.iskender88@gmail.com	5365034206	1995-07-23	34	f	49329669647	0
7538	Sercan	YERDELEN	sercan.yerdelen53@gmail.com	5477870453	1995-03-11	34	t	91432858132	0
7539	Asdasd	ASDASD	asdasd.asdasd55@gmail.com	5492189271	1994-03-16	5	f	73775922291	0
7540	Ali	TOLTAR	ali.toltar56@gmail.com	5591662883	1982-01-12	4	t	14437483315	0
7541	Cenk	GÜNGÖR	cenk.güngör65@gmail.com	5503498430	2001-12-27	52	t	60099649461	0
7543	Gökçe	GÜNER	gökçe.güner53@gmail.com	5482891231	1987-02-24	34	f	93429928337	0
7544	Fatih	KARA	fatih.kara30@gmail.com	5322536201	2003-03-04	34	t	83797372904	0
7545	Zeynep	TÜRKKAN ÖZÖN	zeynep.türkkan özön89@gmail.com	5378686678	1995-05-09	34	f	41481052139	0
7546	Setenay	ÇAKIR	setenay.çakır95@gmail.com	5373688557	2000-07-04	35	f	22602348627	0
7547	Melik	CENGİZ	melik.cengiz36@gmail.com	5414902629	2003-10-10	65	t	89303356436	0
7551	Selçuk	AYAZ	selçuk.ayaz29@gmail.com	5433960829	1998-02-18	34	t	32275898715	0
7552	Mustafa	KARAER	mustafa.karaer77@gmail.com	5324282346	1981-03-07	34	t	31279643757	0
7553	Zeynep	ACAR	zeynep.acar64@gmail.com	5307687445	1986-06-08	47	f	53147549820	0
7554	Murat	UYANIK	murat.uyanık41@gmail.com	5529028200	1994-12-13	34	t	86755385576	0
7556	Esra	ÇAKICI	esra.çakıcı58@gmail.com	5328756982	1994-09-06	10	f	86356486472	0
7557	Atilla	DEMİRBİLEK	atilla.demirbilek35@gmail.com	5412789993	1999-04-14	34	t	21192626966	0
7558	Cengiz	ERDEM	cengiz.erdem32@gmail.com	5517246385	1985-07-28	36	t	48100723799	0
7559	Erdal	ULAM	erdal.ulam26@gmail.com	5409044511	2001-05-02	20	t	37394257036	0
7560	Tuğba	KEKEÇ	tuğba.kekeç94@gmail.com	5367186303	1982-11-28	58	f	23198996366	0
7561	Sefa	KARACA	sefa.karaca46@gmail.com	5443591203	1987-01-13	6	t	98867970769	0
7562	Zafer Basri	YÜKSEL	zafer basri.yüksel43@gmail.com	5417161802	1987-05-27	19	t	23336238330	0
7563	Yiğit	TANGÜL	yiğit.tangül19@gmail.com	5482461392	1987-03-12	26	t	77679762124	0
7564	Zehra	VARLIK	zehra.varlık38@gmail.com	5378935127	2001-06-13	42	f	97964094826	0
7565	Çağrı Kaan	ÇETİN	çağrı kaan.çetin42@gmail.com	5536398582	2002-05-23	7	t	96346552444	0
7566	Gökşin Nevriye	ÖRS	gökşin nevriye.örs17@gmail.com	5318775232	1982-04-20	34	f	30998231982	0
7567	Eren	ÇİÇEK	eren.çiçek28@gmail.com	5532222921	2000-11-03	16	t	87409816588	0
7568	Sinan	TOKMAKÇIOĞLU	sinan.tokmakçıoğlu44@gmail.com	5577357445	1980-11-22	6	t	77772069468	0
7570	Meral	ŞENOL	meral.şenol80@gmail.com	5441363422	1982-01-12	24	f	23789546310	0
7571	Yasin	ELDEŞ	yasin.eldeş68@gmail.com	5519049520	2000-10-04	16	t	67606900399	0
7572	Emre Can	KARABACAK	emre can.karabacak57@gmail.com	5498319462	1990-07-18	34	t	79697397134	0
7573	Murat	YILMAZ	murat.yılmaz77@gmail.com	5503885139	1980-10-09	6	t	96182076313	0
7574	Meftun	BAKSİ	meftun.baksi23@gmail.com	5406448183	1980-07-13	34	t	97504077594	0
7578	Muge Neslihan	KOC	muge neslihan.koc83@gmail.com	5414803839	1983-04-03	34	f	84655025998	0
7579	Arzu	ÇAKMAK TEKİN	arzu.çakmak tekin77@gmail.com	5478859398	2000-06-01	6	f	38216206943	0
7580	Barış	SAVAŞKAN	barış.savaşkan80@gmail.com	5452168724	1991-04-02	34	t	70094651088	0
7581	Tayfun Tuncay	TOSUN	tayfun tuncay.tosun15@gmail.com	5507081828	1991-05-20	61	t	63877112644	0
7582	Hülya	KOLSUZOĞLU	hülya.kolsuzoğlu99@gmail.com	5504318439	1993-10-14	63	f	87722697992	0
7583	Ayşe	ÖZSAVRAN	ayşe.özsavran56@gmail.com	5496316410	1992-11-09	48	f	48841923856	0
7585	Nisa	YÜKSEL	nisa.yüksel43@gmail.com	5434064803	1991-10-23	34	f	62975777520	0
7588	Hafize	DAĞLAR	hafize.dağlar 52@gmail.com	5515697441	1992-02-19	7	f	85207541657	0
7589	Muhammet Sami	ÇALIK	muhammet sami.çalık29@gmail.com	5503504681	1981-07-20	34	t	90931132181	7
7590	Ferdi	UYSAL	ferdi.uysal84@gmail.com	5532129237	1995-03-20	19	t	52338583242	0
7591	Umut	ELBİR	umut.elbir42@gmail.com	5528853781	1997-10-14	26	t	89900168681	0
7592	Birol	TEMEL	birol.temel78@gmail.com	5487347771	1985-07-05	55	t	49752932257	0
7593	Özgün	ÖZPINAR	özgün.özpınar33@gmail.com	5515319973	1982-07-18	34	t	24716207142	0
7596	Alper	DURMUŞ	alper.durmuş81@gmail.com	5371113326	2001-05-02	34	t	71645320956	0
7597	İsmail	ÖZEN	ismail.özen39@gmail.com	5318016375	2000-10-08	34	t	66769268686	0
7598	Mehmet	AKSOY	mehmet.aksoy87@gmail.com	5464160145	2002-11-15	77	t	31623271863	0
7599	Ersin	KARATAŞ	ersin.karataş94@gmail.com	5514478705	1997-08-23	34	t	36566974448	0
7600	Orhan	İŞLER	orhan.işler44@gmail.com	5474977426	1990-10-06	6	t	43505658721	0
7602	İhsan	KAMALAK	ihsan.kamalak48@gmail.com	5564116758	1983-05-03	46	t	57443006001	1
7603	Hakan	YILDIRIMOĞLU	hakan.yıldırımoğlu84@gmail.com	5572164716	1994-06-01	6	t	62374810890	0
7604	Buğra	BAYÜLKE	buğra.bayülke99@gmail.com	5387918245	1997-06-19	16	t	54618953702	0
7605	EBRU	KURTULUŞ	ebru.kurtuluş48@gmail.com	5588552261	1985-02-08	34	f	52237487817	1
7606	Duygu	ÖZCAN	duygu.özcan41@gmail.com	5447193648	1981-10-20	5	f	74326593914	0
7607	Gülay	YANMAZ	gülay.yanmaz76@gmail.com	5576131664	1986-05-02	28	f	20997904838	0
7610	Rojhat	ERENC	rojhat.erenc84@gmail.com	5442063223	1987-07-15	30	t	80451421263	0
7612	Aytekin	GÜRBÜZ	aytekin.gürbüz95@gmail.com	5524956938	1982-04-21	34	t	92795503105	0
7613	Muhammed Zahid	ALPEREN	muhammed zahid.alperen94@gmail.com	5554662288	1999-10-12	38	t	89710393276	0
7614	Buğra Vehbi	DÖNER	buğra vehbi.döner54@gmail.com	5548731707	1996-03-19	45	t	34570682759	0
7615	Abdulvehhab	AĞIN	abdulvehhab.ağın93@gmail.com	5597884111	1986-01-17	16	t	40697735593	0
7616	Ezgi	KEKLİKÇİ	ezgi.keklikçi19@gmail.com	5366487451	2002-10-07	5	f	47308452927	0
7618	Tuna	AKYIL	tuna.akyıl32@gmail.com	5467235364	2002-10-04	21	f	33696811031	0
7619	Mehmet	YAVUZ	mehmet.yavuz48@gmail.com	5316673239	2001-01-10	47	t	48104918833	7
7620	Hüseyin Can	SARAL	hüseyin can.saral98@gmail.com	5527485299	1983-03-01	34	t	22122849688	1
7621	Nihan	YAVUZ	nihan.yavuz80@gmail.com	5563642706	1982-09-08	34	f	60682644210	4
7622	Ahenk	ANBAR	ahenk.anbar71@gmail.com	5608609377	1982-10-25	34	f	39205178509	7
7623	Leyla	KAYA	leyla.kaya35@gmail.com	5501942436	2003-10-12	34	f	92621244360	0
7624	Yasemin	BOZKURT	yasemin.bozkurt49@gmail.com	5489090536	2003-09-26	9	f	13423585435	7
7625	Gülsün	ÜNAL	gülsün.ünal49@gmail.com	5348647656	1993-06-05	3	f	79326223376	7
7626	Muratcan	GÖKDEMİR	muratcan.gökdemir23@gmail.com	5392371559	1981-02-10	44	t	82152606801	7
7627	Hilal	YÜKSEL	hilal.yüksel91@gmail.com	5557710105	1981-09-26	46	f	77939316092	5
7628	Serkan	ULUÇAY	serkan.uluçay98@gmail.com	5358914735	1990-10-25	34	t	19324956885	0
7629	İlke	CİVELEKOĞLU	ilke.civelekoğlu15@gmail.com	5574757539	1984-11-16	34	f	90262780937	1
7630	Yahya	FİDAN	yahya.fidan94@gmail.com	5387249724	1990-08-09	58	t	56407746804	1
7631	Nilgün	CAMKESEN	nilgün.camkesen17@gmail.com	5457347923	1997-10-01	23	f	44509623855	0
7633	Arife	ÇITIR	arife.çıtır35@gmail.com	5492304722	1982-05-26	34	f	15737523886	1
7634	Halit	KARACA	halit.karaca98@gmail.com	5423028758	1994-05-20	44	t	34410002580	7
7637	Duygu	KARA	duygu.kara30@gmail.com	5387429165	2002-08-18	34	f	85649388683	5
7638	Berrin	ŞAHİN DİRİ	berrin.şahin diri94@gmail.com	5321579893	1986-02-24	6	f	88511386138	7
7639	Hayri	BAYRAM	hayri.bayram86@gmail.com	5428658976	1991-07-02	16	t	97098116487	7
7640	Sezgin	BİLGİN	sezgin.bilgin58@gmail.com	5548442930	1998-09-11	34	t	27259550698	1
7641	Murat	BUDAKOĞLU	murat.budakoğlu83@gmail.com	5372392520	1991-07-01	21	t	31870420752	7
7642	Mustafa	KUMRAL	mustafa.kumral64@gmail.com	5326785485	1986-09-10	67	t	77832333020	8
7643	Hayrettin	KAPLAN	hayrettin.kaplan13@gmail.com	5604876199	1999-05-12	33	t	18434769088	7
7644	Mahmut	ÖZTÜRK	mahmut.öztürk77@gmail.com	5381664924	1988-01-10	34	t	90930810416	6
7645	PINAR	SÖZER	pınar.sözer91@gmail.com	5515727231	1989-01-08	6	f	40709812348	1
7646	Melda	ŞUAYİPOĞLU	melda.şuayipoğlu10@gmail.com	5411759573	1986-04-19	6	f	71475113229	1
7647	AŞKIN	DÜŞÜNDERE	aşkın.düşündere26@gmail.com	5364147756	1998-11-19	59	f	51390342806	3
7648	Yusuf Ziyaeddin	SÖNMEZ	yusuf ziyaeddin.sönmez95@gmail.com	5554711414	1998-07-14	35	t	32957010763	0
7649	Hale	ORUÇ	hale.oruç57@gmail.com	5363255619	1994-03-28	6	f	13516751197	7
7650	İHSAN BURAK	YILMAZ	ihsan burak.yılmaz93@gmail.com	5501795117	2002-11-04	34	t	53258151035	0
7654	Sercan	GÜRLER	sercan.gürler50@gmail.com	5455033790	2003-03-24	26	t	35183920788	1
7655	Hanife Özlem	SERTEL BERK	hanife özlem.sertel berk91@gmail.com	5576323524	1985-11-26	34	f	77859887084	0
7656	SEDA	AYCİBİN	seda.aycibin17@gmail.com	5383831562	1998-01-21	34	f	43185145962	0
7657	AHMET FARUK	ARSLAN	ahmet faruk.arslan30@gmail.com	5473170929	1980-03-17	61	t	31443990710	0
7658	Bülent	GÜNCELER	bülent.günceler69@gmail.com	5564170684	2002-05-09	1	t	68010570000	1
7659	Murat	ÖZPEHLİVAN	murat.özpehlivan45@gmail.com	5311169207	1985-01-20	44	t	59372592174	7
7661	TANSU	TÜRKAN	tansu.türkan87@gmail.com	5361382655	1999-01-14	34	f	79033293188	0
7662	AYSU MELEK	ÇOLAK	aysu melek.çolak70@gmail.com	5457219264	1991-01-19	34	f	79362791594	0
7664	SERHAT	KARATUM	serhat.karatum65@gmail.com	5395586102	1996-06-25	34	t	78337386917	0
7665	AYSUN	DURMUŞ	aysun.durmuş57@gmail.com	5312872170	2000-10-25	34	f	46032954430	0
7666	BURCU	ÜRÜNDÜ	burcu.üründü16@gmail.com	5361900762	1986-05-03	34	f	90753531845	0
7669	AYŞE BİLSAY	DEVELİ	ayşe bilsay.develi75@gmail.com	5535322819	1989-02-24	42	f	37384289123	0
7672	Sümeyra	AYDINER	sümeyra.aydıner51@gmail.com	5377187233	1994-10-02	34	f	77958370092	0
7673	FATİH	KULAKSIZ	fatih.kulaksız62@gmail.com	5372961910	1995-10-26	53	f	41154156207	0
7674	ESRA	ALBAY	esra.albay96@gmail.com	5507512599	1980-03-10	46	t	26573342190	0
7675	MURAT	KUŞ	murat.kuş56@gmail.com	5486032286	1995-09-05	34	t	87230840428	0
7677	Halit	UYANIK	halit.uyanık50@gmail.com	5345262806	1984-05-18	1	t	36955230751	7
7680	Özge	ALTAN	özge.altan79@gmail.com	5348136236	1988-11-08	42	f	77545899342	3
7681	GÜLŞAH	KOÇAK	gülşah.koçak92@gmail.com	5494716433	1987-04-12	69	f	52421986421	0
7682	EBRU	ASAR	ebru.asar11@gmail.com	5521040831	1982-02-02	34	f	64016057604	0
7683	Neslihan	ARICI	neslihan.arıcı26@gmail.com	5366000499	1997-12-06	16	f	50648229497	1
7684	Uzay	DURAL ŞENOĞUZ	uzay.dural şenoğuz88@gmail.com	5607894609	1996-06-01	34	f	40089918790	7
7685	Muhammet Zahit	ATÇIL	muhammet zahit.atçıl23@gmail.com	5516265108	1996-08-09	34	t	55567534728	0
7686	Mehveş	Tarım	mehveş.tarım45@gmail.com	5406706912	1987-10-15	34	f	11608796353	1
7687	MAKBULE	KALI SOYER	makbule.kalı soyer87@gmail.com	5363628951	1986-09-09	44	f	32182536740	1
7688	AHMET	ÖZTÜRK	ahmet.öztürk65@gmail.com	5465718645	1998-03-18	28	t	24360449695	8
7689	Ömer	DİNÇER	ömer.dinçer59@gmail.com	5576915247	1981-08-14	70	t	10792610288	0
7691	MERT	SEZER	mert.sezer70@gmail.com	5565039249	1986-02-02	34	t	11870861869	0
7692	BURCU	PAKFİLİZ	burcu.pakfiliz75@gmail.com	5314942895	1985-04-03	34	f	55366837157	0
7693	BEYZA	YAMAN	beyza.yaman69@gmail.com	5568969469	1995-09-16	6	f	58046309428	0
7694	ADEM	BALCI	adem.balcı46@gmail.com	5356023837	1981-09-03	34	t	69546647573	0
7695	NAZLI	ECE	nazlı.ece80@gmail.com	5525955152	1986-08-06	34	f	85602304092	0
7696	GÖKHAN	YILDIRIM	gökhan.yıldırım30@gmail.com	5464069825	1988-11-01	34	t	43744269748	0
7698	SERTAÇ	KURTULMUŞ	sertaç.kurtulmuş68@gmail.com	5324197170	1998-05-15	34	t	38920044960	0
7700	Çiğdem	Yumbul	çiğdem.yumbul41@gmail.com	5417339176	1996-09-19	55	f	55370715279	1
7701	HAYRİYE PINAR	ÖZKAN	hayriye pınar.özkan92@gmail.com	5432214838	1996-05-05	34	f	97462192888	7
7702	AYLİN	POROY ARSOY	aylin.poroy arsoy46@gmail.com	5402919991	1980-07-23	16	f	41633098035	7
7703	ORHAN	GÜMÜŞEL	orhan.gümüşel74@gmail.com	5535563919	1991-06-11	6	t	35945480262	1
7704	Mehmet Arif	ÖZER	mehmet arif.özer44@gmail.com	5397261503	2001-05-13	46	t	25867247799	1
7708	Zehra Gül	Yiğit	zehra gül.yiğit52@gmail.com	5338212386	2003-09-01	34	f	23621605714	1
7709	Yusuf	Ermez	yusuf.ermez54@gmail.com	5581904258	1986-04-10	16	t	80918476533	0
7710	Yasin	YIGIT	yasin.yıgıt62@gmail.com	5502424937	1980-07-01	60	t	39174811749	8
7712	SERACETTİN ÖZGÜR	ORAL	seracettin özgür.oral69@gmail.com	5607823197	1987-07-09	21	t	99872303068	0
7713	CENGİZ	GENÇ	cengiz.genç10@gmail.com	5536320103	1986-05-16	6	t	37510063618	7
7715	MÜGE	YOĞUN	müge.yoğun51@gmail.com	5525979156	2001-11-06	16	f	51813752705	0
7716	SELVİ	SELÇUK	selvi.selçuk84@gmail.com	5593656985	2002-02-16	35	f	72418456085	0
7717	LÜTFİYE	KARAKAFA	lütfiye.karakafa38@gmail.com	5443858763	1989-08-23	16	f	59249651380	0
7718	EMRULLAH	KILIÇ	emrullah.kılıç75@gmail.com	5503478673	1992-01-08	20	t	36983455034	0
7719	JÜLİDE	SUYABAKAN	jülide .suyabakan22@gmail.com	5496574649	1985-02-25	16	f	87841930118	1
7720	BEGÜM	TARI	begüm.tarı95@gmail.com	5444198136	1986-06-10	16	f	72119883322	3
7723	İREM NUR	ACON	irem nur .acon15@gmail.com	5538608177	1986-02-18	16	f	50764408859	0
7724	ÖZLEM	AYVAZ	özlem.ayvaz74@gmail.com	5467230412	1993-08-21	16	f	43333136144	0
7725	KAHRAMAN	AYDIN	kahraman.aydın29@gmail.com	5302914898	1990-08-23	36	t	77978228101	0
7726	BERFU	SARI	berfu.sarı66@gmail.com	5431841498	1992-01-07	16	f	58042879081	0
7728	SİBEL	ÇAKIROĞLU	sibel.çakıroğlu74@gmail.com	5565035576	1980-02-10	16	f	74945201669	5
7729	ECEM CEREN	BEŞİKÇİOĞLU	ecem ceren.beşikçioğlu77@gmail.com	5553202749	1996-02-12	16	f	90434348231	0
7730	ÇİĞDEM	DEMİRTAŞ	çiğdem.demirtaş72@gmail.com	5561220156	1983-06-28	10	f	69394466926	0
7731	DEMET	YILMAZ	demet.yılmaz45@gmail.com	5488332103	1980-09-06	16	f	75578388677	0
7733	Erol	KAHVECİ	erol.kahveci87@gmail.com	5497866561	1989-06-21	35	t	96809103749	1
7734	Mehmet Fatih	ÇITLAK	mehmet fatih.çıtlak81@gmail.com	5481941743	1990-08-03	34	t	23985182929	0
7735	Nedret	APAYDIN	nedret.apaydın42@gmail.com	5348693390	1989-09-03	34	t	71702541314	1
7736	Hacı Ahmet	Arslantürk	hacı ahmet.arslantürk47@gmail.com	5538121336	2001-07-15	46	t	39290754661	0
7737	Fatma	YILMAZ	fatma.yılmaz35@gmail.com	5418659328	1998-05-24	45	f	64978840765	1
7738	Mert	OSKAN	mert.oskan42@gmail.com	5377698117	1997-08-18	16	t	82480957528	1
7740	Bilge	YAVUZ	bilge.yavuz31@gmail.com	5454244552	1995-12-05	55	f	13639071145	0
7741	Sinan	TÜYSÜZ	sinan.tüysüz54@gmail.com	5593839455	1984-11-20	34	t	62668782854	0
7742	Caner	NACAR	caner.nacar77@gmail.com	5558807882	2000-10-27	27	t	25795879243	0
7744	Zeynep Selin	ÖZDEN	zeynep selin.özden43@gmail.com	5553704448	1982-01-18	19	f	72509326757	0
7745	nca	DURUKAN	nca.durukan74@gmail.com	5305725774	1996-12-11	34	f	58235512238	0
7746	Özge	DİNÇ	özge.dinç83@gmail.com	5566832319	1990-09-19	34	f	19460386952	0
7747	Kübra	ER	kübra.er44@gmail.com	5535895315	1983-03-14	31	f	28342840690	0
7748	Ayça	NAYMAN	ayça.nayman72@gmail.com	5565738733	1998-03-04	35	f	23995794482	0
7749	Halid	KANDEMİR	halid.kandemir70@gmail.com	5608436291	1986-02-20	34	t	67802215198	1
7751	Sevim	EKE	sevim.eke22@gmail.com	5363003130	1983-03-16	35	f	44346113562	0
7752	Bilge	CELİK	bilge.celik64@gmail.com	5448936981	1985-05-11	34	f	86073417188	0
7753	Dilara	GASER	dilara.gaser50@gmail.com	5369199576	1988-05-09	54	f	68954043462	0
7756	Mustafa Sabri	KÜÇÜKAŞÇI	mustafa sabri.küçükaşçı88@gmail.com	5427957545	1987-11-02	42	t	31011546077	3
7759	Fethi Berk	GÜLER	fethi berk.güler13@gmail.com	5581519156	1985-04-24	22	t	47290553507	0
7760	Gülay	IŞKIN NAMLI	gülay.ışkın namlı92@gmail.com	5438466113	1982-12-21	44	f	84770214870	3
7761	Gülay	KORKMAZ	gülay.korkmaz49@gmail.com	5443352628	1999-09-10	16	f	66194904992	0
7762	Ömer	KAYA	ömer.kaya38@gmail.com	5388365218	1987-08-14	4	t	98785715728	0
7763	Aslı	GÜNAYDINOĞLU	aslı.günaydınoğlu 28@gmail.com	5513819259	1987-05-26	34	f	19792475771	0
7764	Furkan	ÖZYILMAZ	furkan.özyılmaz14@gmail.com	5357104410	1997-08-15	54	t	71577131755	0
7766	Melike	BÜYÜKHAMURKAR	melike.büyükhamurkar20@gmail.com	5446461789	1996-01-04	34	f	32809945620	0
7768	Emre	BULUT	emre.bulut87@gmail.com	5467475541	1994-01-18	34	t	93490689993	0
7770	Yunus Emre	KARAGÖZ	yunus emre.karagöz76@gmail.com	5423539306	2000-02-28	34	t	29767786264	0
7771	Sara	YAZICIOĞLU	sara.yazıcıoğlu21@gmail.com	5494300960	1997-11-26	34	f	38441868773	0
7774	Hande	KUŞ	hande.kuş79@gmail.com	5527883655	1998-06-16	34	f	30621779729	0
7775	Kübra	ÇELİK	kübra.çelik55@gmail.com	5471159418	1997-10-22	55	f	69762786338	0
7777	Şeyda	HATUNOĞLU	şeyda.hatunoğlu21@gmail.com	5497069208	2001-03-26	64	f	56603195679	0
7778	Cansu	YAVUZ	cansu.yavuz46@gmail.com	5463801902	1994-08-05	22	f	91765420171	0
7779	Murat	GÜNAL	murat.günal75@gmail.com	5357373455	1987-05-14	33	t	76115750832	0
7780	Turan	FIRAT	turan.fırat56@gmail.com	5426965531	2001-01-20	34	t	36710688215	0
7781	Hüseyin	YILDIZDOĞAN	hüseyin.yıldızdoğan68@gmail.com	5562607604	1987-06-05	34	t	49261712742	0
7782	Ece	SOYUBOL	ece.soyubol94@gmail.com	5441108410	2001-01-15	16	f	93359780103	0
7783	Süleyman	SARAÇ	süleyman.saraç90@gmail.com	5535253687	2001-10-21	41	t	30176566400	0
7784	Pınar	ARSLAN	pınar.arslan50@gmail.com	5603730444	1992-05-17	6	f	53977377966	1
7785	Aycan	ERİNSEL ÖZİSTEK	aycan.erinsel özistek47@gmail.com	5405090866	1993-07-28	34	f	29931474001	0
7787	Anı	ERTAN	anı.ertan34@gmail.com	5597782174	1997-12-19	34	f	80069821362	0
7788	Osman	ÇENGİL	osman.çengil35@gmail.com	5587309435	1984-05-12	48	t	70266244884	7
7789	Abdurrahman	ÖZBEK	abdurrahman.özbek15@gmail.com	5384346198	1982-03-04	34	t	98930941305	0
7790	Göknur	ÖZER	göknur.özer83@gmail.com	5593053378	1981-09-11	77	f	92040187363	0
7791	Hande	ÇETİNTAŞ	hande.çetintaş78@gmail.com	5314962828	1986-07-03	39	f	68085365098	0
7792	Ayşegül	ATAK	ayşegül.atak47@gmail.com	5358596937	1994-04-12	27	f	59931007080	1
7794	Selma	USLUOĞLU	selma.usluoğlu29@gmail.com	5458435486	2000-03-10	31	f	57491907238	1
7795	Orkun	İNCE	orkun.ince66@gmail.com	5503637946	1998-08-08	6	t	88696046378	0
7796	Kerem	YÜKSELOĞLU	kerem.yükseloğlu16@gmail.com	5605679962	1992-09-10	34	t	81398141045	0
7797	Armağan	GÜVERCİN	armağan.güvercin18@gmail.com	5441310654	1999-12-20	34	t	36371615921	0
7799	Erman	ARSLAN	erman.arslan63@gmail.com	5552103723	1985-12-25	6	t	77475148468	0
7800	Şimal	CEYLAN	şimal.ceylan43@gmail.com	5461805208	1989-02-02	34	f	80383520242	0
7802	Ersin	ÇETİN	ersin.çetin76@gmail.com	5376795727	2003-02-22	16	t	14987861595	7
7803	Mehmet Kürşad	AKTAŞ	mehmet kürşad.aktaş67@gmail.com	5597733471	1991-07-14	6	t	50221841739	0
7804	Berna	YALAZ	berna.yalaz61@gmail.com	5355081174	1990-10-27	57	f	25039278623	0
7805	Can Ahmet	ÇİMEN	can ahmet.çimen97@gmail.com	5467837581	1996-06-18	34	t	69172589386	1
7806	Süleyman Enes	KILIÇ	süleyman enes.kılıç52@gmail.com	5537422524	1984-12-25	34	t	93634541534	0
7807	Belgin	ALÇAY	belgin.alçay77@gmail.com	5453467909	1998-06-13	34	f	82404573034	0
7808	Bilgehan	IŞIK	bilgehan.ışık22@gmail.com	5515562720	1982-12-04	44	t	40472311964	0
7810	Ali	ŞEKER	ali.şeker24@gmail.com	5443377903	1983-06-10	54	t	86723490611	0
7812	Kerem	ÖZÇAKMAK	kerem.özçakmak15@gmail.com	5418607787	1995-01-14	34	t	40175368299	0
7814	Mehmet	CEBECİ	mehmet.cebeci26@gmail.com	5494711636	1989-11-13	34	t	60133608294	1
7815	İbrahim	ÇELİKBİLEK	ibrahim.çelikbilek61@gmail.com	5568012837	1994-12-13	36	t	15047685053	0
7816	Hilal Eda	BÜLBÜL	hilal eda.bülbül48@gmail.com	5479085884	1986-07-23	42	f	35565746485	0
7818	Fera	AD	fera.ad14@gmail.com	5322214553	2002-10-02	1	f	18270405659	0
7819	Sinan	TEPE	sinan.tepe34@gmail.com	5561342807	1996-11-05	62	t	92725037619	0
7828	Göktuğ	DUYAR	göktuğ.duyar24@gmail.com	5481548457	1998-09-02	34	t	50370031433	1
7830	Arınç	KURT	arınç.kurt51@gmail.com	5545422202	2000-02-06	67	t	35362933245	0
7831	Nurcan	ÇOBAN	nurcan.çoban25@gmail.com	5415935671	1984-04-10	34	f	83466507092	0
7832	Harun	UĞUR	harun.uğur85@gmail.com	5385856742	1990-11-23	34	t	12150495144	0
7833	Esma	KOCAAĞALAR	esma.kocaağalar64@gmail.com	5351364753	1996-02-12	59	f	39779199441	0
7834	Merve	İLERİ	merve.ileri74@gmail.com	5318244449	1983-10-23	67	f	89482049363	0
7835	Sümeyye	AÇIKGÖZ	sümeyye.açıkgöz65@gmail.com	5354316873	2000-12-18	70	f	75021141205	0
7836	İlkay	GÜRSOY	ilkay.gürsoy12@gmail.com	5582424135	1983-02-27	35	f	67477003912	0
7837	Merve	AKTAŞ	merve.aktaş15@gmail.com	5512368369	2000-10-14	34	f	53494149596	0
7838	Alican	KAN	alican.kan 60@gmail.com	5374349870	1980-08-28	34	t	48602355973	1
7839	Kemal	BORANDAĞ	kemal.borandağ17@gmail.com	5464325839	1989-07-08	34	t	14748526044	0
7841	Uğur Baran	BENTEŞEN	uğur baran.benteşen41@gmail.com	5563417101	1994-10-22	21	t	49091838725	0
7844	Faruk	ÇAKMAK	faruk.çakmak10@gmail.com	5608685193	2001-08-06	34	t	95908158232	0
7845	Zekeriye	ÇİL	zekeriye.çil36@gmail.com	5553661906	1990-03-27	80	t	29822947849	0
7846	Buğra	ÇELİK	buğra.çelik37@gmail.com	5568464278	1983-06-21	34	t	33553635814	0
7847	Semire	SOYHAN	semire.soyhan15@gmail.com	5495085922	1993-11-12	34	f	54786970930	0
7848	Enes	BEKTAŞ	enes.bektaş50@gmail.com	5531090580	1984-12-04	61	t	89470245521	0
7849	Aykut	KAYA	aykut.kaya61@gmail.com	5517725539	1989-02-26	3	t	58585978753	0
7850	Gülşah	TEKMİL	gülşah.tekmil17@gmail.com	5506854664	1994-01-12	34	f	17117163289	0
7851	Meryem	GUREL	meryem.gurel67@gmail.com	5432655161	1981-11-13	34	f	27400451505	0
7852	Yasemin	CEYLAN	yasemin.ceylan 26@gmail.com	5438338845	2000-02-11	34	f	94083064323	0
7854	Emel	DURSUN	emel.dursun70@gmail.com	5476950437	1990-01-10	34	f	17378014899	0
7855	Fevzi Melih	ÇÖL	fevzi melih.çöl91@gmail.com	5552288557	1991-02-18	34	t	69463747938	0
7856	Arif	ALABACA	arif.alabaca82@gmail.com	5506980457	2001-10-01	34	t	69408712561	0
7857	Yunus Emre	DEMİREL	yunus emre.demirel72@gmail.com	5374523849	1985-07-18	34	t	81651933006	0
7859	Metin Erkan	ÇEKMEZ	metin erkan.çekmez24@gmail.com	5492668117	1981-10-21	34	t	73901343631	1
7862	İclal	YAZİCİ	iclal.yazici94@gmail.com	5432506925	1994-05-22	34	f	13456561482	0
7863	Yağmur	ÖZENCİ	yağmur.özenci42@gmail.com	5434316953	1984-07-19	6	f	77960945263	0
7864	Zeynep	ÇETİN	zeynep.çetin91@gmail.com	5413568964	1994-09-15	59	f	59840877420	0
7865	Abdullah Zübeyr	ŞEKERCİ	abdullah zübeyr.şekerci50@gmail.com	5368568925	1988-12-02	34	t	59619300240	0
7868	Rıza Emre	BODUR	rıza emre.bodur36@gmail.com	5336593859	1997-10-11	32	t	40205222166	3
7871	Gökmen Burak	KURTARAN	gökmen burak.kurtaran46@gmail.com	5502471277	1986-07-03	6	t	55173839827	0
7873	Merve	ÖZ	merve.öz54@gmail.com	5363234272	1999-08-12	37	f	22347169100	0
7874	Enes	ŞANLI	enes.şanlı14@gmail.com	5515357347	1983-01-03	34	t	23283503146	0
7878	Erdi	TURAL	erdi.tural81@gmail.com	5327947870	1995-12-08	55	t	86676855604	0
7880	Oguzhan	TÜMAYMAN	oguzhan.tümayman61@gmail.com	5515249785	1995-12-21	34	t	82520596988	0
7881	Adem	BEYAZ	adem.beyaz58@gmail.com	5592816825	1992-04-21	79	t	20631806453	0
7882	Esra	ORHAN	esra.orhan65@gmail.com	5572405828	1983-01-17	34	f	16446293037	0
7884	Orçun	KANDEMİR	orçun.kandemir99@gmail.com	5593745205	1998-07-13	10	t	56642660228	0
7886	Merve Gül	SEFERİNOĞLU	merve gül.seferinoğlu98@gmail.com	5391285544	1981-12-09	34	f	41695694290	0
7888	Erdem	GUVEN	erdem.guven65@gmail.com	5414176428	1982-03-20	34	t	51489803989	0
7889	Ahmet Görkem	ÖZDOĞAN	ahmet görkem.özdoğan55@gmail.com	5598948592	1985-11-17	1	t	63540508937	0
7890	İbrahim	TÜLEYLİOĞLU	ibrahim.tüleylioğlu11@gmail.com	5584952572	1988-10-12	31	t	44811078143	0
7891	Seda	SAĞLAM	seda.sağlam40@gmail.com	5456264812	1999-01-21	6	f	67153837987	0
7892	Mehmet	KURDAŞ	mehmet.kurdaş68@gmail.com	5333338290	2002-04-11	34	t	15454815776	0
7893	Mehmet Emre	ÖLMEZ	mehmet emre.ölmez21@gmail.com	5577728165	1990-07-26	46	t	58840093292	0
7898	Ameer	ALMASRİ	ameer.almasri40@gmail.com	5421634995	1996-04-04	32	t	28579023923	0
7900	İlhan	ÖZTOZLU	ilhan.öztozlu48@gmail.com	5584597179	1988-03-10	16	t	35720149961	0
7902	Benan	GEDİK	benan.gedik52@gmail.com	5581609147	1980-07-12	34	f	82231677539	0
7905	İmer Buse	YAĞIZ	imer buse.yağız95@gmail.com	5393838483	2001-10-08	67	f	63587646165	0
7906	Kübra	NAR	kübra.nar74@gmail.com	5321302612	1992-10-20	34	f	99551344156	0
7907	Naz	KOCAÇINAR	naz.kocaçınar72@gmail.com	5354379424	1994-10-02	34	f	30306614003	0
7910	Zafer	BUNSUZ	zafer.bunsuz46@gmail.com	5498360788	1991-07-12	34	t	71316512131	6
7911	Seher	KADIOĞLU	seher.kadıoğlu76@gmail.com	5465665218	1995-01-19	34	f	11140879282	0
7913	Koray	DAĞ	koray.dağ45@gmail.com	5592664129	1987-03-05	34	t	97864152718	0
7916	Abdullah Dursun	ARABACI	abdullah dursun.arabacı88@gmail.com	5485097367	1984-05-21	42	t	40202049087	0
7917	Özhan	OTAY	özhan.otay62@gmail.com	5405358553	2000-02-15	34	t	36920862647	0
7920	Selda	ŞENTÜRK YILDIRIM	selda.şentürk yıldırım51@gmail.com	5543192944	1998-08-03	41	f	69730164417	0
7921	Cem	ERDEM	cem.erdem56@gmail.com	5557622142	1998-02-11	34	t	56091708635	0
7925	Bahadır	TOMAÇ	bahadır.tomaç64@gmail.com	5421706714	1994-07-10	6	t	37753850296	0
7926	Şamil	ARSLAN	şamil.arslan24@gmail.com	5458607855	1992-08-13	10	t	91756783966	0
7930	İsmet	GÖKGÖZ	ismet.gökgöz61@gmail.com	5366434530	1990-06-18	34	t	99310019755	0
7932	Rabia	AŞAĞIDAĞ	rabia.aşağıdağ54@gmail.com	5383715620	2003-05-11	34	f	93851012841	0
7935	Aves	DENETMEN	aves.denetmen90@gmail.com	5514462148	2001-11-19	6	t	29467627142	0
7936	Aves	DENETMEN	aves.denetmen67@gmail.com	5503633952	1980-11-26	6	t	46955577195	0
7938	Yusuf	ÖZ	yusuf.öz36@gmail.com	5345319109	2000-03-12	25	t	90075551445	0
7941	Kenan	TUNCER	kenan.tuncer42@gmail.com	5437044518	1997-12-11	72	t	38076685787	0
7942	Jülide Ceren	ŞAHİN	jülide ceren.şahin62@gmail.com	5528475857	1997-09-01	34	f	46205972159	0
7946	Mücahit	ÇEVİK	mücahit.çevik55@gmail.com	5558463466	2000-01-02	58	t	40178633868	0
7952	Hamdi	APALI	hamdi.apalı99@gmail.com	5564369852	1985-02-09	42	t	49284363800	0
7955	Levent	KAYA	levent.kaya62@gmail.com	5447121747	1993-01-24	34	t	82771663332	0
7956	Ömer	ŞİRİN	ömer.şirin47@gmail.com	5322741188	2002-07-11	59	t	47565626459	0
7960	Ela	CENGİZ	ela.cengiz46@gmail.com	5466315465	1992-04-03	8	f	86022135278	0
7969	Tan Berk	AKI	tan berk.akı48@gmail.com	5543308522	1980-10-12	55	t	12209061573	0
7973	Duygu	AKAR	duygu.akar94@gmail.com	5522533228	1987-06-14	77	f	20295401122	0
7975	Seyit Efe	ÇİFCİ	seyit efe.çifci40@gmail.com	5473793435	1995-03-05	5	t	26009389367	0
7976	Kübranur	ZEBUNOĞLU	kübranur.zebunoğlu70@gmail.com	5308659861	1986-10-16	34	f	90764442470	0
7978	Erim Yalım Can	KUTLUKAN	erim yalım can.kutlukan84@gmail.com	5603347158	1999-07-19	34	t	62022376445	0
7980	Mehmet	BULUT	mehmet.bulut42@gmail.com	5491556818	2001-06-18	50	t	44439041931	0
7981	Ayşe Merve	ÇAĞLAYAN	ayşe merve.çağlayan36@gmail.com	5345721247	1987-08-27	34	f	35904527568	0
7983	Elif	GÜREL	elif.gürel71@gmail.com	5561118688	1982-06-17	3	f	16636537913	0
7984	Umutcan	PEKTETİK	umutcan.pektetik98@gmail.com	5418784388	2003-05-01	34	t	32425794000	0
7985	Muğdat	BARAN	muğdat.baran70@gmail.com	5488954411	1982-11-20	65	t	13633648932	0
7987	Suat	ÖZÇELİK	suat.özçelik12@gmail.com	5356869469	1981-02-17	25	t	78827959361	0
7991	Selin	PAZARBAŞI	selin.pazarbaşı21@gmail.com	5445881707	1983-11-02	52	f	32692666153	0
7992	Melda	TANRIKULU	melda.tanrıkulu61@gmail.com	5478132751	1988-07-06	34	f	59347745707	0
7996	Murat	ÖZCAN	murat.özcan76@gmail.com	5478192977	1989-12-24	34	t	48331863850	0
8005	Habib Can	ERDOĞAN	habib can.erdoğan71@gmail.com	5507431690	1984-08-21	38	t	40125434097	0
8007	Muhammed Emin	YILDIZ	muhammed emin.yıldız13@gmail.com	5544631554	1988-04-23	34	t	28740393416	0
8008	Salih	ÇAKIR	salih.çakır15@gmail.com	5591322820	1998-04-26	55	t	17302209096	0
8009	Taha Erham	KELEŞ	taha erham.keleş58@gmail.com	5408450683	1988-10-15	34	t	78682013253	0
8011	Emre	ER	emre.er57@gmail.com	5379107542	1988-12-27	25	t	15563606911	0
8012	Nihal Gözde	SUBAŞI	nihal gözde.subaşı74@gmail.com	5583350874	1988-02-04	21	f	79790941292	0
8013	Çiğdem	GENÇ	çiğdem.genç45@gmail.com	5538815695	1991-06-04	48	f	52837217415	0
8015	Esat	KINIŞ	esat.kınış53@gmail.com	5408282799	1996-10-26	56	t	49761356772	0
8016	Hayati	USTA	hayati.usta97@gmail.com	5378836481	1994-10-17	52	t	64304921517	0
8017	Mehmet Fatih	KORKUT	mehmet fatih.korkut28@gmail.com	5397736146	1996-08-19	34	t	16027634594	0
8019	Burak	YILDIRIM	burak.yıldırım34@gmail.com	5437853761	2003-10-13	34	t	82826609955	0
8022	Nuri	ÜYEPAZARCI	nuri.üyepazarcı72@gmail.com	5565236505	1993-05-23	34	t	63124674096	0
8023	Doğuş Can	ÇİÇEKLİ	doğuş can.çiçekli78@gmail.com	5495725630	2002-10-01	34	t	59600641530	0
8026	Duygu	BAYRAKTAR	duygu.bayraktar18@gmail.com	5503055916	2001-11-05	16	f	28713548165	0
8027	Çiğdem	SARI	çiğdem.sarı53@gmail.com	5442370286	1987-03-22	19	f	45889890791	0
8028	Ayşegül	TUNCER	ayşegül.tuncer12@gmail.com	5377865943	1988-11-02	34	f	45459541007	0
8029	Nurullah	AKDEMİR	nurullah.akdemir86@gmail.com	5543502856	1994-01-07	49	t	96647897230	0
8031	Fatih	ALTUN	fatih.altun44@gmail.com	5445936933	1994-05-08	38	t	10634358166	0
8032	Zühal	YAVUZ	zühal.yavuz47@gmail.com	5497357645	2001-07-28	34	f	95046567926	0
8034	Tamer	YILMAZ	tamer.yılmaz70@gmail.com	5495275919	2002-06-28	56	t	52970984416	0
8036	Lokman	KILIÇ	lokman.kılıç 67@gmail.com	5482649191	1983-04-27	34	t	72142427890	0
8037	Yusuf	ÜNAL	yusuf.ünal38@gmail.com	5514572751	1982-09-11	5	t	61925759353	0
8038	Mert	ÖNBEY	mert.önbey40@gmail.com	5463080390	1985-10-04	34	t	49208417898	0
8043	Bekir	YILDIZ	bekir.yıldız33@gmail.com	5511111625	1988-06-27	27	t	40671328588	0
8044	Hatice Kübra	TEKEREK	hatice kübra.tekerek90@gmail.com	5597092653	1985-09-09	46	f	68218267548	0
8045	Nevzat	YUŞAN	nevzat.yuşan16@gmail.com	5468200163	1992-12-16	27	t	99659572168	0
8046	Özge	PEYİK	özge.peyik81@gmail.com	5439199972	1987-01-03	34	f	75462418531	0
8047	İbrahim	YÖRÜK	ibrahim.yörük44@gmail.com	5496887535	1987-11-04	70	t	56790341796	0
8048	Eda	HEPDİNÇLER	eda.hepdinçler79@gmail.com	5411593883	2000-11-27	34	f	95583138652	0
8051	Pınar Damla	UZUNOĞLU	pınar damla.uzunoğlu37@gmail.com	5526910298	2003-07-19	34	f	22280576950	0
8052	Halil	DALGIÇ	halil.dalgıç 64@gmail.com	5514584107	1981-04-21	10	t	22964552898	0
8053	Ahmet Akif	DEMİRBAŞ	ahmet akif.demirbaş57@gmail.com	5584513434	1991-11-27	67	t	36727203637	0
8054	Nazlı	YASARİ	nazlı.yasari22@gmail.com	5402421728	1993-12-20	17	f	57015737515	0
8055	Çağla	ÖZ	çağla.öz45@gmail.com	5311754928	1991-09-04	34	f	30462875058	0
8056	Remzi	AKTURK	remzi.akturk62@gmail.com	5463820229	2003-03-13	26	t	29703321853	0
8057	Cansu	VAROL	cansu.varol46@gmail.com	5412900869	1987-07-06	32	f	66827487579	0
8059	Öztürk	BEYRİBEY	öztürk.beyribey65@gmail.com	5522278256	1988-03-04	23	t	73146869244	0
8060	Ceren	TÜRKAY	ceren.türkay80@gmail.com	5526431507	2001-01-28	34	f	40517433316	0
8061	Bekir	ÖZBULUT	bekir.özbulut95@gmail.com	5431452836	1983-09-20	1	t	48244194519	0
8062	Fatih	CEVAHİROĞLU	fatih.cevahiroğlu 46@gmail.com	5442056609	1980-06-17	34	t	40153134360	1
8063	İrem Nur	YENİDÜNYA	irem nur.yenidünya62@gmail.com	5504923104	1991-06-27	34	f	87429946766	0
8064	Erdem	BOSTAN	erdem.bostan50@gmail.com	5534378236	2002-11-19	34	t	31497975713	0
8065	Seren	TURAN	seren.turan25@gmail.com	5595161114	2000-07-11	59	f	41173924196	0
8066	Telat	KÜÇÜKKARIŞ	telat.küçükkarış15@gmail.com	5581411975	1996-01-09	39	t	82507921089	0
8067	Fatih Zahid	GENÇ	fatih zahid.genç30@gmail.com	5484272603	2002-12-04	61	t	12811765990	0
8068	Gökçe	OTTAŞ	gökçe.ottaş41@gmail.com	5549017439	1980-08-09	34	f	82569004354	0
8070	Betül	KIRATLI	betül.kıratlı85@gmail.com	5304633205	1993-12-13	54	f	62967485909	0
8072	Betül	COŞKUN	betül.coşkun17@gmail.com	5458563479	1984-06-16	7	f	57390494704	0
8073	Ayla	URAZ	ayla.uraz56@gmail.com	5486233243	1983-05-03	18	f	74791239618	0
8074	Hilal	ŞENDİR	hilal.şendir27@gmail.com	5527385653	1999-11-23	58	f	33043639475	0
8075	Pınar	POLAT	pınar.polat49@gmail.com	5481970194	2000-07-18	5	f	49692117610	0
8076	Ali Emre	ÇINGIR	ali emre.çıngır96@gmail.com	5371377286	1998-05-23	16	t	64258562101	0
8077	Zeynep Ceren	BİLGİÇ	zeynep ceren.bilgiç27@gmail.com	5447444442	1987-05-16	6	f	77710671834	0
8078	Mesut	KOCATOROS	mesut.kocatoros89@gmail.com	5484181291	1993-06-15	52	t	53824258681	0
8079	Murat	YÜKSEL	murat.yüksel45@gmail.com	5326851133	1995-01-15	34	t	46817872565	0
8080	Eda	DERİNOĞLU	eda.derinoğlu38@gmail.com	5431408517	1999-06-14	34	f	96921867303	0
8081	Hasan	ÇELİK	hasan.çelik39@gmail.com	5416145687	1988-11-13	23	t	43780947150	0
8084	Tuğba Betül	IŞIK	tuğba betül.ışık37@gmail.com	5509175988	2001-06-08	6	f	83933556320	0
8086	Sevilay	YILDIZ	sevilay.yıldız43@gmail.com	5464417274	2003-08-09	61	f	81155073324	0
8087	Faik Sabri	ÇAVUŞOĞLU	faik sabri.çavuşoğlu20@gmail.com	5344071401	1980-09-14	70	t	60346697440	0
8089	Emir	DİVANİ	emir.divani91@gmail.com	5488672353	1996-09-17	34	t	23474095008	0
8090	Berkan	ATAÇ	berkan.ataç19@gmail.com	5465427579	1990-12-16	6	t	86818773293	0
8091	Tuğçe Özge	ÖZDEN	tuğçe özge.özden91@gmail.com	5538870279	1985-10-02	9	f	44522012305	0
8092	Kadir Can	SARICA	kadir can.sarıca10@gmail.com	5532977702	1985-01-03	34	t	81542131207	0
8094	Esma	KAPLAN	esma.kaplan92@gmail.com	5314332470	1987-08-07	34	f	98130861535	0
8095	Aysun	YAPICIOGLU	aysun.yapıcıoglu13@gmail.com	5396940846	1982-08-28	16	f	55513104197	0
8096	Hüseyin	YENER	hüseyin.yener35@gmail.com	5404983884	1986-03-15	78	t	14323076576	0
8098	Barış	ULUIRMAK	barış.uluırmak19@gmail.com	5477470334	2003-02-11	16	t	74848790134	0
8100	Tarık	FERİK	tarık.ferik24@gmail.com	5504497462	1996-03-06	54	t	56126503566	0
8101	Fatih	COŞAR	fatih.coşar23@gmail.com	5487641716	2001-07-26	42	t	51399579126	0
8102	Feyza Nur	KAYA	feyza nur.kaya55@gmail.com	5541215842	2003-02-12	34	f	89536049607	0
8106	Beyazıt	ÇAKIR	beyazıt.çakır15@gmail.com	5369181990	1998-01-28	31	t	99180404749	0
8107	Kadir Ozan	ÇİÇEK	kadir ozan.çiçek26@gmail.com	5441252485	1984-06-05	41	t	14200802310	0
8108	Aslıhan	TEMEL	aslıhan.temel95@gmail.com	5526785289	2002-05-21	35	f	48598288658	0
8109	Nihal	ŞİMŞEK	nihal.şimşek68@gmail.com	5395122646	1984-04-26	16	f	86222071277	0
8110	Erkut	BALOĞLU	erkut.baloğlu44@gmail.com	5574478502	1994-05-03	34	t	19026341977	0
8111	Erol	TAŞÇİ	erol.taşçi16@gmail.com	5354191305	1991-11-04	34	t	26065621457	1
8112	Taner	TÜRE	taner.türe14@gmail.com	5316312771	1986-02-08	45	t	87627900301	0
8114	Kevser Nida	BEKAROĞLU	kevser nida.bekaroğlu50@gmail.com	5568150469	1990-03-12	61	f	76904956154	0
8115	Kübra Nur	KIRALİ	kübra nur.kırali56@gmail.com	5526977873	1983-03-22	53	f	31258880513	0
8118	Yalçın	GÜL	yalçın.gül17@gmail.com	5335638833	1998-01-16	33	t	56681026760	0
8119	Olgaç Arda	DÖNMEZ	olgaç arda.dönmez59@gmail.com	5551678668	1985-10-19	34	t	99684830981	0
8120	Cansu	TUNA	cansu.tuna15@gmail.com	5381068178	1994-10-07	34	f	37622411871	0
8121	Merve	KARABIYIK	merve.karabıyık39@gmail.com	5392811307	1986-09-08	16	f	83238946708	0
8122	Levent	ILGAZ	levent.ılgaz14@gmail.com	5333164471	1982-06-11	41	t	81012929689	0
8124	Ahenk	URAZ	ahenk.uraz16@gmail.com	5332976705	1985-11-28	34	f	15186047032	0
8127	Yusuf	ÇELİK	yusuf.çelik50@gmail.com	5504217599	1985-04-24	34	t	13834583648	0
8128	Melda	AYDOĞAN	melda.aydoğan85@gmail.com	5464212108	1984-01-18	6	f	41216587759	0
8132	Ayşegül	GÜNEYSU	ayşegül.güneysu11@gmail.com	5528305623	1986-06-01	34	f	11129619384	0
8133	Emine	ULU	emine.ulu52@gmail.com	5513089595	1981-08-13	34	f	17383538723	1
8134	Durukan	SİPAHİ	durukan.sipahi31@gmail.com	5372886754	1987-06-24	23	t	78252406174	0
8135	Hakan	APAYDIN	hakan.apaydın15@gmail.com	5594135472	1996-02-09	34	t	26018947108	0
8136	Görkem	ARCAK	görkem.arcak51@gmail.com	5393045717	1987-12-03	34	t	42881874437	0
8137	Rukiye Büşra	BAŞYİĞİT	rukiye büşra.başyiğit83@gmail.com	5593951530	1985-03-22	34	f	95185717151	7
8138	Samyeli	CANPOLAT	samyeli.canpolat40@gmail.com	5417927110	1987-01-22	31	f	50665631551	0
8139	Muhammed	KOCAOĞLU	muhammed.kocaoğlu22@gmail.com	5374429550	1996-02-02	63	t	23056512924	0
8140	Ümmügülsüm	UĞUZ	ümmügülsüm.uğuz33@gmail.com	5531737202	1998-01-07	58	f	88563492229	0
8143	Erkam Musab	AKSAL	erkam musab.aksal87@gmail.com	5598270652	1993-09-18	71	t	39782557420	0
8145	Yasemin	TIRPAN	yasemin.tırpan29@gmail.com	5341888430	1982-02-06	16	f	73706898763	0
8147	Meryem Nur	ÇOBAN	meryem nur.çoban71@gmail.com	5487987273	1998-03-11	3	f	63625547816	0
8148	Esma	ŞİŞMANOĞLU	esma.şişmanoğlu63@gmail.com	5587138922	1980-05-07	34	f	45200163705	0
8149	Ebubekir	ŞEN	ebubekir.şen95@gmail.com	5548513632	1999-06-17	34	t	24184663461	0
8151	Barbaros Arif	ÖZCAN	barbaros arif.özcan60@gmail.com	5552233998	1983-02-08	34	t	93004305936	0
8153	Şimal	BERBER	şimal.berber98@gmail.com	5541529175	1989-03-26	26	f	13224592543	0
8155	Akın	ÇAY	akın.çay13@gmail.com	5403977134	1993-07-12	66	t	91888916005	0
8160	Didem	ÖVER	didem.över82@gmail.com	5394720521	1984-06-05	34	f	88700716423	7
8161	Sener	AK	sener.ak64@gmail.com	5332988255	1982-10-06	34	t	56646112000	1
8162	Gülseren	AKBAŞ	gülseren.akbaş64@gmail.com	5402149621	1992-11-03	34	f	44531919422	0
8163	Faik	YILDIRIM	faik.yıldırım69@gmail.com	5374720141	1988-10-03	41	t	40336367131	0
8164	Nurdamla	KALLEK	nurdamla.kallek70@gmail.com	5558609957	1996-04-13	34	f	82367319864	0
8165	Samet	EYÜBOĞLU	samet.eyüboğlu20@gmail.com	5471578593	1998-07-05	34	t	65657556476	0
8169	Hacı Mehmet	BOYRAZ	hacı mehmet.boyraz63@gmail.com	5341225433	1995-11-21	35	t	68119452220	7
8170	Berat Can	SADIKOĞLU	berat can.sadıkoğlu36@gmail.com	5577953938	1998-02-08	34	t	27346046883	0
8172	Gökhan	KUŞÇUOĞLU	gökhan.kuşçuoğlu31@gmail.com	5348557310	1980-03-22	34	t	75638935441	0
8173	Hatice	GÖKCE	hatice.gökce40@gmail.com	5449146693	1992-11-08	34	f	44284124410	0
8174	Şebnem Özge	ÖZMERDİVEN	şebnem özge.özmerdiven13@gmail.com	5511725259	2000-01-09	22	f	88979563895	0
8175	Sencer	KILIÇ	sencer.kılıç10@gmail.com	5457940742	2000-03-16	34	t	63670091182	1
8176	Erkan	YILDIRIM	erkan.yıldırım74@gmail.com	5574024585	1991-07-07	37	t	43128768282	0
8177	Özlem	ÖZDEMİR ÇETİN	özlem.özdemir çetin64@gmail.com	5576975911	1991-06-23	3	f	60963340249	0
8178	Gülçin	TURHAN	gülçin.turhan45@gmail.com	5334352440	1984-08-12	67	f	87069324824	0
8180	Neslihan	AKILOTU	neslihan.akılotu52@gmail.com	5524704537	1996-09-01	23	f	32937899187	0
8181	İsmail	DURMAZ	ismail.durmaz53@gmail.com	5527659612	2003-05-09	63	t	77787547307	0
8182	Hasibe	TALAŞ	hasibe.talaş51@gmail.com	5522462892	1992-07-25	58	f	75052736080	0
8185	Betül	TORUN	betül.torun29@gmail.com	5385209605	1984-09-26	54	f	42176389156	0
8186	İdil	AKGÜN	idil.akgün99@gmail.com	5322750316	1999-03-25	34	f	38785605881	0
8187	Nihal	PİŞKİN	nihal.pişkin35@gmail.com	5401729205	1980-03-12	33	f	15164325472	0
8188	Selin	ÇALIŞKAN	selin.çalışkan53@gmail.com	5466960498	1990-09-19	34	f	84388514417	0
8189	Adem	BULUT	adem.bulut48@gmail.com	5326404280	1980-09-23	34	t	77644503264	0
8190	Gökçe	ÇAĞDAŞ	gökçe.çağdaş67@gmail.com	5601442118	1982-01-05	34	f	75831121916	1
8191	Abdulbaki	OK	abdulbaki.ok48@gmail.com	5405463484	1994-01-01	31	t	26223597460	0
8192	Serap Sebil	AVCI	serap sebil.avcı14@gmail.com	5311885870	1997-08-26	6	f	14987139394	0
8193	Seda Nur	BİLİCİ	seda nur.bilici 66@gmail.com	5345400838	1991-08-26	63	f	59576772428	0
8194	Tulın	KOT	tulın.kot40@gmail.com	5351802952	1999-10-06	54	f	85369266243	0
8195	Neslihan	ŞEN GÜNDÜZ	neslihan.şen gündüz85@gmail.com	5525601428	2001-03-06	34	f	90221877833	0
8196	Nursena	ŞİMŞEK	nursena.şimşek97@gmail.com	5305121282	1980-02-18	16	f	91580044045	0
8197	Metin	KURT	metin.kurt42@gmail.com	5434864569	1984-12-12	35	t	82161602720	0
8201	Osman Tayfun	FAKİROGLU	osman tayfun.fakiroglu51@gmail.com	5598616747	1986-05-26	34	t	56903792876	0
8202	Metin Erkan	ÇEKMEZ	metin erkan.çekmez95@gmail.com	5507099410	1993-04-03	34	t	44303548147	7
8203	Orhan	ATEŞ	orhan.ateş22@gmail.com	5487359175	1981-08-01	33	t	12597837060	0
8205	Nilay	SEFERTAŞ	nilay.sefertaş56@gmail.com	5452351384	2000-01-04	34	f	40699717437	0
8207	Semih	BOZKURT	semih.bozkurt75@gmail.com	5534730833	1986-10-21	34	t	14048371610	0
8208	Kazım Tolgahan	ŞANLI	kazım tolgahan.şanlı63@gmail.com	5312386562	1986-09-25	16	t	77119046808	0
8209	Sevde	DARTAR	sevde.dartar42@gmail.com	5563987871	1999-12-21	37	f	43150269043	0
8210	Şemse	KUTSAL	şemse.kutsal26@gmail.com	5406102659	2001-12-01	31	f	87953821347	0
8211	Tarık	TOPRAK	tarık.toprak48@gmail.com	5581498506	1998-02-09	34	t	74265252641	0
8212	Ali Uğur	ŞİMŞEK	ali uğur.şimşek69@gmail.com	5502287171	1982-02-07	32	t	42879397823	0
8213	Ayşegül	KILIÇ	ayşegül.kılıç45@gmail.com	5585638678	2000-09-24	34	f	51399090473	0
8214	Ekrem Burhan	CAN	ekrem burhan.can35@gmail.com	5437606103	1981-03-24	34	t	30260810436	0
8215	Sinan	HANÇER	sinan.hançer33@gmail.com	5364936269	1991-07-17	34	t	15872830088	0
8216	Eda	ARSLAN	eda.arslan65@gmail.com	5475050223	1996-02-10	27	f	35845080741	0
8217	Melike Kübra	SARIOĞLU	melike kübra.sarıoğlu83@gmail.com	5497599506	1997-08-01	66	f	27364729998	0
8218	Sera	CENGİZ	sera.cengiz44@gmail.com	5367545848	1997-10-20	16	f	47685378928	0
8219	Gökberk	SARIGÜL	gökberk.sarıgül61@gmail.com	5482786221	1984-02-11	34	t	40935513624	0
8220	Büşra	ÇOKDAŞ	büşra.çokdaş94@gmail.com	5387164357	1994-07-07	34	f	63240356437	0
8221	Abdulsamed	ÇİMEN	abdulsamed.çimen16@gmail.com	5496735550	2003-06-28	54	t	88288870707	0
8222	Demet	ÖZŞAHİN	demet.özşahin89@gmail.com	5343092839	1983-02-07	1	f	34768858965	0
8223	Sercan	GÜLTEKİN	sercan.gültekin17@gmail.com	5411447870	1998-05-05	34	t	50033414887	0
8224	Meryem	GÜLTEKİ	meryem.gülteki77@gmail.com	5375155853	2000-04-17	34	f	35119177298	0
8226	Seher	ÇERVATOĞLU	seher.çervatoğlu21@gmail.com	5301312266	1990-07-17	34	f	30095646279	0
8227	Gökhan	ŞENGÜL	gökhan.şengül77@gmail.com	5574599370	1999-07-06	59	t	96590745837	1
8228	Anıl	İÇÖZ	anıl.içöz76@gmail.com	5337810420	1998-11-03	59	t	53359816100	0
8230	Neslihan	ERGİN	neslihan.ergin49@gmail.com	5537813897	1981-09-10	7	f	13790963392	0
8231	Erol	KESKİN	erol.keskin68@gmail.com	5384497268	1991-01-24	34	t	58101888634	0
8232	Sedef Olcay	ATICI	sedef olcay.atıcı67@gmail.com	5367646292	1997-02-27	68	f	33853238388	0
8233	İlbars Dorukhan	VAROL	ilbars dorukhan.varol19@gmail.com	5322748525	2002-03-18	23	t	89169678810	0
8234	Merve	OZABUS	merve.ozabus97@gmail.com	5514612985	1999-12-23	27	f	72102670377	0
8238	Merve	TAHTA	merve.tahta71@gmail.com	5603444169	1981-04-01	34	f	34331548956	1
8240	Kerem	AKPINAR	kerem.akpınar77@gmail.com	5502777646	2003-01-05	34	t	41709456404	0
8241	Umut	ÖZDOĞAN	umut.özdoğan12@gmail.com	5345201926	1996-07-09	66	t	15043069112	0
8242	Kartal Bahadır	ÇETİNGÖZ	kartal bahadır.çetingöz27@gmail.com	5579079262	1985-11-26	34	t	68319546764	0
8243	Pınar	BEKPINAR	pınar.bekpınar17@gmail.com	5461032124	1987-09-02	34	f	61034584035	0
8244	Bihter	EKİZOGLU	bihter.ekizoglu89@gmail.com	5412746159	1988-05-02	10	f	30408368988	1
8245	Emrah	YÜCE	emrah.yüce77@gmail.com	5354268729	1989-08-27	34	t	27592642197	0
8246	Yusuf Kağan	ATALAY	yusuf kağan.atalay11@gmail.com	5359200888	1987-11-05	35	t	76727958031	0
8247	Mehmet	KÜLTE	mehmet.külte28@gmail.com	5314023410	2001-02-07	37	t	71651013706	0
8248	Mehmet Rıdvan	İSKENDER	mehmet rıdvan.iskender93@gmail.com	5511615134	1988-12-04	34	t	67046056761	0
8249	Emre	GÜLER	emre.güler92@gmail.com	5501067510	1997-03-07	34	t	33595721101	0
8250	Muhammed Sacid	BEYHAN	muhammed sacid.beyhan61@gmail.com	5306458837	1997-03-27	34	t	56829174824	0
8251	Hüma	TOKER	hüma.toker60@gmail.com	5584808250	1990-01-03	60	f	53132005204	0
8252	Mahmud Mücahid	SAĞMAN	mahmud mücahid.sağman13@gmail.com	5543101711	1991-09-03	44	t	74879297649	0
8253	Tuba	KARAÇOBAN	tuba.karaçoban 15@gmail.com	5517991679	1984-02-19	21	f	58508164524	0
8254	İlhan	ATAŞ	ilhan.ataş87@gmail.com	5571176858	1993-08-01	27	t	49547106479	0
8255	Ömer	ERDEM	ömer.erdem58@gmail.com	5448010970	2000-12-23	58	t	71093257398	0
8256	Gözde	AKCAN	gözde.akcan80@gmail.com	5521439112	1986-10-01	54	f	91108045282	0
8257	Mustafa	GEDİK	mustafa.gedik97@gmail.com	5485733104	1986-12-17	34	t	23856387528	0
8258	Tolga Kudret	KARACA	tolga kudret.karaca63@gmail.com	5541147351	1984-04-18	34	t	85919883089	0
8259	Kemal	AYDIN	kemal.aydın44@gmail.com	5528859849	1992-12-16	26	t	36732402180	0
8260	Didar	YILDIRIM	didar.yıldırım86@gmail.com	5493530368	1998-12-13	34	f	22327367287	0
8261	Gökhan	GEGEKOĞLU	gökhan.gegekoğlu57@gmail.com	5378152978	1985-11-26	67	t	55650559808	0
8262	Hanife	YALÇIN	hanife.yalçın82@gmail.com	5528814630	1981-02-28	34	f	69127427037	0
8263	Beyza	AÇIKAY	beyza.açıkay51@gmail.com	5507017409	1981-05-21	34	f	73889780072	0
8264	Damla	GÖZEL	damla.gözel86@gmail.com	5343395401	1991-03-02	6	f	69801984930	0
8266	Cihat	GÜLER	cihat.güler59@gmail.com	5488095359	1983-10-03	16	t	97661536343	0
8267	Osman	AKTEMUR	osman.aktemur33@gmail.com	5498918561	2000-07-27	34	t	28514325930	0
8268	Furkan	DÜNDAR	furkan.dündar35@gmail.com	5398414403	1989-06-07	61	t	96369590186	0
8270	Yasemin	GÜLER	yasemin.güler25@gmail.com	5463788160	2001-03-18	34	f	53933065537	0
8271	Aziz	BİLEN	aziz.bilen31@gmail.com	5347574740	1999-12-03	45	t	43793623534	0
8272	Görkem	DÖRTBÖLÜK	görkem.dörtbölük51@gmail.com	5557762778	1981-03-23	48	t	73008203180	0
8273	Murat	ALTAN	murat.altan13@gmail.com	5377867551	1990-09-25	67	t	16296741053	0
8274	Zeynep Gülşah	ÖZHAN	zeynep gülşah.özhan40@gmail.com	5537907638	1987-05-15	34	f	41818470350	0
8275	Tansu	ÖZARSLAN	tansu.özarslan16@gmail.com	5557917975	1986-01-27	35	f	52527520225	0
8276	Mahmut	TÜMENBATUR	mahmut.tümenbatur72@gmail.com	5552343251	2001-09-14	1	t	59917457908	0
8277	Zafer	SAYINTA	zafer.sayınta23@gmail.com	5466270763	2001-02-18	22	t	50870997967	0
8279	Murat	HEKİM	murat.hekim93@gmail.com	5501751524	1986-12-11	53	t	55724491010	0
8280	Ayşegül	ŞAHİN	ayşegül.şahin37@gmail.com	5373857164	2003-09-08	34	f	11404678656	0
8281	Mert	İLGÜN	mert.ilgün89@gmail.com	5566217735	1982-12-04	34	t	21347504448	0
8282	Çiğdem	AKDAĞ ATABAY	çiğdem.akdağ atabay95@gmail.com	5427893968	1999-05-26	10	f	31387113099	0
8283	Sertaç	ÇAĞLAYAN	sertaç.çağlayan81@gmail.com	5444079232	1990-11-25	34	t	30108522202	0
8284	İlhan	ÖZDEMİR	ilhan.özdemir27@gmail.com	5561968720	1981-04-16	34	t	71480285119	0
8285	Adem	AYAR	adem.ayar72@gmail.com	5315516974	2003-05-16	34	t	30586536785	0
8286	Mehmet	GÜLER	mehmet.güler23@gmail.com	5521075331	2000-12-07	44	t	49479393864	0
8287	Elif	ÖRNEK	elif.örnek27@gmail.com	5357151669	1998-07-07	55	f	43211838083	0
8288	Elif	KÖKSAL	elif.köksal36@gmail.com	5563755369	1981-01-20	34	f	50142977771	0
8289	Faruk	KOLÇAK	faruk.kolçak97@gmail.com	5334772691	1982-10-02	34	t	50905037304	0
8290	Yağız	GÖRÜR	yağız.görür34@gmail.com	5446414465	2003-02-22	34	t	49158160045	0
8291	Pelin	NAL	pelin.nal24@gmail.com	5376760355	1991-01-26	17	f	31099348101	0
8292	Ceren	TOKSOZ	ceren.toksoz17@gmail.com	5492057511	2002-12-15	59	f	13148525639	0
8293	Merve	KARAMUSTAFA	merve.karamustafa33@gmail.com	5505932760	1989-11-05	34	f	98506551348	0
8294	Mehmet	GÜLER	mehmet.güler84@gmail.com	5398799538	1988-08-19	44	t	37045179170	0
8296	Deniz	ÇERÇİ	deniz.çerçi80@gmail.com	5545117681	1987-05-08	1	f	50796834802	0
8297	Harun	DURSUN	harun.dursun78@gmail.com	5358979307	1999-06-27	44	t	26429748290	0
8298	Cansel Bedia	SIĞIRCI	cansel bedia.sığırcı38@gmail.com	5383050919	1999-04-12	33	f	28564903423	0
8299	Mustan Muhammet	KOÇER	mustan muhammet.koçer28@gmail.com	5407071724	1990-11-25	7	t	30325331117	0
8302	Damla	MOL	damla.mol13@gmail.com	5326980721	1990-03-12	34	f	81816545969	0
8303	Selvi	ALABAY	selvi.alabay75@gmail.com	5532847284	1998-09-22	75	f	91892077358	0
8305	Emre	ŞENGÜLER	emre.şengüler66@gmail.com	5511770228	1980-06-09	34	t	44241439811	0
8308	İsrafil	KURALAY	israfil.kuralay65@gmail.com	5308269129	1995-08-13	25	t	59023416163	0
8309	Tuğba	BAYINDIR	tuğba.bayındır31@gmail.com	5534812185	1988-03-18	23	f	73930838466	0
8310	Hüseyin	AKSU	hüseyin.aksu90@gmail.com	5535422134	1998-07-05	34	t	84714078924	0
8311	Özlem	TAŞ	özlem.taş15@gmail.com	5351523645	1999-04-08	34	f	81324715687	5
8312	Firdevs	KELEKÇİ	firdevs.kelekçi27@gmail.com	5595351767	1989-01-09	21	f	37555262243	0
8313	Fürkan Kenan	KESKİN	fürkan kenan.keskin47@gmail.com	5425914438	1997-09-14	54	t	53480481846	0
8316	Halil İbrahim	SARIBOĞA	halil ibrahim.sarıboğa55@gmail.com	5554155381	1986-11-28	67	t	19472915595	0
8317	Yağmur Aslınur	EDEMEN	yağmur aslınur.edemen81@gmail.com	5412054111	1985-10-13	34	f	98328609273	0
8319	İbrahim	KARADENİZ	ibrahim.karadeniz12@gmail.com	5418709891	1998-10-20	47	t	37328651571	0
8320	Burak	DAĞ	burak.dağ48@gmail.com	5387674630	2001-11-21	35	t	41838664002	0
8322	Batuhan	YAVUZ	batuhan.yavuz39@gmail.com	5343128659	2003-02-06	13	t	75543237504	0
8323	Umut	GÜNAY	umut.günay98@gmail.com	5535799677	2003-05-08	45	t	84355182042	0
8324	Selin	KARA	selin.kara47@gmail.com	5508616167	1998-04-14	23	f	18339062826	0
8326	Kıymet	YURDUGÜL	kıymet.yurdugül96@gmail.com	5416796776	1994-05-15	32	f	21247695012	0
8327	Mehmet Cemil	ŞAHİN	mehmet cemil.şahin44@gmail.com	5488507909	1984-02-21	34	t	10235198221	0
8329	Merve	YÜKSEL	merve.yüksel78@gmail.com	5444019528	1987-04-08	34	f	45230207842	0
8330	Kayhan Emre	GÜNERİ	kayhan emre.güneri12@gmail.com	5345161587	1986-01-04	34	t	76901597463	0
8331	Beldem	SEKBAN	beldem.sekban68@gmail.com	5504851327	2003-09-08	34	f	26909729002	0
8332	Gökçe	KAYRA	gökçe.kayra38@gmail.com	5502459866	2001-01-23	35	f	24912380832	0
8333	Meryem	AKIN	meryem.akın59@gmail.com	5598710841	1981-11-05	32	f	44570416892	0
8334	Merve	KAÇAR	merve.kaçar37@gmail.com	5529068677	1985-05-20	59	f	71126386673	0
8335	Husnu Berat	YİLDİRİM	husnu berat.yildirim96@gmail.com	5573731213	1987-09-06	32	t	90110152666	0
8336	Abdulkadir	TENİKECİ	abdulkadir.tenikeci32@gmail.com	5317956919	1987-01-22	37	t	23003800813	0
8337	Sema Gül	ERDOĞAN	sema gül.erdoğan41@gmail.com	5398457741	1982-01-22	40	f	46587252634	0
8338	Merve	KOCA	merve.koca82@gmail.com	5526694318	1991-06-18	34	f	76630486983	0
8339	Tuğba	BENLİ	tuğba.benli26@gmail.com	5571234914	1990-03-25	18	f	59540178777	0
8340	Tülay	ÇITIR KURTULUŞ	tülay.çıtır kurtuluş12@gmail.com	5487543739	1998-05-02	34	f	53995611045	0
8342	Didem	ACAR	didem.acar87@gmail.com	5552329897	1986-12-19	19	f	49635812812	0
8343	Gülüzar	SÖNMEZ	gülüzar.sönmez84@gmail.com	5423131557	1993-02-20	34	f	44984653016	0
8344	Ozan Latif	DOĞAN	ozan latif.doğan27@gmail.com	5411699231	1988-03-07	29	f	33818078388	0
8346	Buse	ÇELİK	buse.çelik40@gmail.com	5321181290	1984-09-06	34	f	91465841449	0
8347	Birsen	ŞİMŞEK ÖZEN	birsen.şimşek özen 31@gmail.com	5373377150	1988-03-20	34	f	21848861895	0
8348	Şeyma	PEKDEMİR	şeyma.pekdemir85@gmail.com	5467133351	1982-01-08	34	f	55196982045	0
8349	Burcu Yağmur	DEMİR	burcu yağmur.demir51@gmail.com	5386973877	1997-01-04	34	f	93766367529	0
8350	Mehmet	ERDİNÇ	mehmet.erdinç63@gmail.com	5476325665	1995-10-04	2	t	86001150375	0
8351	Mehmet	CANCA	mehmet.canca97@gmail.com	5485478449	1991-09-17	34	t	24025363618	0
8355	Burak	GÜNDÜZ	burak.gündüz11@gmail.com	5352433506	1990-07-28	52	t	49320751795	0
8356	Şafak	SAKALLI	şafak.sakallı14@gmail.com	5524259618	1992-04-11	34	t	31581272250	0
8357	Nail	TÜRKDİL	nail.türkdil63@gmail.com	5593493780	1996-02-17	34	t	22676226789	0
8362	Furkan	OZYURT	furkan.ozyurt91@gmail.com	5377492355	1998-10-19	26	t	24481309863	0
8366	Kübra Nur	KESEN	kübra nur.kesen67@gmail.com	5412886349	2000-04-20	60	f	57302157622	0
8367	Elif	OKTAY	elif.oktay51@gmail.com	5472558120	2001-05-03	67	f	99349031130	0
8368	Abdüssamed	GÖL	abdüssamed.göl89@gmail.com	5366411148	1988-02-24	38	t	77190623316	0
8369	Ahmet Burak	KOYUNCU	ahmet burak.koyuncu 94@gmail.com	5388061393	1986-03-16	63	t	63313442244	0
8372	Onur Erkan	YILDIZ	onur erkan.yıldız74@gmail.com	5335196816	1984-09-24	23	t	68545757011	0
8373	Merve	SERT	merve.sert39@gmail.com	5533178773	2003-11-07	2	f	90618825527	0
8376	Firat	MÜMİNOGLU	firat.müminoglu73@gmail.com	5534907352	2001-04-20	34	t	90436413512	0
8377	Dilay	ŞEN	dilay.şen55@gmail.com	5369123889	1987-04-17	34	f	25660502541	0
8379	Merve	BAYRAM	merve.bayram71@gmail.com	5405404439	1999-07-10	23	f	10853629625	0
8381	Büşra	ERTUĞRUL	büşra.ertuğrul43@gmail.com	5472984509	1998-11-20	22	f	36589003400	0
8382	Duygu	YILMAZ	duygu.yılmaz37@gmail.com	5346723556	1998-01-27	34	f	11943303358	0
8383	Sezen	ÇAĞLAR	sezen.çağlar99@gmail.com	5374668457	2001-12-04	34	f	84043398270	0
8384	Gamze	ORTA	gamze.orta15@gmail.com	5551951427	1985-03-03	34	f	12092600654	0
8385	Serkan	ÖZTÜRK	serkan.öztürk25@gmail.com	5385008995	1986-12-22	66	t	33022071827	0
8386	Melike	SIRAKAYA	melike.sırakaya78@gmail.com	5577829252	1995-03-15	34	f	79152091455	0
8387	Neslişah	ÖZTÜRK	neslişah.öztürk33@gmail.com	5602350207	2002-06-05	34	f	26096019566	0
8388	Mücahit Abdullah	ORHAN	mücahit abdullah.orhan40@gmail.com	5486681563	1986-06-04	44	t	72907462990	0
8389	Sinem	GEÇGEL KARAGÖL	sinem.geçgel karagöl49@gmail.com	5431733987	1988-10-04	34	f	66908811873	0
8390	Ecem Tuğçe	CESUR	ecem tuğçe.cesur44@gmail.com	5564334379	1995-01-12	59	f	85231205856	0
8391	Buse	YILMAZ	buse.yılmaz79@gmail.com	5319142103	1988-11-09	22	f	29526732532	0
8392	Gizem	ALTAN	gizem.altan16@gmail.com	5457650304	1987-03-25	67	f	33144223307	0
8393	Muratcan	TANYERLİ	muratcan.tanyerli29@gmail.com	5607860811	1986-04-17	34	t	16731798579	0
8394	Duygu	ÖZTÜRK	duygu.öztürk43@gmail.com	5321569803	1983-10-05	34	f	23340310085	0
8395	Elif	YILMAZÖRNEK	elif.yılmazörnek52@gmail.com	5502831336	2001-12-02	34	f	20115143830	0
8396	Abdurrahman Hamza	TÜZGEN	abdurrahman hamza.tüzgen78@gmail.com	5443075453	1983-11-16	34	t	96761597799	0
8397	Seda	KASALAR	seda.kasalar18@gmail.com	5457005483	1997-11-25	34	f	59307684823	0
8398	Buse Sabire	ELÇİGEMİ	buse sabire.elçigemi92@gmail.com	5376197642	2000-02-27	34	f	67517276231	0
8400	Şafak	NALBANTOĞLU	şafak.nalbantoğlu85@gmail.com	5508056277	1993-10-25	34	t	84457427091	0
8401	Abdulkadir	KUTLUAY	abdulkadir.kutluay44@gmail.com	5547157995	1987-03-27	38	t	32914055598	0
8402	Büşra	VURAL	büşra.vural28@gmail.com	5566041173	1984-09-07	72	f	60447672739	0
8403	Enise	ÖZEL	enise.özel80@gmail.com	5392642738	2000-08-27	35	f	27340301778	0
8404	Hilal	PİNAZ	hilal.pinaz97@gmail.com	5606576383	2001-08-24	34	f	39397899540	0
8405	Pelin	ÇELEBİ	pelin.çelebi24@gmail.com	5461294978	1995-01-17	34	f	83076535305	0
8407	Ebru	KENT	ebru.kent44@gmail.com	5367058439	1990-11-26	31	f	32920139027	0
8408	Uğur	KORKMAZ	uğur.korkmaz43@gmail.com	5541647983	1995-02-07	34	t	69498776061	0
8409	Hatice Cennet	YILMAZ	hatice cennet.yılmaz86@gmail.com	5383936716	1983-06-17	34	f	56465845992	0
8410	Zeynep	SÜMER	zeynep.sümer77@gmail.com	5308929197	1980-05-09	15	f	41578337006	0
8411	Yalçın Alperen	YİĞİT	yalçın alperen.yiğit79@gmail.com	5335896508	1989-10-15	34	t	24985006277	0
8412	Ayşe İdil	EKŞİ	ayşe idil.ekşi16@gmail.com	5483929369	1992-01-23	34	f	75368046908	0
8415	Güner Gözde	TEKSİN	güner gözde.teksin57@gmail.com	5503671906	1998-01-24	6	f	64744170080	0
8417	Dilhan	DEMİR	dilhan.demir29@gmail.com	5397974575	1998-04-02	34	f	29506696283	0
8418	Sinem	GÜN	sinem.gün33@gmail.com	5537717574	1997-03-03	35	f	47724914894	0
8419	Erkin	SARI	erkin.sarı44@gmail.com	5342366371	2000-11-26	34	t	50185913380	0
8420	Cansın Simay	UĞUR	cansın simay.uğur39@gmail.com	5462159575	1993-03-21	38	f	58054492416	0
8421	Emrullah	TOKMAK	emrullah.tokmak56@gmail.com	5357773198	1981-02-17	34	t	80514980349	0
8423	Mert	YILDIRIM	mert.yıldırım69@gmail.com	5461653272	1998-11-14	17	t	71223430824	0
8424	Emre	KARAGÖZ	emre.karagöz25@gmail.com	5418112988	1995-01-21	34	t	17615059924	0
8425	Muhammed Şükrü	ERİŞ	muhammed şükrü.eriş40@gmail.com	5378187523	2001-04-09	34	t	15511849387	0
8426	Cenk Aydın	IŞIKDOĞAN	cenk aydın.ışıkdoğan58@gmail.com	5482370304	1984-04-03	43	t	23335655095	0
8427	Duygu	KALELİ	duygu.kaleli54@gmail.com	5451757785	1997-06-26	34	f	39663108992	0
8428	Ayşe	SALTIK ERDOĞAN	ayşe.saltık erdoğan76@gmail.com	5335086408	1980-02-01	61	f	26919269696	0
8429	Merve	EROL	merve.erol25@gmail.com	5328676148	1987-02-18	34	f	50050888566	0
8430	Erdem Eray	HAMİTOĞULLARI	erdem eray.hamitoğulları17@gmail.com	5344684370	1981-05-18	36	t	94174544392	0
8431	Mehmet	KIRMIZIGÜL	mehmet.kırmızıgül60@gmail.com	5344519662	1984-03-08	20	t	35378392096	0
8432	Sinem	KUZGUNOĞLU	sinem.kuzgunoğlu78@gmail.com	5473370367	1996-11-06	16	f	10747323874	0
8433	Sinem	ODABAŞI	sinem.odabaşı16@gmail.com	5522229912	1995-11-15	34	f	39367509295	0
8434	Hasan	TURALIOĞLU	hasan.turalıoğlu86@gmail.com	5346305475	1983-01-08	34	t	93253744109	0
8435	Oğuzhan	ŞİMŞİT	oğuzhan.şimşit59@gmail.com	5437677922	1989-10-27	52	t	90466429545	0
8436	Mustafa	CANDAROĞLU	mustafa.candaroğlu68@gmail.com	5572913949	1992-09-14	37	t	39612732101	0
8437	Erdem	SARI	erdem.sarı93@gmail.com	5552297769	1999-09-14	34	t	74184258630	0
8438	Muhammet Faruk	TOPRAK	muhammet faruk.toprak87@gmail.com	5575007486	1988-08-13	34	t	53359466488	0
8439	Mert	YEŞİN	mert.yeşin50@gmail.com	5462830402	1994-09-19	34	t	33573871269	0
8440	Ecem	ALKAŞ	ecem.alkaş94@gmail.com	5322079617	1982-04-25	34	f	10776297845	0
8441	Aişe Betül	BAŞ	aişe betül.baş86@gmail.com	5323346137	1985-10-03	35	f	66104146213	0
8442	Onur	YILDIRIM	onur.yıldırım44@gmail.com	5566632711	1984-01-13	75	t	84231641444	0
8443	Eda	BALCI	eda.balcı60@gmail.com	5561125646	1989-10-07	34	f	29558314574	0
8445	Ahmet Emre	YOL	ahmet emre.yol60@gmail.com	5556281308	1990-11-22	6	t	39625907048	0
8446	Ayşenur	KARTAL	ayşenur.kartal59@gmail.com	5325028372	1999-05-18	34	f	42601153627	0
8448	Fırat	OLTULU	fırat.oltulu47@gmail.com	5445505129	1982-02-12	69	t	33441109522	0
8450	Alperen	KAHVECİ	alperen.kahveci80@gmail.com	5444251227	1988-06-16	10	t	29505399132	0
8451	Dilek	ÖZBEK	dilek.özbek52@gmail.com	5588915315	1987-05-07	34	f	42313636490	0
8452	Bircan	AKMERCAN	bircan.akmercan59@gmail.com	5448012504	1991-08-27	44	f	54021508095	0
8453	Hasan Hüseyin Ali	GÜL	hasan hüseyin ali.gül12@gmail.com	5513774849	1997-11-05	33	t	88055116608	0
8454	Uğur	TAŞKİT	uğur.taşkit83@gmail.com	5466632177	1995-08-05	47	t	38312250923	0
8455	Muhammed Enes	DURMUŞ	muhammed enes.durmuş40@gmail.com	5448795958	2002-06-20	34	t	43550216415	0
8456	Havva	ERDOĞAN	havva.erdoğan27@gmail.com	5442103423	2000-04-25	35	f	93702020785	0
8457	Seda	İNCİ	seda.inci83@gmail.com	5481869874	1998-11-09	24	f	87375825376	0
8458	Mehmet Gökhan	AYALP	mehmet gökhan.ayalp77@gmail.com	5507099514	2000-05-19	34	t	30614630212	0
8459	Ayşe Nur	SAĞIN	ayşe nur.sağın82@gmail.com	5455725321	1987-04-04	34	f	64741646415	0
8460	Serpil	YILMAZ	serpil.yılmaz12@gmail.com	5548109852	1990-06-08	1	f	10022348080	0
8462	Emre	GÜNAY	emre.günay90@gmail.com	5548889342	1991-12-18	34	t	96439428182	0
8463	Mehmet Yavuz	DEMİRBİLEK	mehmet yavuz.demirbilek64@gmail.com	5485590438	1997-04-20	6	t	53639381887	0
8464	Suna	KAYA EROĞLU	suna.kaya eroğlu56@gmail.com	5305392465	1988-06-13	58	f	24944754741	0
8466	Akın	YILMAZEL	akın.yılmazel90@gmail.com	5583205932	1983-06-14	35	t	94426389887	0
8468	Mukaddes Deniz	ETLER	mukaddes deniz.etler91@gmail.com	5515542178	2000-02-12	34	f	72708096971	0
8471	Güngör	BAŞDİNÇ	güngör.başdinç20@gmail.com	5488961783	1982-07-26	65	t	21979779975	0
8473	Feyzullah	BAYER	feyzullah.bayer77@gmail.com	5547143763	1988-10-27	44	t	33566605323	0
8474	Neşe	AKBAŞ	neşe.akbaş40@gmail.com	5334230247	1983-03-22	34	f	97143600555	0
8475	Büşra	KUŞCU	büşra.kuşcu57@gmail.com	5431731485	1989-06-08	34	f	36595347413	0
8476	Cemile	ERDEN	cemile.erden70@gmail.com	5403223143	1987-12-05	34	f	62078264817	0
8477	Behiye	KAYA	behiye.kaya62@gmail.com	5594897327	1987-10-28	16	f	84653247198	0
8478	Emre	AYGÜN	emre.aygün48@gmail.com	5415948956	1986-12-09	58	t	13001417841	0
8479	Tuğba	DEMİR	tuğba.demir57@gmail.com	5476750837	1997-05-16	54	f	43780551413	0
8480	Ahmet	ÇEVİK	ahmet.çevik98@gmail.com	5462207887	1995-08-19	34	t	24286993780	0
8482	Elif	SAĞLAM	elif.sağlam27@gmail.com	5347592259	1989-06-02	54	f	58802207722	0
8484	Şeyma	PERK	şeyma.perk54@gmail.com	5303690833	1995-07-25	44	f	28026887911	0
8485	Basak	KAHRAMAN	basak.kahraman71@gmail.com	5396533474	1989-04-20	34	f	72151278415	0
8487	Aylin	GÖRENER	aylin.görener67@gmail.com	5308610569	1996-12-10	34	f	21154468085	0
8488	Bircan	DEĞERLİ	bircan.değerli52@gmail.com	5452650363	1981-09-18	34	f	64042967606	1
8491	Berk	ÖRÜCÜ	berk.örücü15@gmail.com	5381046493	1983-05-17	34	t	92037254221	0
8492	Suna Zehra	GEDEMENLİ	suna zehra.gedemenli21@gmail.com	5301667474	2000-07-01	34	f	35152658661	3
8493	Kemal	YILDIRIM	kemal.yıldırım72@gmail.com	5568757625	1991-05-25	14	t	44162996762	0
8494	Çağla	ÇANLIOĞLU	çağla.çanlıoğlu37@gmail.com	5495018678	2001-01-20	16	f	41492770692	0
8496	Funda	SOHTAOĞLU	funda.sohtaoğlu22@gmail.com	5328333482	1994-06-24	34	f	47909275951	0
8497	Melek	KURSUN	melek.kursun68@gmail.com	5606260559	1996-12-26	53	f	90088809213	0
8499	Güvenç	BAYRAKTAR	güvenç.bayraktar49@gmail.com	5466807681	2003-03-07	34	t	49745094152	0
8500	Mehmet Mert	TUNÇMAN	mehmet mert.tunçman78@gmail.com	5425097546	1999-06-10	34	t	71772423800	0
8501	Zülküf	KAÇMAZ	zülküf.kaçmaz43@gmail.com	5511732150	1994-06-17	65	t	37750696856	0
8502	Büşra	TEKNE	büşra.tekne95@gmail.com	5406769535	1999-09-18	34	f	85291487827	0
8503	Melis	ELBELİ	melis.elbeli78@gmail.com	5333010530	1986-01-06	59	f	99814910484	0
8504	İlknur	DÖNMEZ	ilknur.dönmez91@gmail.com	5596227906	2003-06-15	34	f	81358595585	0
8506	Kübra	AY	kübra.ay99@gmail.com	5592495694	2003-02-28	34	f	83639059576	0
8507	Eyyup	SERT	eyyup.sert76@gmail.com	5342171876	1999-07-01	63	t	60060601603	0
8508	Aslı	ALP	aslı.alp29@gmail.com	5452447854	1999-02-15	34	f	22774889152	0
8510	Semih	VARLI	semih.varlı55@gmail.com	5421545716	1999-08-01	34	t	32145964993	0
8511	Mehmet	ÖZGÜÇ	mehmet.özgüç29@gmail.com	5596950740	1998-10-07	34	t	68661625796	0
8512	Çağla	ER	çağla.er88@gmail.com	5514077379	2003-01-08	34	f	37513281572	7
8513	Ayten Nahide	KORKMAZ	ayten nahide.korkmaz14@gmail.com	5381103736	1984-05-07	55	f	85051320643	0
8514	Gizem	AYDEMİR	gizem.aydemir26@gmail.com	5446635834	1982-02-17	34	f	29239012433	0
8516	Ferhat	ÇAPAN	ferhat.çapan31@gmail.com	5375500406	1995-11-12	27	t	14579448585	0
8517	Serkan	ERDEMİR	serkan.erdemir82@gmail.com	5587796541	2002-07-21	7	t	29121211142	0
8518	Yaşar Can	ALTINIŞIK	yaşar can.altınışık95@gmail.com	5589019658	1987-09-08	6	t	59420042517	0
8519	Eren Yaşar	ÇİÇEK	eren yaşar.çiçek43@gmail.com	5564984732	1982-11-21	26	t	75946981715	0
8521	Fatih	ÇALIŞKAN	fatih.çalışkan19@gmail.com	5375832249	1986-03-28	34	t	25037636646	0
8522	Aylin	SAHİN	aylin.sahin54@gmail.com	5435201238	1985-08-10	34	f	46255929172	0
8523	Ali	DOĞAN	ali.doğan52@gmail.com	5476585434	1995-01-15	37	t	14623688561	0
8524	Abdullah Musab	ŞAHİN	abdullah musab.şahin63@gmail.com	5504292821	2002-04-12	34	t	63070837273	0
8525	Muhammet	FİDAN	muhammet.fidan91@gmail.com	5578378189	2003-04-25	34	t	53000617870	0
8526	Mehmet Yalçın	PARMAKSIZ	mehmet yalçın.parmaksız23@gmail.com	5326491143	2000-07-17	63	t	84381041135	0
8527	Celil	TAŞKIN	celil.taşkın60@gmail.com	5589180965	1983-01-21	17	t	16351544409	0
8531	Mustafa	KOCAİZMİRLİ	mustafa.kocaizmirli35@gmail.com	5481926472	1983-01-08	34	t	14446513923	0
8533	Saliha	KAYKUN	saliha.kaykun80@gmail.com	5418213731	1982-11-21	52	f	98122400455	0
8543	Nilay	İÇEN	nilay.içen16@gmail.com	5453931687	1991-05-10	34	f	89219994728	0
8544	Seren	TUĞCU	seren.tuğcu20@gmail.com	5585547536	2000-04-09	34	f	99538510178	0
8546	Selahattin	EKMEN	selahattin.ekmen51@gmail.com	5474361164	1985-08-18	34	t	33595669782	0
8548	Uğur Can	TANRIBUYURDU	uğur can.tanrıbuyurdu54@gmail.com	5354363280	1990-12-27	34	t	27388213659	0
8549	Berk	İNKAYA	berk.inkaya10@gmail.com	5472840706	2003-09-11	34	t	34638675346	0
8550	Yunus Kerem	ÇİNAR	yunus kerem.çinar22@gmail.com	5602848355	1997-07-05	34	t	63738299357	0
8551	Hüseyin	YAVUZ	hüseyin.yavuz25@gmail.com	5598620216	1985-04-17	43	t	77876830096	0
8554	Emre	CERAN	emre.ceran17@gmail.com	5321367919	1988-06-17	42	t	94111254787	0
8557	Yeşim	YİGİT	yeşim.yigit52@gmail.com	5562586972	1987-12-04	65	f	92273069439	0
8558	Muhammed	SAYIN	muhammed.sayın87@gmail.com	5341265927	1989-04-13	56	t	20019798051	0
8559	Ercan	ÖZDEMİR	ercan.özdemir13@gmail.com	5573572398	1995-10-21	46	t	81004998049	0
8560	Tuğba	ÖZYÜREK	tuğba.özyürek76@gmail.com	5567815221	1994-08-06	34	f	34447861817	0
8561	Özlem	SÖNMEZ	özlem.sönmez30@gmail.com	5592545150	1982-06-21	14	f	17952464290	0
8562	Münevver Meltem	ÇALIŞKAN	münevver meltem.çalışkan19@gmail.com	5388937225	1986-03-13	34	f	77797335298	0
8563	Hilal	PATACİ	hilal.pataci95@gmail.com	5582198945	2003-01-06	34	f	81289365215	0
8564	Beyza	GÜLMEZ	beyza.gülmez12@gmail.com	5414397640	1993-10-22	78	f	51250321736	0
8565	Cem	ÇAVUŞ	cem.çavuş69@gmail.com	5312471703	1993-12-09	34	t	20499389723	0
8567	Ayça	UĞUR	ayça.uğur84@gmail.com	5351652606	1995-11-15	34	f	38088675434	0
8568	Derya	ÇEVİK TAŞDEMİR	derya.çevik taşdemir11@gmail.com	5509080265	1982-02-09	27	f	70677173180	0
8569	Esra	SALTIK YAMAN	esra.saltık yaman 50@gmail.com	5446456967	1994-01-08	61	f	80613426058	0
8570	Ömer	KARTAL	ömer.kartal66@gmail.com	5574994654	2001-11-14	63	t	31497269154	0
8572	Emre	CÖMERT	emre.cömert41@gmail.com	5375549496	1991-12-11	34	t	13768988069	7
8573	Furkan	ÖVÜNDÜR	furkan.övündür86@gmail.com	5463250125	1989-03-10	34	t	84118702699	0
8574	Deniz Merve	ERCAN	deniz merve.ercan11@gmail.com	5324973104	1983-05-19	27	f	62681441079	0
8575	Elif	KAM	elif.kam28@gmail.com	5321993939	1981-04-03	52	f	16587956984	0
8576	Muhammed	ÜNSAL	muhammed.ünsal78@gmail.com	5605511384	1984-07-14	6	t	88562325956	0
8577	Mehtap	MUTLU	mehtap.mutlu88@gmail.com	5594509684	1985-02-22	34	f	88433782508	0
8578	Yavuz Selim	DİCLE	yavuz selim.dicle24@gmail.com	5347422488	1995-08-10	35	t	91246022993	0
8579	Betül	DEMİRKAYA	betül.demirkaya99@gmail.com	5442370177	1995-04-12	12	f	13313852885	0
8580	Ayşe Ayça	OSMANBAŞ	ayşe ayça.osmanbaş35@gmail.com	5354050551	2002-06-20	34	f	64340919700	0
8581	Berna	KİLERCİ	berna.kilerci16@gmail.com	5577445589	1990-09-25	34	f	24929006179	0
8583	Tuğba	BAHÇELİ	tuğba.bahçeli34@gmail.com	5381420261	1983-07-09	34	f	94609627999	0
8584	Osman	KUTLU	osman.kutlu47@gmail.com	5457600981	2002-09-28	34	t	75842393580	0
8586	Raziye	TAKAN	raziye.takan36@gmail.com	5401949479	1991-06-03	7	f	92616838794	0
8587	İbrahim	EKİNCİ	ibrahim.ekinci26@gmail.com	5411293877	1988-11-12	34	t	25541143772	0
8589	Yavuz Selim	HİRA	yavuz selim.hira86@gmail.com	5481481164	1995-06-05	24	t	55928806281	0
8590	Kemal Mahmut	KAŞGARLI	kemal mahmut.kaşgarlı23@gmail.com	5497184954	1980-05-28	34	t	88487952286	0
8591	Hamdiye	YILMAZ	hamdiye.yılmaz92@gmail.com	5524222407	1985-11-17	34	f	73091012075	0
8592	Ali	ERCAN	ali.ercan21@gmail.com	5517553389	1988-08-22	62	t	60225555251	0
8593	Ahmet Cihan	KORKMAZ	ahmet cihan.korkmaz44@gmail.com	5479190996	1982-03-09	34	t	83682997924	0
8595	Medet Can	GÜNDÜZ	medet can.gündüz69@gmail.com	5351671529	2000-02-08	34	t	37442581707	0
8596	Akif	GÖNÜLCÜ	akif.gönülcü91@gmail.com	5372774385	1992-02-22	54	t	43619640801	0
8597	Merve	KARABATAK	merve.karabatak63@gmail.com	5586762341	1994-10-10	34	f	76453168620	0
8598	Hakan	ÇITIR	hakan.çıtır27@gmail.com	5445007777	2003-04-10	28	t	30576691919	0
8599	Arda	ALMALI	arda.almalı31@gmail.com	5494260818	1986-12-05	34	t	61742031971	1
8601	Dilek	SELEK	dilek.selek75@gmail.com	5558996856	1995-01-06	57	f	18946161694	0
8602	Emre	TÜRKCAN	emre.türkcan93@gmail.com	5515469716	1983-12-10	34	t	59138751716	0
8603	Aykut	AKTAŞ	aykut.aktaş11@gmail.com	5367804555	1994-08-12	67	t	68962460640	0
8604	Sabahat	YAZICI	sabahat.yazıcı67@gmail.com	5352992942	1993-06-07	6	f	81748002039	0
8605	Suat	SELÇUK	suat.selçuk29@gmail.com	5512306752	1984-11-28	34	t	53314851016	0
8607	Sevim	ŞAHİN	sevim.şahin45@gmail.com	5305748361	2002-06-26	61	f	33212661091	0
8609	Yusuf	ERDEM	yusuf.erdem90@gmail.com	5597726761	1989-08-24	33	t	20247958087	0
8611	Esra Nur	ŞAĞBAN	esra nur.şağban87@gmail.com	5438261863	1992-02-23	16	f	59445686044	0
8612	Enes	ÇETİN	enes.çetin11@gmail.com	5548390558	1981-09-17	34	t	85273973028	0
8616	H.eylül	GÜNDAY	h.eylül.günday68@gmail.com	5398383747	1997-11-19	6	f	68760197799	0
8617	Erdoğan	BOZ	erdoğan.boz69@gmail.com	5581542716	1996-10-25	23	t	32510670233	0
8618	Bilal	EREN	bilal.eren21@gmail.com	5521321260	1985-04-19	34	t	76606350184	0
8619	Hamit	İLME	hamit.ilme65@gmail.com	5485322100	1988-03-15	34	t	88887070060	0
8620	Akif	UZUN	akif.uzun26@gmail.com	5524363227	1997-04-15	34	t	43194499565	1
8621	Demet	VATANSEVER KAHRAMAN	demet.vatansever kahraman78@gmail.com	5394467755	1996-05-09	10	f	83554498435	0
8623	Bilge	RÜZGAR	bilge.rüzgar81@gmail.com	5353535501	2003-07-01	62	f	61808997487	0
8625	Nur	SERBEST	nur.serbest27@gmail.com	5601816266	1983-10-09	34	f	30012753484	0
8627	Musa	TUNÇ	musa.tunç80@gmail.com	5603084262	1986-07-15	72	t	61297516577	0
8628	Zeynep Kübra	KAVCAR	zeynep kübra.kavcar40@gmail.com	5508190655	2003-07-14	34	f	40437287499	0
8630	Huriye	FELEKOGLU	huriye.felekoglu82@gmail.com	5539000925	1989-03-15	38	f	69446216638	0
8631	Salih	ÇALIK	salih.çalık54@gmail.com	5475331898	1994-09-28	28	t	22874681799	0
8632	Alev	YÜCEL	alev.yücel72@gmail.com	5344201908	2002-06-13	60	f	98322951941	0
8633	Duygu	GÜLER	duygu.güler66@gmail.com	5485515665	1998-12-27	16	f	67241805289	0
8634	Aykut Emre	BİTER	aykut emre.biter44@gmail.com	5471611817	1999-05-09	58	t	41245093221	0
8635	Ali Halid	USLU	ali halid.uslu20@gmail.com	5391332726	1989-10-10	57	t	84988951849	0
8637	Eda	GEZMEK	eda.gezmek62@gmail.com	5304613190	1983-04-21	34	f	85115812136	0
8638	Hacı Murat	KESKİNKILINÇ	hacı murat.keskinkılınç59@gmail.com	5318847868	1980-05-13	34	t	37501687232	0
8639	Samet	ÖZTÜRK	samet.öztürk65@gmail.com	5341122159	1993-04-17	6	t	73653281859	0
8640	Servet	KORKMAZ	servet.korkmaz94@gmail.com	5566300615	1985-08-21	75	t	45700689873	0
8641	Ferit	ARĞUN	ferit.arğun61@gmail.com	5476333997	1993-11-03	21	t	37104732649	0
8642	Süleyman Yaman	ALPATA	süleyman yaman.alpata58@gmail.com	5309199601	1988-12-09	34	t	52577230129	0
8643	Hülya	YAĞCI	hülya.yağcı38@gmail.com	5423375187	1990-07-12	34	f	46344052176	0
8644	Emre	BARKIN	emre.barkın57@gmail.com	5607599656	1985-05-08	34	t	31434255910	0
8645	Mehmet	ALTUNKILIC	mehmet.altunkılıc47@gmail.com	5321144633	1996-11-07	52	t	27577752730	0
8646	Robert	KUL	robert.kul89@gmail.com	5462426659	1986-02-18	34	t	33561544228	0
8650	Tuğba	TEKELİOĞLU	tuğba.tekelioğlu39@gmail.com	5371046584	1987-08-07	7	f	49954347642	0
8651	Hilal	ÇİMEN	hilal.çimen33@gmail.com	5408318847	1990-07-25	34	f	93361143725	0
8652	Kazim	ALBAYRAK	kazim.albayrak34@gmail.com	5371809160	1994-11-14	61	t	46087518871	0
8653	Rümeysa	YILMAZ	rümeysa.yılmaz84@gmail.com	5367872110	1984-12-07	81	f	13977589538	0
8654	Aslı	DEĞERLİ	aslı.değerli93@gmail.com	5545551675	1981-12-26	35	f	53053418882	0
8655	Melis	KANDEMİR	melis.kandemir22@gmail.com	5322794621	1991-05-17	34	f	66086236591	0
8658	Mustafa	KOYUN	mustafa.koyun75@gmail.com	5331393558	2001-06-21	34	t	23368477562	0
8659	Süleyman	ORAL	süleyman.oral74@gmail.com	5395475695	1992-06-07	68	t	92816624912	0
8660	Mert İlbey	KARAKAŞ	mert ilbey.karakaş63@gmail.com	5462810349	1989-11-15	16	t	60292096049	0
8661	Mahmut	ŞAHİN	mahmut.şahin90@gmail.com	5386276617	1996-05-21	61	t	59714852743	0
8662	Atacan	BAYSEFEROĞULLARI	atacan.bayseferoğulları34@gmail.com	5447299530	1999-11-15	13	t	89845210605	0
8663	Cihan	HANELÇİ	cihan.hanelçi33@gmail.com	5383668383	1993-02-04	34	t	95493332725	0
8664	Fatih	BÜTÜNER	fatih.bütüner54@gmail.com	5562164367	1987-07-21	34	t	38451722769	0
8666	Çagla	AKIN	çagla.akın64@gmail.com	5556631467	1989-06-08	41	f	53457707439	0
8667	Seda	İNCİ	seda.inci37@gmail.com	5483469328	1999-09-11	34	f	86889690849	0
8668	Aydın Tolga	ERGUN	aydın tolga.ergun95@gmail.com	5321757739	1991-04-01	34	t	18707184238	7
8669	Sema	KAYA	sema.kaya31@gmail.com	5341894205	1999-10-22	21	f	36710256712	0
8670	Fettah	AKDOĞAN	fettah.akdoğan80@gmail.com	5548468810	2003-10-15	23	t	21889086052	0
8671	Yalçın	DEMİR	yalçın.demir53@gmail.com	5375812644	1990-05-26	34	t	76045214335	0
8672	Murat	ALTUN	murat.altun32@gmail.com	5418157624	1992-01-17	71	t	10378853470	0
8673	Elif	YENİÇERİ	elif.yeniçeri81@gmail.com	5334460622	1992-01-14	1	f	68768497081	0
8674	Gülseren	DELİPINAR KAYTAN	gülseren.delipınar kaytan16@gmail.com	5443885653	1995-03-02	34	f	37117050123	0
8676	İlker	DURMUŞ	ilker.durmuş22@gmail.com	5455463916	1999-10-17	11	t	17185890975	0
8677	Hatice Tayyibet	ERSOY PETEK	hatice tayyibet.ersoy petek70@gmail.com	5381439956	2001-08-28	44	f	42181659206	0
8678	Hilal	YURT	hilal.yurt59@gmail.com	5556503717	1985-11-20	6	f	57658181189	0
8679	Hakkı	BÜYÜKCENGİZ	hakkı.büyükcengiz47@gmail.com	5337579997	1983-05-15	42	t	32583095426	0
8680	İrem	BACAKSIZ	irem.bacaksız90@gmail.com	5332427415	1984-01-06	41	f	41353690583	0
8681	İlknur	DURSUN	ilknur.dursun46@gmail.com	5524713371	2003-01-03	16	f	45533196861	0
8682	Merve	AKŞİT	merve.akşit76@gmail.com	5588539889	1982-04-10	43	f	75906891707	0
8683	Ensar	TOPCU	ensar.topcu65@gmail.com	5584947824	1991-05-22	25	t	57824899937	0
8684	Fuat	ONBAŞILI	fuat.onbaşılı27@gmail.com	5343272516	2000-12-15	38	t	91502618766	0
8685	Mert	MANGUT	mert.mangut19@gmail.com	5502993331	1996-01-09	34	f	13951862769	0
8686	Şeyma	DELİPOYRAZ	şeyma.delipoyraz55@gmail.com	5513792747	1999-05-27	34	f	71272419351	0
8687	Yaşar	MERAL	yaşar.meral76@gmail.com	5317523488	1997-04-17	25	t	13077942613	0
8689	Buse	KUĞUOĞLU	buse.kuğuoğlu78@gmail.com	5477913479	1987-02-10	34	f	33318435500	0
8690	Emine	FERİK	emine.ferik92@gmail.com	5528365766	1987-09-25	16	f	58280158964	0
8691	Tülay	YİĞİT	tülay.yiğit83@gmail.com	5541801668	2002-09-04	34	f	61609659265	0
8693	Doğanay	ÇELİK	doğanay.çelik16@gmail.com	5355476166	2001-10-19	6	t	55094710539	0
8694	İlke	ÇAKABEY	ilke.çakabey65@gmail.com	5428417281	2002-02-24	34	t	34518726735	0
8696	Muhammed İkbal	ÇELİK	muhammed ikbal.çelik93@gmail.com	5543575257	1991-02-25	80	t	13308896099	0
8697	Meltem	POLAT	meltem.polat11@gmail.com	5308103695	1988-05-09	6	f	44031035980	0
8698	Kadir	FİDAN	kadir.fidan21@gmail.com	5318924647	1980-11-10	47	t	31714583978	0
8699	Alper	ERDAŞ	alper.erdaş80@gmail.com	5515416312	2001-08-04	39	t	62197115965	0
8700	Funda	ALCİN	funda.alcin30@gmail.com	5325465443	1995-01-27	16	f	76175372308	0
8704	Emin	KÜÇÜK	emin.küçük95@gmail.com	5517612934	1996-07-27	34	t	72824091748	0
8705	Zafer	ERBAŞLAR	zafer.erbaşlar48@gmail.com	5511682733	1983-07-17	16	t	21878750808	0
8706	Göktuğ Can	BURUL	göktuğ can.burul66@gmail.com	5411733278	2002-06-27	35	t	73533270148	0
8708	Özgün	GÜNGÖR	özgün.güngör78@gmail.com	5371052289	1995-09-14	35	f	17961134811	0
8709	Ülkün	EKEN	ülkün.eken89@gmail.com	5587107375	1994-12-10	16	f	24717108827	0
8713	Kaan	PAÇACI	kaan.paçacı79@gmail.com	5568555694	2003-07-02	34	t	31834688334	0
8714	Sezgin	IŞIK	sezgin.ışık77@gmail.com	5473922353	2002-04-09	16	t	47330811579	0
8715	Berk	ÖZCAN	berk.özcan24@gmail.com	5448365926	1988-07-10	6	t	15012434411	0
8716	Gökhan	DALMA	gökhan.dalma35@gmail.com	5593518797	1987-10-15	34	t	22476336588	0
8717	Emre	ÇINAR	emre.çınar75@gmail.com	5328911333	1990-02-26	34	t	52640137696	0
8718	Tuğçe	ARSLANPINAR	tuğçe.arslanpınar14@gmail.com	5534166816	1996-08-13	42	f	54323560938	0
8720	Nazlı	ŞEN	nazlı.şen71@gmail.com	5315151586	1996-06-23	34	f	32203925634	0
8721	Cefa	AKDAĞ	cefa.akdağ70@gmail.com	5366796862	1983-08-10	65	t	43563003850	0
8722	Ayşe Beyza	CEYLAN	ayşe beyza.ceylan81@gmail.com	5591874229	1986-10-16	68	f	23188821868	0
8723	İlkcan Anıl	ÇAKMAK	ilkcan anıl.çakmak96@gmail.com	5339146291	1999-12-06	34	t	92047793531	0
8726	Büşra Çağla	EGEL	büşra çağla.egel86@gmail.com	5356908338	1997-05-01	34	f	14492157378	0
8728	Özge	KORKUSUZ	özge.korkusuz89@gmail.com	5476366461	1998-05-09	34	f	82594631604	0
8730	Abdullah Gazi	KARATAŞ	abdullah gazi.karataş57@gmail.com	5474594592	1996-05-17	2	t	37612284814	0
8731	Ahmet Sami	KURİŞ	ahmet sami.kuriş14@gmail.com	5304569872	2003-03-09	54	t	73991619677	0
8735	Tuğba	ATA	tuğba.ata96@gmail.com	5411266242	1982-10-06	51	f	39047100233	0
8736	Uğur	GATFAR	uğur.gatfar91@gmail.com	5474752316	1986-08-07	34	t	15319127604	0
8738	Hasan Uğur	YÜCE	hasan uğur.yüce40@gmail.com	5528298909	1985-09-20	34	t	63084044625	0
8739	Birgül	ANBALAY	birgül.anbalay82@gmail.com	5431005701	1986-04-17	34	f	54463695187	0
8740	Sinem	ÜNER	sinem.üner36@gmail.com	5604969451	2000-01-04	34	f	37698017502	0
8741	Mehmet	YILDIZ	mehmet.yıldız82@gmail.com	5434463763	1996-03-12	16	t	27741171740	0
8743	Muhammed Ebubekir	TEMEL	muhammed ebubekir.temel97@gmail.com	5379007486	1983-08-14	34	t	13834758778	0
8744	Elif	CİVELEK	elif.civelek50@gmail.com	5515747476	1996-08-22	40	f	80602746189	0
8745	Hazal	BARAN	hazal.baran89@gmail.com	5515575501	1984-05-06	34	f	38043160633	0
8746	Deniz	DARUN	deniz.darun58@gmail.com	5563518769	1987-11-08	46	f	28164956540	0
8748	Tayfun	DEMİR	tayfun.demir73@gmail.com	5386961790	2001-11-01	34	t	49231925379	0
8751	Nazmiye	BİRYAN	nazmiye.biryan79@gmail.com	5461222684	2000-11-20	34	f	92831593102	0
8753	Lütfi	PETEK	lütfi.petek34@gmail.com	5411677249	1992-04-11	6	t	48099229573	0
8754	Tuğba	HUSREVOĞLU	tuğba.husrevoğlu28@gmail.com	5495364599	1996-03-23	34	f	76359178090	0
8758	Tamer	SEVİNÇ	tamer.sevinç57@gmail.com	5607435593	1984-04-20	16	t	32624521895	0
8760	Gülçin	SARIKAYA	gülçin.sarıkaya93@gmail.com	5547821472	2003-11-21	20	f	90877659875	0
8761	Sercan	YILMAZ	sercan.yılmaz88@gmail.com	5392990416	1986-01-17	34	t	87604476512	0
8762	Muhammet Selim	BİLİCİ	muhammet selim.bilici62@gmail.com	5346923209	1988-10-09	25	t	36308988707	0
8763	Ekin	TUNA	ekin.tuna46@gmail.com	5375064175	1985-02-18	35	f	74016783978	0
8764	Pınar	GÖNÜL	pınar.gönül99@gmail.com	5446450206	1982-10-23	59	f	23639988264	0
8765	Orhun	TAŞYÜREK	orhun.taşyürek15@gmail.com	5502759880	1983-02-25	6	t	71321537267	0
8766	Ferit	OSOYDAN	ferit.osoydan 57@gmail.com	5354924976	2001-08-12	34	t	79727524657	0
8767	Sevda	BABAOĞLU	sevda.babaoğlu29@gmail.com	5464566920	1994-07-27	42	f	83321879017	0
8768	Umut	KABAKCI	umut.kabakcı10@gmail.com	5532262459	1993-08-03	6	t	18298250320	0
8769	Hacı Mehmet	ÇOBAN	hacı mehmet.çoban58@gmail.com	5367733154	1992-01-19	44	t	15802353948	0
8772	Elçin	ÇELİK	elçin.çelik63@gmail.com	5524256505	2000-03-23	34	f	18680782470	0
8773	Elif	YILMAZ	elif.yılmaz16@gmail.com	5524357328	1989-09-15	34	f	47261690389	0
8775	Ali Musab	AKDAL	ali musab.akdal42@gmail.com	5492526103	1995-02-07	65	t	54011135395	0
8777	Ali Baran	ÜNALAN	ali baran.ünalan36@gmail.com	5466717727	1985-05-09	34	t	96473086193	0
8778	Filiz	KOÇAK	filiz.koçak26@gmail.com	5401679247	1989-09-01	6	f	83907352341	0
8781	Mehmet Çoşku	ALP	mehmet çoşku.alp57@gmail.com	5462439674	1991-05-13	35	t	83709384254	0
8784	Onur	BAYAR	onur.bayar46@gmail.com	5407140114	1987-02-01	34	t	18521330499	1
8790	Ferzin Reyhan	İPEKYÜZ	ferzin reyhan.ipekyüz89@gmail.com	5573452296	1992-01-04	21	f	24737037306	0
8793	Fatih	BÖLÜKBAŞI	fatih.bölükbaşı48@gmail.com	5495814138	1990-10-20	34	t	69868199397	0
8794	Muhammet	UZUNER	muhammet.uzuner89@gmail.com	5582510686	1993-09-21	8	t	17518862305	0
8796	Özlem	YAMAN	özlem.yaman74@gmail.com	5578056210	1984-06-04	41	f	49915270617	0
8798	Büşra	DAĞCI	büşra.dağcı85@gmail.com	5356313462	1983-04-15	60	f	85344598357	0
8802	Soner	KESKİN	soner.keskin18@gmail.com	5306422789	2003-08-15	52	t	11321707149	0
8803	Şahzüver	ÇAKIR	şahzüver.çakır82@gmail.com	5511730976	1985-02-12	60	t	36584559342	0
8804	Tolga	ATASOY	tolga.atasoy52@gmail.com	5596332375	1980-05-28	34	t	26464477564	0
8805	İskender	ÜNLÜ	iskender.ünlü52@gmail.com	5455974544	2000-12-10	70	t	94120646514	0
8806	Neval	ŞENBAYRAM	neval.şenbayram75@gmail.com	5411797251	1987-10-14	63	f	61326846496	0
8807	İpek Suat	GÜNEŞ	ipek suat.güneş67@gmail.com	5596003292	2003-08-08	34	f	54191556479	0
8809	Hüseyin	EKER	hüseyin.eker55@gmail.com	5366812557	1988-12-14	41	t	76314663169	0
8810	Bahar	DİVRİK	bahar.divrik20@gmail.com	5511036592	1988-07-04	16	f	77349773180	0
8811	Melike Ayşe	KAPDAN	melike ayşe.kapdan12@gmail.com	5301320935	1991-01-13	34	f	38370700044	0
8815	Mustafa	ÖZDEMİR	mustafa.özdemir31@gmail.com	5524245637	1995-07-25	28	t	34329362221	0
8817	Oğuzcan	KUTKAN	oğuzcan.kutkan84@gmail.com	5412823564	1995-02-27	9	t	84757232234	0
8818	Hazal	NAZLI	hazal.nazlı42@gmail.com	5422458619	1983-09-04	34	f	39344497133	0
8819	Enis	GÖK	enis.gök93@gmail.com	5302135685	1982-07-17	34	t	12180230344	0
8823	Yunus Emre	NARİN	yunus emre.narin52@gmail.com	5358013171	1982-10-09	16	t	39116232996	0
8825	Emrah	ÇEVİK	emrah.çevik16@gmail.com	5477611646	1983-12-02	2	t	17203739808	0
8826	Tuğçe	ÖZTEL	tuğçe.öztel17@gmail.com	5326313358	1989-11-21	34	f	93527536235	0
8827	Hüseyin Berk	ÇANKAYA	hüseyin berk.çankaya71@gmail.com	5592439686	1984-02-06	41	t	30892868342	0
8830	Ulaş	KAYA	ulaş.kaya74@gmail.com	5551376160	1991-06-18	45	t	28601181040	0
8831	Buket	ERKUL	buket.erkul34@gmail.com	5425915269	1991-11-26	34	f	57937697324	0
8832	Ahmet Yasir	YILMAZ	ahmet yasir.yılmaz60@gmail.com	5447225622	2000-11-22	28	t	81673578545	0
8833	Emel	OKUR ÇETİNKAYA	emel.okur çetinkaya45@gmail.com	5347936955	1991-07-24	34	f	61112380532	0
8835	Hayri Barış	ÖDEMİŞ	hayri barış.ödemiş21@gmail.com	5464566723	1980-01-26	16	t	51856495666	0
8836	Mehmet Kemal	TÖMEK	mehmet kemal.tömek14@gmail.com	5451018628	1982-03-13	34	t	26535940340	0
8838	Eda	KAHRİMAN	eda.kahriman11@gmail.com	5567605968	1984-09-16	34	f	19606566903	0
8839	Uluğ Çağrı	BEYAZ	uluğ çağrı.beyaz94@gmail.com	5367574803	1994-11-10	25	t	79365509592	0
8841	Umut	ŞİMŞEK	umut.şimşek25@gmail.com	5494285524	1990-08-17	6	t	92319904620	0
8842	Burcu	ÜNLÜ	burcu.ünlü61@gmail.com	5601717471	1991-03-16	35	f	67310081400	0
8843	Seda	SİNEK	seda.sinek32@gmail.com	5429059899	1982-12-19	34	f	74316423920	0
8846	İdil	KINAV	idil.kınav 92@gmail.com	5518503348	2003-09-14	16	f	79533294049	0
8847	Yusuf Abdullah	KOÇ	yusuf abdullah.koç74@gmail.com	5481050222	1996-11-22	34	t	47610897967	0
8850	Dorukhan	DEMİRBİLEK	dorukhan.demirbilek48@gmail.com	5517554968	1991-09-13	34	t	97628021037	0
8851	Eda	DELİGÖZ	eda.deligöz77@gmail.com	5353139675	1996-08-19	35	f	48632391732	0
8852	Mehmet Fatih	ORHAN	mehmet fatih.orhan25@gmail.com	5499127607	1995-09-06	34	t	49804580105	0
8854	Mert	İPEK	mert.ipek97@gmail.com	5516975230	1999-05-23	42	t	86539318587	0
8855	Samet	KODAMAN	samet.kodaman53@gmail.com	5415505601	1995-07-24	16	t	21991881634	0
8856	Hasan Mert	GÜNER	hasan mert.güner36@gmail.com	5347143174	1986-08-20	55	t	17655506568	0
8862	Saadettin	PENÇE	saadettin.pençe62@gmail.com	5316335593	1993-03-13	51	t	95279174187	0
8863	Burak Ekim	ÜRÜN	burak ekim.ürün17@gmail.com	5321431380	1980-04-06	34	t	91446727512	1
8864	Özkan	KARATAÇ	özkan.karataç68@gmail.com	5557419101	1982-11-22	34	t	56606857019	0
8866	Umıt Mehmet	KARALI	umıt mehmet.karalı44@gmail.com	5373776715	1987-03-15	53	t	58164677574	0
8867	Fethiye	ÖZHÜSREV	fethiye.özhüsrev95@gmail.com	5542911955	1982-03-12	44	f	53912268417	0
8868	Bayram	HAYMANA	bayram.haymana65@gmail.com	5306551214	1980-03-21	78	t	77341066671	0
8869	Hüseyin	POLAT	hüseyin.polat53@gmail.com	5507579542	2001-05-24	44	t	24560431935	0
8874	Öznur	SUBAŞI KARAYİĞİT	öznur.subaşı karayiğit17@gmail.com	5525779102	1991-09-19	6	f	15428321763	0
8875	Merve	BİÇİMVEREN	merve.biçimveren 66@gmail.com	5597320775	1992-04-28	50	f	17083078425	0
8878	Eda	BOĞA	eda.boğa13@gmail.com	5341379173	1980-10-27	34	f	64936013920	0
8879	Özge	TAN	özge.tan20@gmail.com	5421224348	1995-03-22	34	f	51684838536	0
8880	Harun	ŞEN	harun.şen80@gmail.com	5334184427	1992-05-21	65	t	94077113215	0
8882	Veysel	KILINÇ	veysel.kılınç19@gmail.com	5385299543	1987-03-12	65	t	13809675973	0
8883	Nagehan	ERÇAKAR	nagehan.erçakar51@gmail.com	5442914796	2000-05-24	34	f	14071796700	0
8885	Serkan	ARGIN	serkan.argın94@gmail.com	5382717795	1980-09-12	1	t	60015802837	0
8886	Şükrü	ŞEKERCİ	şükrü.şekerci45@gmail.com	5345856359	1992-03-21	60	t	20851424283	0
8887	Selim Sinan	GÜLERYÜZ	selim sinan.güleryüz74@gmail.com	5378977572	1989-01-10	34	t	14751926543	0
8888	Bircan	ESER	bircan.eser28@gmail.com	5603595650	1992-09-18	23	f	68813287797	0
8889	Hasibe	KIZILTAŞ	hasibe.kızıltaş35@gmail.com	5336790474	1990-01-05	34	f	47278422295	0
8890	Erkan	GÜRSU	erkan.gürsu46@gmail.com	5572666937	2003-01-18	34	t	97977231036	0
8891	Tugay	SARIKAYA	tugay.sarıkaya77@gmail.com	5364460191	1989-10-26	34	t	15499207825	0
8892	Nazlıhan	DOĞAN CANBAZOĞLU	nazlıhan.doğan canbazoğlu65@gmail.com	5403090159	1995-04-12	62	f	25527980032	0
8893	Enes Şura	TOSUN	enes şura.tosun64@gmail.com	5566916267	1983-05-13	19	t	92073029934	0
8894	Kemal	AKALIN	kemal.akalın46@gmail.com	5314844319	1983-08-05	55	t	21481172545	0
8895	Ayşe	CİVELEK	ayşe.civelek47@gmail.com	5461336976	1988-06-17	34	f	26632913278	0
8896	Mustafa Kemal	KAVRAK	mustafa kemal.kavrak94@gmail.com	5418454244	2003-01-06	34	t	65379165349	0
8897	Cem	TUNCA	cem.tunca86@gmail.com	5353133442	1989-09-11	34	t	75045932903	0
8898	Caner	ÖZLER	caner.özler41@gmail.com	5591855974	1996-07-27	41	t	25311407832	0
8900	Melis Ayşenur	ERSÖZ	melis ayşenur.ersöz75@gmail.com	5478719706	1985-07-17	26	f	40407407839	0
8901	Yusuf	AKAYDIN	yusuf.akaydın75@gmail.com	5543190616	1984-03-17	34	t	44972555531	0
8902	Ezgi	FİDANBOY	ezgi.fidanboy47@gmail.com	5364229368	2002-10-19	6	f	10903560434	0
8903	Neriman Ayça	AYRAN	neriman ayça.ayran34@gmail.com	5522531933	1986-05-18	11	f	61644390347	0
8904	Erhan	TARHAN	erhan.tarhan86@gmail.com	5541487345	1980-06-23	39	t	23623955933	0
8905	Didem	TEL	didem.tel36@gmail.com	5556418607	1999-10-12	34	f	52433223017	0
8906	Recep	ÖZKUL	recep.özkul83@gmail.com	5463595265	1984-07-23	43	t	87316034234	0
8907	Berk Olçum	BİLGİN	berk olçum.bilgin59@gmail.com	5495769231	1984-06-21	6	t	82925319597	0
8908	İlhan	ELMACI	ilhan.elmacı10@gmail.com	5458329779	1996-06-23	31	t	80423509954	0
8909	Erdem	GÜNERİ	erdem.güneri36@gmail.com	5474714843	1998-09-23	12	t	99848894193	0
8911	Duygu	ŞAKAR	duygu.şakar78@gmail.com	5514245175	1995-09-25	16	f	22498310374	0
8912	Müjde	ERTAŞ	müjde.ertaş25@gmail.com	5302916914	1981-10-12	34	f	34764404594	0
8914	Dilek	YONAR	dilek.yonar36@gmail.com	5533644469	1990-08-23	34	f	50538302209	0
8915	Birsen	DERDİYOK	birsen.derdiyok31@gmail.com	5457079622	1990-02-27	34	f	36767727606	0
8916	Gökhan	CİNDEMİR	gökhan.cindemir33@gmail.com	5578459663	1994-09-21	67	t	92831664367	0
8917	Adil Emin	ÖZAY	adil emin.özay79@gmail.com	5312470999	1989-08-12	55	t	84867802231	0
8918	Sıla	SOYDAŞ	sıla.soydaş37@gmail.com	5423758847	1997-12-12	35	f	95486921729	0
8920	Süleyman Deniz	ARSLAN	süleyman deniz.arslan92@gmail.com	5395883582	1981-09-26	21	t	42203363439	0
8921	Gurkan	SENGUL	gurkan.sengul21@gmail.com	5528218351	1990-03-18	34	t	97420671490	0
8923	Sevde	KEÇER KORKMAZ	sevde.keçer korkmaz62@gmail.com	5551326934	2000-10-10	34	f	35863973011	0
8924	Mustafa	ÇELEBİ	mustafa.çelebi75@gmail.com	5531601153	1987-11-09	34	t	93428939938	0
8925	Mehmet Oğuz	KARA	mehmet oğuz.kara18@gmail.com	5378158650	1982-09-19	34	t	96454083348	0
8926	Alican	CAPAN	alican.capan27@gmail.com	5576898908	1982-05-23	27	t	56529253188	0
8928	Songül	SARAÇ	songül.saraç30@gmail.com	5575978630	1988-05-06	34	f	55354749935	3
8929	Burcu	ÖZKUL	burcu.özkul83@gmail.com	5605638823	1990-06-11	81	f	37901470929	0
8930	Barış	YILDIRIM	barış.yıldırım28@gmail.com	5594525677	1994-07-22	37	t	61861501401	5
8931	Nida	SEVİNMİŞ	nida.sevinmiş 24@gmail.com	5564501934	1981-05-02	33	f	53568367392	1
8934	Burhan	AYIK	burhan.ayık66@gmail.com	5387313191	1989-09-07	56	t	57967043578	0
8937	Elif	ÖZLEN	elif.özlen72@gmail.com	5536042875	1995-04-14	34	f	95179146576	0
8938	Didem	VURAL	didem.vural38@gmail.com	5604025967	1993-08-14	34	f	32803394402	0
8939	Yunus	ÇETİNKAYA	yunus.çetinkaya33@gmail.com	5554426771	1999-07-19	33	t	43889215744	0
8940	Aygül	İNCİSOY	aygül.incisoy83@gmail.com	5497042243	2000-03-20	46	f	12296771939	0
8942	Nihal	AKTUĞ	nihal.aktuğ59@gmail.com	5573409504	1985-03-28	34	f	90574565310	0
8944	Cansu	SAÇ	cansu.saç 19@gmail.com	5309090562	1981-10-12	34	f	56601050297	0
8945	Ayşe	TAŞDELEN	ayşe.taşdelen46@gmail.com	5332568419	1988-04-16	6	f	37431036164	0
8946	Mehmet	KART	mehmet.kart80@gmail.com	5562064695	1980-03-06	20	t	56877923695	0
8947	Elif Nur	ÇEPNİ	elif nur.çepni93@gmail.com	5605392400	1991-07-20	34	f	27395446103	0
8951	Ümran İrem	TEMİZ	ümran irem.temiz75@gmail.com	5447158250	2000-03-18	34	f	43130384789	0
8952	Ata	GÖKGÜR	ata.gökgür42@gmail.com	5481344319	1998-05-28	34	t	51578761851	0
8953	Kamber Oğulcan	AKGÜN	kamber oğulcan.akgün78@gmail.com	5494587213	1990-09-09	7	t	83943673343	0
8954	Melih	YILMAZ	melih.yılmaz41@gmail.com	5451966491	1998-12-19	34	t	56640328357	0
8955	Barış Ozan	AYDEMİR	barış ozan.aydemir45@gmail.com	5527892372	1980-11-13	34	t	43622629741	0
8956	Yasemin	ATASEVER	yasemin.atasever47@gmail.com	5411794426	1981-06-26	34	f	96058704558	0
8957	Ersin	YALMAN	ersin.yalman52@gmail.com	5601872657	1989-05-16	36	t	28568821407	0
8960	Hanife	MUHÇU	hanife.muhçu91@gmail.com	5501752696	1995-05-01	61	f	68414465261	0
8961	Derya	ELMAS	derya.elmas76@gmail.com	5411417711	1999-08-26	34	f	72051233440	0
8962	Mehmet Akif	BEYHAN	mehmet akif.beyhan59@gmail.com	5592367643	1995-03-25	65	f	28497316413	4
8964	Tuğba	BAYLAN	tuğba.baylan79@gmail.com	5443429582	1988-08-01	5	f	16016092888	0
8965	Elif	ÖZAYDIN	elif.özaydın24@gmail.com	5346090817	1998-09-19	34	f	23712733617	0
8966	Cihat	AHISHALI	cihat.ahıshalı10@gmail.com	5324384931	1988-04-17	19	t	82963724714	0
8967	Senem	ELİYAS	senem.eliyas84@gmail.com	5327485774	1991-05-21	34	f	48039388741	0
8969	Melih	ALTINAY	melih.altınay40@gmail.com	5478679337	1987-03-15	34	t	97659408479	0
8970	Ozlem	DOGAN	ozlem.dogan96@gmail.com	5569151819	2001-06-17	34	f	96349267997	0
8971	Hazel Sinem	POYRAZ	hazel sinem.poyraz55@gmail.com	5306167947	1990-10-04	34	f	81331570424	0
8972	Esra	KAHRAMAN	esra.kahraman97@gmail.com	5557334162	1996-08-20	17	f	64653635101	0
8973	Işıl	KILIÇ	ışıl.kılıç38@gmail.com	5564145885	1984-12-28	35	f	25999557108	0
8974	Adem	DERİN	adem.derin 97@gmail.com	5484599315	2000-11-21	3	t	40592952648	0
8975	Özgür	HANOGLU	özgür.hanoglu55@gmail.com	5471928680	1995-11-10	16	t	10821088045	0
8976	Ertuğrul	TAN	ertuğrul.tan32@gmail.com	5604469796	1982-05-03	62	t	90459298917	0
8977	Sema	TEMİRELLİ	sema.temirelli53@gmail.com	5482946594	2000-08-06	34	f	14430887702	0
8978	Meral Mumine	TÜRKMEN	meral mumine.türkmen76@gmail.com	5352280904	1984-03-20	70	f	60888642658	0
8980	Gülgün	GÖL FİL	gülgün.göl fil90@gmail.com	5321569993	1996-04-26	58	f	24494129979	0
8982	Ayşe	KARA	ayşe.kara72@gmail.com	5597897885	1987-01-06	34	f	47865487956	0
8983	Osman Buğrahan	KARA	osman buğrahan.kara12@gmail.com	5496978276	2003-03-21	34	t	98819006176	0
8985	Barış	KÖMÜRCÜ	barış.kömürcü65@gmail.com	5448851203	1982-10-12	34	t	20594446060	0
8990	Ömer	GÖRGÜLÜ	ömer.görgülü56@gmail.com	5539109127	1989-02-02	35	t	60840956946	0
8991	Emre	GÜRBULAK	emre.gürbulak48@gmail.com	5351814617	1981-07-09	47	t	13511662232	0
8993	Aşkın	YILDIZ	aşkın.yıldız49@gmail.com	5544937617	1989-12-01	44	t	97873509949	0
8994	Şule	ÇELİK	şule.çelik80@gmail.com	5608542289	1997-03-09	44	f	58805547076	0
8995	Kerem	YILMAZ	kerem.yılmaz94@gmail.com	5542440469	1992-07-27	16	t	54696437286	0
8996	Mehmet Sıddık	ÇETİNEL	mehmet sıddık.çetinel 19@gmail.com	5562082728	1999-04-01	4	t	27043568370	0
8997	Mine	DUMAN	mine.duman13@gmail.com	5311427766	1988-05-10	34	f	27391719834	0
8998	Özer	YILDIZ	özer.yıldız17@gmail.com	5397019266	1984-05-06	34	t	72746721748	0
9003	Özgür Veysel	DEMİRTAŞ	özgür veysel.demirtaş76@gmail.com	5503353509	1988-01-20	6	f	23683303834	0
9004	Bekir	İŞLEK	bekir.işlek50@gmail.com	5505729903	1991-03-27	3	t	85277127883	0
9006	Kübra	SÜMER	kübra.sümer26@gmail.com	5548704547	1983-08-22	54	f	70001757390	0
9007	Ali Haydar	MURADOĞLU	ali haydar.muradoğlu92@gmail.com	5337504351	1988-10-18	54	t	98818755518	0
9008	İbrahimcan	HUBAN	ibrahimcan.huban43@gmail.com	5413538252	1999-11-20	34	t	73459455384	7
9009	Mesut	ÇİÇEK	mesut.çiçek71@gmail.com	5576565311	1993-11-19	34	t	39334601055	0
9012	Hatice Güneş	YILDIZ	hatice güneş.yıldız36@gmail.com	5424520499	1984-05-20	34	f	92733297822	0
9015	Ebru	GÖKÇEER	ebru.gökçeer91@gmail.com	5594054413	1987-06-08	7	f	98505670217	0
9016	Hasan	EKER	hasan.eker22@gmail.com	5543109319	1985-08-01	38	t	90488923469	0
9018	Ahu	BÜLBÜL	ahu.bülbül65@gmail.com	5602841319	2001-05-05	60	f	95924518233	0
9019	Merve	NECİMOĞLU	merve.necimoğlu22@gmail.com	5443249173	1982-03-12	3	f	72329106463	0
9020	Mustafa Cüneyd	AYVAZ	mustafa cüneyd.ayvaz97@gmail.com	5591836995	1991-01-12	34	t	22597835437	0
9021	Cansel	AYDIN	cansel.aydın82@gmail.com	5601796101	1994-10-01	34	f	16655787947	0
9022	Bengu	AYBARAZ	bengu.aybaraz65@gmail.com	5403413741	1980-12-20	16	f	19913185887	0
9024	Kübra	ÇITAK	kübra.çıtak64@gmail.com	5406846884	1987-01-28	5	f	80196143576	0
9025	Dilara	DURMUŞ	dilara.durmuş83@gmail.com	5598900445	1996-11-07	34	f	58584600655	0
9027	Mehmet	TEKİNSOY	mehmet.tekinsoy53@gmail.com	5385986282	2000-06-21	71	t	65262929792	0
9029	Guven	ÖNDEMİR	guven.öndemir 91@gmail.com	5325980300	1988-07-11	6	t	11241075634	0
9030	Muuhammet Emin	CAN	muuhammet emin.can12@gmail.com	5361550570	1983-12-22	34	t	49769732973	0
9031	Resul	ALTAN	resul.altan79@gmail.com	5448700532	1988-01-20	71	t	73327229778	0
9032	Büşra Nur	DEMİR	büşra nur.demir26@gmail.com	5401008867	1995-12-11	71	f	29733879683	0
9033	Yalın Özgü	YAZICI	yalın özgü.yazıcı85@gmail.com	5528610210	1988-07-02	35	t	89630896095	0
9034	Abdulkerim	FAZLA	abdulkerim.fazla59@gmail.com	5346435816	1998-12-01	28	t	62248627041	0
9035	Fazlı Uğur	ÇOLAK	fazlı uğur.çolak55@gmail.com	5397715200	1990-05-04	34	t	90540270321	0
9037	İdil	KANDI	idil.kandı32@gmail.com	5466123381	1998-11-14	22	f	86918005917	0
9038	Sinem	AKSUN	sinem.aksun15@gmail.com	5545425427	1983-05-18	34	f	85764090146	0
9039	Öykü	AKIN	öykü.akın 61@gmail.com	5361442507	1983-09-04	34	f	74160383490	0
9040	Tuğba	SAYGI	tuğba.saygı81@gmail.com	5313985201	2001-10-01	45	f	34974136242	0
9041	Turan Abdullah	ÇAKMANUS	turan abdullah.çakmanus67@gmail.com	5335194237	1988-11-01	34	t	23027678672	0
9042	Selen	BALCI	selen.balcı73@gmail.com	5415846421	1987-05-21	34	f	15259443120	0
9044	Serhat	YILMAZ	serhat.yılmaz79@gmail.com	5432115521	1987-06-20	47	t	80337088717	0
9045	Beyza Nur	TURAN	beyza nur.turan25@gmail.com	5576817920	1997-03-01	26	f	34008561475	0
9046	Gamze	ÇELİKKARTAL	gamze.çelikkartal66@gmail.com	5492697623	1989-08-18	34	f	70661859336	0
9047	Hogır	KAYA	hogır.kaya76@gmail.com	5418996207	1994-09-01	47	t	35022036864	0
9050	Zeynep	KICI	zeynep.kıcı73@gmail.com	5467592556	1985-07-17	34	f	54302117700	0
9052	Emre Erdem	ÜNVER	emre erdem.ünver77@gmail.com	5481905847	1991-02-24	34	t	42609374277	0
9053	Onur	YÜKSEL	onur.yüksel75@gmail.com	5338699760	1996-02-09	59	t	98076133792	0
9054	Elif Kübra	GARİP	elif kübra.garip72@gmail.com	5352492369	1995-10-11	34	f	92525680642	0
9056	Osman	ÇALIM	osman.çalım67@gmail.com	5408790897	1999-11-20	2	t	72557191463	0
9057	Mustafa	KARATAŞ	mustafa.karataş 18@gmail.com	5325239175	1990-07-11	41	t	73455224855	0
9060	Erhan	ÇELİK	erhan.çelik43@gmail.com	5486757295	1988-04-06	34	t	76825976982	0
9061	nca	ASLAN	nca.aslan58@gmail.com	5501399203	1983-09-17	35	f	51415705156	0
9062	Meryem	UÇAR	meryem.uçar22@gmail.com	5536609941	2000-10-16	67	f	72778767488	0
9063	Kutluhan Berktuğ	AYGÜNEY	kutluhan berktuğ.aygüney72@gmail.com	5321342967	1999-06-05	34	t	92315412403	7
9064	Ersin	ÖZ	ersin.öz 77@gmail.com	5564624881	1983-11-11	23	t	99617468348	1
9066	Abidin	ARMAN	abidin.arman14@gmail.com	5561062396	1990-03-06	19	t	77980633110	0
9067	Dilara	ŞENSİVAS	dilara.şensivas26@gmail.com	5601954735	2000-03-11	34	f	57628751083	0
9068	Eray	EFE	eray.efe57@gmail.com	5485882426	2003-06-10	42	t	93909289430	0
9069	Zeynep	ÜÇDAL	zeynep.üçdal 16@gmail.com	5441849143	1997-02-25	34	f	40483060808	0
9070	Hasan Utku	GELBAL	hasan utku.gelbal 31@gmail.com	5323374368	2002-11-20	60	t	77813385663	0
9071	Özlem	ÇORUMLU	özlem.çorumlu21@gmail.com	5431018824	1997-07-16	19	f	72959817171	1
9072	Fatih	DEMİRCAN	fatih.demircan82@gmail.com	5486365174	1986-01-27	53	f	64789476223	0
9073	Barış	ÇAKMAKTAŞI	barış.çakmaktaşı76@gmail.com	5582469221	1990-03-18	48	t	76018438508	0
9074	Mustafa	ORUÇ	mustafa.oruç75@gmail.com	5603364738	1986-08-22	47	t	22518868169	0
9075	Betül	AKYÜZ	betül.akyüz 40@gmail.com	5526505370	1983-07-20	34	f	36893276953	0
9076	Tugce	ZENGİN	tugce.zengin27@gmail.com	5475021470	1994-08-23	54	f	69372175965	0
9077	Hakan	AKIZ	hakan.akız16@gmail.com	5482921440	1988-10-10	16	t	86634404765	0
9078	Muhammet Fatih	YÜKSEL	muhammet fatih.yüksel29@gmail.com	5505110941	1987-10-13	34	t	19955099191	0
9079	Gülşah Dilan	ÖZYURT	gülşah dilan.özyurt39@gmail.com	5451914779	1995-01-14	39	f	17742532777	0
9081	Ahmet Sena	ELBİSTANLI	ahmet sena.elbistanlı15@gmail.com	5468097660	1996-10-09	34	t	41528688768	0
9082	Emel	SAĞLAYAN	emel.sağlayan59@gmail.com	5437078567	1990-12-13	46	f	94290570307	0
9083	Tahsin	BAYRAM	tahsin.bayram69@gmail.com	5369145759	1991-10-07	61	t	66015069002	0
9084	Ayse	KUYUMCU	ayse.kuyumcu55@gmail.com	5586769910	1983-01-07	34	f	25092942178	0
9085	Şevin	PAYDAŞ	şevin.paydaş92@gmail.com	5392755859	1998-03-25	63	f	38473886989	0
9086	Abdurrahman	ÇİÇEK	abdurrahman.çiçek96@gmail.com	5457307295	1995-10-20	65	t	24001301366	0
9087	Mert	GÜVENÇLİ	mert.güvençli29@gmail.com	5447152654	1984-05-08	33	t	37260406751	1
9088	Güliz Pınar	SAYIN	güliz pınar.sayın95@gmail.com	5308991912	1996-02-27	34	f	84976247991	0
9089	Serhat	KEBABCI	serhat.kebabcı12@gmail.com	5477137671	1983-03-02	34	t	18010080187	0
9090	Esra	ATAKUL	esra.atakul41@gmail.com	5336113517	2001-03-25	21	f	49630886846	0
9091	Hakan	KANIK	hakan.kanık82@gmail.com	5538774371	1982-01-16	73	t	98154174364	0
9092	Düzgün	ALBAYRAK	düzgün.albayrak76@gmail.com	5425125947	1986-09-20	38	t	16987585959	0
9093	Elif	AKBULAK	elif.akbulak 33@gmail.com	5378989814	1995-05-14	34	f	81130238243	0
9094	Bilal	SERT	bilal.sert60@gmail.com	5548214220	1985-02-23	20	f	26630704597	0
9095	Özge	DOĞAN	özge.doğan69@gmail.com	5468961718	1999-01-02	34	f	48905040508	0
9096	Fatma Nur	MENEKŞE	fatma nur.menekşe36@gmail.com	5554427803	1980-04-14	34	f	97389678504	0
9100	Emel İrem	ERİŞ	emel irem.eriş54@gmail.com	5393334869	1992-02-22	34	f	82811541539	0
9101	Eren	ÖZDEMİR	eren.özdemir47@gmail.com	5575655928	1992-02-27	34	t	21029976330	0
9102	Eyüp	DÖNMEZ	eyüp.dönmez86@gmail.com	5491772824	2000-09-18	34	t	10788020585	0
9103	Fatma	DURMAZ	fatma.durmaz91@gmail.com	5455469260	1990-04-24	34	f	75039913330	0
9104	Cahit	YILMAZ	cahit.yılmaz81@gmail.com	5541326292	1995-12-01	61	t	18325126838	0
9105	Yasin	YETİŞMİŞ	yasin.yetişmiş16@gmail.com	5474249838	1985-05-09	77	t	17476201875	0
9106	Esat Kerem	BULUT	esat kerem.bulut72@gmail.com	5322795627	1998-08-18	23	t	17989195897	0
9107	Ayşe Begüm	GÜNDOĞDU	ayşe begüm.gündoğdu99@gmail.com	5504252155	2002-08-20	34	f	36318482693	0
9108	Nazlı Burcu	TÜCCAROĞLU	nazlı burcu.tüccaroğlu 52@gmail.com	5456528327	1992-12-13	13	f	49898902417	0
9109	Hakan	KÖK	hakan.kök87@gmail.com	5313326865	1988-02-22	34	t	69104793055	0
9110	İbrahim	EROL	ibrahim.erol46@gmail.com	5307454239	1987-05-26	64	t	54895002856	0
9111	Mehmet	AĞAÇ	mehmet.ağaç35@gmail.com	5427363517	1985-11-14	63	t	13677058887	0
9112	Asiyenur	ÇANKAYA	asiyenur.çankaya17@gmail.com	5471909207	1999-07-05	34	f	30093974543	6
9113	Asdads	DDAS	asdads.ddas89@gmail.com	5448872495	1998-09-06	15	t	38131216647	0
9114	Burak	DEMİR	burak.demir47@gmail.com	5334197694	1995-05-05	34	t	45451945375	0
9115	Turgay	GEDİK	turgay.gedik98@gmail.com	5428390923	1986-10-02	28	t	35540020143	0
9117	Gülpembe	İLGÜN	gülpembe.ilgün89@gmail.com	5582074580	1987-03-08	68	f	46646441682	0
9118	Özcan	ÇORUH	özcan.çoruh68@gmail.com	5537646853	1986-06-27	28	t	10493935958	0
9120	Muhammed Hanifi	EKİNCİ	muhammed hanifi.ekinci92@gmail.com	5506991741	1990-05-17	6	t	49457046564	0
9121	Feridun	AKKAYA	feridun.akkaya49@gmail.com	5578199227	2000-11-09	18	t	67575267921	0
9122	Nigar Elif	YILMAZ	nigar elif.yılmaz57@gmail.com	5363897218	1989-04-18	34	f	16813086281	0
9123	Elvan	SARI	elvan.sarı25@gmail.com	5317767791	2002-11-19	29	t	61273052421	1
9124	Kasım	KOÇKAYA	kasım.koçkaya63@gmail.com	5593267660	1981-10-15	2	t	14487863659	0
9125	Ahmet Alper	GÜLER	ahmet alper.güler27@gmail.com	5461634406	2003-01-26	23	t	64882639251	0
9127	Berrin Gökçe	KÖROĞLU	berrin gökçe.köroğlu22@gmail.com	5445060814	1984-02-28	34	f	99802975182	0
9129	Özlem	TAŞ	özlem.taş71@gmail.com	5463067180	1999-11-28	34	f	94101601852	0
9131	Burak	ÖZKAN	burak.özkan55@gmail.com	5581834837	1995-06-12	6	t	93349298379	1
9132	Şenay	DEDE	şenay.dede10@gmail.com	5321135936	1990-01-25	35	f	65021803463	0
9133	Engin	TAN	engin.tan86@gmail.com	5367583862	2003-09-18	4	t	97036591195	0
9134	Uğur	KARAKOÇ	uğur.karakoç66@gmail.com	5604967463	2002-07-22	36	t	70346582219	0
9135	Zühal	AKGÜN	zühal.akgün34@gmail.com	5323985962	1985-02-26	52	f	80638127468	0
9136	Mehmet Ali	BUDUNOĞLU	mehmet ali.budunoğlu68@gmail.com	5455039870	1982-05-13	12	t	81231530736	0
9137	İrşad	ÖNAY	irşad.önay56@gmail.com	5586537371	2000-11-01	34	t	34738482920	0
9138	Cüneyt	OĞURLU	cüneyt.oğurlu77@gmail.com	5487775789	1989-11-19	16	t	35647701393	0
9139	Sedat	KARA	sedat.kara65@gmail.com	5344456939	1988-01-19	53	t	49425976539	0
9140	Ziya	KARABULUT	ziya.karabulut82@gmail.com	5464960882	1992-04-13	1	t	98277850097	0
9141	Mahmut Esad	ERGİN	mahmut esad.ergin12@gmail.com	5462911473	1988-02-08	35	t	26355512163	0
9142	Mehmet Çağrı	KIZILTAŞ	mehmet çağrı.kızıltaş98@gmail.com	5523697341	1989-10-17	34	t	64940894840	0
\.


--
-- Data for Name: togrenciler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.togrenciler (id, bolum_tbolumlerid, ogrenci_tkullanicilarid, ogrencino, baslangictarihi, mezuniyettarihi) FROM stdin;
5	112	2233	149230324	1998-05-02	2003-05-02
6	233	7037	131488051	2016-11-07	2020-11-07
7	130	7381	175885528	2021-10-01	2024-10-01
8	82	7463	181709761	2018-05-10	2023-05-10
9	107	8875	127446629	2016-07-20	2021-07-20
10	127	8616	131110128	1992-08-05	1996-08-05
11	123	5292	160256196	2014-06-05	2019-06-05
12	259	5424	165078343	1994-12-03	2001-12-03
16	52	5294	116462300	1993-04-10	1999-04-10
17	213	2548	187175073	2021-07-14	2026-07-14
23	185	7857	118095295	2017-11-22	2021-11-22
25	113	5256	185316423	2019-10-14	2023-10-14
28	113	4805	136230962	2012-07-25	2017-07-25
32	214	2570	192382289	1991-08-18	1998-08-18
36	285	8272	159217721	1995-06-04	2000-06-04
37	299	7960	118355514	2001-05-19	2008-05-19
39	264	4929	186935564	2009-11-02	2015-11-02
43	44	7598	140977261	2004-10-17	2008-10-17
44	235	2627	126653280	2021-03-11	2028-03-11
45	158	5068	149965297	1996-08-01	2003-08-01
46	202	7561	120571824	2013-01-10	2018-01-10
49	204	4885	117069663	2020-04-05	2027-04-05
53	246	7313	129277816	2001-06-10	2004-06-10
57	208	5612	132070065	2009-05-24	2015-05-24
59	187	2368	142870140	2006-03-28	2010-03-28
62	64	5198	148086094	2016-01-01	2020-01-01
65	304	6971	152831740	2009-03-17	2014-03-17
66	72	4765	117436526	2019-03-03	2025-03-03
67	260	7010	104641975	2011-07-17	2018-07-17
68	109	6023	133497149	2015-08-02	2020-08-02
72	161	5060	110872775	1993-07-24	2000-07-24
74	242	8226	143496770	1997-12-18	2003-12-18
75	15	7031	104907387	1998-10-24	2001-10-24
82	225	5167	116896945	1993-07-20	1998-07-20
85	157	5968	195699583	1994-07-16	2000-07-16
87	52	8285	126605215	2015-08-24	2020-08-24
89	160	8079	114984005	2014-08-24	2019-08-24
91	202	2277	165684959	2011-12-16	2015-12-16
94	205	4752	152688027	2013-09-09	2016-09-09
95	93	2508	171599574	2006-04-05	2010-04-05
96	311	4790	185314280	2003-02-26	2008-02-26
97	44	6075	183486227	1991-01-08	1997-01-08
101	88	7086	142091870	1999-05-13	2006-05-13
104	300	7210	161795784	2016-07-11	2022-07-11
106	121	7060	158815912	1991-08-19	1994-08-19
108	258	5425	125711258	1995-06-22	2002-06-22
109	172	5284	140989764	1995-02-22	1998-02-22
112	39	6658	151083664	2005-02-05	2009-02-05
113	263	5569	166062584	1995-05-15	2001-05-15
115	212	6902	147021845	2010-10-20	2016-10-20
117	69	7209	164088655	2007-09-11	2010-09-11
120	248	2318	174621857	2015-02-26	2022-02-26
121	171	4976	150183174	2004-05-10	2010-05-10
124	133	5744	102696442	2006-01-08	2012-01-08
126	11	5225	105893809	2007-01-23	2012-01-23
129	138	5096	140073737	2012-10-25	2019-10-25
131	10	7306	124607697	1993-06-04	2000-06-04
132	267	8533	128676559	1995-02-28	2001-02-28
134	265	2500	181361766	2009-10-12	2012-10-12
135	309	5421	186731600	2004-07-10	2010-07-10
137	16	2208	165634463	1992-07-19	1997-07-19
138	174	6188	169839634	1992-06-08	1998-06-08
139	52	6689	194883643	1993-10-13	2000-10-13
142	290	8639	183289250	1992-12-13	1999-12-13
146	177	6544	110034169	2008-09-07	2015-09-07
147	119	6710	137393255	2003-06-07	2006-06-07
148	313	5978	133798719	1992-10-01	1997-10-01
153	51	5832	132110816	2009-07-16	2013-07-16
154	43	8108	119753451	1997-07-06	2000-07-06
157	294	5084	112362079	1990-06-21	1997-06-21
159	281	8016	160692075	2020-08-15	2027-08-15
161	103	6243	150690886	2002-06-24	2007-06-24
162	245	7703	189062361	2021-04-10	2027-04-10
164	61	8136	109130682	2009-06-05	2012-06-05
167	52	8121	124424511	1997-05-20	2003-05-20
170	236	8311	158778561	2016-05-16	2022-05-16
171	200	7140	150036590	1999-12-02	2003-12-02
172	214	8135	133169996	2021-09-05	2027-09-05
174	75	8546	167966144	1999-02-26	2004-02-26
181	173	2621	166045922	2018-02-26	2021-02-26
182	136	7226	103335067	2008-08-02	2012-08-02
184	150	2475	173856304	1996-10-12	2001-10-12
186	166	8717	193943515	2008-02-17	2012-02-17
192	316	7815	106594399	2004-11-05	2008-11-05
194	157	2238	156415772	2006-10-14	2009-10-14
195	249	6069	182734184	2020-02-01	2023-02-01
198	29	5129	154259421	2002-07-27	2005-07-27
199	211	7783	120229016	2012-04-19	2018-04-19
201	165	2513	164514207	2012-08-26	2018-08-26
205	11	7533	131062208	2005-01-15	2012-01-15
206	311	8544	172935237	1992-06-05	1999-06-05
207	51	7124	115822325	1996-12-13	2001-12-13
209	148	8013	116075287	1991-11-14	1995-11-14
212	287	7704	183908836	2002-03-10	2008-03-10
214	246	8523	103985206	1994-02-18	1997-02-18
216	70	2196	119249208	2019-10-22	2022-10-22
217	297	8222	192464494	1998-06-08	2003-06-08
218	156	9125	176614813	2010-02-24	2014-02-24
220	14	7592	172341913	2020-11-08	2023-11-08
224	298	6122	147330449	2007-08-04	2011-08-04
230	320	7808	168399587	2016-08-16	2023-08-16
232	202	7599	147958623	2006-03-06	2013-03-06
233	185	8644	130149088	2009-11-07	2016-11-07
237	276	5465	109635286	2006-01-09	2011-01-09
238	169	8106	134154514	2016-09-05	2019-09-05
239	150	6040	192799437	2002-08-13	2009-08-13
240	300	6101	118978682	2009-03-26	2016-03-26
241	121	2366	137651312	2012-05-06	2019-05-06
242	247	5123	113023963	1998-06-24	2001-06-24
245	42	7746	162233456	2008-05-25	2015-05-25
247	11	6450	182889969	2021-04-03	2026-04-03
249	156	8181	125694286	1997-06-23	2001-06-23
250	248	6072	198508334	2016-10-10	2023-10-10
251	242	5052	170652526	2000-04-10	2006-04-10
252	181	8473	186103886	2009-09-28	2014-09-28
255	200	8998	104335038	2019-12-23	2026-12-23
256	156	2312	177871347	1997-03-07	2000-03-07
258	305	7304	156550424	1995-03-01	2002-03-01
262	182	8137	139475601	2003-04-03	2010-04-03
266	228	6425	163518478	2012-08-07	2018-08-07
269	73	6241	200387286	1990-01-05	1993-01-05
270	241	4712	131940539	2000-01-25	2006-01-25
271	304	6607	133060523	2017-06-08	2022-06-08
273	241	4863	127318231	2006-06-18	2010-06-18
274	282	5702	129874984	2008-08-08	2015-08-08
276	221	7677	147055331	2008-05-13	2011-05-13
277	245	9112	106058960	2014-01-16	2017-01-16
281	254	7643	186001224	1990-09-25	1996-09-25
283	82	6418	156372511	2021-12-06	2027-12-06
284	226	5717	128912935	2021-09-11	2028-09-11
287	52	2362	157067066	2010-03-04	2016-03-04
291	83	8392	187576040	2022-07-11	2029-07-11
292	123	6908	121848846	1990-10-04	1996-10-04
294	14	7443	156352341	1990-03-01	1996-03-01
297	284	8832	198094602	1993-07-18	1999-07-18
298	170	6907	142348630	2013-02-17	2020-02-17
299	179	4444	161569150	1996-02-08	1999-02-08
300	160	6081	151299955	1995-11-03	2002-11-03
301	17	6582	137325758	2002-06-16	2005-06-16
303	301	5891	173745187	2005-10-07	2011-10-07
304	301	9083	169573913	2011-08-06	2015-08-06
305	76	8983	154239887	1995-04-13	1998-04-13
310	268	6357	118955301	2018-03-27	2021-03-27
311	310	6498	121343519	2006-08-26	2013-08-26
312	6	5383	163757309	2007-04-05	2014-04-05
313	171	5677	142535376	2021-05-01	2026-05-01
315	307	2392	149295050	2005-09-07	2011-09-07
316	216	6336	137290177	2012-10-19	2016-10-19
317	234	6608	197359074	1992-08-24	1998-08-24
319	87	8852	177390593	2008-07-22	2015-07-22
320	272	5998	172883187	2022-01-12	2026-01-12
322	196	8593	152953398	2016-08-07	2019-08-07
323	122	2282	131492066	2011-04-11	2017-04-11
325	180	8723	102302748	2015-01-19	2020-01-19
327	61	6441	130541398	2003-09-10	2006-09-10
329	123	5107	109625073	2015-06-07	2022-06-07
334	280	8568	184196330	2011-07-12	2017-07-12
338	30	7193	194497686	2015-12-14	2020-12-14
340	158	7847	130970633	2008-02-20	2013-02-20
341	197	2434	186456234	2002-10-18	2007-10-18
342	178	7882	159744374	1991-05-12	1994-05-12
346	110	6412	195433087	2017-04-01	2024-04-01
347	30	8280	125338162	2007-04-18	2014-04-18
348	78	5607	174987735	1994-11-03	2000-11-03
350	119	2288	147136915	2019-03-09	2024-03-09
352	229	8502	197034336	2004-07-06	2009-07-06
354	55	5528	168228640	2010-10-01	2016-10-01
356	139	7287	177084779	2007-12-14	2012-12-14
358	163	8635	187782032	2005-04-11	2011-04-11
360	177	8075	190670397	2008-10-22	2012-10-22
367	184	6115	145214559	2022-11-28	2029-11-28
369	127	8108	136518645	2001-04-08	2007-04-08
372	152	8875	140872301	1999-02-07	2003-02-07
377	189	6032	141128059	1998-11-22	2001-11-22
383	161	7183	103870713	2016-08-08	2022-08-08
386	18	7862	120230960	2008-11-27	2014-11-27
387	226	5420	191756773	2020-06-28	2024-06-28
391	75	7562	112663757	2013-12-10	2019-12-10
393	223	4869	125940859	1993-05-03	1996-05-03
395	267	8031	132926622	1995-12-03	1998-12-03
396	264	2303	185977833	2021-12-16	2025-12-16
401	299	8294	146066297	2019-05-24	2024-05-24
404	157	4953	197518150	2022-03-12	2027-03-12
406	155	5907	198369044	1996-04-01	2002-04-01
408	141	6222	148495938	2012-07-09	2019-07-09
412	13	6472	141283951	2012-10-07	2017-10-07
413	147	5795	107342543	2011-10-02	2014-10-02
415	267	7804	137567413	2009-11-21	2015-11-21
416	53	6947	127727274	2022-05-18	2027-05-18
418	169	7564	133326859	2004-01-07	2007-01-07
420	136	6662	115346518	2000-02-09	2005-02-09
423	247	6715	106858241	1994-07-03	1997-07-03
424	149	6486	117888940	2008-05-17	2014-05-17
425	42	5494	160849109	2021-05-05	2024-05-05
426	284	7657	135101692	2013-12-08	2016-12-08
430	267	6226	192684191	2006-04-07	2009-04-07
436	43	8991	101913641	2010-03-17	2014-03-17
438	266	5893	128373790	2014-04-13	2018-04-13
439	146	5481	193566459	1993-10-18	1996-10-18
440	214	6235	176928508	1996-01-25	2000-01-25
442	306	2417	113915613	2020-02-19	2025-02-19
444	147	2607	189528241	1991-12-03	1995-12-03
445	255	7245	158702589	2001-05-05	2005-05-05
450	258	8170	123040061	2018-02-20	2024-02-20
451	310	8663	117573505	1995-02-22	2001-02-22
452	275	4715	103199485	2001-10-21	2006-10-21
453	163	2288	194809768	2021-05-02	2027-05-02
454	168	8127	115914299	1999-10-19	2003-10-19
455	308	5140	177466292	1999-09-23	2006-09-23
456	72	7797	101506540	2015-09-20	2021-09-20
457	278	5780	118078882	2022-07-16	2028-07-16
461	165	2574	159564701	2008-03-10	2012-03-10
462	140	2218	116063675	1990-02-21	1997-02-21
465	275	2311	162388316	2014-08-26	2019-08-26
469	67	7100	129615352	2003-09-02	2006-09-02
472	118	8713	169299766	1992-03-12	1998-03-12
474	250	2486	124310501	1999-07-26	2005-07-26
477	201	7133	130670124	2013-04-08	2017-04-08
478	285	8064	144318629	2002-07-04	2005-07-04
479	77	8516	129679632	1991-10-15	1995-10-15
481	136	9077	168863267	2005-07-16	2009-07-16
485	2	5238	159518404	2013-12-07	2017-12-07
486	222	9122	177718645	2013-05-06	2017-05-06
491	161	7535	147593613	1990-12-13	1994-12-13
492	213	4718	181391025	1997-02-09	2004-02-09
493	38	2502	184816703	2008-10-19	2013-10-19
494	66	8473	150483608	2004-01-14	2011-01-14
496	174	4802	108681930	1996-08-24	2002-08-24
497	154	7268	105843438	1994-06-16	1997-06-16
499	219	7010	114263917	2013-03-24	2017-03-24
502	75	5438	182581619	2012-03-15	2015-03-15
503	211	6623	102739988	1994-03-06	1997-03-06
505	168	6971	120004922	1991-04-11	1994-04-11
507	286	2486	147378110	2001-10-06	2006-10-06
509	195	8746	125818273	1995-08-14	1999-08-14
511	184	8434	112058844	1997-11-24	2002-11-24
512	229	7018	119523214	2022-05-03	2025-05-03
513	40	4989	126221299	2005-09-20	2011-09-20
516	76	8818	164589563	2004-10-09	2008-10-09
518	123	8768	123193350	1999-01-09	2002-01-09
519	134	7118	134752740	2011-01-05	2018-01-05
520	124	5698	109286019	1998-08-14	2002-08-14
524	116	5818	138864873	1996-07-04	2003-07-04
525	145	9134	150385465	2006-06-25	2013-06-25
526	2	6704	152783095	2018-04-10	2025-04-10
527	277	7654	182868165	2020-05-28	2027-05-28
529	9	4824	174214804	1997-08-21	2000-08-21
530	70	7011	112146827	1990-12-15	1996-12-15
533	310	2536	108252995	1997-06-13	2000-06-13
536	13	8960	123519716	2000-10-08	2004-10-08
538	193	7898	115865582	2019-12-20	2026-12-20
539	184	7746	175101916	1992-05-28	1995-05-28
541	45	6447	141419339	2020-03-23	2023-03-23
544	148	6465	177029083	2015-03-02	2021-03-02
545	93	2296	182848160	2004-07-24	2007-07-24
548	57	7269	171211310	2019-10-01	2024-10-01
550	261	6942	115903431	2000-06-20	2004-06-20
551	249	7394	159712805	2014-07-20	2017-07-20
553	28	8850	193292356	2017-02-13	2020-02-13
554	42	6556	105950911	2001-10-12	2006-10-12
556	149	8836	139783600	2016-07-28	2021-07-28
557	124	7684	196351074	2007-05-10	2013-05-10
565	87	4737	126644222	1999-08-10	2004-08-10
566	103	9115	101478339	1991-05-23	1996-05-23
568	202	7153	129039629	2015-08-24	2021-08-24
569	153	9101	106623009	1997-06-03	2004-06-03
570	82	6306	177225008	2002-01-16	2005-01-16
572	167	7165	140162984	1998-09-27	2005-09-27
573	185	2480	191159073	2019-02-03	2025-02-03
576	264	4840	104827339	2003-08-12	2010-08-12
577	197	8455	140288251	2013-06-24	2020-06-24
578	46	5886	127061905	2008-07-06	2011-07-06
582	141	6587	136642217	2007-08-06	2014-08-06
583	170	8196	158370663	1992-07-07	1995-07-07
588	216	7138	158379654	2009-12-23	2014-12-23
589	310	8007	111158882	2021-12-23	2026-12-23
590	172	7429	153376390	2016-12-26	2023-12-26
593	140	7797	178362106	2018-04-20	2025-04-20
594	67	8715	172698759	2018-08-14	2025-08-14
598	242	5214	155487559	2022-02-28	2028-02-28
599	257	8220	155932268	1990-03-13	1996-03-13
601	81	8015	151210576	2008-06-22	2014-06-22
602	53	8048	185085060	1997-05-09	2001-05-09
603	27	7482	103907107	1997-11-20	2000-11-20
604	93	7639	171420638	1997-09-17	2002-09-17
606	232	7093	192220220	1994-03-14	2001-03-14
608	267	7529	149419927	1995-02-11	1998-02-11
610	181	8270	114037547	2004-05-19	2007-05-19
612	113	6903	144615915	2010-08-16	2016-08-16
614	168	5174	167425606	2020-05-04	2025-05-04
615	302	8210	108619878	2022-05-17	2027-05-17
617	122	6022	156344833	1996-04-16	2003-04-16
618	301	7662	198854464	1992-03-16	1997-03-16
621	153	4788	172042503	2020-02-23	2024-02-23
627	181	7283	121734727	2004-10-24	2008-10-24
629	149	6687	148056990	2019-07-14	2024-07-14
633	21	7644	200354111	2020-09-14	2023-09-14
634	264	7386	167364021	2020-01-17	2025-01-17
636	2	6586	113398251	2001-11-02	2005-11-02
637	117	2365	147039254	2011-03-15	2014-03-15
639	316	7209	178400103	2007-05-18	2011-05-18
640	235	5539	128254102	2012-08-15	2016-08-15
642	134	5856	199514925	2018-11-14	2024-11-14
644	244	7346	136483017	2021-11-14	2028-11-14
646	285	8138	163157486	1990-10-06	1995-10-06
647	306	6270	155090143	2010-09-20	2015-09-20
650	82	2217	147297271	2000-06-13	2004-06-13
653	63	4877	140256273	2022-08-12	2026-08-12
654	147	2315	133539175	2000-02-07	2006-02-07
659	318	5001	125997140	1994-06-25	1998-06-25
660	234	8405	189956596	1995-04-14	1999-04-14
662	2	8344	198476179	1992-08-24	1996-08-24
666	43	8718	181605107	2007-02-24	2012-02-24
668	256	8902	123438227	2000-08-11	2003-08-11
670	296	8054	181939263	1991-01-13	1995-01-13
671	120	6903	103906999	1994-11-28	1997-11-28
674	247	6737	195385069	2018-11-06	2021-11-06
676	233	2403	138625771	2008-02-12	2011-02-12
678	42	2481	103410966	1993-06-23	1999-06-23
681	53	7113	117160821	2000-04-08	2005-04-08
682	186	5163	137831186	2008-04-17	2011-04-17
686	118	4903	197818568	2008-03-01	2012-03-01
687	287	8181	158546185	2018-03-01	2021-03-01
690	237	2575	153187622	2021-09-19	2027-09-19
691	29	8777	130416896	2016-05-10	2022-05-10
699	111	2433	139661883	2013-10-28	2018-10-28
702	29	2638	101626827	1996-06-15	2000-06-15
703	143	5830	158349584	2020-01-25	2024-01-25
704	272	8663	184607986	1998-06-03	2005-06-03
707	13	8516	159211186	2012-03-01	2019-03-01
708	41	7108	144845921	2000-08-24	2006-08-24
710	228	6667	111294647	1997-04-07	2002-04-07
713	177	6609	146895971	1990-09-03	1994-09-03
714	112	2617	134566896	1997-05-15	2002-05-15
716	241	7499	191289960	1991-11-17	1995-11-17
722	264	5163	177046112	2011-12-14	2015-12-14
723	54	7178	149088731	2021-05-06	2024-05-06
724	235	6482	156807943	2020-10-16	2023-10-16
727	12	7264	200270945	1990-02-23	1995-02-23
731	116	4398	138177709	2000-02-11	2004-02-11
741	155	7984	135264485	2011-05-09	2018-05-09
742	250	9121	136972107	2000-09-24	2006-09-24
745	15	4984	104546194	1992-12-03	1996-12-03
747	303	7121	193938517	2009-03-10	2012-03-10
751	108	2233	178681446	1996-05-01	1999-05-01
753	261	5072	169288093	2004-02-15	2007-02-15
755	81	4741	127380181	1991-03-06	1994-03-06
758	204	3335	199132313	2006-02-26	2011-02-26
759	263	5977	163370430	2001-05-19	2008-05-19
762	81	5217	132573573	1999-10-21	2006-10-21
763	129	6021	107635824	1992-12-17	1997-12-17
765	221	7364	166512924	2015-11-04	2020-11-04
766	50	6657	102094369	1993-06-16	2000-06-16
767	193	9125	129757664	2013-11-11	2018-11-11
777	311	4947	104862308	2012-01-15	2018-01-15
778	299	8249	194174280	2008-09-21	2012-09-21
780	10	6912	187901414	2016-05-04	2022-05-04
782	311	7194	142102436	1992-04-13	1997-04-13
785	53	5569	108103834	1992-10-22	1997-10-22
786	196	6475	132396591	2009-07-12	2013-07-12
793	200	7736	140618174	2022-02-15	2025-02-15
795	288	5209	185603970	2021-07-08	2026-07-08
796	14	6299	127182692	1991-05-02	1994-05-02
800	132	4883	126856895	2010-11-28	2014-11-28
801	218	8973	101706627	2009-11-17	2014-11-17
802	245	5736	105748557	2000-06-20	2006-06-20
805	240	4861	115544114	2022-04-13	2025-04-13
809	76	5597	106054684	1998-05-25	2003-05-25
811	297	4737	154872740	2020-04-20	2025-04-20
812	289	6485	143039797	1992-11-04	1998-11-04
813	238	8437	109547425	1997-09-08	2003-09-08
815	21	7991	163182774	1991-03-01	1994-03-01
816	160	6357	111078623	2007-07-09	2014-07-09
821	134	7720	163285089	1995-12-19	2002-12-19
822	198	7323	193930156	2002-02-19	2009-02-19
824	4	5729	129247978	2003-03-27	2008-03-27
829	125	7619	147115282	2014-07-17	2017-07-17
830	180	7511	129056687	2008-04-27	2015-04-27
832	61	3281	128345820	1991-01-13	1997-01-13
835	156	5763	119743539	2022-01-16	2029-01-16
836	119	8357	188642564	2019-02-06	2024-02-06
837	191	6009	143439047	2008-07-14	2014-07-14
846	158	8215	138193885	1999-01-06	2003-01-06
851	310	2459	187142439	1992-06-28	1997-06-28
854	76	8319	104840943	2013-03-01	2018-03-01
857	43	6233	165000515	2003-02-03	2010-02-03
858	77	6267	166661071	1999-02-15	2003-02-15
865	198	6915	168225216	2000-05-26	2005-05-26
866	258	8242	113943459	2010-07-13	2014-07-13
870	168	8048	189288775	2017-04-23	2021-04-23
871	180	4953	178939573	2015-05-17	2020-05-17
873	146	5830	116333096	2007-08-27	2014-08-27
876	117	5022	189961051	1994-07-25	1998-07-25
877	318	5984	105837479	1992-11-26	1998-11-26
879	252	7612	124074941	2004-05-12	2009-05-12
880	27	4916	123278508	2013-08-21	2019-08-21
881	217	2610	109379191	2006-02-27	2010-02-27
882	55	6367	186098193	2003-04-07	2010-04-07
885	120	8091	110640442	2003-06-02	2006-06-02
889	192	5214	109860535	2004-04-07	2011-04-07
891	6	5695	131432831	2021-08-06	2028-08-06
894	110	9096	125906555	2001-03-05	2007-03-05
895	277	5995	116273350	2005-07-23	2010-07-23
897	119	6499	124764843	2009-08-17	2015-08-17
899	44	4732	135455567	2003-08-19	2006-08-19
909	276	8182	176256179	1996-07-26	2001-07-26
912	142	4680	186165676	2009-11-12	2014-11-12
915	258	7774	134730636	2017-02-22	2020-02-22
917	69	2458	142490761	2008-03-12	2011-03-12
925	57	6976	195612201	2010-09-22	2016-09-22
929	271	5836	121843417	2021-10-12	2028-10-12
930	284	8864	140019324	2016-08-07	2023-08-07
932	240	7272	183900519	2017-12-28	2023-12-28
935	85	2405	189056461	2002-02-26	2005-02-26
937	247	4695	173476064	2001-08-10	2004-08-10
945	27	5819	143112931	1993-02-25	2000-02-25
946	270	5469	111657567	2016-06-11	2023-06-11
953	44	2319	128396681	1992-11-28	1997-11-28
954	149	7642	190313740	1998-02-16	2004-02-16
959	162	7449	156984280	2015-07-09	2018-07-09
960	171	4992	149691907	2015-12-01	2022-12-01
961	6	4764	178570378	1994-02-14	2000-02-14
962	155	8493	172112841	1993-06-08	1998-06-08
973	230	6705	175372859	2016-02-24	2019-02-24
976	49	5904	143679307	2013-12-14	2018-12-14
977	55	8256	124185346	1998-10-06	2003-10-06
982	278	6976	187285693	2011-01-15	2018-01-15
983	155	2629	180132208	1990-03-07	1994-03-07
985	79	8965	124038882	2014-01-12	2017-01-12
990	235	6278	143421028	2019-06-19	2023-06-19
993	288	8953	162754498	2019-08-16	2024-08-16
994	123	4689	106654290	1996-07-06	1999-07-06
995	245	2478	182854259	1992-03-05	1999-03-05
996	72	9022	114782224	1990-03-14	1993-03-14
997	254	4795	197031900	2009-09-11	2013-09-11
998	302	5874	195041247	1993-03-12	1998-03-12
1000	61	8851	170395560	2011-05-23	2015-05-23
1003	230	8709	146281709	1990-04-06	1997-04-06
1004	249	4693	190415333	1992-12-06	1998-12-06
1005	116	5116	117243380	1997-11-09	2000-11-09
1007	217	8056	196817444	2011-01-04	2014-01-04
1011	148	3304	156224196	2019-05-17	2023-05-17
1016	93	7888	127516969	2011-02-08	2017-02-08
1023	284	4845	193753306	2013-12-21	2020-12-21
1024	284	8251	107421675	1995-12-03	1999-12-03
1025	53	7803	171161521	2016-10-24	2021-10-24
1027	151	8602	181823324	1994-05-25	1998-05-25
1030	182	4942	147097895	2003-01-18	2006-01-18
1031	145	5172	158395037	2013-02-02	2017-02-02
1032	232	2366	178691660	2006-05-06	2011-05-06
1033	233	6737	123714481	2016-07-07	2022-07-07
1034	103	5089	109396776	2005-07-17	2011-07-17
1036	246	5172	138235167	2018-07-11	2021-07-11
1037	296	5819	173964098	1996-03-26	2001-03-26
1045	190	9135	168869916	1990-06-20	1995-06-20
1046	180	5383	181679774	1998-02-13	2004-02-13
1047	77	6251	186446771	2003-10-17	2007-10-17
1049	283	8308	121632985	1996-05-18	2003-05-18
1054	300	5015	125071557	2012-01-06	2015-01-06
1056	169	7125	168370168	2011-02-26	2016-02-26
1057	194	4826	144252058	2018-10-11	2022-10-11
1060	113	7649	190890424	1991-08-12	1994-08-12
1061	150	5227	155846821	2016-04-01	2021-04-01
1062	152	9067	163097047	2018-12-10	2022-12-10
1065	259	7055	158111673	2002-02-12	2006-02-12
1066	289	5650	161968948	2014-09-24	2018-09-24
1067	307	2627	127944907	1991-03-06	1996-03-06
1069	214	5964	116124480	2020-05-26	2023-05-26
1070	129	6924	149862221	2014-02-15	2019-02-15
1071	28	2529	175584315	1992-04-11	1997-04-11
1074	89	5538	119125865	2020-06-04	2027-06-04
1075	136	5460	151135832	2001-01-28	2005-01-28
1077	249	2353	131657832	2012-03-15	2019-03-15
1079	164	7385	111764639	2010-09-06	2016-09-06
1081	126	2336	109041327	2016-12-17	2022-12-17
1083	200	6059	116468275	2001-05-07	2007-05-07
1092	41	2319	152737881	2021-03-07	2026-03-07
1096	136	5755	118364341	2003-11-20	2008-11-20
1098	263	8395	171182490	2003-04-12	2009-04-12
1099	188	5731	173414521	2002-06-08	2007-06-08
1103	204	8372	164065278	2007-10-28	2014-10-28
1105	109	5664	103187214	2006-07-02	2010-07-02
1106	39	7165	147929166	2012-12-16	2015-12-16
1107	278	7082	182647201	1990-11-24	1993-11-24
1110	313	6295	123842677	2022-07-20	2026-07-20
1117	152	8075	153207330	2008-02-23	2014-02-23
1121	273	7525	105062166	2014-01-10	2020-01-10
1122	4	7500	124956384	1990-05-08	1994-05-08
1123	181	4803	159835216	2018-12-06	2022-12-06
1126	230	5258	124167346	2008-04-28	2015-04-28
1128	266	2294	129370704	1996-04-07	2001-04-07
1129	255	8340	104713117	2022-08-23	2027-08-23
1131	20	6115	164458793	2009-07-11	2016-07-11
1135	255	5154	108665519	2009-07-12	2016-07-12
1136	45	6472	126676472	2022-10-25	2029-10-25
1137	213	6681	155016305	2010-11-23	2014-11-23
1139	230	8946	114593343	2020-02-11	2027-02-11
1141	120	7186	115215256	2022-11-16	2025-11-16
1148	117	2398	106522763	1990-10-16	1994-10-16
1151	303	6926	169504836	2006-07-06	2010-07-06
1153	207	6376	114938908	2003-06-26	2008-06-26
1155	300	6168	184793071	2016-11-01	2022-11-01
1157	2	4871	105691603	2017-06-20	2023-06-20
1158	221	2821	143598329	1992-05-27	1996-05-27
1159	172	8390	131962788	1994-12-10	1999-12-10
1160	283	6642	138970062	2012-12-01	2015-12-01
1162	11	8284	119177539	2009-02-10	2012-02-10
1168	235	7095	146098213	1997-11-15	2001-11-15
1170	129	6329	179180761	1999-10-16	2003-10-16
1173	27	9142	131350126	2020-02-09	2025-02-09
1174	264	2551	193887185	2021-11-23	2026-11-23
1175	5	8368	172057531	2002-03-27	2009-03-27
1177	51	4725	151053235	1996-09-11	2002-09-11
1179	85	7956	112209252	2014-04-14	2017-04-14
1180	176	8883	199929505	2002-11-14	2009-11-14
1182	221	7130	106046093	1998-04-23	2001-04-23
1188	172	2230	135843491	2017-06-22	2020-06-22
1192	311	5557	110778798	1994-03-24	2000-03-24
1193	283	4807	106956610	1990-09-19	1996-09-19
1194	314	5477	155523375	2003-02-06	2010-02-06
1195	259	8397	180483138	1993-12-25	1997-12-25
1197	253	7277	187680910	2011-01-17	2018-01-17
1198	30	2207	119719349	2006-04-22	2013-04-22
1199	64	7483	175555608	2021-02-26	2026-02-26
1200	237	7935	169339334	1995-02-01	2001-02-01
1201	197	2289	144366767	1997-07-05	2003-07-05
1203	287	8258	188759975	1991-03-20	1994-03-20
1204	295	7226	133773197	2005-03-07	2011-03-07
1205	130	8297	112402524	2007-04-10	2011-04-10
1207	93	2531	144502964	2022-12-26	2025-12-26
1209	275	4771	142590207	2019-05-10	2026-05-10
1210	110	9092	155119126	2003-09-20	2010-09-20
1211	307	6990	190681169	2003-04-06	2009-04-06
1213	193	4692	159408114	2020-06-23	2027-06-23
1214	41	9086	153547941	2003-06-07	2007-06-07
1215	235	7043	104380824	2020-11-21	2024-11-21
1219	145	6538	181296281	2002-05-27	2007-05-27
1220	185	8917	159188147	2020-12-07	2024-12-07
1221	277	4672	162171996	2011-12-27	2016-12-27
1228	217	2515	198114326	1992-05-06	1998-05-06
1230	315	7884	195233870	2016-04-28	2019-04-28
1233	306	8441	129965611	2004-01-27	2011-01-27
1235	299	3871	138835719	2021-12-21	2025-12-21
1238	77	6624	185983617	1996-03-05	2002-03-05
1243	267	7568	188578058	2008-03-12	2013-03-12
1244	275	2458	145610452	2000-03-25	2007-03-25
1245	123	6390	194126471	2016-01-24	2022-01-24
1246	89	8407	116888477	2002-04-27	2009-04-27
1250	272	5584	198623406	2001-01-15	2007-01-15
1251	165	8619	143905247	2014-06-03	2017-06-03
1252	45	8634	111736114	2019-05-17	2026-05-17
1256	171	7387	135042792	1995-02-22	2000-02-22
1258	93	2200	134249517	2016-06-28	2023-06-28
1259	112	7729	151550106	2018-07-16	2024-07-16
1260	213	5589	145294850	2003-07-17	2006-07-17
1261	259	6243	136729718	2011-06-16	2014-06-16
1262	219	7115	178707426	1995-08-26	2000-08-26
1264	110	5616	182257190	1990-02-02	1993-02-02
1266	187	6575	172029790	1992-02-21	1995-02-21
1269	234	5133	175768908	1990-04-07	1995-04-07
1271	136	4815	162899027	2011-03-02	2014-03-02
1273	260	7346	200517207	2019-03-21	2025-03-21
1274	90	6500	119654543	2018-12-28	2025-12-28
1280	175	2480	163268191	2019-01-21	2024-01-21
1282	293	8878	138243150	1994-11-04	1998-11-04
1283	120	6527	197248428	1991-02-09	1995-02-09
1286	293	5041	143247396	2020-06-08	2027-06-08
1287	275	6055	118716725	2000-07-10	2006-07-10
1292	204	6159	123809759	1991-01-21	1997-01-21
1294	173	7782	107333915	1992-04-15	1998-04-15
1296	1	7394	130071851	2010-02-03	2013-02-03
1299	141	8443	156701776	2022-11-07	2027-11-07
1301	107	5212	167983437	1992-10-24	1996-10-24
1302	75	5405	172782957	2015-02-24	2021-02-24
1303	282	8522	143283907	1990-08-26	1997-08-26
1304	290	3745	146393048	1995-07-09	1998-07-09
1312	205	8195	155448643	2013-01-08	2020-01-08
1315	275	8902	119414001	2008-10-03	2015-10-03
1318	291	9078	124760307	2012-10-08	2015-10-08
1319	288	6985	191815991	2012-03-13	2019-03-13
1320	53	5543	121194491	1996-10-01	2000-10-01
1321	119	8568	149899980	2019-09-10	2023-09-10
1322	82	6229	160705656	1991-09-15	1994-09-15
1323	103	7766	184521255	2014-08-06	2021-08-06
1324	80	9071	159953016	2015-05-03	2021-05-03
1326	90	8426	127203217	1992-12-16	1996-12-16
1327	140	5636	119197257	2016-05-22	2019-05-22
1329	216	8955	155841260	1998-12-14	2003-12-14
1331	268	5339	151818238	2002-09-26	2005-09-26
1336	156	9024	187156658	2001-09-07	2007-09-07
1338	291	8454	117286138	2013-11-27	2019-11-27
1339	205	4864	195729766	1999-10-19	2005-10-19
1340	271	2253	190093329	2015-10-22	2021-10-22
1341	239	8182	194679352	2020-02-19	2023-02-19
1342	10	5500	114991945	2016-09-03	2023-09-03
1344	115	7052	168200468	1996-04-23	2001-04-23
1345	215	8480	157933922	1998-08-26	2003-08-26
1350	27	6639	196793195	2006-01-08	2009-01-08
1351	27	4975	141158214	2014-12-15	2020-12-15
1354	233	2259	105199615	2021-01-28	2027-01-28
1360	14	5014	199306804	2016-08-16	2019-08-16
1362	155	9134	127067314	2004-01-22	2007-01-22
1363	228	7111	153479881	1990-09-11	1996-09-11
1364	184	7001	141233022	2020-03-13	2026-03-13
1369	173	6133	137654229	2016-05-19	2023-05-19
1370	110	8781	170115670	2020-02-24	2025-02-24
1371	218	8165	175430586	2000-06-08	2003-06-08
1372	205	2494	187118704	1993-06-28	1997-06-28
1374	225	5276	113484254	2013-12-25	2020-12-25
1376	194	2443	173674289	2012-08-18	2018-08-18
1379	54	6343	121786810	1990-05-23	1996-05-23
1381	210	2391	181195440	1997-02-07	2004-02-07
1382	256	7283	200898834	1990-10-18	1996-10-18
1384	136	2258	140700759	2013-01-24	2017-01-24
1386	258	6533	108195507	1995-05-17	1999-05-17
1387	61	5031	148570165	2018-01-03	2022-01-03
1389	268	2377	157249938	2002-01-21	2006-01-21
1394	278	6600	163482257	2000-02-01	2003-02-01
1397	288	6981	189740891	1998-10-13	2001-10-13
1402	290	7713	161884119	2020-06-20	2025-06-20
1405	76	8637	180505099	2005-12-27	2012-12-27
1409	15	4812	188963336	2010-08-27	2017-08-27
1410	252	7780	103913095	1993-09-17	1996-09-17
1412	274	6721	193854152	2003-05-27	2010-05-27
1414	110	6966	164247293	2021-11-26	2024-11-26
1415	49	9035	189602955	1992-10-06	1997-10-06
1417	12	6282	170667930	1993-05-18	1997-05-18
1418	202	4883	148686768	2008-01-24	2014-01-24
1421	277	7483	145369775	2021-05-07	2024-05-07
1422	282	8303	127515397	2019-11-07	2022-11-07
1423	240	7606	101976438	2006-10-22	2013-10-22
1424	225	6903	187903886	2007-05-25	2011-05-25
1426	243	4791	121910368	2017-09-08	2022-09-08
1428	176	5809	135594046	1993-04-15	1996-04-15
1429	140	8132	121532227	2010-04-05	2013-04-05
1430	103	2224	117888324	2013-09-12	2016-09-12
1431	123	2544	109619313	2012-07-03	2018-07-03
1432	218	6597	161674288	1999-12-07	2003-12-07
1433	221	2634	162174140	2000-11-11	2006-11-11
1436	73	7034	161527673	2014-03-05	2018-03-05
1438	273	2564	169991382	1996-11-08	2002-11-08
1439	173	5624	159618159	2006-04-12	2011-04-12
1441	161	6453	112960656	2009-10-09	2014-10-09
1445	291	5441	139773380	2011-05-14	2017-05-14
1448	48	3871	102985940	2010-11-04	2015-11-04
1449	194	6897	103189158	1990-07-06	1997-07-06
1455	177	6960	197781578	2005-10-03	2008-10-03
1457	272	9104	163721340	2006-07-28	2011-07-28
1459	268	5556	133296410	2017-07-20	2024-07-20
1460	230	8739	102964717	1995-08-01	2002-08-01
1461	181	9121	131485692	2001-02-17	2006-02-17
1462	261	5118	193777005	1997-09-11	2002-09-11
1464	21	6890	135005021	2009-06-22	2012-06-22
1467	93	5177	171908004	1993-10-08	1999-10-08
1469	89	9096	104981139	1995-10-14	2001-10-14
1470	20	4732	121744617	2009-09-15	2013-09-15
1472	126	6175	103840442	2020-12-05	2024-12-05
1473	285	8574	173091060	2003-12-26	2007-12-26
1475	162	4773	109628156	1998-07-11	2004-07-11
1476	128	6529	113696200	2016-03-01	2022-03-01
1484	53	8052	163876712	2005-06-12	2009-06-12
1486	268	5385	135392650	1997-09-09	2004-09-09
1488	211	6600	124312773	1995-06-27	2001-06-27
1489	89	9021	184057749	1993-05-27	1996-05-27
1492	215	2615	151399873	2001-07-11	2005-07-11
1493	197	9039	130856543	2016-01-17	2020-01-17
1494	115	5301	177138789	2013-04-11	2020-04-11
1495	242	4960	157491792	2020-06-07	2025-06-07
1497	143	5453	175791241	2001-09-19	2006-09-19
1505	234	5713	178071287	1996-03-25	2001-03-25
1506	288	8195	177546500	2014-02-08	2021-02-08
1507	108	5960	200929377	2012-07-22	2019-07-22
1508	68	7535	125916301	2020-07-25	2027-07-25
1509	161	8993	109803695	2000-06-09	2007-06-09
1513	131	2581	200501368	1990-09-27	1997-09-27
1514	260	5051	149036569	2005-05-02	2012-05-02
1520	82	9044	178428904	2012-12-04	2015-12-04
1522	291	6469	160503213	2019-12-09	2024-12-09
1524	160	9125	151504866	1994-02-25	1997-02-25
1526	55	5569	161402323	2000-03-26	2003-03-26
1529	136	8326	105536506	2008-11-10	2013-11-10
1531	222	5643	177016008	1990-09-17	1997-09-17
1533	274	7839	108528381	1994-06-17	2000-06-17
1534	87	5200	175863195	1995-12-02	1998-12-02
1538	230	5532	129076530	2013-02-28	2018-02-28
1539	10	5225	186932594	2015-05-04	2020-05-04
1545	245	5420	196784209	2004-07-11	2011-07-11
1546	166	6525	145285192	2021-07-02	2027-07-02
1553	151	7261	119220478	2013-08-24	2019-08-24
1555	256	8290	125276046	1995-03-09	1998-03-09
1559	107	8119	180635926	1999-04-08	2003-04-08
1560	70	4740	135431769	2019-06-10	2025-06-10
1561	269	6488	130842451	1995-08-28	1998-08-28
1562	251	7292	106331389	2010-02-13	2016-02-13
1563	90	5455	196548153	1993-12-20	1999-12-20
1569	90	8516	151624916	2010-12-21	2013-12-21
1570	81	6696	111837684	1995-03-28	2000-03-28
1571	308	7176	114564492	1995-01-05	2000-01-05
1573	88	8192	145532100	2021-03-12	2025-03-12
1576	244	5491	152020923	1993-09-10	1996-09-10
1577	284	9034	196548372	2013-09-09	2018-09-09
1579	20	8567	160574562	2017-03-06	2021-03-06
1582	111	6166	104940346	2013-11-06	2018-11-06
1583	48	6448	168843176	2007-01-28	2014-01-28
1587	241	2432	101706071	1999-05-04	2003-05-04
1592	206	4838	131969273	2002-10-03	2009-10-03
1593	274	8706	128640768	2001-06-15	2006-06-15
1595	86	8164	196596457	1998-03-14	2002-03-14
1596	192	4781	106525145	2017-07-22	2021-07-22
1599	47	5544	138762801	2008-04-20	2011-04-20
1601	258	6565	198175665	1994-01-18	2001-01-18
1605	28	5688	141917855	2020-09-03	2024-09-03
1606	299	6589	132058485	2006-07-22	2009-07-22
1607	12	8086	185404161	1995-05-13	2002-05-13
1608	1	5871	137625181	1997-09-01	2003-09-01
1613	184	9008	136156232	2016-07-08	2022-07-08
1614	294	6299	120378253	2022-05-05	2028-05-05
1617	38	7844	174833474	1994-12-23	2000-12-23
1619	124	2586	184348977	2006-07-01	2010-07-01
1623	290	5497	199456176	2021-10-25	2028-10-25
1627	173	2645	189395905	1995-11-25	2002-11-25
1630	309	8333	124834610	2012-05-20	2015-05-20
1632	21	6201	156735162	1991-08-17	1997-08-17
1637	22	5663	164834484	2009-12-09	2013-12-09
1639	293	6065	128577221	2021-03-02	2026-03-02
1642	18	2608	146886316	1997-12-20	2001-12-20
1643	278	6902	190794465	1996-01-26	2002-01-26
1647	192	6564	109909180	2015-10-06	2019-10-06
1654	83	2225	195179269	2007-08-01	2014-08-01
1656	216	6719	123339116	1999-12-09	2006-12-09
1658	138	6636	157188148	2014-10-26	2019-10-26
1659	291	7259	134742841	2000-02-20	2006-02-20
1662	90	5995	184542167	2022-09-23	2025-09-23
1664	137	6079	114695804	2012-01-15	2015-01-15
1665	65	7855	157250265	1993-05-11	1998-05-11
1667	296	2558	192724614	1992-01-25	1995-01-25
1674	10	4873	182706255	2019-05-05	2024-05-05
1675	219	7728	199126883	1998-11-26	2003-11-26
1677	220	7399	135686540	2015-03-19	2018-03-19
1678	159	6306	197372236	1998-04-27	2001-04-27
1680	143	9045	179134493	1993-01-25	1997-01-25
1683	184	8668	144067864	2020-05-01	2023-05-01
1684	53	7517	184276007	2008-04-09	2015-04-09
1685	225	6601	166369114	1994-04-19	2001-04-19
1686	154	5144	187800878	2017-05-28	2023-05-28
1688	63	7179	155636055	2018-04-11	2023-04-11
1690	208	7457	138870201	1994-08-01	2000-08-01
1692	163	6702	133821511	1998-12-10	2001-12-10
1693	212	4853	170368558	1993-09-22	2000-09-22
1694	157	2304	200143778	2000-07-06	2003-07-06
1697	57	5811	195748120	2013-11-09	2018-11-09
1698	255	6652	125004788	1997-08-02	2003-08-02
1708	140	2221	158263326	2017-05-25	2024-05-25
1709	139	7854	101149072	2004-09-20	2010-09-20
1711	89	9095	117974956	2022-12-09	2027-12-09
1713	138	6337	196043586	2015-07-28	2018-07-28
1714	263	6956	109683186	2003-12-12	2009-12-12
1720	197	2332	116221142	2019-07-02	2022-07-02
1723	116	6014	199931597	2010-09-05	2014-09-05
1725	142	6093	182857115	2004-07-28	2010-07-28
1726	306	5484	172842144	2020-02-27	2025-02-27
1730	89	2307	156579560	1992-07-07	1996-07-07
1731	242	5126	102049624	2019-04-18	2023-04-18
1735	5	6985	112256426	2008-01-20	2013-01-20
1736	311	4958	125388051	2002-08-26	2008-08-26
1739	64	8595	108039756	2002-05-25	2008-05-25
1740	152	7334	141433003	2006-10-19	2011-10-19
1742	77	6441	123642566	2004-11-09	2010-11-09
1743	150	7800	107481234	2017-03-24	2021-03-24
1744	222	5476	128495776	1999-12-21	2005-12-21
1745	244	6533	123525116	2012-08-20	2018-08-20
1748	50	5514	147712546	1998-07-02	2005-07-02
1749	64	8106	101984333	1996-08-18	2002-08-18
1750	56	8548	113629004	1990-10-11	1997-10-11
1751	145	5471	198042170	2017-03-08	2022-03-08
1752	288	8668	183407545	2011-11-22	2015-11-22
1755	313	5731	195972844	1990-03-01	1996-03-01
1756	314	5477	181365313	2009-03-24	2015-03-24
1759	73	6333	164555260	2006-11-12	2010-11-12
1762	251	5131	184122218	2007-09-01	2012-09-01
1763	178	9135	134224273	2008-04-08	2015-04-08
1766	249	5211	115623497	2017-03-21	2024-03-21
1767	133	6627	195495631	1994-10-07	1997-10-07
1768	200	7851	146199695	1995-04-07	2000-04-07
1769	287	7526	162781578	1998-03-15	2005-03-15
1772	119	4894	164394265	2007-12-25	2013-12-25
1773	123	8964	148149191	2021-12-22	2027-12-22
1775	168	8557	133171224	2005-01-20	2012-01-20
1776	241	8070	138466765	2003-10-01	2006-10-01
1777	119	8390	182903566	2003-07-18	2006-07-18
1779	239	5039	156590142	2012-06-27	2018-06-27
1781	146	2310	126100016	2001-02-27	2007-02-27
1782	14	5121	162168543	2012-04-21	2015-04-21
1785	130	9025	175058891	2007-06-08	2012-06-08
1787	292	6267	139437812	2001-05-21	2008-05-21
1788	20	4797	178335882	2007-11-18	2010-11-18
1789	172	8579	169844315	2009-08-17	2016-08-17
1790	48	5844	142824747	2003-09-22	2008-09-22
1791	301	7719	186284717	2008-07-27	2014-07-27
1792	135	8451	190267729	2012-02-15	2018-02-15
1795	267	4702	174199121	1996-07-20	2002-07-20
1798	19	8026	124698648	2016-12-16	2021-12-16
1799	267	2306	159697290	2011-03-24	2014-03-24
1803	313	6429	113724524	1995-04-19	2000-04-19
1808	52	6946	116846456	2019-06-07	2026-06-07
1809	297	2450	107511685	2011-09-02	2017-09-02
1810	78	5516	186902750	1995-02-14	2001-02-14
1811	173	6395	200697085	1999-02-03	2005-02-03
1814	190	2317	181514654	2010-02-17	2017-02-17
1815	159	2507	104419709	2010-02-25	2013-02-25
1817	69	6511	180154633	2004-10-14	2010-10-14
1818	187	5245	137604884	2009-02-02	2015-02-02
1820	217	7605	199703379	2015-07-16	2020-07-16
1822	28	8586	189044986	2022-03-12	2027-03-12
1825	54	6244	114562745	2007-03-12	2011-03-12
1828	179	7185	125292033	1992-11-03	1995-11-03
1829	50	8693	122510521	2011-03-27	2018-03-27
1832	4	2219	178741920	2005-11-03	2009-11-03
1838	86	9088	116588883	2020-03-07	2024-03-07
1839	189	4764	174311237	1994-07-26	2000-07-26
1842	38	5154	148093829	2015-12-17	2018-12-17
1845	14	6938	129294400	2021-09-08	2026-09-08
1846	213	4983	165790714	2004-02-20	2008-02-20
1848	257	8655	175245928	1994-04-09	1997-04-09
1849	182	9006	109104306	2001-06-03	2008-06-03
1851	155	9142	149205169	2008-05-02	2011-05-02
1852	247	9020	186582803	1993-04-22	1997-04-22
1853	261	8418	144514912	2010-01-07	2017-01-07
1855	301	2484	179926011	1992-03-02	1996-03-02
1857	161	7551	137982667	1992-06-04	1999-06-04
1858	228	7857	111765960	2009-08-27	2013-08-27
1860	185	7597	142168562	2000-01-23	2005-01-23
1863	124	7279	181385472	2020-03-26	2025-03-26
1870	21	7891	115818039	2006-09-09	2010-09-09
1873	30	6369	109972627	2005-10-16	2010-10-16
1875	240	4684	134101510	2004-07-06	2008-07-06
1876	259	5689	181464957	1998-11-12	2004-11-12
1879	258	2295	171091198	1993-02-27	1997-02-27
1880	81	7450	157688823	2008-06-09	2013-06-09
1883	161	2493	183095018	1992-06-23	1998-06-23
1884	138	9133	108165745	2005-05-05	2012-05-05
1885	22	6907	192281681	2014-11-13	2020-11-13
1886	88	3788	142397858	2019-09-03	2025-09-03
1887	4	5995	134424949	2000-01-20	2006-01-20
1891	193	2346	135041553	1999-06-12	2003-06-12
1894	2	4762	135527819	2007-02-14	2012-02-14
1896	184	7955	161036403	2018-03-24	2025-03-24
1900	123	8266	199949821	2000-06-19	2007-06-19
1907	279	5011	185313530	2008-03-20	2013-03-20
1908	188	2591	174256924	2019-03-15	2024-03-15
1916	239	8332	104010179	1991-02-25	1994-02-25
1921	30	5663	162137537	1995-08-01	2000-08-01
1923	222	6916	174339981	2002-11-04	2009-11-04
1926	280	5789	197662334	2008-12-20	2015-12-20
1928	293	5672	195225647	1999-09-14	2006-09-14
1931	203	7196	151059019	2013-09-17	2017-09-17
1932	190	2477	148979782	1998-05-17	2001-05-17
1934	261	7113	198090502	1997-03-25	2001-03-25
1935	307	2575	135813001	2007-10-14	2011-10-14
1937	20	4667	116721126	2017-08-04	2020-08-04
1939	290	2314	197762531	1992-05-28	1996-05-28
1940	53	5961	166785688	2011-12-28	2017-12-28
1942	5	5968	160361549	2014-10-12	2017-10-12
1944	202	6130	180709413	2021-02-14	2027-02-14
1945	139	2266	149481004	2003-02-24	2006-02-24
1946	52	9038	136422867	1992-05-25	1997-05-25
1947	138	7108	125965626	2021-11-20	2025-11-20
1949	18	7228	187995581	2012-12-09	2019-12-09
1952	201	6650	178073584	2017-07-20	2024-07-20
1953	123	7053	160779909	2004-03-22	2007-03-22
1957	5	5285	118100030	2017-05-08	2024-05-08
1958	38	7543	122488732	2008-11-08	2011-11-08
1959	310	9120	140493147	2009-07-23	2013-07-23
1960	154	7778	181102672	2020-11-06	2025-11-06
1961	78	5304	110307380	1998-08-08	2003-08-08
1962	1	7461	135687051	2015-08-04	2018-08-04
1965	199	7830	113682300	1997-03-07	2001-03-07
1967	268	8420	136408481	2019-11-14	2025-11-14
1968	144	2600	147625287	2012-04-14	2016-04-14
1969	39	2212	151448796	2012-10-16	2017-10-16
1971	83	5498	174605145	1993-04-10	1998-04-10
1973	253	6157	188211267	2004-11-15	2008-11-15
1974	131	2323	173686435	2012-02-27	2016-02-27
1975	309	2514	169089098	2015-12-18	2019-12-18
1977	314	6400	196271016	2017-02-17	2024-02-17
1978	157	7428	196251833	2001-09-26	2007-09-26
1980	155	4750	126523434	2004-12-12	2007-12-12
1981	198	4879	164416877	2019-06-26	2024-06-26
1982	117	8119	120278589	2007-04-06	2014-04-06
1983	218	6144	156187689	2005-06-14	2008-06-14
1987	119	8704	105918799	2002-07-15	2006-07-15
1992	228	5347	155259984	2020-05-05	2024-05-05
1997	29	2335	197642028	2016-09-25	2022-09-25
2000	61	6301	126817171	2000-12-23	2007-12-23
2001	151	7008	176555483	2014-08-24	2017-08-24
2002	152	2645	141380357	2004-05-08	2009-05-08
2004	185	4733	157067856	2017-12-16	2021-12-16
2006	9	8075	177207869	2009-07-02	2013-07-02
2009	311	6706	119119051	2001-12-04	2004-12-04
2013	40	6715	118351032	2006-04-14	2010-04-14
2014	196	7640	167043749	2004-01-12	2011-01-12
2015	188	4927	135181422	2006-12-23	2009-12-23
2016	63	6315	139859110	2001-11-16	2004-11-16
2020	86	7622	125406550	2012-08-06	2017-08-06
2025	319	6060	183647696	2020-05-14	2023-05-14
2028	294	6410	194539167	2017-07-05	2022-07-05
2029	239	2388	102343371	1993-02-04	2000-02-04
2036	15	8888	159110719	1991-07-18	1998-07-18
2038	127	6399	142136591	1994-05-08	1999-05-08
2042	109	6068	180818212	2021-02-01	2024-02-01
2044	109	8633	127257364	2007-09-19	2012-09-19
2046	306	7278	195239187	2011-09-23	2017-09-23
2047	318	7227	174843487	2001-02-14	2008-02-14
2048	191	8985	176507051	2015-11-24	2018-11-24
2050	65	7450	196083281	2003-04-08	2009-04-08
2053	261	6693	166735199	2004-07-18	2007-07-18
2055	80	5023	190748990	2000-03-24	2007-03-24
2058	201	8153	181151318	2003-10-16	2006-10-16
2059	318	2244	155446133	1999-01-16	2004-01-16
2064	68	2513	148408135	2001-09-02	2004-09-02
2065	181	8145	101136156	2020-04-02	2023-04-02
2066	209	8479	114931025	2015-01-15	2021-01-15
2067	135	7181	126498021	2016-01-23	2023-01-23
2068	132	4942	195575754	1991-04-21	1994-04-21
2069	169	8674	103345553	2021-10-18	2026-10-18
2072	261	5800	147952627	2003-03-14	2010-03-14
2076	286	5219	120617129	2002-01-19	2005-01-19
2079	300	7574	165302071	2015-08-07	2022-08-07
2080	30	4903	185749899	1994-07-13	1998-07-13
2083	276	5658	118757445	2007-05-15	2012-05-15
2086	205	5476	111334615	2017-02-05	2021-02-05
2089	122	4913	170828762	2005-12-19	2010-12-19
2091	310	8065	125529922	2013-02-26	2018-02-26
2094	14	8448	172637046	2005-11-10	2012-11-10
2096	126	7358	162499784	2007-11-05	2014-11-05
2098	241	8784	159147736	2004-05-16	2011-05-16
2102	251	6503	114819011	1990-02-18	1996-02-18
2105	51	5991	165463074	2008-06-12	2013-06-12
2107	89	6500	189553080	1991-10-15	1994-10-15
2112	47	5465	135406355	2021-04-16	2026-04-16
2120	193	2244	126822988	2002-07-01	2006-07-01
2121	134	2408	156539454	2019-06-23	2023-06-23
2122	210	2650	187912248	2018-12-21	2022-12-21
2125	249	7125	148134968	2000-02-20	2003-02-20
2127	20	6412	186294074	2020-09-15	2023-09-15
2128	115	8101	148662898	1999-11-26	2005-11-26
2129	10	9079	193425784	2007-02-28	2014-02-28
2130	69	5042	167466297	2012-07-19	2015-07-19
2132	46	5642	138207497	2016-04-16	2021-04-16
2134	151	2224	185870693	2022-01-09	2028-01-09
2136	131	2433	184044899	2020-05-25	2027-05-25
2141	222	7647	162553538	2001-12-11	2004-12-11
2142	147	8473	194240830	2005-06-27	2012-06-27
2143	204	6232	106606268	1999-02-22	2003-02-22
2144	229	7984	102943675	1993-07-07	1998-07-07
2145	260	7677	162414758	1997-06-19	2004-06-19
2146	237	8720	163718715	1995-03-12	1998-03-12
2150	144	8238	181877958	2014-04-23	2019-04-23
2153	205	5849	131841450	2007-07-22	2012-07-22
2156	215	5405	157799463	2012-12-20	2016-12-20
2160	195	8456	169602076	1995-11-19	1998-11-19
2162	216	7768	113311441	1994-07-24	1998-07-24
2163	287	4942	146300141	2003-04-18	2008-04-18
2167	287	9009	148230475	1999-08-28	2005-08-28
2172	268	6912	170539407	2004-08-01	2008-08-01
2175	84	7655	183567628	1999-12-16	2002-12-16
2180	7	8084	154321328	2020-06-25	2025-06-25
2181	17	8817	127600467	2008-06-26	2011-06-26
2183	20	7258	188965761	1991-11-08	1995-11-08
2188	260	8032	163491673	2016-01-04	2021-01-04
2189	46	4910	158962055	2015-11-07	2018-11-07
2190	193	5476	195217443	1999-03-22	2003-03-22
2191	64	2639	128212790	2016-08-28	2019-08-28
2195	39	6115	194165412	2017-02-02	2023-02-02
2197	281	8273	172925792	2000-02-15	2007-02-15
2199	194	7359	144720688	1992-10-09	1997-10-09
2201	177	6150	193230335	2012-12-07	2017-12-07
2210	44	2432	175057473	2012-04-16	2018-04-16
2211	138	4507	150673135	2002-11-22	2008-11-22
2213	246	8251	145649265	2020-12-26	2026-12-26
2214	84	5835	160178808	2007-02-08	2011-02-08
2216	10	7141	160749271	2016-07-02	2019-07-02
2217	307	2515	198337625	2007-06-24	2013-06-24
2218	68	2189	198434601	2020-09-04	2026-09-04
2220	142	7053	195226436	2004-08-08	2007-08-08
2225	150	7457	133514457	2005-10-21	2011-10-21
2226	10	7205	157919311	1995-11-28	2002-11-28
2229	184	2286	187676990	2002-02-16	2005-02-16
2231	132	8578	111334203	2009-01-22	2014-01-22
2232	122	8386	136818013	1996-07-28	1999-07-28
2236	216	8945	130937351	2003-06-19	2008-06-19
2237	121	4735	181569178	2004-08-09	2008-08-09
2238	226	6267	192422522	1997-10-13	2003-10-13
2240	239	6195	154835813	2020-02-22	2024-02-22
2242	46	7631	108787043	2005-01-10	2008-01-10
2243	161	8506	154020443	2019-07-18	2026-07-18
2244	48	6619	175610176	2003-09-01	2006-09-01
2246	205	8296	168467615	2003-11-14	2009-11-14
2253	288	2631	176015961	2013-12-08	2018-12-08
2257	209	2580	144831344	2013-11-19	2020-11-19
2259	85	4692	161218420	1990-04-24	1993-04-24
2260	47	8856	130049383	2022-03-13	2028-03-13
2261	53	6890	156058196	2007-10-25	2014-10-25
2262	223	7029	152650103	1996-04-28	2003-04-28
2268	156	8260	105354996	2020-10-23	2023-10-23
2269	295	4861	171824268	2001-07-28	2004-07-28
2271	89	7211	124726857	2013-07-01	2016-07-01
2272	50	5438	105326344	2012-12-18	2015-12-18
2273	315	5497	144715750	2005-11-04	2011-11-04
2275	232	2230	150856392	2002-11-19	2007-11-19
2276	147	4909	102302748	2001-02-26	2007-02-26
2277	139	6648	142390546	2019-11-14	2022-11-14
2278	206	8864	138581937	1992-06-23	1997-06-23
2279	6	4742	122044051	2009-01-21	2015-01-21
2280	132	7473	123111456	1992-02-26	1998-02-26
2284	12	8401	113130991	2021-09-11	2026-09-11
2285	66	7075	167929512	2015-08-15	2018-08-15
2286	45	5406	168096319	2018-01-24	2024-01-24
2287	159	7913	108473112	2015-05-02	2021-05-02
2288	272	8501	147791008	1997-10-15	2004-10-15
2289	259	5453	181451453	2001-09-05	2006-09-05
2290	259	7664	159424001	2006-05-14	2012-05-14
2291	170	7304	130306894	2019-09-02	2026-09-02
2295	273	6161	120340000	2020-01-25	2024-01-25
2297	110	2382	139918700	1994-01-10	2001-01-10
2299	180	6282	116520083	2007-07-14	2012-07-14
2302	309	8391	200272102	2006-01-08	2010-01-08
2303	282	2359	198414093	1999-11-04	2005-11-04
2304	169	7878	159034808	1991-02-10	1994-02-10
2312	170	5857	148971942	2016-03-20	2022-03-20
2315	172	4850	150841941	2006-12-17	2009-12-17
2316	67	5586	131403957	1999-03-17	2002-03-17
2320	199	7318	150275740	2014-08-10	2017-08-10
2322	137	6461	179337070	2014-08-04	2020-08-04
2325	178	7873	195418821	2009-10-17	2012-10-17
2327	232	5264	178835618	2001-05-09	2007-05-09
2329	122	8823	153224832	2010-11-25	2017-11-25
2331	296	5368	134979720	2019-02-23	2026-02-23
2334	165	7911	120955926	2021-11-25	2026-11-25
2336	70	8804	119510035	2002-04-13	2007-04-13
2338	270	5285	124115462	1999-09-28	2004-09-28
2340	126	7685	183750991	1998-01-01	2001-01-01
2341	269	2413	170735725	1997-05-16	2003-05-16
2342	193	6958	130517614	2002-11-05	2009-11-05
2347	222	2234	155550568	1992-01-25	1998-01-25
2349	201	4954	177038108	2007-05-02	2014-05-02
2350	149	5027	146581339	1999-12-27	2002-12-27
2351	293	4771	181736893	1995-08-07	2000-08-07
2352	306	2479	142208480	2003-09-18	2010-09-18
2354	274	5538	132704288	2022-04-16	2028-04-16
2358	180	8135	142425613	2012-10-10	2017-10-10
2362	237	6146	145357438	1998-02-21	2005-02-21
2363	86	2459	181857423	1993-09-14	1998-09-14
2365	139	6587	106615547	2017-12-04	2022-12-04
2368	211	7351	161412425	2022-03-26	2026-03-26
2369	70	4739	174333732	2022-01-21	2025-01-21
2370	93	6670	194614274	2009-03-17	2016-03-17
2373	231	4661	129612478	2020-10-02	2026-10-02
2374	255	2474	116771568	2008-06-14	2015-06-14
2377	170	7365	175807441	2000-09-01	2003-09-01
2378	120	8739	191512096	2011-06-02	2017-06-02
2379	17	5074	155808054	1999-06-27	2004-06-27
2381	135	8255	123160877	2013-09-13	2016-09-13
2388	190	8773	143082716	1995-06-14	2001-06-14
2389	318	2306	139003217	1995-06-21	2001-06-21
2392	167	6992	103039532	2019-05-19	2025-05-19
2394	11	5663	105312176	2008-05-20	2011-05-20
2396	53	8897	185764822	2017-12-06	2022-12-06
2397	109	2280	174237898	2000-07-28	2003-07-28
2399	221	8758	166142123	2005-10-05	2011-10-05
2400	181	2207	134013597	2017-02-17	2022-02-17
2401	155	2215	153407905	1990-03-08	1995-03-08
2402	72	2587	165647481	2001-09-19	2006-09-19
2403	264	5506	145202673	1992-10-17	1995-10-17
2405	224	5154	162554959	1991-10-10	1996-10-10
2406	165	7805	167001688	1991-09-02	1994-09-02
2410	68	6066	191325871	1991-09-19	1994-09-19
2411	287	9057	162222643	2017-12-07	2020-12-07
2415	234	7855	143663234	2000-09-19	2005-09-19
2419	107	8443	104810662	2022-04-14	2029-04-14
2420	256	8549	152452269	1996-07-14	1999-07-14
2421	109	6479	109208662	2000-10-07	2005-10-07
2423	318	5449	120007291	2015-10-20	2020-10-20
2424	184	7882	169907435	2005-07-12	2010-07-12
2425	147	2292	113495994	1992-05-03	1997-05-03
2428	230	6226	155037443	2003-03-17	2007-03-17
2433	289	6710	179293953	1996-04-24	2000-04-24
2435	238	9021	123440416	2006-02-26	2010-02-26
2436	233	6121	130179418	1995-06-11	1999-06-11
2437	171	5823	108667188	2003-01-10	2010-01-10
2440	221	6075	142420381	2007-09-05	2013-09-05
2444	211	4671	139185956	2019-04-11	2022-04-11
2449	171	8660	150234151	1995-01-16	1999-01-16
2450	209	2498	147755964	1999-02-16	2003-02-16
2451	156	7277	191376047	2019-07-22	2026-07-22
2452	216	8373	137499880	1994-02-06	1998-02-06
2453	113	5523	189564560	1997-07-22	2001-07-22
2454	196	5154	169824774	2015-06-27	2020-06-27
2457	265	2364	156155124	2001-07-04	2007-07-04
2459	238	7055	147503360	2003-06-26	2009-06-26
2463	47	7379	180966035	1998-09-19	2004-09-19
2464	210	8666	153865564	2015-10-06	2021-10-06
2465	103	7803	194332224	1996-11-19	1999-11-19
2468	222	8220	103041242	2019-07-01	2024-07-01
2469	310	8320	125598573	1998-07-09	2002-07-09
2473	103	5233	118041001	1991-09-12	1994-09-12
2474	4	9057	182809770	2020-12-11	2026-12-11
2480	175	7838	141460567	1991-08-25	1996-08-25
2481	35	6486	128347999	1994-07-11	2001-07-11
2485	172	7873	104240550	2002-07-09	2007-07-09
2486	125	2625	162149513	2002-06-13	2006-06-13
2488	130	8227	177481529	1996-07-21	2002-07-21
2491	1	7797	193993486	1996-04-24	2001-04-24
2493	258	5868	118463491	2010-04-27	2014-04-27
2494	103	2298	170994356	2006-01-06	2010-01-06
2495	199	4989	113229791	2019-12-21	2024-12-21
2498	20	4945	119008072	2012-07-03	2017-07-03
2500	49	5616	155496522	2003-11-14	2007-11-14
2503	281	8455	175539955	2005-01-21	2008-01-21
2505	134	6574	157529880	2001-09-14	2006-09-14
2506	148	2317	189969272	2019-07-25	2025-07-25
2507	308	7429	177501070	2019-08-25	2025-08-25
2508	78	4840	152429738	1994-11-27	2001-11-27
2509	132	2345	197846127	2009-02-07	2016-02-07
2515	161	6691	158244781	1994-11-12	2000-11-12
2516	107	4774	141153741	1991-01-20	1997-01-20
2519	300	8689	110489398	2021-02-28	2028-02-28
2523	213	7688	186302329	1993-12-04	1998-12-04
2525	182	8605	195140341	2011-07-18	2015-07-18
2528	319	5666	163836752	2008-06-24	2012-06-24
2530	297	5676	115412879	2006-07-06	2010-07-06
2531	187	2583	107666789	1994-01-14	1998-01-14
2533	35	2618	186350335	2002-09-06	2009-09-06
2534	145	7946	133054505	2003-03-09	2008-03-09
2539	241	7474	146980437	2022-11-24	2029-11-24
2540	193	4661	106417523	2004-09-23	2010-09-23
2543	150	3745	151556603	1992-09-10	1997-09-10
2544	45	2308	103969574	1998-02-27	2002-02-27
2545	63	7215	104817772	2017-06-04	2023-06-04
2547	256	6138	196559482	1998-08-17	2001-08-17
2548	45	7218	111163848	2017-09-23	2024-09-23
2549	4	5582	134473589	1990-08-10	1994-08-10
2553	239	8106	197325747	2004-03-16	2009-03-16
2555	208	6015	104727005	1992-02-07	1999-02-07
2560	16	6488	163907275	1998-05-01	2005-05-01
2563	48	6116	110130924	2018-10-02	2023-10-02
2568	201	8781	194388511	1995-01-14	1998-01-14
2569	111	5797	190732060	2006-04-04	2013-04-04
2577	190	4803	106664863	1998-07-06	2004-07-06
2578	157	6909	134124571	2020-05-12	2023-05-12
2581	64	9016	146141070	1993-04-05	1998-04-05
2582	230	6721	199765343	2016-05-26	2023-05-26
2586	308	6285	158343369	2022-11-18	2027-11-18
2587	136	4690	185530193	2001-03-05	2008-03-05
2588	209	4858	136199297	2021-03-20	2028-03-20
2590	216	7693	174961684	2014-04-08	2021-04-08
2596	87	2592	168054099	2011-01-06	2017-01-06
2598	181	6280	150627022	2012-11-27	2015-11-27
2599	290	2576	162252038	2008-11-20	2011-11-20
2600	14	2371	123097722	1992-02-12	1998-02-12
2603	30	8862	146120737	2015-04-11	2018-04-11
2604	65	7341	114485162	2007-02-26	2010-02-26
2608	121	6494	196227806	2008-04-28	2012-04-28
2609	163	8513	179396535	2009-02-11	2013-02-11
2613	251	6922	126290836	2006-02-14	2012-02-14
2614	138	2391	181043423	2000-09-04	2005-09-04
2623	191	6702	181737989	2021-10-19	2026-10-19
2624	289	8338	140170627	2001-04-15	2004-04-15
2625	232	7411	121863734	1998-05-03	2002-05-03
2626	163	6040	131919025	1999-01-18	2002-01-18
2627	291	6138	144267841	1994-11-26	1998-11-26
2629	230	5735	167784551	2013-11-03	2016-11-03
2630	78	4761	166560476	2009-06-14	2013-06-14
2631	313	8122	110243732	2020-11-15	2023-11-15
2636	51	8831	108527497	1995-11-06	2000-11-06
2638	50	7564	126367443	2008-01-06	2015-01-06
2640	293	7004	179470963	1997-01-24	2002-01-24
2642	236	6629	161290237	1992-08-03	1999-08-03
2643	142	5498	108983716	1996-02-07	2002-02-07
2644	115	7334	199724434	2008-02-24	2011-02-24
2646	121	7172	156371020	1999-04-19	2002-04-19
2649	280	7125	189183061	2008-01-04	2012-01-04
2650	130	5782	127195720	1997-03-09	2001-03-09
2651	292	8569	109844811	2008-09-06	2012-09-06
2653	203	6433	114396798	2003-04-03	2010-04-03
2654	16	5763	123330510	2020-07-26	2027-07-26
2655	165	2342	141867949	2022-06-11	2029-06-11
2658	221	2424	168794824	1991-07-18	1997-07-18
2661	193	8203	184681900	1998-06-21	2005-06-21
2662	226	8190	143769363	2021-02-14	2027-02-14
2663	118	5237	152489504	2006-12-08	2009-12-08
2665	85	5698	156847060	2004-05-12	2007-05-12
2667	223	8602	152762124	2017-07-15	2020-07-15
2670	134	7435	198608122	1999-09-14	2006-09-14
2671	254	7802	129527537	2000-04-05	2007-04-05
2673	107	6901	198245886	1996-01-20	2002-01-20
2674	10	6034	119245440	2007-11-15	2014-11-15
2676	116	2451	176758633	2019-07-28	2025-07-28
2677	54	8888	113895124	2018-11-20	2025-11-20
2679	140	8173	164696825	2001-01-10	2008-01-10
2692	280	9104	179743866	2016-06-06	2023-06-06
2695	81	7131	120092202	2018-12-24	2025-12-24
2697	115	8276	132242820	2019-07-07	2023-07-07
2699	179	7565	198454611	2018-10-15	2023-10-15
2700	19	5806	134956882	1993-12-16	1998-12-16
2704	309	5224	173810894	1995-01-13	2002-01-13
2705	192	5968	185627851	2011-06-12	2017-06-12
2707	41	6003	157829553	2006-06-04	2013-06-04
2708	268	7782	174242424	2020-06-14	2027-06-14
2711	246	8193	154449682	2018-03-04	2023-03-04
2712	93	5856	200577476	2005-03-22	2008-03-22
2714	202	8173	108715531	2005-04-26	2011-04-26
2715	268	2218	146530688	2013-08-28	2018-08-28
2716	148	4992	128874754	1995-10-15	2002-10-15
2717	306	2391	174796708	2001-01-27	2007-01-27
2720	131	6581	147736824	2021-12-23	2028-12-23
2721	226	2585	124775719	2008-09-03	2011-09-03
2723	198	6226	173550950	2007-10-03	2013-10-03
2724	214	7672	145630153	2007-09-02	2010-09-02
2726	319	8133	164018496	2002-10-12	2005-10-12
2728	249	8864	152258282	2013-03-17	2019-03-17
2736	20	6914	153877942	1990-08-26	1996-08-26
2738	165	4860	180487210	2020-05-24	2024-05-24
2740	227	7152	190090756	2012-11-22	2018-11-22
2743	107	4992	185717947	2001-04-18	2004-04-18
2744	262	5128	186082529	2017-11-17	2021-11-17
2751	64	6168	189533900	2010-04-01	2016-04-01
2755	90	6079	135526773	2019-05-24	2023-05-24
2757	283	8192	186786251	2017-05-28	2021-05-28
2765	195	7248	119981240	2010-12-01	2015-12-01
2766	130	4717	115631927	2021-04-14	2024-04-14
2767	181	6558	161509712	1996-03-06	2000-03-06
2768	75	7500	185247133	1994-05-18	2000-05-18
2770	198	4855	119860712	2011-11-04	2018-11-04
2776	111	7864	169790696	2004-10-06	2010-10-06
2778	271	8609	173482921	2008-03-02	2015-03-02
2779	309	7969	106111741	1997-07-04	2000-07-04
2781	143	6349	103977061	2006-01-09	2012-01-09
2783	41	5882	157190714	2000-08-15	2006-08-15
2789	311	6344	197658778	2008-09-22	2012-09-22
2790	310	7026	176923013	1998-05-21	2002-05-21
2794	115	5284	156722868	2013-11-27	2017-11-27
2797	39	8681	180806382	2021-08-01	2026-08-01
2799	203	8735	138555276	2019-10-15	2026-10-15
2801	269	7992	164411215	1990-01-01	1994-01-01
2804	138	5908	134318049	2019-06-15	2022-06-15
2808	28	4418	152523059	1995-02-14	2000-02-14
2811	189	5357	191459106	1990-12-24	1997-12-24
2813	12	8619	184408535	2009-03-18	2015-03-18
2816	181	6968	122421979	2007-06-04	2011-06-04
2817	223	4686	186427781	2008-07-28	2015-07-28
2821	40	8890	166459412	1990-04-26	1995-04-26
2822	8	6886	150540002	2011-05-07	2016-05-07
2826	22	8319	163479576	2014-02-04	2021-02-04
2828	157	2343	147437569	2002-06-15	2007-06-15
2832	173	7819	103967665	2014-11-27	2018-11-27
2833	216	2545	171545956	2017-06-15	2023-06-15
2836	165	4866	129165848	1996-06-25	2000-06-25
2837	54	8718	183115504	2003-06-27	2009-06-27
2839	81	8634	178542332	2016-12-10	2022-12-10
2841	147	8305	153548332	1995-04-12	1999-04-12
2843	280	8415	171588330	1995-10-09	1998-10-09
2845	119	7444	198279221	2021-10-11	2026-10-11
2848	110	6908	168475709	1994-06-14	1998-06-14
2849	138	5630	179832781	1998-03-17	2003-03-17
2850	316	7322	190347625	2019-12-09	2026-12-09
2852	209	7164	120701915	2019-01-10	2023-01-10
2856	3	5832	103590505	2022-03-04	2027-03-04
2857	275	5591	149779757	1998-07-23	2001-07-23
2858	157	8561	178836547	2008-10-13	2013-10-13
2861	186	7112	139578139	2014-11-12	2021-11-12
2862	301	7420	173360603	2004-01-08	2011-01-08
2863	146	5780	196339130	2005-02-19	2012-02-19
2869	9	6905	137365727	2015-03-11	2018-03-11
2872	224	5656	179619702	2016-10-05	2021-10-05
2873	283	6382	127047387	2006-10-11	2011-10-11
2876	311	7293	184546067	2016-02-14	2023-02-14
2879	167	4680	142743597	2010-05-07	2016-05-07
2882	130	2363	186477743	2006-11-11	2011-11-11
2884	187	8684	105448856	2004-05-20	2011-05-20
2886	153	5869	179519068	2003-06-06	2009-06-06
2887	237	2571	161613369	1993-07-21	2000-07-21
2890	300	2196	131379843	2004-02-14	2008-02-14
2894	235	6259	171481592	2002-08-19	2006-08-19
2897	112	8452	104866535	2021-06-26	2025-06-26
2898	320	2250	182713391	2020-05-26	2023-05-26
2900	268	8605	134977015	2014-12-07	2020-12-07
2903	143	9021	125059835	1995-06-12	1998-06-12
2905	142	2428	118481609	2018-09-06	2021-09-06
2909	295	6397	183573376	2012-09-14	2018-09-14
2910	9	8689	102158205	2006-01-27	2011-01-27
2911	250	6490	146369147	1995-06-21	1999-06-21
2915	46	6887	106703266	2020-08-06	2025-08-06
2916	118	5238	166901930	1999-03-04	2003-03-04
2917	69	6478	186695988	2011-06-08	2017-06-08
2918	126	8502	164107465	2016-07-02	2021-07-02
2919	160	8369	199885667	2017-12-28	2023-12-28
2920	10	7738	134507597	1995-03-13	1998-03-13
2921	269	6613	182183656	1996-11-12	2001-11-12
2922	298	7391	152128154	1995-11-25	1998-11-25
2926	211	6294	123171293	2004-03-06	2007-03-06
2928	54	7645	109464945	1995-01-27	2002-01-27
2929	162	7731	111565161	2015-08-08	2021-08-08
2930	153	7328	181069223	1994-01-07	1999-01-07
2934	186	8683	101778965	1991-01-12	1998-01-12
2939	260	6123	190870564	2015-02-14	2021-02-14
2941	79	2464	175347191	2007-08-18	2013-08-18
2942	82	5539	129488296	2017-06-12	2023-06-12
2944	12	6294	194534173	2008-01-14	2012-01-14
2946	246	8901	129166224	1994-05-14	2000-05-14
2948	21	8045	113283741	2001-02-24	2004-02-24
2951	3	6454	148613325	2020-02-28	2024-02-28
2952	115	7152	175079885	2022-05-22	2027-05-22
2953	215	5633	150736695	1999-02-06	2003-02-06
2954	174	6008	135282454	2001-09-21	2006-09-21
2955	141	8917	133366437	2014-04-04	2019-04-04
2959	178	2439	147039987	2009-08-11	2015-08-11
2960	212	2295	167836596	2020-09-04	2025-09-04
2966	196	6184	136176345	2000-01-20	2007-01-20
2967	151	5098	131194033	1998-01-27	2003-01-27
2968	252	2281	186326173	2022-11-19	2026-11-19
2970	63	6590	182121965	2006-12-16	2013-12-16
2972	8	6475	169200689	2021-11-25	2024-11-25
2973	276	4777	123006307	2004-12-10	2008-12-10
2974	19	2539	198490116	2003-06-16	2009-06-16
2978	3	4815	106679219	2006-05-11	2012-05-11
2979	9	2378	136331454	1992-08-11	1998-08-11
2981	246	8739	161332856	1991-07-15	1997-07-15
2982	259	6075	112282675	1992-03-20	1996-03-20
2983	279	8886	132516284	1993-04-24	1999-04-24
2985	288	8212	155448423	1995-10-18	2002-10-18
2987	147	7805	172285044	2009-05-09	2013-05-09
2990	176	8191	128749533	2011-12-21	2016-12-21
2991	216	5971	177173132	2015-10-06	2022-10-06
2994	1	6328	170982760	2021-06-25	2024-06-25
2995	252	5558	136092566	1993-12-02	1999-12-02
2997	19	8497	120080670	2007-05-03	2014-05-03
2999	54	5851	110380764	1991-07-07	1998-07-07
3000	132	5474	189547642	2013-02-11	2019-02-11
3002	194	6276	172985966	2020-12-16	2026-12-16
3003	143	5867	173181178	2013-07-06	2016-07-06
3010	269	8294	108319898	1998-07-28	2004-07-28
3011	253	7434	153229724	1990-09-01	1996-09-01
3012	241	5509	135204195	2010-07-19	2015-07-19
3014	120	8501	102130573	1996-02-25	2000-02-25
3015	160	7693	163450015	2012-08-13	2015-08-13
3018	78	5221	196557186	2001-04-10	2008-04-10
3019	282	5854	104767730	2014-02-02	2017-02-02
3023	310	2597	145725148	1999-11-01	2005-11-01
3035	168	4955	108932731	1992-01-24	1996-01-24
3037	170	6226	126835081	2018-04-23	2025-04-23
3038	181	7615	146436958	2008-09-25	2012-09-25
3039	3	7262	121157549	1990-08-11	1994-08-11
3042	193	7640	171125893	2016-09-24	2022-09-24
3043	89	5126	116622987	2006-11-01	2013-11-01
3044	173	5501	162471837	2001-12-22	2006-12-22
3048	190	5384	108668058	2020-11-02	2025-11-02
3050	14	7115	162090786	1992-08-20	1999-08-20
3053	140	7012	119658817	2020-06-25	2026-06-25
3054	300	6706	179046471	2014-01-02	2020-01-02
3059	147	7171	104350272	1992-04-14	1995-04-14
3060	219	6915	175268191	2011-02-28	2017-02-28
3063	149	5423	126047708	2014-01-22	2020-01-22
3064	115	6663	179154183	1996-03-21	2001-03-21
3065	316	4857	164583508	2022-01-25	2027-01-25
3067	87	7322	193145193	2000-02-16	2003-02-16
3068	145	2278	149377628	2003-09-10	2010-09-10
3073	243	5970	122942827	2006-01-08	2011-01-08
3074	28	6314	190302176	2015-01-25	2022-01-25
3075	137	6207	120520526	2010-06-06	2015-06-06
3079	235	7835	182353267	2019-05-10	2022-05-10
3082	284	4963	154026025	2005-05-05	2009-05-05
3084	238	6710	129409616	1993-02-28	1998-02-28
3087	2	5160	156314238	2003-11-15	2006-11-15
3090	68	7256	183874204	2009-04-01	2015-04-01
3091	148	7464	122529988	1996-11-16	1999-11-16
3092	189	6429	187089715	1992-10-10	1998-10-10
3093	306	6153	144602063	1997-07-01	2001-07-01
3094	271	8499	197744816	2018-02-08	2022-02-08
3095	21	8169	180228766	1993-02-19	1996-02-19
3096	240	8640	176700342	1996-04-22	2002-04-22
3097	220	6182	188102030	1999-09-27	2005-09-27
3099	220	6271	172218645	2003-05-02	2006-05-02
3100	107	5256	140114977	2009-06-21	2014-06-21
3101	151	8224	200557684	1996-03-09	2000-03-09
3104	285	5448	128303089	2007-12-08	2012-12-08
3107	247	7352	126526203	2020-09-17	2025-09-17
3108	215	5611	197730189	2004-08-14	2010-08-14
3110	298	2649	163635081	2018-12-16	2023-12-16
3111	266	5231	167969360	1998-06-05	2003-06-05
3112	273	5649	198601996	2019-12-17	2023-12-17
3113	183	2355	134206198	1998-02-18	2002-02-18
3114	196	8453	195556309	2003-07-26	2007-07-26
3116	126	4778	123300835	2008-11-11	2013-11-11
3117	108	6937	170504535	1990-01-25	1996-01-25
3119	242	4980	123044642	1997-07-06	2001-07-06
3120	40	6384	130747417	2007-12-13	2013-12-13
3121	196	5347	115684681	2001-02-22	2006-02-22
3124	47	5042	176958962	2016-10-23	2019-10-23
3125	261	8804	144195008	1991-03-25	1996-03-25
3127	111	7579	199015193	2012-03-07	2019-03-07
3128	130	7018	160823826	2016-06-19	2021-06-19
3129	299	5995	145493422	2000-02-18	2005-02-18
3133	146	2354	167463141	2010-04-27	2016-04-27
3134	267	5717	196985690	1997-08-18	2003-08-18
3140	141	8169	143817718	2015-04-07	2021-04-07
3142	300	5195	178377395	1991-04-21	1995-04-21
3143	113	8426	170162204	2004-05-17	2010-05-17
3145	195	8381	149964508	2009-10-14	2012-10-14
3151	11	5607	128701097	2001-05-09	2007-05-09
3155	300	7178	163853214	2010-04-25	2015-04-25
3156	223	2347	131574376	2013-03-23	2018-03-23
3159	93	7054	110913744	2020-07-14	2026-07-14
3160	29	5916	115080060	1997-10-19	2004-10-19
3161	88	4857	113681160	2014-07-01	2020-07-01
3162	238	8911	139457785	1996-01-10	2002-01-10
3166	255	2198	118252035	2004-03-16	2007-03-16
3168	315	2193	135202890	2000-03-12	2005-03-12
3179	89	7228	156286878	2006-03-21	2011-03-21
3180	43	6391	171531065	1999-12-05	2003-12-05
3181	305	4824	138978705	1991-02-18	1998-02-18
3183	149	7035	190774611	1990-09-20	1993-09-20
3187	293	7499	120682453	2012-06-04	2016-06-04
3188	7	6188	120861097	2007-11-02	2010-11-02
3189	215	2410	162682281	1996-10-03	2000-10-03
3191	128	6938	102602575	2011-11-05	2018-11-05
3194	113	6942	191828755	2018-12-28	2024-12-28
3195	93	4680	182555790	2017-08-17	2024-08-17
3198	263	6924	106360666	1993-11-11	1997-11-11
3202	126	7379	157253049	2018-04-06	2023-04-06
3203	35	4761	166349042	2014-02-25	2017-02-25
3205	191	7991	191687741	1995-09-21	2001-09-21
3206	231	8282	199838255	2004-01-23	2010-01-23
3210	52	5658	106034650	2016-11-02	2019-11-02
3215	22	8664	188100816	1999-05-22	2004-05-22
3218	197	8696	160243580	2004-09-11	2008-09-11
3220	193	6110	165518270	2021-12-13	2026-12-13
3222	47	7171	150943577	1999-10-12	2003-10-12
3223	262	2326	164989978	2015-07-28	2022-07-28
3224	128	7731	177250844	2010-06-01	2016-06-01
3226	168	2566	162423258	1994-06-08	1999-06-08
3227	261	5250	164315304	1999-12-02	2003-12-02
3229	51	4908	119585570	2005-01-24	2012-01-24
3231	232	5582	154867108	1994-11-08	2000-11-08
3235	276	6350	115580513	1996-07-20	2003-07-20
3236	136	2570	172141015	2011-04-25	2017-04-25
3241	27	6107	170688085	2015-11-25	2018-11-25
3245	117	8508	178158336	1998-03-06	2003-03-06
3250	267	5225	183878268	2010-02-18	2016-02-18
3251	215	2455	157523413	1998-04-23	2005-04-23
3252	250	8211	176341777	1998-02-17	2002-02-17
3256	213	6546	102262815	1993-04-12	1996-04-12
3258	45	5251	170370898	2000-06-03	2003-06-03
3261	318	6330	104372062	1990-04-23	1994-04-23
3267	315	2205	177563435	2012-02-12	2016-02-12
3268	52	5252	191495142	1997-10-24	2000-10-24
3270	5	5642	156517445	2009-11-26	2014-11-26
3271	144	5333	132419391	2020-08-14	2024-08-14
3275	48	8817	182013217	1999-06-25	2006-06-25
3277	148	8478	188202658	1991-12-07	1994-12-07
3279	2	8680	156417057	2008-03-20	2011-03-20
3281	76	8709	108038247	1991-12-02	1998-12-02
3283	303	2239	180970523	2009-06-18	2012-06-18
3285	269	6688	111009800	2020-02-27	2024-02-27
3287	181	7792	134578732	1995-09-16	2001-09-16
3288	205	2231	125559937	2022-05-26	2029-05-26
3289	159	7221	136724208	2020-02-13	2023-02-13
3293	29	4725	140597307	1990-07-16	1994-07-16
3296	180	8731	193011799	2019-06-05	2023-06-05
3300	169	5094	198507615	2016-08-05	2023-08-05
3301	318	7103	129569673	2004-09-24	2007-09-24
3302	293	5084	136391056	1998-01-18	2003-01-18
3304	209	7259	111406883	1997-08-02	2000-08-02
3305	89	7507	119953694	2005-04-24	2012-04-24
3308	290	7086	137659384	1995-03-12	1999-03-12
3310	302	2239	147498699	2007-10-28	2014-10-28
3314	1	8471	187131728	2013-09-28	2016-09-28
3315	172	5126	187584747	2009-07-07	2014-07-07
3319	172	8596	147035297	1990-05-02	1993-05-02
3320	83	6607	110031899	1998-11-01	2005-11-01
3321	246	6224	191498787	2002-09-18	2007-09-18
3324	64	4812	170784950	1992-08-03	1997-08-03
3325	284	2611	198494066	2017-08-22	2023-08-22
3327	175	7808	161690593	1990-03-02	1997-03-02
3331	53	6385	108615715	2019-07-17	2024-07-17
3333	156	8937	143374422	2016-11-04	2020-11-04
3334	301	5598	138480557	1996-02-12	2003-02-12
3335	152	7946	129617938	2022-01-06	2029-01-06
3336	201	6954	194440799	1990-07-01	1993-07-01
3339	157	2610	104944368	2020-07-26	2023-07-26
3340	243	6939	119402988	2008-11-09	2015-11-09
3341	270	5166	170782224	1994-08-28	1997-08-28
3348	54	7695	195361388	1996-07-21	2002-07-21
3349	83	4698	198131875	1993-02-04	1997-02-04
3351	156	2922	191690211	2011-04-27	2017-04-27
3354	70	8967	121447827	2008-04-28	2014-04-28
3356	304	5816	122634755	1991-03-15	1994-03-15
3358	194	7337	165048096	1990-08-22	1995-08-22
3359	90	4878	165248994	2022-10-12	2027-10-12
3360	290	9068	146939442	2013-11-11	2017-11-11
3361	125	4661	151306393	2008-04-03	2014-04-03
3362	12	9129	146947986	2001-12-21	2006-12-21
3366	228	8693	135904600	2010-08-20	2014-08-20
3367	9	7735	157578418	1995-03-13	2002-03-13
3368	50	2526	141620226	2012-01-22	2017-01-22
3369	38	8991	126358767	2019-09-01	2023-09-01
3370	162	4892	174945686	2011-07-14	2017-07-14
3371	55	8372	111452248	1991-06-22	1997-06-22
3372	126	2433	123886065	1998-06-27	2001-06-27
3373	177	8216	186968389	2015-05-03	2018-05-03
3374	248	7180	105952878	2022-01-09	2027-01-09
3379	205	2457	126023641	2008-06-10	2012-06-10
3380	160	4666	187186664	1991-03-13	1997-03-13
3381	191	2519	172623674	2002-01-15	2006-01-15
3385	284	2463	105722302	2012-03-11	2019-03-11
3390	283	6461	178713852	2009-11-01	2012-11-01
3391	232	5582	189639612	2005-11-25	2009-11-25
3392	122	8514	152855775	2011-02-27	2018-02-27
3393	187	8580	146016591	2009-10-07	2013-10-07
3394	146	8563	161750309	2012-04-04	2015-04-04
3396	139	9056	139944274	1996-05-06	2000-05-06
3397	299	2390	183817364	2022-10-18	2025-10-18
3398	281	7021	125955388	2017-01-06	2023-01-06
3399	73	2223	139361760	1998-11-28	2005-11-28
3401	239	6209	182670401	2000-01-18	2007-01-18
3402	291	7658	167316857	2012-05-22	2017-05-22
3403	218	8568	188125372	2001-09-07	2006-09-07
3404	198	7267	197886473	2014-07-11	2020-07-11
3408	257	6382	167569683	2015-06-16	2018-06-16
3409	167	5819	166842441	2004-05-16	2007-05-16
3411	299	4659	184283993	2013-10-01	2019-10-01
3412	20	6247	176879723	2011-08-11	2017-08-11
3414	167	8497	196615100	2011-07-14	2014-07-14
3415	123	4851	105575303	2011-02-05	2015-02-05
3416	289	5344	149957652	1990-10-15	1996-10-15
3417	43	5834	118852048	2001-08-01	2008-08-01
3418	84	9135	126402809	2005-04-17	2011-04-17
3421	41	6034	104726367	1997-02-19	2000-02-19
3425	205	8773	187468913	1999-02-07	2006-02-07
3427	147	4668	176468568	2007-07-19	2010-07-19
3430	256	7626	171198320	1998-09-10	2003-09-10
3432	20	8874	127811534	2015-07-11	2019-07-11
3433	17	7437	123940407	2020-02-21	2024-02-21
3434	87	4706	186368638	1992-08-18	1999-08-18
3435	231	8008	133223807	1993-10-06	1996-10-06
3437	150	5471	103060982	2019-09-20	2022-09-20
3439	113	8690	137676286	2001-07-22	2004-07-22
3440	7	7003	154609321	2017-06-06	2023-06-06
3443	208	2516	143158269	1996-09-04	2002-09-04
3446	211	5985	166800847	2004-10-17	2011-10-17
3450	226	7453	169312332	2013-10-15	2019-10-15
3451	53	2440	147240924	1994-03-22	2000-03-22
3452	282	6198	194623031	2018-08-07	2022-08-07
3454	65	5051	177948197	2015-01-28	2020-01-28
3456	70	7325	113621214	2009-10-16	2015-10-16
3458	50	7685	128649886	1992-11-08	1999-11-08
3459	201	5473	131800077	1999-03-28	2003-03-28
3461	299	8173	130689216	1994-10-17	1999-10-17
3462	204	8575	155148578	2004-12-08	2008-12-08
3469	259	7710	126158300	1995-08-28	2002-08-28
3470	302	7537	175691437	2010-12-02	2017-12-02
3474	103	7444	138467378	2019-08-01	2024-08-01
3475	112	8644	163970672	2004-04-20	2010-04-20
3482	9	2973	163891180	1999-10-21	2003-10-21
3483	235	7029	180005972	2002-07-16	2009-07-16
3487	238	5583	121021878	2017-06-01	2020-06-01
3488	314	5701	125201232	2010-02-06	2017-02-06
3489	211	6583	147899800	1995-03-23	1999-03-23
3490	294	8132	101082481	2001-10-14	2004-10-14
3491	299	8576	160496285	2010-12-14	2014-12-14
3494	315	9083	160855831	1993-02-16	2000-02-16
3496	301	8601	189188128	2019-03-28	2026-03-28
3499	142	7749	200409837	2009-07-13	2012-07-13
3500	20	6906	163753822	2009-06-11	2012-06-11
3501	76	9091	200132507	2020-12-14	2023-12-14
3502	138	8425	178193328	2012-03-04	2016-03-04
3504	153	6419	186144986	2000-01-11	2004-01-11
3509	299	2553	193287951	2004-10-19	2011-10-19
3510	72	8066	167387187	2019-09-06	2023-09-06
3512	267	8885	119020965	1993-03-19	1996-03-19
3513	76	8137	155278764	2002-12-14	2006-12-14
3515	115	7000	135289948	1994-09-14	1997-09-14
3516	282	5961	180452575	2004-01-06	2008-01-06
3517	190	5938	115532224	2013-02-01	2019-02-01
3519	40	5539	167653336	2000-06-27	2004-06-27
3521	123	6347	190928077	2008-12-27	2011-12-27
3524	6	2320	137264367	1990-02-12	1995-02-12
3526	64	8586	116241836	2022-06-02	2028-06-02
3527	127	5263	141747276	1994-01-01	2000-01-01
3528	248	7370	175336669	1992-09-12	1996-09-12
3529	54	6898	146860167	2018-12-15	2024-12-15
3532	133	6079	155326959	1996-05-03	2003-05-03
3538	267	2289	177305208	2007-09-15	2014-09-15
3541	243	8696	121828804	2020-12-08	2024-12-08
3542	192	4913	175482350	2011-04-22	2018-04-22
3544	284	8897	191052009	2008-12-02	2014-12-02
3549	52	8523	186148198	1999-11-14	2005-11-14
3551	282	2489	159026843	2005-04-24	2008-04-24
3554	13	5927	160440918	2012-11-21	2017-11-21
3555	257	2534	150275873	2022-05-26	2026-05-26
3556	177	8802	117197925	1996-09-13	1999-09-13
3557	285	7285	152264597	2014-10-15	2020-10-15
3558	75	5856	150051435	2017-01-21	2020-01-21
3560	17	6487	172538759	2004-04-20	2008-04-20
3561	184	7195	157788572	1990-02-10	1995-02-10
3566	207	4920	143132649	2016-11-16	2019-11-16
3572	103	8170	195659320	1991-03-10	1994-03-10
3574	232	6704	179028338	2005-01-07	2010-01-07
3575	212	5532	149680505	2010-05-13	2017-05-13
3576	70	8401	126973064	1997-05-16	2002-05-16
3578	46	6044	154095646	2015-07-07	2020-07-07
3579	113	7791	196990511	1992-06-27	1995-06-27
3580	151	7181	148544737	1996-01-09	1999-01-09
3581	140	8028	104436488	2018-08-19	2023-08-19
3583	84	7713	103605687	2012-09-21	2018-09-21
3585	299	2456	133813412	1991-07-11	1994-07-11
3586	169	2300	147675287	2001-04-25	2007-04-25
3588	27	5612	113246441	1998-08-08	2005-08-08
3591	275	5040	121576854	1997-04-20	2003-04-20
3592	217	5854	181210565	1999-03-07	2003-03-07
3594	245	5042	189441646	2012-10-13	2019-10-13
3597	218	7659	114648892	2022-03-04	2029-03-04
3600	123	5905	137225912	2001-06-27	2006-06-27
3601	195	8054	123486363	2008-08-26	2011-08-26
3602	201	4733	132268348	1999-09-13	2006-09-13
3603	156	5237	111975801	1998-08-20	2003-08-20
3604	230	6015	173661150	2020-08-14	2024-08-14
3607	69	8415	148318089	2019-02-16	2025-02-16
3617	107	6465	118665414	1990-09-24	1995-09-24
3618	217	2485	127889751	1996-12-12	1999-12-12
3619	177	6548	183354616	2016-04-07	2020-04-07
3626	287	2248	173213421	2021-02-02	2027-02-02
3627	216	6100	183029401	2021-06-17	2027-06-17
3628	309	7900	175484239	2018-12-15	2022-12-15
3629	264	8878	105070490	2001-09-14	2008-09-14
3631	177	2566	197578932	1991-06-22	1997-06-22
3634	176	7991	155032977	2014-02-19	2020-02-19
3635	87	8612	167337719	2000-10-07	2007-10-07
3636	199	6379	167529553	2006-08-11	2009-08-11
3637	8	4691	126100986	2019-06-05	2026-06-05
3639	140	4754	126201604	2018-06-02	2025-06-02
3640	28	6966	177435806	2006-01-08	2011-01-08
3641	297	8446	118052722	1997-01-27	2003-01-27
3644	234	8967	109513179	1994-01-21	2001-01-21
3645	64	4769	169768812	2020-02-16	2025-02-16
3646	202	8739	120180850	2016-01-17	2022-01-17
3648	169	8333	105133927	1998-07-09	2002-07-09
3651	210	5250	133412179	2004-02-02	2011-02-02
3654	194	6317	147072423	2022-05-15	2029-05-15
3658	256	8417	139625646	2014-01-11	2021-01-11
3662	41	7844	103476572	2005-11-03	2008-11-03
3663	30	5504	190020158	1991-01-08	1998-01-08
3665	143	7236	110822158	1992-01-21	1999-01-21
3666	109	2520	145944553	2006-12-16	2010-12-16
3674	54	9125	124453765	1994-08-07	2001-08-07
3675	141	6664	107995664	2016-10-22	2021-10-22
3677	189	4788	112993543	2008-10-28	2014-10-28
3679	72	2525	147030161	2019-06-14	2023-06-14
3682	180	8310	187623218	2016-08-13	2022-08-13
3685	252	6237	118249752	1992-07-20	1996-07-20
3688	176	5174	114740158	2009-01-19	2012-01-19
3689	66	5555	178211955	2003-03-26	2008-03-26
3690	87	8901	181300864	1990-05-28	1996-05-28
3692	139	5420	164713500	2019-10-27	2026-10-27
3695	269	4858	181915107	1997-05-04	2001-05-04
3696	222	2582	134087032	2010-02-13	2015-02-13
3698	308	7978	149163663	2019-04-03	2022-04-03
3699	253	8803	193104724	2011-12-01	2014-12-01
3701	171	2464	158164586	2004-06-26	2007-06-26
3705	252	7726	194264625	1996-10-24	2000-10-24
3707	222	8350	182483510	2003-11-09	2009-11-09
3710	70	5977	125905954	2008-10-23	2012-10-23
3711	46	5012	132684571	2000-08-15	2007-08-15
3716	79	4867	145616721	1999-12-20	2002-12-20
3721	247	8279	186306315	2007-11-11	2014-11-11
3724	194	6280	113394653	1990-12-10	1995-12-10
3728	188	5835	103045355	2011-04-24	2014-04-24
3729	126	6437	190153108	2013-03-04	2017-03-04
3733	39	7641	147604663	1992-09-03	1999-09-03
3738	130	7956	124303128	1995-09-28	1998-09-28
3740	242	5586	130549711	1997-04-01	2004-04-01
3741	214	6006	107062146	2005-05-07	2011-05-07
3746	41	5497	109199392	2007-09-16	2010-09-16
3748	112	6929	132390905	2015-04-03	2020-04-03
3749	122	6657	149132966	2021-01-28	2028-01-28
3750	241	6918	137177200	1991-03-13	1994-03-13
3751	152	6983	165195307	1996-02-20	2001-02-20
3753	295	4687	141707256	2001-11-19	2005-11-19
3755	145	9042	188132369	1991-05-07	1997-05-07
3756	165	7218	101126545	2010-02-23	2017-02-23
3757	90	8262	101670721	2005-05-13	2010-05-13
3758	197	7173	141772877	2008-02-11	2015-02-11
3759	211	5211	102181260	1990-12-17	1995-12-17
3763	121	7775	150257799	1992-12-21	1996-12-21
3765	240	8410	141427626	2003-12-24	2008-12-24
3767	103	5038	108583254	1994-06-24	1997-06-24
3769	185	7207	139027691	2004-02-04	2008-02-04
3773	268	4697	175702561	2016-12-03	2020-12-03
3774	165	6216	124743975	2008-01-18	2014-01-18
3776	51	7691	185013592	2008-11-26	2011-11-26
3778	174	8092	116378058	1996-02-23	2002-02-23
3781	308	6995	189861426	1997-08-18	2002-08-18
3782	27	2410	172248276	2015-02-01	2018-02-01
3783	235	7789	187159395	2014-12-22	2018-12-22
3784	219	8572	127389281	2014-11-12	2020-11-12
3785	112	5544	142401032	2013-12-16	2018-12-16
3787	223	2585	160693326	2013-08-16	2018-08-16
3793	83	8450	121773659	2009-11-19	2016-11-19
3794	293	8393	104477474	2013-09-01	2016-09-01
3796	260	5582	111636054	2013-12-20	2016-12-20
3797	49	7907	181780034	2013-01-27	2018-01-27
3799	150	2247	116157870	2010-01-24	2016-01-24
3802	263	7466	131840185	2005-07-23	2008-07-23
3805	301	8854	142979847	2020-05-27	2025-05-27
3811	30	2523	161510228	2017-08-12	2024-08-12
3813	202	6152	185111706	2017-02-25	2020-02-25
3814	124	4909	158058688	2011-06-04	2017-06-04
3818	201	7309	102047542	1998-05-03	2001-05-03
3821	273	2295	144297672	2016-10-16	2022-10-16
3824	199	6909	149205315	2005-07-28	2010-07-28
3826	68	8965	109502679	2004-06-28	2007-06-28
3829	119	6589	175367056	2019-07-02	2025-07-02
3831	257	4728	170150860	1990-06-17	1995-06-17
3832	313	2306	113078434	1998-02-19	2001-02-19
3834	118	4619	195596356	1993-11-02	1997-11-02
3835	183	6321	121292135	2012-10-14	2016-10-14
3837	302	6222	140236151	2016-03-25	2022-03-25
3838	203	6375	158473150	1990-05-26	1995-05-26
3839	295	2326	190318747	1997-05-23	2004-05-23
3841	296	8501	114380533	2013-08-04	2016-08-04
3842	139	2300	190193979	1998-05-03	2003-05-03
3844	137	6459	114640278	2006-08-03	2010-08-03
3846	268	7225	182913470	2003-03-24	2010-03-24
3848	11	8722	109563151	2019-01-02	2026-01-02
3855	276	4788	139579948	2000-12-07	2005-12-07
3857	14	8955	103924246	2020-05-25	2024-05-25
3858	191	8514	107413620	2011-05-19	2017-05-19
3859	266	7478	101252893	2006-12-11	2011-12-11
3860	309	8329	155038733	2018-12-10	2024-12-10
3861	291	5007	114673082	2015-08-23	2022-08-23
3862	190	7060	130387910	1997-06-28	2004-06-28
3863	61	6514	139692533	2000-02-15	2005-02-15
3864	309	6066	195213693	2019-02-28	2026-02-28
3866	122	5371	183066838	1997-12-09	2003-12-09
3870	156	7401	114733126	1997-01-03	2003-01-03
3871	47	7740	145110316	1997-07-19	2000-07-19
3872	298	2624	130648227	1990-04-02	1996-04-02
3873	66	8471	146324328	2014-07-19	2017-07-19
3876	46	2451	135066165	2015-10-21	2022-10-21
3877	64	7742	153186171	2017-06-21	2024-06-21
3880	167	5599	117358820	1992-11-02	1995-11-02
3883	320	5507	133894015	2013-06-19	2018-06-19
3885	42	4865	118414799	1995-02-12	1998-02-12
3888	109	6541	200115384	1990-06-20	1993-06-20
3889	170	8221	171476241	2006-06-02	2010-06-02
3890	20	6923	125210377	1995-05-03	2001-05-03
3891	252	8669	127564014	2015-06-21	2020-06-21
3896	257	8100	108412346	2000-03-07	2006-03-07
3897	134	6418	198585823	2005-08-02	2011-08-02
3898	285	9015	129671554	2017-08-10	2021-08-10
3900	57	7559	180268015	1996-06-11	1999-06-11
3902	120	8403	176793798	2004-06-14	2010-06-14
3903	246	6636	114084856	1998-08-09	2004-08-09
3905	223	8714	164204457	1990-05-25	1995-05-25
3910	11	6495	151116849	1994-02-14	2000-02-14
3915	193	8493	136802210	2012-11-10	2016-11-10
3916	28	2531	109982364	2007-05-04	2011-05-04
3917	66	5252	146303182	2006-06-25	2011-06-25
3919	35	7709	153461661	2018-02-23	2023-02-23
3920	252	7717	151376906	2014-04-16	2018-04-16
3922	187	8715	124686064	2006-01-10	2010-01-10
3925	300	7862	137034028	1990-10-14	1996-10-14
3927	109	6650	148470420	2014-02-14	2019-02-14
3930	182	4892	134133329	2011-10-24	2017-10-24
3931	235	7101	155078598	2012-01-21	2018-01-21
3932	73	6581	109681841	1994-10-01	1999-10-01
3933	235	4690	115582552	2006-09-26	2009-09-26
3939	257	5548	193929952	2008-03-11	2012-03-11
3943	162	8925	162492105	2006-04-11	2009-04-11
3945	51	7695	185561986	2013-12-12	2019-12-12
3946	208	6420	199517571	2002-01-27	2008-01-27
3947	18	9133	118855086	1998-06-07	2002-06-07
3950	118	5132	140213007	2006-01-15	2010-01-15
3953	54	6999	141256547	2017-02-14	2020-02-14
3956	137	2239	102470867	2022-01-03	2025-01-03
3957	188	7321	162701067	2017-04-10	2022-04-10
3959	90	7062	132413293	2003-09-25	2008-09-25
3962	103	4970	154589273	1997-03-11	2002-03-11
3964	191	2291	189376943	2022-08-04	2029-08-04
3965	17	8270	139417961	2011-09-07	2017-09-07
3966	182	5130	155732880	2006-05-08	2009-05-08
3969	141	9142	199156903	2004-02-08	2011-02-08
3971	107	2627	162828430	2019-11-04	2025-11-04
3975	134	8618	177884641	2021-11-08	2025-11-08
3976	49	8975	103534201	2014-10-23	2017-10-23
3979	190	2611	153813063	2014-03-04	2018-03-04
3980	78	6100	152663031	1990-07-25	1995-07-25
3981	263	3471	119128804	2016-06-12	2021-06-12
3982	297	2378	191011819	2004-11-08	2007-11-08
3983	90	8210	106443671	2011-02-15	2017-02-15
3984	300	8299	155217852	2012-04-10	2015-04-10
3985	93	6212	145834706	2003-08-07	2008-08-07
3991	54	4893	189601530	2017-12-22	2024-12-22
3994	22	4984	184702139	2017-06-09	2024-06-09
3999	188	8644	129340474	2012-08-13	2016-08-13
4001	117	7410	116237678	2014-08-12	2020-08-12
4004	209	6565	186124817	1996-10-22	2001-10-22
4007	86	5652	134581167	2015-03-03	2019-03-03
4008	138	8479	109811826	2021-10-24	2026-10-24
4009	176	6389	197791342	2014-05-07	2021-05-07
4010	87	5042	132959993	1994-08-12	2000-08-12
4011	148	6066	153664264	2000-01-01	2006-01-01
4017	217	6418	123117742	2022-09-03	2025-09-03
4018	15	8074	122086686	2002-09-27	2009-09-27
4019	137	7684	186428933	2022-02-28	2026-02-28
4020	212	7612	116552913	1995-03-12	1998-03-12
4027	147	8405	120906443	2007-04-16	2012-04-16
4031	133	7008	175867260	1995-08-16	1998-08-16
4035	143	5611	175115606	2013-09-26	2018-09-26
4036	50	7771	163771125	2022-05-22	2028-05-22
4037	103	8726	193520104	2002-08-09	2006-08-09
4038	7	7984	199553005	2000-05-27	2003-05-27
4041	269	7936	128858300	1992-01-27	1997-01-27
4044	209	6548	171065661	2001-12-08	2007-12-08
4046	284	6995	124349980	1999-11-06	2004-11-06
4050	190	7563	128434899	2004-04-02	2010-04-02
4052	261	8546	167284555	2005-12-03	2009-12-03
4055	282	5434	128155681	2008-12-11	2014-12-11
4059	49	8952	170667894	2005-05-19	2010-05-19
4063	313	8640	153438581	2003-03-26	2007-03-26
4072	152	5696	121539040	2000-05-25	2007-05-25
4074	79	9045	144481970	2001-01-18	2006-01-18
4077	124	7115	126256331	1995-02-11	2002-02-11
4078	293	5172	156476379	1997-09-09	2001-09-09
4082	181	6671	142789855	2022-01-15	2028-01-15
4085	315	6057	179671313	1995-11-13	2000-11-13
4086	2	7684	131769372	1990-02-03	1994-02-03
4088	277	4823	182682603	2005-11-17	2012-11-17
4091	112	9030	158411929	2020-01-10	2025-01-10
4092	207	8398	155708114	1997-09-25	2003-09-25
4095	267	6719	144763385	2007-05-27	2014-05-27
4096	220	6928	142271026	2014-08-04	2021-08-04
4098	206	2268	128011375	1991-11-07	1998-11-07
4099	9	2513	140973115	2001-09-24	2006-09-24
4100	18	8650	174516681	2001-03-15	2006-03-15
4103	253	6209	126335986	2016-04-10	2020-04-10
4106	140	7591	134469799	2014-10-16	2018-10-16
4108	240	7812	140035464	2018-07-13	2025-07-13
4114	118	2263	175443164	2000-01-16	2007-01-16
4115	282	7454	165025725	2013-06-09	2018-06-09
4122	84	5001	196792337	2016-02-21	2021-02-21
4123	301	8441	143415299	2001-06-14	2007-06-14
4126	165	8102	149390517	1997-10-19	2001-10-19
4130	201	5513	195269629	2003-05-17	2008-05-17
4131	235	8826	157594502	2002-07-08	2007-07-08
4133	266	7571	138710297	2012-04-15	2015-04-15
4134	130	7363	184078926	1994-12-20	2001-12-20
4135	149	8458	182610284	2006-07-24	2010-07-24
4136	231	7702	144921605	2022-11-07	2026-11-07
4137	314	6915	159974526	2017-03-04	2024-03-04
4139	234	7270	181943172	2000-09-16	2003-09-16
4144	81	6521	190175218	1998-07-01	2003-07-01
4145	21	4870	127883310	1992-03-21	1997-03-21
4149	315	6953	189358376	2021-01-17	2024-01-17
4150	184	6258	158867743	2019-06-19	2025-06-19
4151	296	8827	153210583	2007-02-27	2012-02-27
4157	262	5231	104908767	2006-11-15	2012-11-15
4158	235	6687	103889216	2012-07-11	2015-07-11
4164	171	8108	133349261	2019-10-18	2026-10-18
4165	179	7898	133421005	1993-06-11	1997-06-11
4166	294	6057	110423246	2016-09-13	2022-09-13
4167	68	2194	106926095	1991-05-18	1996-05-18
4168	171	9006	108539491	2021-03-01	2024-03-01
4170	286	5747	119465547	1997-06-15	2002-06-15
4173	168	5737	199086927	2006-01-26	2011-01-26
4175	298	6284	140518056	1993-10-10	2000-10-10
4178	251	5582	125257584	1997-04-02	2001-04-02
4179	305	2504	166730968	2013-05-27	2016-05-27
4181	86	4842	197441786	2003-09-21	2006-09-21
4183	222	8376	177923299	2005-12-11	2009-12-11
4185	30	5432	171840097	1994-11-13	1998-11-13
4186	285	4918	108192505	1999-06-23	2004-06-23
4191	88	7696	192612267	2011-12-13	2017-12-13
4192	144	2442	130448442	2009-08-11	2012-08-11
4193	29	6901	130316065	1996-09-13	2001-09-13
4194	204	4733	142269747	2008-09-04	2012-09-04
4198	65	7366	120095644	1999-12-09	2005-12-09
4201	162	2612	160948447	1999-10-13	2004-10-13
4206	164	2479	155801544	2000-10-22	2005-10-22
4208	110	7092	155762066	2011-11-22	2014-11-22
4216	294	6700	160802313	2017-05-17	2022-05-17
4219	14	6435	163200150	1996-07-28	2001-07-28
4221	110	9105	160172079	2004-11-22	2011-11-22
4222	249	2263	183951690	1996-07-12	1999-07-12
4223	48	2444	156769149	2009-11-17	2013-11-17
4225	82	5780	137147635	2020-01-18	2023-01-18
4229	313	8718	112396485	2015-01-03	2021-01-03
4230	258	2222	137520281	2001-06-19	2006-06-19
4231	235	5861	145897354	1990-07-20	1994-07-20
4232	247	7638	156704569	2000-08-23	2006-08-23
4234	168	6398	112610267	2020-11-18	2024-11-18
4237	107	8923	121225601	2000-05-25	2003-05-25
4243	263	7846	152488997	2021-06-14	2026-06-14
4245	271	2507	153172581	2000-06-10	2004-06-10
4246	307	8193	118711601	2019-10-16	2026-10-16
4247	171	7845	171704167	2009-01-06	2014-01-06
4248	264	8320	135312601	2013-07-01	2019-07-01
4251	319	9138	184001555	2017-05-15	2023-05-15
4253	163	8383	131481893	1997-12-18	2004-12-18
4257	2	4790	178704144	2015-12-14	2020-12-14
4259	107	8713	108975490	2000-10-21	2003-10-21
4262	245	5400	159426089	2000-01-15	2005-01-15
4263	157	6697	177540650	2008-10-10	2012-10-10
4265	297	7559	167112420	2017-04-19	2023-04-19
4268	297	9015	187255615	2018-08-01	2022-08-01
4269	209	9124	155583405	2002-08-07	2006-08-07
4271	256	7135	160609112	2016-10-14	2021-10-14
4274	277	4844	183635203	2006-07-16	2011-07-16
4276	53	7243	127473644	1995-10-03	2000-10-03
4281	49	5420	156195902	1993-08-22	1996-08-22
4282	199	7941	196392244	1994-10-11	1998-10-11
4283	276	5263	143436108	2001-01-11	2004-01-11
4285	195	6615	115515752	2002-06-09	2009-06-09
4286	280	7284	200231758	2014-05-03	2019-05-03
4288	5	7654	158253818	1996-05-05	2001-05-05
4291	115	4963	137099523	2006-05-02	2009-05-02
4299	137	4906	177188325	2004-03-06	2007-03-06
4303	17	7317	175676428	1996-09-05	2001-09-05
4304	209	7834	106201818	1995-01-25	1999-01-25
4305	44	8714	121490758	2001-11-06	2008-11-06
4307	140	6622	165875688	2000-12-26	2007-12-26
4308	263	2452	117794089	2004-01-24	2007-01-24
4312	28	9044	162906248	2014-01-23	2017-01-23
4313	78	5381	132041574	2008-09-28	2015-09-28
4314	51	2190	160251593	1996-09-10	2003-09-10
4319	127	6395	161229963	1992-03-15	1995-03-15
4320	128	6650	107781649	2016-07-10	2021-07-10
4322	53	9122	159105327	1998-03-06	2002-03-06
4323	252	8809	173531755	2018-10-20	2022-10-20
4324	252	6133	145829848	2004-08-24	2009-08-24
4326	210	5404	197932574	2019-04-20	2024-04-20
4327	128	6130	193026869	2010-08-03	2015-08-03
4329	209	9025	120486085	2022-10-24	2026-10-24
4337	123	4678	178253206	2011-06-01	2018-06-01
4341	195	6516	118007564	2012-11-11	2019-11-11
4342	150	5669	154296508	2006-08-12	2010-08-12
4344	201	7932	148028412	2001-04-08	2004-04-08
4345	241	4919	119774414	2008-02-01	2015-02-01
4351	246	2364	105885093	1997-12-26	2002-12-26
4352	295	5864	128745862	2006-07-10	2011-07-10
4353	163	2577	158426183	1999-03-13	2002-03-13
4355	54	8007	194075228	2017-06-22	2022-06-22
4358	184	7119	193571136	2002-07-27	2008-07-27
4360	211	8543	106409722	2013-11-09	2017-11-09
4362	255	5692	164159249	2010-06-09	2016-06-09
4364	10	9113	148886121	1992-09-06	1995-09-06
4365	186	8978	198726935	2013-06-09	2016-06-09
4367	318	5420	179283371	1994-06-14	2000-06-14
4368	245	5612	189933020	2011-11-19	2015-11-19
4370	8	7254	113042742	1992-01-16	1999-01-16
4372	187	6489	104728293	1991-04-24	1997-04-24
4373	134	4689	159626295	2014-08-11	2017-08-11
4376	81	8289	151987978	2007-09-17	2012-09-17
4378	290	4733	112887391	2010-04-10	2014-04-10
4379	5	6636	124253112	2013-02-16	2017-02-16
4381	197	4869	142209687	2015-04-03	2018-04-03
4384	78	6483	132496577	2022-07-17	2027-07-17
4385	249	6411	112685011	2010-06-09	2016-06-09
4386	138	7263	130725518	2003-04-11	2006-04-11
4387	231	6673	175582059	2018-07-24	2025-07-24
4388	93	8516	103341527	1997-02-25	2003-02-25
4391	210	8212	108901600	1997-01-15	2002-01-15
4396	285	6593	105304186	2004-07-19	2011-07-19
4397	266	8994	116020082	2010-04-05	2017-04-05
4398	52	8262	160671639	1991-09-17	1994-09-17
4401	211	8202	120889185	2021-11-11	2025-11-11
4403	143	3747	154357676	2007-05-28	2010-05-28
4405	2	7374	182985227	2000-08-06	2006-08-06
4409	306	8819	102639963	1996-10-23	1999-10-23
4410	320	4909	173902403	2011-05-06	2015-05-06
4411	12	6468	153728454	2020-05-15	2024-05-15
4414	147	2347	185898243	1992-07-26	1996-07-26
4418	167	8831	178537382	2012-03-07	2017-03-07
4420	205	5555	185030766	2009-10-03	2016-10-03
4422	172	8176	199548301	2020-01-11	2027-01-11
4425	235	4863	155567581	2008-03-17	2011-03-17
4428	301	6455	115021926	1992-12-21	1995-12-21
4429	112	8218	159478901	2006-01-23	2013-01-23
4431	135	8434	179761403	2022-06-24	2026-06-24
4434	165	7362	101689479	2002-09-28	2006-09-28
4436	201	8424	192244081	2000-12-15	2004-12-15
4437	28	7592	199738684	2017-08-01	2021-08-01
4438	231	8975	187181389	2004-12-07	2009-12-07
4439	288	6459	131206167	2005-06-18	2011-06-18
4440	1	4904	168842245	2020-06-17	2027-06-17
4442	119	5879	107899236	1995-07-26	2001-07-26
4443	314	7273	169817679	2019-05-13	2026-05-13
4444	276	5645	149024988	1990-08-23	1997-08-23
4445	172	5916	177525064	1990-05-25	1997-05-25
4447	65	7270	192777600	2020-08-28	2025-08-28
4448	285	6698	138968151	2002-06-04	2009-06-04
4452	302	2258	117646929	1994-01-10	1997-01-10
4453	248	4903	187325174	2000-08-16	2007-08-16
4454	175	7980	196989035	2014-05-12	2021-05-12
4455	240	8793	117551648	2003-12-13	2009-12-13
4459	246	2390	143455984	2007-01-25	2012-01-25
4461	298	5514	171510707	1999-03-03	2005-03-03
4462	159	9045	118533487	2009-08-22	2012-08-22
4465	167	5267	157420975	2018-11-21	2021-11-21
4466	166	8475	173157401	2012-04-20	2016-04-20
4468	69	6551	182765886	2001-08-11	2007-08-11
4471	80	4997	161009829	2008-01-19	2012-01-19
4474	203	4740	119175994	2021-02-01	2027-02-01
4481	160	4795	165747023	2022-01-21	2026-01-21
4482	45	7125	180717457	2016-11-02	2020-11-02
4487	81	6597	141768498	1994-06-03	2001-06-03
4488	217	8100	160547504	2015-06-27	2019-06-27
4489	169	6575	194611209	1996-04-25	2001-04-25
4490	130	5122	145087269	2003-12-15	2009-12-15
4491	231	6068	158165291	2012-01-07	2016-01-07
4492	170	9118	188229421	2015-04-13	2022-04-13
4493	268	8279	183726673	2021-08-28	2028-08-28
4494	290	2648	116109705	2010-09-16	2016-09-16
4499	239	8244	157531442	2009-11-23	2016-11-23
4500	289	6661	119888977	2021-01-08	2027-01-08
4502	90	6674	150936107	1994-11-04	1998-11-04
4506	197	5009	143220352	1991-07-13	1996-07-13
4512	158	8603	186815957	2004-01-09	2011-01-09
4514	303	2553	164216826	2017-11-17	2024-11-17
4525	205	4704	168119947	2022-06-04	2029-06-04
4526	237	4820	167168824	1992-03-24	1999-03-24
4527	9	4770	165824065	2001-07-12	2005-07-12
4528	110	5404	167620344	2017-01-18	2024-01-18
4529	12	6214	144439854	2018-07-15	2025-07-15
4533	296	4965	182274644	1997-12-23	2001-12-23
4534	136	7703	102504124	2011-12-16	2018-12-16
4535	281	2612	106031811	1990-05-26	1993-05-26
4536	116	5908	169239385	2013-05-19	2017-05-19
4537	294	7638	122165014	2010-02-25	2014-02-25
4538	251	7852	157051532	1996-06-09	2000-06-09
4541	121	8120	174195499	1990-08-09	1995-08-09
4542	15	7178	132896990	2022-08-18	2029-08-18
4550	219	5263	149127644	1991-04-13	1995-04-13
4553	40	8249	148124592	2012-11-03	2016-11-03
4555	243	5766	102592799	1992-02-21	1999-02-21
4556	260	2592	117375353	2022-07-27	2029-07-27
4560	194	5402	111992203	1995-08-26	1998-08-26
4561	236	5015	191413697	2000-02-02	2007-02-02
4563	284	5800	142718860	2001-10-23	2008-10-23
4564	119	7534	185927652	2018-07-23	2023-07-23
4565	251	7892	183205294	2017-05-13	2024-05-13
4567	287	8110	176161410	1999-01-20	2002-01-20
4568	159	8466	170776560	2006-06-26	2009-06-26
4569	51	5249	155658294	2018-11-23	2023-11-23
4570	310	8551	136792412	2008-03-25	2013-03-25
4571	144	8484	129840220	2008-05-03	2013-05-03
4572	128	9089	158545760	2006-08-28	2011-08-28
4573	270	7037	182153597	1998-06-26	2005-06-26
4574	73	6435	176949077	2010-11-12	2015-11-12
4575	70	7026	148255942	2020-06-18	2027-06-18
4581	204	6312	114500969	2005-08-28	2010-08-28
4587	268	6441	146590207	2015-08-13	2022-08-13
4589	50	4862	103481084	2004-06-08	2009-06-08
4590	146	6518	117665711	1997-05-11	2000-05-11
4591	116	5747	104939544	2001-10-05	2004-10-05
4594	240	4941	147374547	1991-11-05	1997-11-05
4600	57	7615	174600451	2017-04-03	2022-04-03
4602	207	8437	118484997	2007-08-23	2010-08-23
4604	135	7844	118744503	2020-11-09	2027-11-09
4606	50	2456	189045956	2001-04-23	2008-04-23
4608	134	5543	160422035	2019-08-25	2025-08-25
4610	164	8863	117240510	2000-10-27	2006-10-27
4612	35	8519	158006231	2014-10-28	2018-10-28
4613	40	9057	165801107	2012-08-11	2019-08-11
4617	146	8663	176999753	2022-08-15	2028-08-15
4618	252	7511	150631798	2013-05-11	2019-05-11
4621	195	4660	137140964	2003-12-10	2008-12-10
4623	155	8048	156538677	2017-05-10	2024-05-10
4625	185	7234	141953442	2021-10-04	2027-10-04
4626	30	8147	164627559	2015-03-12	2020-03-12
4628	81	2582	144661301	2022-08-10	2028-08-10
4629	180	8704	169861846	1992-11-09	1999-11-09
4631	113	2404	183997790	2014-04-11	2019-04-11
4633	163	7336	175965177	2006-08-04	2011-08-04
4634	29	7685	136706726	1997-10-27	2002-10-27
4637	281	8034	162565525	2009-01-21	2014-01-21
4640	113	2518	192508156	2006-08-24	2013-08-24
4646	226	5824	184709288	2009-02-22	2016-02-22
4648	293	6899	132564527	2001-02-07	2004-02-07
4650	230	6714	199423094	2021-12-11	2026-12-11
4651	240	6544	175317089	2004-09-01	2008-09-01
4652	227	8308	168160839	2014-02-11	2018-02-11
4654	133	5207	174019505	2012-12-25	2018-12-25
4658	6	8181	178670073	2003-03-19	2009-03-19
4662	280	4718	137037253	2004-07-25	2007-07-25
4663	113	7800	191471182	2011-03-14	2016-03-14
4664	90	4691	123127344	2016-06-10	2023-06-10
4666	108	7081	140480982	2008-11-12	2013-11-12
4667	108	4797	138676959	2003-01-05	2006-01-05
4671	39	7047	131511729	1998-11-07	2005-11-07
4672	182	7712	161403032	2016-04-18	2023-04-18
4674	177	6225	151470485	2003-07-15	2008-07-15
4677	260	7659	106531574	1999-11-02	2003-11-02
4678	85	6051	190195584	2021-03-27	2025-03-27
4680	298	2553	151332663	1990-04-20	1994-04-20
4681	107	7335	154887136	1991-10-23	1994-10-23
4688	260	6251	166033279	1995-10-14	2002-10-14
4689	209	2630	103883731	2002-06-21	2007-06-21
4691	221	2480	118332202	2008-10-18	2013-10-18
4693	93	7389	133220675	2008-02-27	2011-02-27
4696	93	8064	173054412	2012-07-03	2019-07-03
4697	18	8218	119748971	1997-08-21	2003-08-21
4698	41	7165	167468071	2006-06-15	2013-06-15
4701	189	7081	140632879	2019-03-10	2023-03-10
4702	146	7466	108221487	2008-09-10	2015-09-10
4704	77	2264	131262898	2020-07-04	2024-07-04
4705	103	4736	139840242	1995-12-17	2001-12-17
4707	161	8806	199020421	2007-08-01	2011-08-01
4708	189	9052	186607408	2004-12-15	2007-12-15
4709	314	6391	104610157	2004-03-10	2010-03-10
4711	310	8246	146568661	2011-09-27	2018-09-27
4715	93	5807	133214432	1996-04-14	2001-04-14
4716	121	7779	104291807	2007-07-19	2012-07-19
4718	193	6347	163464478	2021-05-11	2025-05-11
4720	244	8781	165343730	2022-06-26	2029-06-26
4722	41	7717	184581254	2002-07-27	2005-07-27
4724	231	7862	191781721	2015-06-14	2019-06-14
4725	159	9061	114861752	1994-11-17	2001-11-17
4736	28	5641	200714008	2009-07-19	2012-07-19
4738	29	7623	146781842	2017-08-04	2024-08-04
4740	199	8592	178936148	2002-10-09	2006-10-09
4742	197	7518	192766700	2003-11-07	2006-11-07
4743	200	8723	121518352	2018-07-11	2023-07-11
4744	272	8305	123177408	1993-01-16	2000-01-16
4745	243	8081	140900511	2004-08-24	2009-08-24
4746	15	6015	153032690	1995-03-09	1999-03-09
4748	164	2195	156194894	1994-09-21	1999-09-21
4753	28	2494	116509762	2002-06-12	2005-06-12
4756	198	2355	176908391	1996-05-12	2001-05-12
4757	61	7193	170358185	1992-12-18	1998-12-18
4758	144	7109	161685219	2016-10-11	2020-10-11
4759	228	6081	124865723	1992-07-02	1995-07-02
4760	246	7472	120957846	2022-02-18	2027-02-18
4761	65	4869	182718094	1993-01-04	1997-01-04
4763	227	7907	116343534	1990-05-16	1993-05-16
4764	171	5814	142303327	1995-10-12	2000-10-12
4765	255	6971	174603143	2000-10-01	2007-10-01
4766	129	4674	141017977	2020-05-10	2025-05-10
4769	282	5083	161639148	2014-11-09	2020-11-09
4771	39	6921	163280542	2014-06-11	2019-06-11
4777	79	8451	127632804	1996-11-21	2002-11-21
4778	77	2458	127218783	2013-08-11	2016-08-11
4780	137	6601	196242103	1999-09-01	2005-09-01
4784	111	8586	193567819	2010-11-23	2015-11-23
4785	143	4920	179174673	2006-10-01	2011-10-01
4786	282	7069	187281626	2006-09-16	2012-09-16
4788	297	8385	156305859	2012-11-04	2018-11-04
4789	88	8410	121480419	1993-05-22	1999-05-22
4790	269	4700	121987347	2019-06-19	2024-06-19
4792	151	2206	188876797	2016-01-11	2019-01-11
4794	269	5650	121603838	2015-12-26	2020-12-26
4797	1	2427	136992177	2019-01-28	2022-01-28
4798	162	8468	150708585	2012-08-24	2015-08-24
4799	110	2335	153742544	1992-06-08	1996-06-08
4801	213	7429	155535175	1990-02-27	1995-02-27
4803	111	2576	141727569	2010-02-25	2013-02-25
4805	180	8597	132871965	2002-05-09	2007-05-09
4806	290	8031	113054473	2012-08-08	2018-08-08
4807	247	8140	112641587	2012-09-14	2017-09-14
4812	176	6658	142313921	2008-12-19	2011-12-19
4814	27	7369	131656702	1999-06-08	2003-06-08
4815	46	5399	108269269	2022-10-09	2027-10-09
4818	204	2604	117482819	1993-11-04	1997-11-04
4820	137	4727	141705280	2007-03-27	2010-03-27
4821	247	7708	111080355	2013-09-06	2016-09-06
4822	208	8611	140392591	2018-05-21	2024-05-21
4825	40	7792	131608923	1999-02-27	2002-02-27
4829	51	6120	153362167	2019-06-19	2024-06-19
4831	228	7688	153783956	2000-04-12	2005-04-12
4834	57	7505	120209355	1998-07-08	2003-07-08
4841	189	8740	162276277	2007-06-24	2013-06-24
4843	143	6299	144012663	2008-02-26	2014-02-26
4845	128	8550	184617182	2021-05-08	2028-05-08
4847	7	5120	171849986	2016-02-17	2020-02-17
4849	42	6353	115928895	2005-03-20	2010-03-20
4850	6	4683	188424269	2020-08-19	2025-08-19
4851	181	2297	170285987	2002-12-21	2007-12-21
4857	12	7910	147418315	2004-05-17	2007-05-17
4858	167	8355	165937579	2013-08-16	2019-08-16
4859	303	6966	159843161	1995-08-18	2001-08-18
4861	195	6423	166697432	2011-10-10	2014-10-10
4870	13	8674	193785343	2017-06-22	2021-06-22
4872	270	6075	164586751	2005-12-19	2008-12-19
4873	110	5509	148684932	1996-11-13	2001-11-13
4875	231	2648	121837781	1992-05-08	1997-05-08
4878	140	2275	188708455	1995-02-24	1999-02-24
4879	246	5357	187931401	1991-11-18	1994-11-18
4880	72	4720	187606145	2021-06-07	2027-06-07
4881	20	7878	169351003	2007-03-05	2014-03-05
4882	257	6551	167453425	2012-11-08	2018-11-08
4890	225	6452	116428515	1994-10-15	1997-10-15
4891	51	6571	180251585	1995-04-14	2002-04-14
4894	236	6168	119282403	2012-01-18	2015-01-18
4898	18	2493	157628456	2009-01-11	2012-01-11
4900	18	8775	130088926	2005-06-16	2011-06-16
4901	266	9016	117122462	2016-11-21	2023-11-21
4904	184	7844	193530910	2004-01-27	2009-01-27
4907	193	2252	142139814	2018-06-25	2025-06-25
4908	171	7109	118458172	1994-10-17	1999-10-17
4910	194	2492	161597152	2020-01-21	2023-01-21
4911	261	6519	126374601	1991-12-20	1995-12-20
4912	295	6551	154148502	2005-02-21	2010-02-21
4915	152	5138	137511977	1991-02-17	1997-02-17
4917	76	6029	199199928	1996-10-02	2001-10-02
4918	278	9135	183785067	2016-10-21	2022-10-21
4928	53	7297	117637559	1992-01-08	1996-01-08
4930	231	8766	117241652	2001-05-02	2005-05-02
4931	121	5376	183115211	1990-07-10	1995-07-10
4933	173	6282	141071986	2006-12-11	2009-12-11
4938	11	4664	114896594	1997-01-18	2000-01-18
4943	196	6652	149322856	2006-11-17	2011-11-17
4944	239	6562	181977055	1997-04-22	2002-04-22
4949	239	2330	135779761	1994-01-16	1999-01-16
4957	290	2511	190441134	2011-09-12	2018-09-12
4959	226	5564	118712113	1992-08-07	1999-08-07
4960	308	8078	186068076	2008-08-27	2014-08-27
4962	252	8796	151302136	2001-01-19	2008-01-19
4966	281	5526	197237474	1993-08-20	1998-08-20
4969	283	8055	118967608	2003-08-13	2010-08-13
4970	1	5508	151387336	1993-05-12	1996-05-12
4972	283	7159	116343745	2021-10-02	2027-10-02
4973	137	4695	132183087	2007-07-27	2011-07-27
4975	294	7164	142144441	2005-01-22	2010-01-22
4976	70	4894	157658698	2010-02-05	2017-02-05
4978	56	7282	117106822	2002-02-25	2005-02-25
4979	279	6670	130598773	1991-06-21	1995-06-21
4980	57	8327	148290382	2010-09-08	2016-09-08
4982	208	5694	127508950	2000-03-09	2007-03-09
4984	184	8120	139150343	2004-08-04	2010-08-04
4991	108	5033	102204556	2011-03-27	2017-03-27
4994	184	8775	156134289	2020-09-08	2027-09-08
4995	256	2376	111091572	1993-08-24	1998-08-24
4997	158	7080	190131890	2001-01-11	2007-01-11
4998	73	6985	167407887	1997-05-01	2002-05-01
5000	277	7089	169189654	2008-08-17	2011-08-17
5001	113	2213	153584466	1993-09-21	2000-09-21
5003	61	4830	187513727	2007-01-04	2010-01-04
5005	179	6274	133776682	2019-07-15	2026-07-15
5006	51	5737	174883468	2009-09-18	2016-09-18
5007	129	7120	190650104	2002-05-24	2006-05-24
5010	236	7666	198166791	2004-08-07	2010-08-07
5015	133	7987	184373609	2006-06-24	2010-06-24
5016	85	7992	193299737	2006-04-22	2009-04-22
5018	221	2621	172327557	2015-03-07	2021-03-07
5019	263	8067	162272668	2012-02-14	2019-02-14
5020	152	5366	186916607	2012-02-02	2017-02-02
5021	307	6435	122783131	2008-06-23	2015-06-23
5022	240	8739	105890619	2001-04-04	2005-04-04
5023	189	9042	109935169	2017-05-07	2020-05-07
5025	80	4765	123997227	2004-04-19	2008-04-19
5039	1	7593	183847976	2003-09-08	2007-09-08
5044	85	8934	187604223	1990-04-20	1994-04-20
5045	2	2440	101383171	1997-11-09	2001-11-09
5046	69	4989	166419416	2018-11-27	2022-11-27
5050	203	6997	141537616	2003-08-27	2010-08-27
5051	103	8209	159037826	1994-04-07	1997-04-07
5052	162	2377	170600969	2014-07-25	2020-07-25
5053	152	8322	120189513	2001-05-15	2008-05-15
5054	243	2407	137647524	2000-05-05	2006-05-05
5056	42	5555	146015277	1994-04-21	1997-04-21
5057	152	4838	189973274	2004-10-19	2010-10-19
5059	223	6110	143754427	1992-05-12	1996-05-12
5061	263	5997	154281815	1994-03-22	2001-03-22
5062	222	6344	183073836	1992-07-11	1999-07-11
5064	217	6889	185870134	2002-01-06	2005-01-06
5066	223	8057	115535783	1990-05-27	1996-05-27
5069	131	7299	132007773	1995-11-01	2002-11-01
5073	268	7228	182674256	1995-06-28	1998-06-28
5075	160	8524	125457752	1999-03-22	2005-03-22
5077	274	2323	168477000	2010-11-17	2016-11-17
5080	103	2546	107314640	2016-02-22	2021-02-22
5083	207	4918	171972467	2011-09-26	2016-09-26
5085	54	8430	153780032	2006-11-04	2010-11-04
5086	250	2506	135533490	2003-01-13	2008-01-13
5087	281	6707	101058181	1991-12-06	1995-12-06
5091	253	4795	148694419	2018-08-01	2021-08-01
5093	66	9057	140861919	2016-01-23	2022-01-23
5095	17	8698	194437030	1998-03-11	2003-03-11
5096	126	5856	144388758	2022-01-27	2025-01-27
5098	103	2546	121212612	2002-06-11	2005-06-11
5099	112	8303	118494642	1998-05-03	2002-05-03
5100	258	5453	190754962	1994-12-15	2001-12-15
5104	280	5794	178378348	2005-05-03	2011-05-03
5108	145	8087	148486696	2002-10-17	2006-10-17
5109	304	2454	129383831	2022-11-14	2025-11-14
5110	144	5904	117893621	1996-01-19	2002-01-19
5113	276	2576	139028980	2005-04-19	2009-04-19
5117	180	7684	117575353	2010-12-07	2016-12-07
5119	146	8997	178619315	2014-07-03	2021-07-03
5120	135	9039	159552024	2006-04-12	2012-04-12
5121	207	2410	143010075	1995-05-18	2000-05-18
5123	129	6391	130482487	2011-11-18	2015-11-18
5125	131	4662	132815062	2008-12-10	2014-12-10
5129	150	2546	115574514	1999-11-10	2002-11-10
5130	193	7212	176282079	2005-09-02	2008-09-02
5131	262	7184	127459777	2009-10-16	2016-10-16
5132	44	8716	161458485	2012-09-05	2018-09-05
5137	279	8768	194411789	2015-08-25	2019-08-25
5138	120	7519	155629905	2014-04-22	2021-04-22
5144	121	6258	140058958	1990-02-12	1995-02-12
5145	53	8996	137290831	2003-04-07	2008-04-07
5146	184	7017	134464010	1994-07-24	1999-07-24
5148	306	7766	161600549	2000-08-10	2005-08-10
5157	68	2451	130526516	2015-09-08	2020-09-08
5158	44	6669	185131676	2014-04-05	2019-04-05
5159	1	8067	146983895	1996-10-19	2003-10-19
5161	154	2500	145893282	1994-06-24	1997-06-24
5162	144	6521	153998546	1990-11-03	1997-11-03
5163	248	2250	153723358	2015-02-24	2022-02-24
5170	188	8598	198302714	1991-07-14	1996-07-14
5171	3	5984	157031876	2011-10-13	2016-10-13
5172	282	4727	157013487	2005-04-27	2009-04-27
5173	253	7420	200927551	2020-05-25	2023-05-25
5176	153	7686	156783480	2006-07-18	2009-07-18
5179	30	8418	182022179	1992-09-01	1999-09-01
5180	307	8659	102539956	2007-12-13	2012-12-13
5183	176	8644	151410336	1994-04-21	1997-04-21
5189	2	8708	127603574	2019-05-28	2022-05-28
5191	40	5642	167746124	1997-04-20	2000-04-20
5196	273	5995	193354761	2012-01-27	2015-01-27
5201	30	7243	181716295	2021-11-28	2025-11-28
5203	45	5568	127214880	2012-03-25	2019-03-25
5206	275	5694	142055310	2017-06-25	2022-06-25
5207	235	6222	182572390	2011-11-03	2015-11-03
5208	65	2495	134784326	1992-12-19	1995-12-19
5212	40	5731	163514252	2004-04-17	2010-04-17
5213	246	7181	126913424	1992-07-12	1996-07-12
5215	112	7871	149069215	2013-08-21	2020-08-21
5217	196	7457	178985758	2006-11-22	2012-11-22
5219	287	6009	102479450	2018-11-21	2025-11-21
5221	258	4854	176680427	2011-07-09	2018-07-09
5227	141	5750	184383489	1993-12-25	1999-12-25
5236	226	8143	124213845	1999-08-23	2002-08-23
5237	120	6059	152886409	1998-03-26	2002-03-26
5239	257	4773	189826336	2015-02-14	2020-02-14
5243	237	6549	150708009	2001-03-20	2006-03-20
5244	273	6926	183787035	2016-06-18	2021-06-18
5245	320	2574	190782016	2013-04-21	2018-04-21
5248	171	5984	147498815	2002-10-03	2009-10-03
5249	132	7166	190518446	1993-06-10	1998-06-10
5250	175	6923	132196684	2022-05-12	2025-05-12
5254	73	4697	177316478	2004-12-05	2008-12-05
5255	152	5396	119020154	2019-10-09	2023-10-09
5263	218	6889	135273757	2020-03-21	2024-03-21
5265	132	7812	155785309	1998-10-15	2005-10-15
5266	13	5162	199393678	2015-01-22	2018-01-22
5267	297	7186	197160329	2007-06-04	2014-06-04
5268	38	7913	144025379	1996-07-03	2001-07-03
5270	275	7065	176479268	2019-05-16	2025-05-16
5275	179	6258	176823976	2009-03-23	2012-03-23
5277	177	8748	123493697	2005-12-23	2011-12-23
5278	149	2205	174122818	1996-09-26	2003-09-26
5279	66	8212	177190019	2017-07-24	2023-07-24
5283	169	8073	175930409	2002-09-27	2009-09-27
5285	300	5307	117858583	2007-10-22	2013-10-22
5288	110	6060	145146991	2015-03-26	2018-03-26
5290	109	2223	183242325	2012-02-09	2019-02-09
5291	204	8112	176968854	1996-06-23	1999-06-23
5293	192	8347	101745727	1994-03-10	1997-03-10
5294	38	7361	119878591	2021-01-14	2024-01-14
5299	277	8127	197946162	2016-04-25	2022-04-25
5301	129	2529	120879099	2010-06-12	2016-06-12
5305	192	6617	158921597	1993-06-17	1999-06-17
5306	136	4909	117148713	1995-06-08	1998-06-08
5307	176	4875	163433146	1990-01-24	1995-01-24
5309	244	6433	150298105	1995-11-04	1999-11-04
5313	2	8956	143753992	2018-03-17	2022-03-17
5319	19	8548	153366923	1997-12-27	2002-12-27
5320	299	8642	134590019	2015-07-18	2022-07-18
5321	188	5446	149766678	2009-08-02	2013-08-02
5323	190	8471	196162599	2021-05-28	2025-05-28
5326	275	7509	123848975	2002-05-11	2009-05-11
5329	110	5372	184634715	1998-04-24	2005-04-24
5330	239	5998	197963971	2005-05-06	2008-05-06
5331	128	9129	153956631	1990-10-24	1995-10-24
5334	156	2618	125712626	2002-02-02	2006-02-02
5335	85	2414	194142213	2000-02-10	2007-02-10
5336	154	6664	118991680	2007-02-19	2011-02-19
5337	144	4705	116188534	2009-09-15	2012-09-15
5338	201	7070	106525747	2000-05-13	2006-05-13
5340	199	9006	155774844	2018-06-14	2021-06-14
5341	214	9046	190450868	1990-10-05	1996-10-05
5343	167	7387	163151029	2021-07-01	2025-07-01
5344	279	6694	130193282	1997-04-08	2003-04-08
5346	169	2255	131381261	2006-09-26	2011-09-26
5347	237	7139	169177803	2006-02-06	2011-02-06
5350	240	7980	114888728	2020-10-09	2027-10-09
5351	73	6697	159126947	1991-04-22	1998-04-22
5356	28	8037	142956629	2014-09-09	2017-09-09
5357	78	7881	114731087	2017-07-28	2024-07-28
5359	293	7554	107013200	2004-11-06	2011-11-06
5360	56	5046	183893159	1994-08-26	1999-08-26
5362	250	2625	102618997	2020-07-19	2027-07-19
5363	269	8234	174331592	1990-09-16	1997-09-16
5365	122	9132	110233406	2017-06-07	2023-06-07
5368	247	7451	197426207	2002-09-04	2009-09-04
5369	138	8573	117138236	1990-06-20	1995-06-20
5370	178	7832	120282249	2017-07-14	2022-07-14
5371	110	6906	152636727	2007-04-22	2010-04-22
5372	42	2560	169933182	2016-11-12	2020-11-12
5373	17	7747	140975457	2018-07-07	2024-07-07
5376	87	8654	157671466	2011-08-26	2014-08-26
5377	72	2497	183582585	2005-08-21	2010-08-21
5381	184	5453	176444076	1992-09-09	1998-09-09
5382	48	9114	193684308	2006-01-09	2009-01-09
5385	147	2325	150110789	2001-04-08	2004-04-08
5387	131	5097	166864112	1998-02-13	2001-02-13
5388	225	8740	132366483	2007-04-14	2011-04-14
5389	219	5793	138504545	2021-05-18	2026-05-18
5390	304	8298	115598905	2007-10-14	2012-10-14
5391	274	7198	159707700	1997-12-09	2001-12-09
5393	231	6918	198164432	1996-03-23	2001-03-23
5396	174	4854	149110131	1995-05-28	2000-05-28
5398	172	8197	167911942	2002-09-11	2009-09-11
5399	53	6724	123673720	2013-07-10	2020-07-10
5403	304	5397	197210045	2003-04-17	2007-04-17
5405	72	8781	190570128	2017-10-25	2024-10-25
5408	138	7337	114654129	2004-04-01	2010-04-01
5409	45	7003	157384226	2006-05-01	2012-05-01
5412	263	2273	115138529	2000-06-19	2006-06-19
5413	173	8210	144057778	2014-11-14	2021-11-14
5415	48	6448	157609134	2013-12-22	2018-12-22
5416	195	8669	186238653	2005-09-20	2012-09-20
5417	47	4872	122731138	2013-02-09	2020-02-09
5418	45	5556	145912456	1991-10-20	1994-10-20
5419	50	6639	149844443	2001-07-06	2005-07-06
5420	257	5357	169606777	1992-02-26	1996-02-26
5421	1	7916	169682098	1991-08-19	1998-08-19
5429	260	6063	114624166	1997-02-12	2000-02-12
5431	305	6954	118511041	2009-05-06	2013-05-06
5432	146	7153	139692229	1995-03-19	1999-03-19
5433	222	6425	169437085	2014-11-27	2017-11-27
5435	234	6384	114705734	2014-08-18	2021-08-18
5439	174	8630	142311855	1996-01-02	2000-01-02
5441	9	5381	182578209	2006-09-15	2011-09-15
5443	164	4797	195397414	1991-08-04	1996-08-04
5444	227	8302	116428945	2021-06-21	2025-06-21
5445	135	6498	178930670	1991-03-24	1995-03-24
5446	134	8914	192009253	2021-06-09	2028-06-09
5447	57	7317	125095788	2008-09-26	2012-09-26
5448	214	6434	128945679	2014-12-15	2021-12-15
5449	93	2637	163019511	1995-09-20	1999-09-20
5451	117	7171	115668399	2021-08-16	2026-08-16
5452	67	6161	188488300	2022-07-20	2027-07-20
5453	46	2334	117929171	1994-12-17	2001-12-17
5455	302	7164	115198085	2016-08-14	2019-08-14
5456	130	6198	184955208	2019-06-26	2024-06-26
5457	69	5891	141072312	2015-07-11	2022-07-11
5459	310	2200	169475093	2009-07-22	2012-07-22
5469	269	7640	180102559	2011-01-07	2016-01-07
5471	1	7597	171279940	1994-01-27	2001-01-27
5472	186	7385	197149863	2001-10-19	2006-10-19
5473	120	6171	138715243	2005-11-26	2012-11-26
5474	233	8120	190030489	1992-02-23	1995-02-23
5475	164	2339	135349059	1993-09-11	1998-09-11
5476	319	5844	122105660	2005-10-08	2010-10-08
5477	242	3157	165717168	2002-03-27	2007-03-27
5483	153	7056	138759904	1997-05-22	2002-05-22
5484	109	6182	109752061	2004-02-27	2007-02-27
5485	44	2429	138526976	2007-08-04	2012-08-04
5486	76	7116	105958779	2004-09-04	2007-09-04
5487	175	9009	142643357	1997-08-16	2002-08-16
5492	21	8112	111875982	2002-12-06	2008-12-06
5493	146	6307	188892541	1993-08-02	2000-08-02
5494	112	2361	117847883	1994-07-07	2000-07-07
5499	129	4066	188124446	2010-04-01	2013-04-01
5500	220	5040	137157476	2001-10-27	2004-10-27
5501	286	8642	200434646	1998-08-26	2002-08-26
5504	175	8109	123590221	2021-11-15	2024-11-15
5505	299	6545	198965863	2006-12-24	2009-12-24
5506	65	6171	115361813	1994-03-12	2000-03-12
5507	289	7985	162007579	2009-08-20	2014-08-20
5510	231	2346	130324943	1996-11-03	2003-11-03
5511	308	2438	103439252	2020-04-07	2026-04-07
5513	14	2202	172740417	1991-07-10	1997-07-10
5515	271	5097	111862031	2011-09-07	2014-09-07
5516	185	8525	147667027	2013-03-06	2020-03-06
5520	309	8390	155869084	2018-10-14	2022-10-14
5521	50	6906	143315285	2007-11-18	2011-11-18
5522	234	5800	161741072	2004-08-09	2011-08-09
5523	90	2611	124568754	2014-07-10	2017-07-10
5524	41	6182	162435584	2017-04-26	2023-04-26
5526	224	7505	171123065	2015-03-24	2022-03-24
5527	249	6701	104722341	2021-03-27	2027-03-27
5528	45	5128	155259827	2019-03-17	2026-03-17
5529	265	8595	128437519	2006-04-03	2011-04-03
5530	119	7154	117489927	2016-02-25	2022-02-25
5533	15	7202	115982701	2004-01-17	2008-01-17
5534	38	2513	139563423	2001-11-02	2005-11-02
5536	140	4838	148306398	2007-04-07	2014-04-07
5539	229	6981	160103349	1999-11-21	2005-11-21
5540	138	6517	134246516	2007-01-05	2010-01-05
5542	305	6657	109826755	2018-07-13	2023-07-13
5545	57	2493	106514986	2014-02-02	2017-02-02
5546	216	4824	102490247	2018-05-27	2021-05-27
5548	319	5501	164309813	2006-03-24	2012-03-24
5550	304	6551	150636355	1994-07-18	1998-07-18
5551	117	7720	133153659	1998-06-17	2001-06-17
5555	306	6450	174421538	2019-05-11	2023-05-11
5558	40	8882	142467482	2022-10-03	2027-10-03
5561	257	7149	152202332	2022-08-26	2029-08-26
5570	206	9007	124243829	2017-03-09	2024-03-09
5571	156	8977	178721898	2003-08-14	2006-08-14
5572	16	7298	106205409	1994-09-03	2000-09-03
5573	46	4910	191593389	2022-01-18	2028-01-18
5575	5	7987	194708866	2002-10-20	2005-10-20
5576	22	4836	119512303	2021-10-20	2026-10-20
5578	135	2619	155703435	2017-08-13	2021-08-13
5580	303	7436	187541445	2011-11-22	2016-11-22
5582	176	5474	161626269	2017-03-10	2023-03-10
5583	217	5584	134438911	2008-07-09	2011-07-09
5585	192	7443	124409729	2022-12-16	2026-12-16
5590	226	7633	200083230	2006-05-03	2010-05-03
5591	81	5736	130081576	1993-04-01	1998-04-01
5593	52	5967	185049310	1990-09-12	1993-09-12
5598	197	8022	177362911	2008-04-08	2011-04-08
5600	11	2336	188140735	1994-04-19	1999-04-19
5601	129	7317	114702030	1995-02-16	2002-02-16
5603	15	6639	185190883	2011-03-05	2016-03-05
5604	22	4790	185519081	1992-12-05	1996-12-05
5607	230	2218	124267516	1990-06-11	1995-06-11
5608	194	8706	108246100	2001-06-11	2008-06-11
5609	125	7147	172384155	2008-05-28	2014-05-28
5610	160	6267	175562297	2022-08-13	2029-08-13
5611	81	5181	179124564	1991-12-03	1998-12-03
5613	50	2341	162706168	2004-05-24	2007-05-24
5616	103	7202	133509813	2003-05-28	2009-05-28
5619	311	5432	177970168	2001-04-13	2008-04-13
5620	225	5625	153908404	2019-01-10	2026-01-10
5626	61	8308	197394624	2008-06-26	2012-06-26
5627	113	2547	105664816	1996-02-05	2002-02-05
5631	234	6355	196763280	1996-07-18	2003-07-18
5633	195	2623	188337303	1998-05-12	2005-05-12
5635	260	8056	116788165	1997-01-28	2000-01-28
5637	110	9090	109066553	2011-06-22	2018-06-22
5640	224	8852	130821957	1996-12-24	2000-12-24
5641	142	7078	187379324	1997-08-03	2000-08-03
5644	146	7040	129291262	2018-04-26	2024-04-26
5646	186	7267	119132538	2018-10-12	2022-10-12
5648	209	8621	138313683	2017-06-22	2024-06-22
5651	287	6013	130723921	1991-05-11	1998-05-11
5657	303	4674	159277791	2002-02-13	2005-02-13
5658	168	7486	188050067	2007-08-07	2012-08-07
5659	234	4801	169729147	1997-02-09	2004-02-09
5661	88	5219	189528197	2007-11-01	2010-11-01
5663	69	7503	159078885	2007-01-12	2013-01-12
5664	50	8926	180026662	2002-08-01	2005-08-01
5665	228	2322	112918182	2018-04-28	2021-04-28
5666	210	6059	115180732	1991-12-04	1998-12-04
5667	231	3335	185926446	2019-12-16	2026-12-16
5668	211	8188	156186269	2007-06-16	2011-06-16
5671	18	2281	188580378	2020-05-12	2025-05-12
5672	179	7097	123892187	1995-04-05	2002-04-05
5673	50	6484	106724804	2006-04-21	2009-04-21
5676	117	6995	195176043	2017-08-11	2021-08-11
5678	271	7628	120424617	2008-07-24	2013-07-24
5686	238	5616	167681268	1990-03-23	1996-03-23
5691	169	5143	184882162	2008-09-12	2014-09-12
5692	207	8825	149160942	2018-06-09	2022-06-09
5693	235	6899	189102825	2002-08-14	2007-08-14
5694	239	6039	149461512	1997-04-27	2000-04-27
5695	244	7981	192589882	2006-08-17	2012-08-17
5697	76	7073	154511900	2012-05-10	2016-05-10
5698	132	7363	156192200	2004-02-04	2010-02-04
5699	44	7311	135974919	1995-06-22	2002-06-22
5700	211	6616	195903529	1994-10-21	2000-10-21
5702	285	8550	151672964	1996-11-14	2003-11-14
5704	314	2245	141240020	2019-03-27	2022-03-27
5705	161	5039	148989022	2002-02-24	2006-02-24
5706	254	5129	161950975	2022-12-02	2029-12-02
5707	247	8393	150170193	2022-06-06	2026-06-06
5708	189	4865	129905598	2006-02-05	2013-02-05
5711	265	8124	173110537	2013-01-16	2020-01-16
5712	160	7216	118562719	2009-06-02	2014-06-02
5713	149	7100	163182769	2021-12-19	2024-12-19
5714	190	6271	188553480	2011-06-18	2017-06-18
5718	273	6246	128914062	2012-03-10	2018-03-10
5720	227	2561	112141933	2019-01-16	2022-01-16
5721	126	6437	118618518	2017-10-28	2024-10-28
5722	257	4909	157528708	1995-10-06	2000-10-06
5723	260	5438	104764987	2003-10-12	2006-10-12
5724	252	2541	110205441	2011-05-18	2014-05-18
5730	215	6616	150729673	2021-01-26	2024-01-26
5733	225	6498	131022187	1992-03-19	1998-03-19
5737	126	6153	166142971	2001-12-03	2008-12-03
5741	200	8165	139599547	1996-06-18	1999-06-18
5742	81	7127	147066575	2000-08-11	2005-08-11
5745	135	5431	200199345	2017-12-24	2024-12-24
5749	147	6459	122028750	2009-11-22	2015-11-22
5752	191	7490	177137692	1995-08-16	1998-08-16
5754	212	9056	134321487	2015-08-20	2022-08-20
5758	236	9064	125899517	2020-03-17	2027-03-17
5761	230	6938	199138905	1998-12-19	2001-12-19
5762	136	2424	185055599	2013-11-24	2020-11-24
5768	308	7560	198561177	2011-01-21	2014-01-21
5774	17	6479	151690660	2021-02-03	2027-02-03
5776	119	6694	104246307	2005-12-11	2010-12-11
5778	27	4690	108944624	1996-09-04	2001-09-04
5780	306	6122	131026927	2000-03-12	2004-03-12
5781	193	4775	112310636	2000-06-22	2007-06-22
5783	268	4705	147519642	2000-09-05	2006-09-05
5785	80	5300	166327914	2020-02-19	2023-02-19
5787	185	6975	178185883	2017-05-22	2020-05-22
5790	166	6942	113887857	2016-08-18	2022-08-18
5792	57	7770	148940003	1998-10-01	2002-10-01
5796	216	6284	187951907	2013-04-11	2018-04-11
5797	158	6015	112642629	2017-10-11	2020-10-11
5799	178	5646	106387093	2017-03-11	2024-03-11
5800	66	7146	119053894	2013-07-28	2018-07-28
5801	86	6146	174129192	2012-04-06	2015-04-06
5805	159	5433	128917166	2022-04-07	2025-04-07
5806	252	7561	149939445	2013-09-11	2018-09-11
5811	285	5357	165478833	2005-07-21	2012-07-21
5812	210	8731	166040462	2016-03-04	2021-03-04
5813	270	2711	195034987	1993-08-20	1996-08-20
5819	112	2347	170636447	2002-01-27	2007-01-27
5820	208	6466	154758742	1993-12-08	1999-12-08
5822	111	6955	101540494	2000-09-16	2004-09-16
5823	260	5085	108283065	2022-02-19	2025-02-19
5824	319	2432	152332429	2012-10-25	2015-10-25
5827	86	4737	152163678	2004-07-08	2011-07-08
5828	171	8332	160492148	2013-07-24	2019-07-24
5834	38	5152	157126641	2001-12-28	2004-12-28
5835	88	7902	156298420	2003-02-05	2008-02-05
5837	257	6351	128578381	1997-08-27	2001-08-27
5840	45	7119	182235533	2010-12-24	2014-12-24
5841	144	5038	125770779	1990-04-13	1996-04-13
5842	213	8578	173448247	2018-08-20	2024-08-20
5843	53	4723	152413545	1990-09-12	1996-09-12
5844	143	8224	101330423	2000-04-07	2005-04-07
5845	61	7046	173480018	2005-06-16	2008-06-16
5851	161	5201	123092914	2012-09-15	2017-09-15
5854	301	2354	147304737	1995-08-21	1998-08-21
5855	309	2364	169606530	2012-01-09	2019-01-09
5857	172	8902	133403541	2015-02-25	2019-02-25
5858	86	6601	135785394	2012-02-18	2018-02-18
5859	222	8059	109631759	2015-05-25	2022-05-25
5860	211	2526	127579687	2018-10-04	2023-10-04
5861	28	5083	151479576	2004-03-02	2010-03-02
5862	286	6106	196863549	2022-02-13	2029-02-13
5865	13	8705	105842060	2012-07-08	2016-07-08
5866	159	6979	170438087	2021-04-25	2024-04-25
5869	163	9088	164763252	2016-04-11	2019-04-11
5872	294	7487	193792563	2008-08-02	2013-08-02
5873	148	8442	148328508	2017-03-15	2023-03-15
5875	108	7841	152816811	2011-08-21	2014-08-21
5876	158	7766	162988133	2003-08-03	2006-08-03
5879	130	7540	189349799	2020-02-17	2027-02-17
5880	199	7854	131938112	1992-10-01	1999-10-01
5883	132	6549	136053203	2011-01-04	2017-01-04
5884	306	7394	142967841	2000-09-09	2003-09-09
5888	267	7395	132121103	2017-04-01	2023-04-01
5889	160	8937	142800881	2019-08-13	2023-08-13
5890	154	8313	115797613	1995-05-11	2000-05-11
5893	86	6561	118150497	1999-05-05	2004-05-05
5894	55	8263	179945786	2013-09-19	2016-09-19
5895	89	8990	200982290	2018-09-18	2021-09-18
5898	281	2390	157222736	2007-06-02	2013-06-02
5899	142	2279	164938976	2005-12-20	2008-12-20
5901	87	5138	169200391	2019-08-14	2026-08-14
5904	11	8297	159715156	1997-04-13	2000-04-13
5910	151	4730	163280769	2019-04-04	2023-04-04
5911	311	7279	104524980	2007-12-03	2010-12-03
5912	210	7819	156277315	2013-06-28	2019-06-28
5914	8	6559	173666313	2020-05-14	2026-05-14
5915	315	5431	140198215	2019-05-23	2023-05-23
5916	121	2296	194692984	2005-02-12	2008-02-12
5921	240	4865	175604830	2017-11-25	2020-11-25
5926	124	5768	200193014	1998-01-16	2002-01-16
5927	16	6411	117934194	2000-03-04	2005-03-04
5930	194	7630	135950059	1997-05-05	2000-05-05
5932	113	4871	131538290	2009-11-13	2014-11-13
5933	49	7065	108244606	2013-06-24	2017-06-24
5934	294	8641	107995221	2016-11-01	2020-11-01
5937	161	6449	118540503	2022-03-04	2029-03-04
5938	146	2651	166765737	2018-11-22	2024-11-22
5939	268	2189	167351928	2003-09-17	2010-09-17
5940	107	2430	198911730	2000-02-22	2004-02-22
5943	263	5474	132716008	2011-05-23	2014-05-23
5944	163	5889	179981706	2008-11-28	2013-11-28
5945	234	2922	119131647	2008-08-01	2011-08-01
5946	294	3764	158384587	1998-05-17	2004-05-17
5947	133	5539	192564344	2006-01-19	2009-01-19
5949	189	6424	157685212	1997-05-15	2002-05-15
5950	292	5046	113062892	2006-12-20	2010-12-20
5951	109	2412	103305431	2015-10-07	2019-10-07
5953	251	5416	110772348	2003-04-12	2006-04-12
5954	70	8967	150529690	2006-12-26	2011-12-26
5955	311	6503	132753593	1995-11-27	1999-11-27
5956	143	6999	133628595	2020-11-25	2027-11-25
5958	35	6110	106819618	2017-12-13	2020-12-13
5959	159	6488	160411432	2010-01-12	2017-01-12
5962	297	6570	168181208	1999-09-11	2005-09-11
5969	253	8982	147137675	2013-10-09	2016-10-09
5970	18	5877	126733617	2015-10-04	2022-10-04
5971	229	8056	163568753	1999-02-25	2005-02-25
5975	188	8086	120894959	2003-11-10	2010-11-10
5977	221	7138	109529648	1991-02-07	1996-02-07
5978	111	8233	158999986	2012-09-09	2016-09-09
5981	16	4989	103695412	2017-01-11	2020-01-11
\.


--
-- Data for Name: tyazokuluucretleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tyazokuluucretleri (id, ders_tderslerid, ogrenci_tkullanicilarid, ucret, islemtarihi) FROM stdin;
1	49	9115	515.16	2010-03-30 00:24:00
2	77	8722	147.26	2004-12-21 03:56:00
3	55	7615	550.42	2010-06-29 21:46:00
4	158	6282	466.14	2003-06-24 01:00:00
5	108	8605	921.71	2010-06-09 16:46:00
6	4	4691	637.53	2008-11-04 12:23:00
7	33	8497	1075.06	2002-05-05 21:28:00
8	22	7254	893.19	2004-03-14 23:43:00
9	121	6454	111.19	2004-06-05 05:45:00
10	163	8644	328.48	2004-11-22 04:25:00
11	112	7385	717.76	2003-03-22 01:50:00
12	63	5344	970.45	2001-12-31 01:30:00
13	58	7119	600.41	2010-09-30 11:55:00
14	140	4836	212.59	2006-10-30 19:05:00
15	135	7317	1102.7	2004-01-06 17:00:00
16	105	7565	313.14	2008-08-07 04:53:00
17	119	7394	1005.41	2006-02-07 13:04:00
18	50	4992	1022.04	2006-10-11 10:32:00
19	116	8031	592.49	2008-06-28 08:10:00
20	49	6243	367.64	2005-02-14 04:35:00
21	47	4761	336.24	2007-11-01 06:15:00
22	162	7195	228.11	2009-10-10 23:56:00
23	134	7298	105.03	2001-11-17 17:22:00
24	63	6661	129.83	2001-02-01 04:02:00
25	102	8119	485.21	2003-04-27 17:32:00
26	107	8473	489.62	2002-09-29 15:16:00
27	110	7882	172.17	2008-06-28 15:13:00
28	15	7797	112.31	2010-05-10 09:44:00
29	28	6299	641.22	2004-02-07 08:31:00
30	35	8169	867.13	2005-09-18 03:45:00
31	50	8119	978.14	2009-04-19 11:08:00
32	167	6661	380.83	2003-02-08 08:04:00
33	56	5130	574.3	2001-04-08 20:53:00
34	110	9008	432.09	2001-02-17 03:02:00
35	40	7243	888.45	2004-10-22 18:42:00
36	144	5504	931.12	2005-03-29 09:53:00
37	85	5806	1030.23	2004-07-17 00:29:00
38	120	4790	1010.37	2007-07-15 08:37:00
39	39	8777	812.3	2001-08-06 10:45:00
40	70	2219	219.27	2002-06-10 18:46:00
41	62	4927	835.48	2003-05-31 08:18:00
42	6	6886	1049.61	2005-02-14 07:21:00
43	151	5221	146.36	2009-11-07 15:01:00
44	128	4873	931.82	2008-06-04 22:27:00
45	145	7709	574.45	2003-12-11 13:44:00
46	138	8567	864.34	2004-10-05 07:30:00
47	51	5033	680.61	2004-05-11 04:51:00
48	155	5033	159.42	2008-06-28 20:35:00
49	44	7500	1017	2009-08-18 08:31:00
50	64	2648	1087.81	2005-12-26 19:15:00
51	110	8120	527.35	2008-06-27 12:17:00
52	119	4904	665.18	2004-05-24 20:36:00
53	64	2314	334.06	2006-05-13 11:08:00
54	18	5582	1068.32	2005-01-25 23:09:00
55	145	6486	758.12	2010-08-03 23:12:00
56	129	8722	145.43	2006-02-10 08:39:00
57	48	4765	336.95	2008-09-16 03:16:00
58	49	8170	1091.52	2003-12-07 21:24:00
59	162	6258	1098.17	2010-10-02 21:21:00
60	144	8280	825.86	2003-06-13 18:25:00
61	68	5238	690.46	2003-01-19 14:38:00
62	135	8698	995.3	2002-03-16 13:53:00
63	91	5916	475.13	2010-08-30 11:07:00
64	90	8037	143.54	2005-09-14 20:20:00
65	151	7881	339.57	2005-06-24 09:30:00
66	51	4797	837.07	2003-08-30 01:20:00
67	153	8726	870.61	2005-09-30 03:48:00
68	127	5381	261.35	2008-09-05 03:36:00
69	76	7738	617.31	2008-02-18 22:14:00
70	27	8674	689.87	2006-02-17 01:39:00
71	102	5212	1039.92	2004-02-09 04:58:00
72	154	8713	801.42	2002-03-13 04:42:00
73	102	8923	329.53	2002-03-26 18:44:00
74	58	6258	235.18	2003-02-10 09:04:00
75	134	4989	337.8	2005-06-26 09:20:00
76	124	4742	692.93	2009-11-11 00:18:00
77	37	7369	365.33	2008-12-12 11:25:00
78	147	6590	668.63	2004-09-28 00:22:00
79	40	6369	521.35	2001-05-07 03:25:00
80	35	7891	476.41	2009-02-05 03:34:00
81	70	5582	727.91	2005-08-18 01:22:00
82	107	6558	899.08	2009-08-04 06:38:00
83	32	8218	506.61	2004-05-01 13:34:00
84	168	3745	337.82	2004-06-30 14:00:00
85	45	8983	598.27	2004-08-28 15:32:00
86	68	8708	1071.78	2009-03-06 15:40:00
87	117	9078	1025.33	2007-09-03 20:17:00
88	55	8270	830.13	2006-09-10 18:00:00
89	16	4871	896.7	2009-03-26 16:39:00
90	71	7654	840.45	2007-01-13 14:37:00
91	150	2264	551.28	2010-01-03 13:07:00
92	156	7832	143.11	2002-02-20 02:42:00
93	138	6115	814.04	2008-02-07 09:26:00
94	23	4824	1060.05	2006-09-11 10:31:00
95	151	5516	650.32	2004-01-17 08:14:00
96	71	5285	575.09	2001-03-03 02:58:00
97	92	8280	897.5	2010-05-25 15:28:00
98	23	2973	287.6	2004-04-02 07:14:00
99	20	8181	522.05	2008-04-18 17:35:00
100	61	8580	478.33	2004-05-03 20:43:00
101	90	7592	310.91	2001-04-30 20:36:00
102	6	7254	1244.42	2005-12-24 20:56:00
103	65	7259	523.03	2004-06-05 09:59:00
104	138	7258	822.84	2005-11-12 09:34:00
105	122	5582	993.09	2008-06-28 01:50:00
106	69	6454	465.13	2010-05-18 20:15:00
107	143	5916	781.8	2007-02-27 23:00:00
108	38	5083	940.4	2010-01-30 13:49:00
109	86	8874	541.2	2009-03-06 07:59:00
110	164	5163	951.18	2004-01-29 23:03:00
111	97	8983	949.13	2008-03-05 12:02:00
112	166	2591	224.28	2001-08-17 02:54:00
113	41	7709	846.11	2005-08-16 15:34:00
114	72	4742	398.04	2001-07-28 23:06:00
115	123	8368	926.85	2006-03-06 19:51:00
116	72	8181	739.06	2005-07-26 12:27:00
117	69	5832	320.49	2002-03-16 15:52:00
118	76	7306	809.83	2007-12-23 08:16:00
119	122	5729	995.12	2007-11-08 04:10:00
120	162	8120	516.27	2005-02-16 23:00:00
121	111	7234	783.1	2006-07-02 22:00:00
122	109	2355	1053.35	2005-05-23 02:47:00
123	148	7500	414.91	2005-09-24 15:35:00
124	65	9078	648.92	2007-11-18 19:27:00
125	149	8137	997.59	2001-12-16 23:49:00
126	19	5285	611.51	2006-08-06 03:08:00
127	115	7985	274.61	2008-10-20 01:51:00
128	46	8516	778.07	2010-11-06 08:26:00
129	141	2410	508.89	2002-04-30 08:05:00
130	7	6886	1021.87	2010-05-24 22:15:00
131	137	5806	595.9	2002-03-10 00:46:00
132	114	4927	208.75	2009-06-12 21:00:00
133	149	6029	636.02	2008-12-22 18:55:00
134	147	7179	874.01	2006-08-26 09:07:00
135	36	4790	416.09	2010-04-19 18:02:00
136	76	6912	255.82	2007-05-26 22:11:00
137	97	7116	713.15	2003-12-23 07:33:00
138	150	6267	1040.49	2009-12-25 22:16:00
139	96	5438	976.28	2006-03-10 08:34:00
140	133	4812	404.23	2010-12-18 23:45:00
141	16	8344	1075.05	2001-11-23 15:40:00
142	122	7500	154.18	2005-01-19 23:36:00
143	24	7205	478.97	2004-09-29 18:43:00
144	59	7234	244.56	2008-05-16 09:34:00
145	6	4691	466.47	2010-09-02 21:41:00
146	116	2648	289.87	2002-01-31 19:44:00
147	36	8319	212.02	2010-05-15 15:04:00
148	15	4904	317.3	2004-11-17 04:52:00
149	82	4989	111.63	2004-11-09 08:17:00
150	93	8519	1059.65	2005-08-31 08:11:00
151	44	5438	180.42	2003-10-15 04:30:00
152	156	7882	578.43	2002-01-26 22:57:00
153	89	7369	222.49	2008-06-20 14:37:00
154	54	7684	811.47	2003-06-05 15:47:00
155	40	8418	994.63	2006-10-25 18:36:00
156	16	4790	1017.51	2001-01-17 01:48:00
157	155	6937	719.57	2004-12-15 00:04:00
158	153	4736	1024.51	2005-02-07 09:00:00
159	49	2546	268.58	2008-04-01 04:23:00
160	141	9142	208.84	2003-03-01 03:08:00
161	120	6586	680.02	2010-06-06 23:08:00
162	107	8145	694.6700000000001	2005-08-01 20:29:00
163	19	5642	118.01	2008-09-29 18:37:00
164	55	2297	295.44	2001-12-22 15:05:00
165	17	5984	580.56	2006-08-21 10:26:00
166	116	9068	783.22	2004-08-01 22:46:00
167	102	8443	652.32	2004-05-19 17:35:00
168	134	5763	821.19	2008-01-25 09:30:00
169	102	2627	546.14	2010-02-01 01:54:00
170	138	7878	1088.29	2004-02-12 20:09:00
171	92	5504	414.09	2004-03-18 18:50:00
172	81	6015	584.95	2009-04-05 16:50:00
173	100	5300	137	2008-07-27 22:28:00
174	66	7537	392	2002-05-31 11:54:00
175	86	8567	710.63	2002-06-11 10:01:00
176	31	8817	1013.07	2007-06-27 10:30:00
177	120	8344	280.26	2007-10-17 11:08:00
178	132	8955	797.75	2006-09-11 14:56:00
179	63	6710	1101.07	2005-01-26 01:02:00
180	47	5304	562.89	2006-04-11 02:06:00
181	54	4953	773.27	2003-04-27 19:28:00
182	96	8546	880.11	2007-01-16 10:40:00
183	103	7841	913.26	2005-05-03 03:03:00
184	100	4765	992.37	2006-07-02 11:15:00
185	31	6582	672.44	2001-07-30 01:49:00
186	123	7654	792.1	2003-04-25 03:11:00
187	162	5453	904.49	2004-08-30 11:34:00
188	139	4870	1098.86	2003-07-04 18:30:00
189	156	5646	444.21	2006-04-11 11:12:00
190	14	6475	435.24	2001-12-29 07:35:00
191	123	6985	729.53	2006-08-22 11:54:00
192	42	5528	539.43	2007-12-06 15:02:00
193	83	7317	797.31	2007-08-29 02:13:00
194	43	4877	637.12	2007-03-25 00:26:00
195	59	8917	715.95	2010-04-12 04:51:00
196	162	7119	258.4	2008-10-28 19:01:00
197	62	8086	1015.06	2003-02-22 05:02:00
198	46	6251	777.1	2009-03-22 09:38:00
199	158	8597	380.74	2009-04-16 03:10:00
200	37	2410	903.14	2005-06-13 05:23:00
201	105	7097	1092.25	2007-08-13 19:46:00
202	70	5995	860.02	2006-03-31 12:13:00
203	94	5569	416.04	2009-08-03 06:14:00
204	38	6314	1065.88	2006-04-13 00:20:00
205	92	6369	309.78	2001-03-02 13:25:00
206	127	2973	465.89	2009-07-16 15:22:00
207	102	5256	520.85	2005-04-30 04:29:00
208	101	8726	995.08	2006-11-04 20:31:00
209	59	4733	667.87	2003-01-02 10:33:00
210	41	6110	429.05	2004-01-13 12:40:00
211	113	8715	912.8	2002-01-07 20:20:00
212	84	8650	1081.38	2009-08-29 18:55:00
213	62	8598	875.07	2010-05-04 20:21:00
214	85	8497	757.78	2005-06-05 22:33:00
215	102	6465	856.09	2002-05-04 20:07:00
216	118	5874	334.81	2010-01-09 04:31:00
217	150	8516	358.85	2009-01-09 13:16:00
218	139	8112	107.1	2003-10-20 15:13:00
219	162	8434	230.24	2003-03-30 23:24:00
220	7	7254	666.54	2010-07-16 04:13:00
221	95	6590	768.15	2006-10-10 12:48:00
222	76	6034	659.03	2004-04-01 02:07:00
223	34	7878	669.34	2002-03-21 00:14:00
224	53	7185	991.51	2008-09-20 12:22:00
225	90	6314	847.42	2004-04-24 06:28:00
226	166	8086	381.02	2002-12-29 18:05:00
227	26	6214	555.31	2007-08-26 04:44:00
228	139	7991	319.53	2003-04-19 22:03:00
229	89	5612	520.3	2002-03-15 20:22:00
230	24	7141	672.56	2002-04-21 11:25:00
231	2	4691	935.6	2003-02-09 18:04:00
232	26	6468	684.17	2006-12-12 03:41:00
233	136	8775	606.86	2005-02-04 21:25:00
234	33	5806	551.48	2006-12-16 05:18:00
235	86	6247	878.03	2005-06-18 16:19:00
236	9	4691	677.71	2001-10-01 23:38:00
237	42	8372	740.52	2006-02-16 03:26:00
238	58	7955	160.48	2002-04-28 05:40:00
239	47	6483	587.48	2004-08-25 06:25:00
240	112	7267	410.37	2003-01-05 16:53:00
241	74	6559	570.35	2009-04-08 05:16:00
242	102	7335	650.17	2007-09-09 01:22:00
243	49	8209	872.59	2009-05-12 23:22:00
244	153	4970	286.27	2008-06-23 12:59:00
245	39	6901	175.01	2001-12-28 01:28:00
246	136	8650	326.97	2002-07-08 12:20:00
247	71	6636	726.64	2002-05-20 12:19:00
248	127	2378	451.34	2004-07-16 22:19:00
249	68	6704	250.5	2009-03-18 11:14:00
250	144	5663	716.74	2001-06-08 06:41:00
251	90	2529	469	2001-01-25 00:45:00
252	168	8639	876.24	2004-03-22 09:29:00
253	107	6280	1075.23	2005-10-27 01:14:00
254	29	8888	612.09	2004-01-24 21:53:00
255	28	7592	584.33	2003-08-06 03:17:00
256	43	7215	398.22	2010-05-22 05:20:00
257	138	6914	835.11	2003-04-04 23:13:00
258	101	7444	431.76	2008-01-18 03:47:00
259	75	5381	1005.76	2001-08-16 00:47:00
260	57	2355	534.07	2003-03-22 20:09:00
261	107	7283	981.9	2003-07-25 03:27:00
262	141	6639	635.89	2003-02-11 01:56:00
263	11	4691	911.7	2006-08-01 10:03:00
264	60	8978	1025.5	2004-10-08 01:33:00
265	12	6475	853.43	2007-08-26 06:04:00
266	45	8709	689.35	2009-11-21 03:25:00
267	151	5304	247.17	2002-08-28 05:09:00
268	144	2523	429.53	2005-04-01 23:03:00
269	158	8723	199.03	2005-08-03 09:15:00
270	165	2583	466.81	2009-05-22 15:45:00
271	68	6586	488.03	2007-10-03 08:41:00
272	13	6886	448.24	2004-02-17 04:08:00
273	61	2583	720.08	2002-08-22 23:40:00
274	84	7228	907.15	2009-03-07 23:09:00
275	11	6475	685.92	2010-04-29 03:26:00
276	96	7562	915.63	2008-02-11 03:23:00
277	153	6243	156.02	2007-07-24 02:31:00
278	90	2531	307.46	2007-11-27 20:28:00
279	114	7321	961.79	2005-10-23 13:16:00
280	101	2298	448.51	2006-04-05 09:57:00
281	108	9006	897.99	2002-01-28 12:48:00
282	129	6450	708.08	2006-02-07 22:55:00
283	67	7394	778.49	2010-03-07 19:27:00
284	129	5607	866.65	2005-03-16 08:14:00
285	119	7593	751.43	2007-09-29 16:42:00
286	71	8368	237.16	2005-10-12 11:04:00
287	170	2258	280.31	2005-09-27 00:24:00
288	144	2207	1053.24	2004-10-17 06:17:00
289	77	8297	700.64	2006-09-16 11:39:00
290	64	2576	214.47	2008-09-27 16:03:00
291	101	4970	1018.36	2006-12-11 13:11:00
292	51	6937	138.6	2008-10-18 23:08:00
293	16	4762	170.67	2009-02-14 22:35:00
294	67	7597	767.91	2002-07-27 17:42:00
295	99	6100	956.13	2009-03-29 13:11:00
296	91	6901	866.98	2010-04-01 04:39:00
297	161	6321	386.69	2002-12-17 15:10:00
298	126	6886	652.19	2005-02-21 16:42:00
299	34	4945	728.34	2005-07-21 12:50:00
300	38	2494	511.34	2006-10-08 18:50:00
301	95	7215	217.81	2005-12-04 04:39:00
302	153	7803	874.46	2007-12-20 04:03:00
303	4	6475	975.48	2007-05-11 05:58:00
304	142	8586	386.37	2004-09-06 18:37:00
305	46	6441	712.63	2007-01-07 13:13:00
306	86	4797	249.05	2010-02-07 12:12:00
307	119	7461	757.36	2002-07-14 01:37:00
308	142	6314	168.25	2010-09-24 15:40:00
309	149	7116	1056.43	2010-09-15 22:53:00
310	101	9115	889.82	2010-02-09 13:24:00
311	155	7841	1039.02	2002-12-18 13:26:00
312	102	6901	576.51	2009-11-25 21:17:00
313	25	7533	562.62	2005-01-31 03:24:00
314	56	4942	532.74	2004-07-25 04:00:00
315	18	9057	543.56	2008-12-10 15:30:00
316	30	4989	952.16	2008-05-09 09:18:00
317	81	8888	661.18	2005-03-28 21:03:00
318	114	5835	518.11	2005-10-26 23:14:00
319	93	4761	471.3	2002-04-21 12:16:00
320	81	6639	375.65	2009-07-13 17:39:00
321	122	5995	457.74	2005-11-02 15:23:00
322	42	6367	755.3	2004-10-15 04:16:00
323	101	2224	603.86	2010-07-23 09:34:00
324	129	2336	766.64	2003-02-20 13:50:00
325	129	8284	594.76	2001-05-13 11:50:00
326	23	7735	914.89	2008-02-26 02:49:00
327	162	7844	576.53	2004-09-20 21:31:00
328	64	7086	1073.13	2005-01-23 02:58:00
329	67	8471	542.13	2004-09-27 20:01:00
330	103	6937	341.8	2009-12-24 08:49:00
331	38	5688	346.01	2010-11-19 05:07:00
332	164	7267	623.2	2007-10-12 01:09:00
333	139	7891	1061.84	2008-10-05 18:11:00
334	112	8978	804.15	2001-04-19 15:30:00
335	58	7882	268.09	2008-08-25 10:58:00
336	127	6905	647.13	2006-07-08 20:47:00
337	22	6559	394.58	2008-02-09 15:50:00
338	67	5871	242.01	2010-07-18 12:09:00
339	38	6966	744.47	2006-07-27 08:56:00
340	163	4733	270.67	2008-10-30 20:21:00
341	154	8443	751.6	2001-04-13 15:36:00
342	149	8319	901.26	2007-01-25 00:30:00
343	92	5663	1103.19	2009-05-07 03:28:00
344	143	6901	198.1	2005-05-27 15:24:00
345	38	7592	415.18	2007-05-12 04:16:00
346	83	8698	1034.69	2001-08-27 10:36:00
347	80	2202	157.04	2008-03-03 00:31:00
348	130	8086	156.4	2006-06-30 21:22:00
349	167	5344	541.13	2008-11-17 08:56:00
350	54	6282	365.44	2005-01-25 14:18:00
351	67	5508	770.07	2005-01-26 12:55:00
352	38	8586	950.5	2005-02-26 11:28:00
353	44	5856	487.92	2003-01-18 20:30:00
354	20	5383	143.92	2001-11-25 20:16:00
355	23	5381	934.15	2001-06-12 20:30:00
356	73	8084	128.65	2008-02-10 23:21:00
357	34	6914	1046.62	2010-06-23 23:14:00
358	15	7593	209.41	2010-11-14 04:15:00
359	29	7178	823.64	2007-03-24 05:23:00
360	25	6450	722.39	2008-11-04 04:20:00
361	124	8181	1067.26	2006-08-10 08:02:00
362	107	7615	955.64	2002-05-22 08:04:00
363	27	5162	1048.17	2010-12-16 18:15:00
364	116	7713	438.39	2009-10-25 19:13:00
365	94	8372	138.17	2004-06-15 00:20:00
366	74	4691	319.03	2010-10-15 02:04:00
367	141	4916	405.2	2002-02-08 15:57:00
368	126	7254	805.79	2001-05-19 14:37:00
369	169	8454	411.59	2006-12-18 13:27:00
370	33	8026	114.28	2008-01-08 01:01:00
371	73	7984	795.17	2001-03-27 15:09:00
372	162	6115	755.33	2004-05-01 02:48:00
373	62	5446	108.24	2007-02-26 16:21:00
374	31	6479	270.88	2008-07-24 11:56:00
375	167	6710	1049.41	2001-11-14 18:28:00
376	77	8284	981.21	2010-05-17 00:14:00
377	84	7862	472.74	2009-09-12 04:54:00
378	166	5835	963.8	2001-02-03 23:52:00
379	144	6369	174.71	2001-06-06 00:43:00
380	77	5225	903.66	2004-02-16 11:57:00
381	64	5497	643.58	2009-05-09 16:25:00
382	99	5221	211.94	2003-06-20 06:47:00
383	170	2239	434.88	2001-11-06 12:09:00
384	154	6901	828.13	2001-10-11 04:50:00
385	31	7747	899.94	2006-04-10 14:57:00
386	34	4732	139.31	2004-04-01 01:38:00
387	106	8704	994.39	2007-07-16 07:17:00
388	59	7857	541.24	2003-03-25 20:42:00
389	89	6107	831.84	2006-05-24 06:42:00
390	138	4732	739.01	2010-12-17 18:15:00
391	142	2529	172.08	2004-03-06 14:43:00
392	38	9044	993.12	2010-10-24 22:07:00
393	72	5695	355.65	2010-08-10 13:28:00
394	132	8448	350.03	2007-02-18 00:01:00
395	147	6315	643.79	2006-01-21 18:45:00
396	112	7112	172.45	2001-11-07 22:50:00
397	8	6886	577.11	2003-02-22 21:49:00
398	40	8147	1028.4	2002-07-09 19:16:00
399	141	4975	447.66	2008-03-22 03:29:00
400	80	7592	836.77	2005-01-08 00:59:00
401	20	2320	715.13	2010-01-08 15:03:00
402	78	6294	241.72	2008-03-02 14:41:00
403	2	6886	645.49	2005-11-13 01:18:00
404	168	9068	185.15	2007-02-18 03:34:00
405	54	8135	527.05	2010-02-25 10:54:00
406	140	5663	252.01	2006-03-05 02:21:00
407	135	5074	109.01	2001-06-23 04:10:00
408	53	7565	584.39	2003-12-13 16:24:00
409	123	7987	264.06	2003-01-06 02:46:00
410	55	6558	752.21	2005-09-28 20:29:00
411	74	6886	194.45	2002-01-22 17:41:00
412	102	4774	839.23	2002-08-28 14:13:00
413	86	4732	489.6	2002-07-30 16:38:00
414	2	7254	360.26	2008-11-10 05:27:00
415	26	8619	577.01	2006-10-31 17:51:00
416	20	5695	866.02	2004-07-15 04:25:00
417	62	2591	459.48	2007-02-22 17:55:00
418	87	8169	282.34	2009-12-09 22:32:00
419	141	5612	1159.61	2006-07-03 20:02:00
420	120	4871	819.6	2006-04-17 17:01:00
421	59	7207	876.08	2007-02-08 04:53:00
422	86	6412	781.8	2001-06-16 05:23:00
423	165	5245	997.25	2007-06-04 22:25:00
424	110	7955	795.22	2002-08-12 05:02:00
425	40	5504	1007.47	2005-08-25 14:10:00
426	111	7857	213.22	2008-05-14 07:26:00
427	15	6328	611.94	2010-06-15 10:48:00
428	50	6465	524.45	2005-05-08 09:48:00
429	43	6315	1090.2	2006-11-27 12:27:00
430	32	2608	277.47	2010-03-07 02:47:00
431	54	7511	178.54	2008-04-12 04:07:00
432	12	4691	246.08	2006-09-08 03:46:00
433	39	5129	582.04	2002-02-08 07:55:00
434	31	7317	298.16	2009-04-12 01:29:00
435	80	5121	974.57	2008-03-21 04:22:00
436	168	4733	1051.05	2001-03-31 00:50:00
437	88	4836	816.2	2004-02-12 12:31:00
438	154	8923	252.1	2009-11-14 00:06:00
439	154	2627	582.93	2003-03-13 06:46:00
440	117	6469	1097.29	2003-11-18 00:22:00
441	144	8147	331.22	2010-11-07 09:32:00
442	153	7766	784.85	2010-05-22 05:32:00
443	163	8525	646.92	2005-01-03 03:05:00
444	135	6479	490.04	2002-09-12 11:37:00
445	139	7644	571.39	2010-08-15 04:15:00
446	159	7615	989.6	2004-08-02 12:15:00
447	30	6488	1063.89	2006-03-02 00:42:00
448	91	2335	355.71	2009-07-31 20:04:00
449	58	8668	232.54	2009-06-19 02:17:00
450	30	7298	399.39	2005-06-21 07:58:00
451	148	5405	244.7	2003-01-15 05:48:00
452	143	7623	620.35	2004-01-07 09:47:00
453	160	8605	337.22	2003-06-19 15:52:00
454	7	6475	636.61	2008-01-22 22:50:00
455	56	7712	1019.21	2001-12-10 11:41:00
456	58	5453	294.32	2004-05-04 10:32:00
457	99	5516	412.93	2008-07-05 23:27:00
458	132	6299	1079.41	2002-01-31 23:38:00
459	53	6274	836.81	2003-08-04 02:51:00
460	159	2207	975.62	2010-03-25 05:16:00
461	166	7321	719.49	2007-10-19 06:02:00
462	91	7623	771.41	2006-01-31 09:17:00
463	140	4790	451.15	2001-10-05 21:34:00
464	68	4762	361.44	2001-06-15 11:46:00
465	29	8074	724.1	2006-07-10 23:54:00
466	136	2281	439.68	2001-06-19 13:26:00
467	107	6671	344.2	2001-11-02 13:46:00
468	49	8726	217.47	2010-10-07 10:49:00
469	106	7511	509.1	2003-02-01 17:59:00
470	82	2208	824.04	2001-09-01 17:23:00
471	84	8775	682.68	2002-07-19 20:54:00
472	15	7916	1028.62	2010-11-21 11:51:00
473	24	7306	1066.55	2009-05-16 17:53:00
474	169	9078	1099.1	2007-06-04 00:43:00
475	74	6475	437.19	2003-06-21 02:56:00
476	10	6559	544.11	2007-01-26 20:46:00
477	104	7832	129.14	2007-08-02 14:46:00
478	41	4761	357.45	2010-09-22 02:57:00
479	153	2546	875.48	2009-07-11 15:28:00
480	99	5304	862.33	2001-12-24 18:42:00
481	153	5089	329.64	2010-11-27 21:03:00
482	153	8170	1060.29	2004-07-14 22:27:00
483	81	7202	127.24	2008-12-11 23:24:00
484	39	7623	1022.6	2001-08-14 03:43:00
485	35	4870	711.05	2006-07-02 08:06:00
486	117	5441	548.96	2008-07-16 08:32:00
487	169	7259	842.51	2005-03-16 07:57:00
488	117	7658	1032.26	2008-04-26 21:04:00
489	49	7766	932.83	2007-06-26 18:06:00
490	116	8639	663.22	2010-11-08 21:05:00
491	146	6367	1138.97	2007-12-31 15:21:00
492	67	4904	257.9	2002-02-16 22:09:00
493	154	5212	274.44	2007-09-08 06:55:00
494	38	2529	830.5699999999999	2007-12-31 11:45:00
495	169	6469	971.91	2003-08-02 04:18:00
496	132	6435	357.09	2008-03-28 13:51:00
497	131	5162	134.33	2005-07-25 03:58:00
498	89	2410	454.44	2010-07-19 09:48:00
499	130	6468	725.04	2009-01-22 08:24:00
500	45	8637	308.09	2009-01-05 05:22:00
\.


--
-- Name: tbolumler tbolumler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbolumler
    ADD CONSTRAINT tbolumler_pkey PRIMARY KEY (id);


--
-- Name: tdersialanogrenciler tdersialanogrenciler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tdersialanogrenciler
    ADD CONSTRAINT tdersialanogrenciler_pkey PRIMARY KEY (id);


--
-- Name: tdersler tdersler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tdersler
    ADD CONSTRAINT tdersler_pkey PRIMARY KEY (id);


--
-- Name: tfakulteler tfakulteler_adi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tfakulteler
    ADD CONSTRAINT tfakulteler_adi_key UNIQUE (adi);


--
-- Name: tfakulteler tfakulteler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tfakulteler
    ADD CONSTRAINT tfakulteler_pkey PRIMARY KEY (id);


--
-- Name: tilceler tilceler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tilceler
    ADD CONSTRAINT tilceler_pkey PRIMARY KEY (id);


--
-- Name: tiller tiller_adi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiller
    ADD CONSTRAINT tiller_adi_key UNIQUE (adi);


--
-- Name: tiller tiller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiller
    ADD CONSTRAINT tiller_pkey PRIMARY KEY (id);


--
-- Name: tkangruplari tkangruplari_adi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tkangruplari
    ADD CONSTRAINT tkangruplari_adi_key UNIQUE (adi);


--
-- Name: tkangruplari tkangruplari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tkangruplari
    ADD CONSTRAINT tkangruplari_pkey PRIMARY KEY (id);


--
-- Name: tkullanicilar tkullanicilar_ceptel_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tkullanicilar
    ADD CONSTRAINT tkullanicilar_ceptel_key UNIQUE (ceptel);


--
-- Name: tkullanicilar tkullanicilar_eposta_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tkullanicilar
    ADD CONSTRAINT tkullanicilar_eposta_key UNIQUE (eposta);


--
-- Name: tkullanicilar tkullanicilar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tkullanicilar
    ADD CONSTRAINT tkullanicilar_pkey PRIMARY KEY (id);


--
-- Name: tkullanicilar tkullanicilar_tckimlikno_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tkullanicilar
    ADD CONSTRAINT tkullanicilar_tckimlikno_key UNIQUE (tckimlikno);


--
-- Name: togrenciler togrenciler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.togrenciler
    ADD CONSTRAINT togrenciler_pkey PRIMARY KEY (id);


--
-- Name: tyazokuluucretleri tyazokuluucretleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tyazokuluucretleri
    ADD CONSTRAINT tyazokuluucretleri_pkey PRIMARY KEY (id);


--
-- Name: tbolumler tbolumler_fakulte_tfakultelerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbolumler
    ADD CONSTRAINT tbolumler_fakulte_tfakultelerid_fkey FOREIGN KEY (fakulte_tfakultelerid) REFERENCES public.tfakulteler(id);


--
-- Name: tdersialanogrenciler tdersialanogrenciler_ders_tderslerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tdersialanogrenciler
    ADD CONSTRAINT tdersialanogrenciler_ders_tderslerid_fkey FOREIGN KEY (ders_tderslerid) REFERENCES public.tdersler(id);


--
-- Name: tdersialanogrenciler tdersialanogrenciler_ogrenci_tkullanicilarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tdersialanogrenciler
    ADD CONSTRAINT tdersialanogrenciler_ogrenci_tkullanicilarid_fkey FOREIGN KEY (ogrenci_tkullanicilarid) REFERENCES public.tkullanicilar(id);


--
-- Name: tdersler tdersler_bolum_tbolumlerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tdersler
    ADD CONSTRAINT tdersler_bolum_tbolumlerid_fkey FOREIGN KEY (bolum_tbolumlerid) REFERENCES public.tbolumler(id);


--
-- Name: tilceler tilceler_il_tillerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tilceler
    ADD CONSTRAINT tilceler_il_tillerid_fkey FOREIGN KEY (il_tillerid) REFERENCES public.tiller(id);


--
-- Name: tkullanicilar tkullanicilar_dogumyeri_tilcelerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tkullanicilar
    ADD CONSTRAINT tkullanicilar_dogumyeri_tilcelerid_fkey FOREIGN KEY (dogumyeri_tilcelerid) REFERENCES public.tilceler(id);


--
-- Name: tkullanicilar tkullanicilar_kangrubu_tkangruplariid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tkullanicilar
    ADD CONSTRAINT tkullanicilar_kangrubu_tkangruplariid_fkey FOREIGN KEY (kangrubu_tkangruplariid) REFERENCES public.tkangruplari(id);


--
-- Name: togrenciler togrenciler_bolum_tbolumlerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.togrenciler
    ADD CONSTRAINT togrenciler_bolum_tbolumlerid_fkey FOREIGN KEY (bolum_tbolumlerid) REFERENCES public.tbolumler(id);


--
-- Name: togrenciler togrenciler_ogrenci_tkullanicilarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.togrenciler
    ADD CONSTRAINT togrenciler_ogrenci_tkullanicilarid_fkey FOREIGN KEY (ogrenci_tkullanicilarid) REFERENCES public.tkullanicilar(id);


--
-- Name: tyazokuluucretleri tyazokuluucretleri_ders_tderslerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tyazokuluucretleri
    ADD CONSTRAINT tyazokuluucretleri_ders_tderslerid_fkey FOREIGN KEY (ders_tderslerid) REFERENCES public.tdersler(id);


--
-- Name: tyazokuluucretleri tyazokuluucretleri_ogrenci_tkullanicilarid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tyazokuluucretleri
    ADD CONSTRAINT tyazokuluucretleri_ogrenci_tkullanicilarid_fkey FOREIGN KEY (ogrenci_tkullanicilarid) REFERENCES public.tkullanicilar(id);


--
-- PostgreSQL database dump complete
--

\unrestrict llezew94HQps1oV7TiRCnAuygBCsid8HHbNMVsvs2Aqqcv935Dzswws9clqEfYn

