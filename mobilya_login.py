import streamlit as st
import pyodbc
import pandas as pd

def login():
    """SQL Server'a bağlanarak giriş doğrulaması yapar."""
    st.markdown("<h1 style='text-align: center; color: #007bff;'>Mobilya Mağazasına Hoşgeldiniz!</h1>", unsafe_allow_html=True)
    st.write("<hr style='border: 1px solid #ccc;'>", unsafe_allow_html=True)
    st.markdown("<h3 style='text-align: center;'>Giriş Yap</h3>", unsafe_allow_html=True)

    username_input = st.text_input("Kullanıcı Adı", placeholder="Kullanıcı Adınızı Girin")
    password_input = st.text_input("Şifre", type="password", placeholder="Şifrenizi Girin")

    if st.button("Giriş"):
        try:
            # Bağlantı bilgilerini ayarlayın
            server = 'FT12DF3\SQLEXPRESS' 
            database = 'MobilyaMagazasiVT' 

            # Bağlantı dizesini oluşturun
            conn_str = (
                r'DRIVER={ODBC Driver 17 for SQL Server};'
                r'SERVER=' + server + ';'
                r'DATABASE=' + database + ';'
                r'Trusted_Connection=yes;'
            )

            # Veritabanına bağlanın
            conn = pyodbc.connect(conn_str)

            # Giriş doğrulaması yapın
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Çalışanlar WHERE KullanıcıAdı=? AND Şifre=?", (username_input, password_input))
            user = cursor.fetchone()

            if user:
                st.success("Giriş başarılı!")
                st.session_state.logged_in = True
                st.session_state.username = username_input
                st.experimental_rerun()  # Sayfayı yeniden yükle ve durumu kontrol et
            else:
                st.error("Yanlış kullanıcı adı veya şifre.")

            cursor.close()
            conn.close()

        except pyodbc.Error as ex:
            st.error(f"Veritabanına bağlanılamadı: {ex}")

def main_page():
    st.markdown("<h1 style='text-align: center; color: #007bff;'>Mobilya Mağazasına Hoşgeldiniz!!</h1>", unsafe_allow_html=True)
    st.write("<hr style='border: 1px solid #ccc;'>", unsafe_allow_html=True)
    st.markdown("<h3 style='text-align: center;'>Tablo Seç</h3>", unsafe_allow_html=True)
    
    col1, col2, col3 , col4 = st.columns(4)
    with col1:
        if st.button("Çalışanlar"):
            st.session_state.selected_query = "Çalışanlar"
    with col2:
        if st.button("Müşteri Listesi"):
            st.session_state.selected_query = "Müşteriler"
    with col3:
        if st.button("Sipariş Listesi"):
            st.session_state.selected_query = "Siparişler"
    with col4:
        if st.button("Ürün Listesi"):
            st.session_state.selected_query = "Ürünler"

    if "selected_query" in st.session_state:
        run_query(st.session_state.selected_query)

def run_query(query_name):
    try:
        # Bağlantı bilgilerini ayarlayın
        server = 'FT12DF3\SQLEXPRESS' 
        database = 'MobilyaMagazasiVT' 

        # Bağlantı dizesini oluşturun
        conn_str = (
            r'DRIVER={ODBC Driver 17 for SQL Server};'
            r'SERVER=' + server + ';'
            r'DATABASE=' + database + ';'
            r'Trusted_Connection=yes;'
        )

        # Veritabanına bağlanın
        conn = pyodbc.connect(conn_str)

        # Sorguları tanımlayın
        queries = {
            "Çalışanlar": "SELECT * FROM Çalışanlar",
            "Müşteriler": "SELECT * FROM Müşteriler",
            "Siparişler": "SELECT * FROM Siparişler",  
            "Ürünler": "SELECT * FROM Ürünler"
        }

        query = queries.get(query_name, "")
        if query:
            df = pd.read_sql(query, conn)
            st.write(f"**{query_name} Sonuçları:**")
            st.dataframe(df)
        else:
            st.error("Geçersiz sorgu adı.")

        conn.close()

    except pyodbc.Error as ex:
        st.error(f"Veritabanına bağlanılamadı: {ex}")

if "logged_in" not in st.session_state:
    st.session_state.logged_in = False

if st.session_state.logged_in:
    main_page()
else:
    login()
