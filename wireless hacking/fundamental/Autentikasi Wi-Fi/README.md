Di materi ini, gw bakal ngebahas tentang autentikasi Wi-Fi.

# Autentikasi Wi-Fi

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Autentikasi%20Wi-Fi/img/proses.png" width="50%"/>
</div>

## Apa Itu Autentikasi Wi-Fi?
Autentikasi Wi-Fi adalah proses buat ngebuktiin identitas antara client sama AP sebelon koneksi bener-bener dijalanin.

Tujuannya buat:
- Mastiin client yang nyambung itu client yang sah
- Nyegah orang kaga dikenal numpang di Wi-Fi lu

## Posisi Autentikasi di Alur Koneksi Wi-Fi
Biar kebayang, alurnya kurang lebih kaya gini prosesnya:

### 1. Discovery
Client nyari Wi-Fi (SSID)

### 2. Authentication
Client ngebuktiin identitas dia

### 3. Association
Client resmi kedaftar di AP

### 4. 4-Way Handshake
Bikin kunci enkripsi buat ngenkripsi data

### 5. Dapet IP & Internet
Client dapet IP secara otomatis lewat DHCP sama bisa ngakses internet (kalo ada koneksi internetnya)

## Jenis-Jenis Autentikasi Wi-Fi

### 1. Open (Kaga Pake Password)
Ini autentikasi paling kaga aman.

- **Autentikasi:** langsung konek
- **Handshake:** kaga make
- **Kelebihan:**
  - Sat‑set, langsung konek
- **Kekurangan:**
  - Rawan disadap
  - Semua data bisa diliat kalo kaga make enkripsi tambahan

### 2. WEP (Wired Equivalent Privacy)
Ini autentikasi yang bapuknya udah kaga kepuguhan.

- **Autentikasi:** Shared Key/Open System
- **Handshake:** kaga make
- **Kelebihan:**
  - kaga ada kelebihannya sama sekali 🙂
- **Kekurangan:**
  - Make enkripsi yang bapuk (RC4)
  - IV cuma 24‑bit, gampang keulang
  - Make key statis (itu-itu aja)
  - Bisa dicrack dalam hitungan menit

### 3. WPA/WPA2-Personal (PSK)
Ini autentikasi yang paling sering banyak orang pake di jaman sekarang.

- **Autentikasi:** PSK (Pre-Shared Key)
- **Handshake:** 4-Way Handshake
- **Keunggulan:**
  - Gampang buat ngebikin infrastrukturnya
  - Kaga mahal buat ngebikin infrastrukturnya
  - Hampir semua perangkat support sama WPA/WPA2-PSK
- **Kekurangan:**
  - Bisa ngecrack PSK secara offline kalo 4‑Way Handshake berhasil ketangkep
  - Rentan sama serangan offline kaya brute force sama dictionary attack kalo password yang dipake gampang ditebak
  - Make PSK, jadi kalo PSK nya bocor, semua client bisa langsung konek

### 4. WPA/WPA2 Enterprise (802.1X)
Ini autentikasi yang sering dipake di kalangan enterprise, contohnya kaya di kantor sama kampus.

- **Autentikasi:** EAP (Extensible Authentication Protocol)
- **Handshake:** 4-Way Handshake
- **Keunggulan:**
  - Lebih aman dari PSK karena kaga ada password yang dishare (dibagi-bagi)
  - Setiap client punya kredensialnya masing-masing
  - Bisa konek make password, sertifikat, kalo kaga token/OTP
- **Kekurangan:**
  - Rada ribet buat ngebikin infrastrukturnya
  - Biayanya lebih mahal dibandingin sama infrastruktur PSK

#### Komponen Utama Wi-Fi WPA/WPA2 Enterprise (802.1X)
- **Supplicant:** client
- **Authenticator:** AP
- **Authentication Server:** RADIUS

### 5. WPA3-Personal (SAE)
Ini autentikasi generasi paling baru sama yang paling aman.

- **Autentikasi:** SAE (Simultaneous Authentication of Equals)
- **Handshake:** Dragonfly Handshake
- **Keunggulan:**
  - Offline attack hampir mustahil
  - Lebih tahan sama Evil Twin attack
- **Kelemahan:**
  - Masih jarang perangkat yang ngedukung WPA3
  - Kompatibilitasnya kebates (banyak perangkat lama pada kaga bisa connect)
  - Ada bug di sebagian perangkat generasi awal
  
## Peran Autentikasi Wi-Fi di Wireless Hacking
Di wireless hacking, autentikasi itu jadi target utama.

Kenapa gitu?

Karena:
- Semua serangan Wi-Fi kejadiannya di proses ini
- Handshake cuma dapet kalo ada yang lagi konek
- Deauth dipake buat maksa client konek ulang (buat dapetin handshake)

## Kesimpulan
Intinya, kalo lu paham proses autentikasi, lu bakal ngerti kenapa jenis-jenis serangan Wi‑Fi itu bisa terjadi.
