# Autentikasi Wi-Fi

## Apa Itu Autentikasi Wi-Fi?
Autentikasi Wi-Fi adalah proses pembuktian identitas antara client sama AP.

Tujuannya:
- Mastiin user yang nyambung itu user yang sah
- Mencegah orang sembarangan numpang Wi-Fi

Singkatnya:
> Autentikasi = proses kenalan sama verifikasi sebelum dikasih akses jaringan.

## Posisi Autentikasi di Alur Koneksi Wi-Fi
Biar kebayang, alurnya kurang lebih kaya gini:

### 1. Discovery
Client nyari Wi-Fi (SSID)

### 2. Authentication
Client buktiin identitas

### 3. Association
Client resmi kedaftar di AP

### 4. 4-Way Handshake (kalo WPA/WPA2/WPA3)
Bikin kunci enkripsi buat ngenkripsi data

### 5. Dapet IP & Internet
Client dapet IP secara otomatis lewat DHCP dan bisa ngakses internet (kalo ada koneksi internetnya)

## Jenis-Jenis Autentikasi Wi-Fi

### 1. Open Authentication (Kaga Pake Password)
Ini autentikasi paling kaga aman.

Ciri-cirinya:
- Kagak pake password
- Siapa aja bisa konek

Biasanya dipake di:
- Wi-Fi cafe
- Wi-Fi publik
- Free hotspot

Kelemahannya:
- Data gampang disadap
- Rawan MITM

> Autentikasinya cuma formalitas doang, kaga ada pengamanan yang serius.

### 2. Shared Key Authentication (WEP)
Ini autentikasi yang udah jadul banget.

Cara kerjanya (singkat):
- AP ngasih challenge (tantangan)
- Client ngejawab pake kunci WEP
- Kalo cocok, boleh masuk

Masalahnya:
- Kuncinya statis (gampang ditebak)
- Algoritmannya lemah (RC4)
- Gampang dicrack dalam hitungan menit (bahkan detik)

### 3. WPA/WPA2-Personal (PSK)
Ini autentikasi yang paling sering ditemuin di rumah-rumah.

Autentikasinya pake:
- Pre-Shared Key (PSK): password Wi-Fi yang dipake semua client.

Proses singkatnya:
- Client masukin password
- Password sama SSID terus dihitung jadi PMK
- Dilanjutin ke 4-way handshake
- Kalo hasilnya valid, aksesnya dikasih

Catetan penting:
- Passwordnya kagak dikirim secara langsung
- Yang lewat itu hasil kriptografi

### 4. WPA/WPA2 Enterprise (802.1X)
Ini autentikasi yang sering dipake di kantor sama kampus-kampus.

Ciri-cirinya:
- Pake username sama password
- Ada server RADIUS
- Setiap client punya kredensialnya masing-masing

Komponen utamanya:
- Supplicant: client
- Authenticator: AP
- Authentication Server: RADIUS

Keunggulannya:
- Lebih aman dari PSK karena kaga ada password yang dibagi-bagi
- Setiap client punya kredensialnya masing-masing
- Bisa pake password, sertifikat, kalo kaga pake token

### 5. WPA3-Personal (SAE)
Ini autentikasi generasi paling baru sama yang paling aman.

Ciri-cirinya:
- Pake SAE (Simultaneous Authentication of Equals)
- Anti brute force
- Setiap percobaan autentikasinya itu unik

Keunggulannya:
- Offline attack hampir mustahil
- Lebih tahan terhadap Evil Twin

Kekurangannya:
- Masih jarang perangkat (router atau AP) yang ngedukung WPA3
- Perangkat client lama banyak yang kaga support WPA3

## Peran Autentikasi Wi-Fi di Wireless Hacking
Di wireless hacking, autentikasi itu jadi target utama.

Kenapa gitu?
- Semua serangan Wi-Fi kejadiannya di proses ini
- Handshake cuma dapet kalo ada proses autentikasi
- Deauth dipake buat maksa autentikasi ulang (reconnect)

Contoh:
- Deauth: client reconnect, handshake dapet
- Evil Twin: nipu proses autentikasi
- Brute force: nyerang proses verifikasi

> Jadi kalo lu paham autentikasi, lu bakal paham kenapa jenis-jenis serangan Wi-Fi itu bisa terjadi.
