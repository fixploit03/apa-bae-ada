# Jenis‑Jenis Serangan di Jaringan Wi‑Fi

## 1. Sniffing (Nguping)
Sniffing itu ibarat lu nguping orang yang lagi ngobrol, tapi versinya jaringan.

Penyerang:
- Nangkep paket data yang lewat di udara
- Ngeliat trafik antara client sama AP
- kalo jaringan lemah, data bisa disadap

Biasanya kejadian di:
- Wi‑Fi open/kaga pake password
- Enkripsinya lemah

Tujuannya:
- Ngumpulin informasi
- Bukan langsung ngerusak

## 2. Deauthentication Attack (Nendang Client)
Ini serangan yang sering bikin orang pada kesel.

Yang kejadian:
- Client tiba‑tiba keputus dari Wi‑Fi
- Padahal sinyalnya full
- Disambungin lagi, eh keputus lagi

Ngapa itu bisa kejadian?

Karena Wi‑Fi punya sistem management frame yang bisa dipalsuin.

Tujuannya:
- Maksa buat client reconnect (konek ulang)
- Buat nangkep handshake (dipake buat ngecrack password Wi-Fi)

## 3. Handshake Capture Attack
Ini bukan serangan ngerusak, tapi ngumpulin bahan (bahan apatuh).

Yang dicari:
- 4‑Way Handshake
- Dipake buat ngecrack password Wi‑Fi secara offline

Catetan penting:
- Kaga ujug-ujug langsung dapet password Wi-Fi nya
- Cuma dapet kunci buat dites (password nya bener apa kaga)

Biasanya serangan ini dibarengin sama serangan deauth.

## 4. PMKID Attack
Nah ini serangan yang rada licik tapi elegan. PMKID Attack itu serangan buat dapetin bahan crack password Wi‑Fi,
tanpa perlu ada client yang konek.

Bedanya sama handshake biasa:
- Handshake biasa: butuh client terus client itu dideauth terus nangkep 4‑way handshake
- PMKID Attack: kaga perlu client sama sekali

Yang dilakuin:
- Penyerang ngobrol langsung sama AP
- AP ngasih PMKID
- PMKID yang dikasih bisa dipake buat ngecrack password Wi-Fi secara offline

Catetan penting:
- Tetep kaga langsung dapet password Wi-Fi nya
- Masih harus dicrack pake wordlist kalo kaga pake brute force
- Cuma bahannya aja dapetnya lebih cepet dibandingin sama handshake biasa

Biasanya kejadian di:
- Wi‑Fi yang pake WPA/WPA2‑PSK
- Router jadul atau setingan router yang keamanannya lemah

Kelebihannya:
- Kagak perlu nendang client
- Kagak berisik
- Lebih stealth (kaga gampang ketauan)

Kekurangannya:
- Kaga semua AP rentan
- Router baru banyak yang udah nutup celah ini

Ibaratnya: Lu kaga perlu kunci rumah buat ngebobol itu rumah, lu ngintip ke bawah keset, eh malah nemu kunci serep.

## 5. Brute Force/Dictionary Attack
Ini serangan tujuannya buat nebak password.

Cara kerjanya:
- Nyoba password satu‑satu
- Bisa pake wordlist (kamus)
- Bisa juga full brute force

Targetnya:
- Wi‑Fi yang pake password lemah
- Passwordnya pendek
- Passwordnya pasaran

Biasanya serangan ini kepake kalo passwordnya kaya `12345678`, `udinpetot123`, `dadangdidingdudung`.

## 6. WPS Attack
Ini nyerang fitur WPS (Wi‑Fi Protected Setup).

Masalah WPS:
- Make PIN 8 digit
- PIN bisa ditebak
- Kebanyakan router masih ngaktifin WPS

Akibatnya:
- Password Wi‑Fi bisa ketauan
- Bagen passwordnya susah alias ribet

## 7. Evil Twin Attack
Ini serangan yang paling licik.

Yang dilakuin:
- Penyerang bikin Wi‑Fi palsu
- Namanya sama persis kayak Wi‑Fi asli
- Korban nyambung ke AP palsu

Dampaknya:
- Korban masukin password
- Penyerang ngintip trafik
- Penyerang bisa nyolong akun korban

Ibaratnya: Lu beli pertamax ga taunya isinya pertalit.

## 8. Rogue AP (Access Point)
Kaya Evil Twin, tapi biasanya:
- Dipasang di dalem jaringan
- Tanpa izin admin

Tujuannya:
- Monitoring user
- Bypass keamanan
- Jadi pintu masuk penyerang

## 9. Man‑in‑the‑Middle (MITM)
Penyerang jadi orang ketiga di tengah komunikasi. (gampangnya jadi pelakor dah)

Yang bisa dilakuin:
- Ngintip data
- Ngubah data
- Redirect (ngalihin) ke website palsu

Biasanya kejadian di:
- Wi‑Fi publik
- Wi‑Fi yang kaga pake enkripsi kuat


## 10. Denial of Service (DoS)
Tujuannya cuma satu: bikin Wi‑Fi kaga bisa dipake.

Cara kerjanya:
- Flood paket (ngebanjirin paket)
- Spam request
- Ganggu channel

Dampaknya:
- Jaringan jadi lemot
- Client kaga bisa connect
- AP nya jadi ngecrash
