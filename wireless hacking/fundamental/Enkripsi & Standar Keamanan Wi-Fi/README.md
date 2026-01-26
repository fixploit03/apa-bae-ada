# Enkripsi & Standar Keamanan Wi-Fi

## Jenis-Jenis Standar Keamanan Wi-Fi

### 1. Open (Kaga Pake Password)
- Ciri-cirinya:
  - Kaga pake enkripsi sama sekali.
  - Siapa aja bisa konek kaga make password.
  - Biasa ditemuin di Wi-Fi publik (kaya kafe, mall, bandara, hotel).
- Kekurangannya:
  - Semua traffic Wi-Fi bisa disadap.
  - Rentan terhadap serangan MITM.
  - Bahaya kalau dipake buat ngakses mbanking, email, atau data sensitif tanpa enkripsi tambahan (HTTPS/VPN).

> [!NOTE]
> Meski Wi-Fi-nya open, kalau lu pake HTTPS atau VPN, data lu tetap aman. Yang bahaya itu kalau lu akses situs HTTP atau aplikasi yang kaga pake enkripsi.

### 2. WEP (Wired Equivalent Privacy)
- Tahun: 1997
- Enkripsi: RC4 (stream cipher)
- Panjang kunci: 64-bit atau 128-bit

Ciri-cirinya:
- Standar keamanan Wi-Fi pertama.
- Pake enkripsi RC4 dengan Initialization Vector (IV) yang lemah.
- Kuncinya static (kaga berubah-ubah).

Kekurangannya:
- Paling gampang buat dibobol, bisa dalam hitungan menit (bahkan detik).
- IV nya bisa diprediksi, jadi enkripsinya bisa dicrack make packet injection.
- Tools kaya Aircrack-NG bisa ngecrack kunci WEP cuma butuh sekitar `40.000`–`100.000` paket doang.

> [!NOTE]
> Jangan pernah pake WEP buat jaringan penting. Pake cuma buat belajar atau testing aja.

### 3. WPA (Wi-Fi Protected Access)
- Tahun: 2003
- Enkripsi: TKIP (Temporal Key Integrity Protocol)
- Key management: 4-way handshake

Ciri-cirinya:
- Dibuat sebagai solusi sementara buat ngegantiin WEP yang udah bapuk.
- Pake enkripsi TKIP yang lebih dinamis (kuncinya berubah-ubah per-packet).
- Ada 2 mode:
  - WPA-Personal (PSK): Pake pre-shared key (password yang sama buat semua user).
  - WPA-Enterprise: Pake server RADIUS buat autentikasi individual.

Kekurangannya:
- TKIP udah dianggep lemah dan deprecated (kaga kepake lagi).
- Rentan terhadap packet injection dan replay attack.
- Bisa dicrack make dictionary attack kalau passwordnya lemah.

### 4. WPA2
- Tahun: 2004
- Enkripsi: AES-CCMP (Advanced Encryption Standard - Counter Mode CBC-MAC Protocol)
- Key management: 4-way handshake

Ciri-cirinya:
- Standar paling populer yang masih dipake sampe sekarang.
- Pake enkripsi AES yang jauh lebih kuat dari TKIP.
- Ada 2 mode:
  - WPA2-Personal (PSK): Pake password yang sama buat semua user. Paling sering dipake di rumah.
  - WPA2-Enterprise (802.1X): Pake server RADIUS, tiap user punya username/password sendiri. Lebih aman, biasa dipake di kantor atau kampus.

Kekurangannya:
- WPA2-PSK rentan sama serangan offline kaya dictionary sama brute force attack:
  - Penyerang bisa capture 4-way handshake.
  - Handshake dicrack secara offline pake wordlist kalo kaga brute force.
  - Kalo passwordnya lemah, bisa dicrack dalam hitungan menit.
- Rentan sama PMKID attack.
- Bisa kena KRACK (Key Reinstallation Attack) kalau firmware kaga diupdate.

> [!NOTE]
> WPA2-Enterprise jauh lebih aman dari WPA2-PSK karena kaga pake password yang dibagi-bagi (PSK). Kalo lu setup jaringan kantor, wajib pake WPA2-Enterprise.

### 5. WPA3
- Tahun: 2018
- Enkripsi:
  - WPA3-Personal: AES-GCMP
  - WPA3-Enterprise: AES-GCMP-256
- Key management: SAE (Simultaneous Authentication of Equals)

Ciri-cirinya:
- Standar terbaru dan paling aman di jaman sekarang.
- Pake SAE (Dragonfly handshake) buat gantiin 4-way handshake tradisional.
- Lebih aman dari serangan offline kaya dictionary sama brute force attack.
- Ngedukung forward secrecy (kunci sesi kaga bisa didecrypt meski passwordnya bocor).
- Ada 2 mode:
  - WPA3-Personal (SAE): Lebih aman dari WPA2-PSK, kaga bisa dicrack secara offline dengan gampang.
  - WPA3-Enterprise (192-bit security): Enkripsi level militer buat enterprise.

Kekurangannya:
- Masih ada vulnerability, contohnya Dragonblood (CVE-2019-9494):
  - Side-channel attack.
  - Timing attack.
  - Downgrade attack ke WPA2 (kalau router support transition mode).
- Belum sepamor WPA2, jadi masih jarang ditemuin di lapangan.
- Butuh hardware yang lebih baru buat support WPA3.

> [!NOTE]
> Meski WPA3 jauh lebih aman, bukan berarti 100% kaga bisa dibobol. Kalo passwordnya lemah atau konfigurasi keamanannya salah (misconfiguration), sama aja boong.
