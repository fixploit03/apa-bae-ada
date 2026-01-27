# Handshake & Proses Koneksi Wi-Fi

## Apa Itu Handshake di Wi-Fi?
Handshake adalah proses pertukaran pesan antara client dan AP (Access Point) untuk membentuk koneksi yang aman sebelum komunikasi data dimulai. Di Wi-Fi, handshake yang paling penting adalah **4-Way Handshake** yang digunakan untuk autentikasi dan enkripsi.

## Komponen dalam 4-Way Handshake

### 1. Passphrase (Password Wi-Fi)
Ini adalah bahan paling dasar yang digunakan untuk menghitung PMK.

> [!NOTE]
> **Panjang password Wi-Fi:**
> - ASCII: 8-63 karakter
> - Hex: 64 karakter

### 2. SSID (Nama Wi-Fi)
SSID juga digunakan sebagai bahan untuk menghitung PMK.

**Fungsi SSID:**
- Digunakan sebagai salt dalam proses kriptografi
- Membuat PMK yang unik untuk setiap jaringan

**Kesimpulan:**
> Walaupun passwordnya sama, jika SSID berbeda maka akan menghasilkan PMK yang berbeda.

### 3. PMK (Pairwise Master Key)
PMK adalah kunci utama (ibaratnya kapten dalam tim bola).

**Cara membuat PMK:**
- PMK dibuat dari password Wi-Fi yang digabungkan dengan SSID
- Kemudian diproses secara kriptografi menggunakan:
  - Fungsi: PBKDF2-HMAC-SHA1
  - Iterasi: 4096 kali
  - Output: 256-bit (32 byte)

**Karakteristik PMK:**
- Tidak dikirim ke jaringan
- Tidak terlihat dalam handshake
- Menjadi bahan untuk membuat kunci lainnya

### 4. Nonce (ANonce & SNonce)
Nonce adalah angka acak yang hanya dipakai sekali.

**ANonce (Authenticator Nonce):**
- Dibuat oleh AP
- Dikirim di Message 1

**SNonce (Supplicant Nonce):**
- Dibuat oleh client
- Dikirim di Message 2

**Fungsi Nonce:**
- Membuat kunci yang unik untuk setiap koneksi
- Mencegah replay attack
- Mencegah penggunaan kunci lama

### 5. PTK (Pairwise Transient Key)
PTK adalah kunci utama untuk komunikasi antara client dan AP.

**PTK dibuat dari:**
- PMK
- ANonce
- SNonce
- MAC Address AP
- MAC Address client

**Karakteristik PTK:**
- Unik per client
- Unik per session
- Digunakan untuk enkripsi data dan membuat MIC

### 6. Sub-Key dalam PTK
PTK bukan satu kunci saja, tetapi terbagi menjadi beberapa bagian:

#### KCK (Key Confirmation Key)
- **Fungsi:** Membuat dan memverifikasi MIC
- **Tujuan:** Membuktikan bahwa password benar

#### KEK (Key Encryption Key)
- **Fungsi:** Mengenkripsi GTK
- **Tujuan:** Supaya GTK tidak bocor saat transmisi

#### TK (Temporal Key)
- **Fungsi:** Enkripsi data user
- **Tujuan:** Ini yang benar-benar digunakan saat browsing internet

### 7. MIC (Message Integrity Check)
MIC bukan kunci, tetapi hasil perhitungan kriptografi.

**Karakteristik MIC:**
- Dibuat menggunakan KCK
- Digunakan untuk membuktikan kunci benar
- Mengecek bahwa data handshake tidak diubah

**MIC terdapat di:**
- Message 2 (dibuat oleh client)
- Message 3 (dibuat oleh AP)

### 8. GTK (Group Temporal Key)
GTK adalah kunci untuk komunikasi broadcast dan multicast.

**Fungsi GTK:**
- Broadcast traffic
- Multicast traffic
- Protokol seperti ARP, beacon, dll

**Karakteristik GTK:**
- Sama untuk semua client dalam satu AP
- Dikirim di Message 3
- Dienkripsi menggunakan KEK

## Diagram Alur Komponen

```
Password + SSID
       ↓
   PMK (256-bit)
       ↓
ANonce + SNonce + MAC Addresses
       ↓
      PTK
  ↓    ↓    ↓
KCK   KEK   TK
  ↓    ↓    ↓
MIC   GTK  Enkripsi Data
```

## Proses 4-Way Handshake

4-Way Handshake adalah proses kriptografi yang terjadi setelah perangkat client terhubung dengan AP. Tujuannya adalah membuat Pairwise Transient Key (PTK) yang unik untuk setiap sesi koneksi.

### Message 1: AP → Client
**Apa yang terjadi:**
- AP mengirim ANonce (Authenticator Nonce) ke client

**Penjelasan:**
- ANonce adalah angka acak yang dibuat oleh AP
- Tujuannya sebagai bahan untuk membuat kunci enkripsi yang unik
- Pada tahap ini belum ada proses enkripsi data, hanya pertukaran bahan kunci

> [!NOTE]
> AP belum tahu apakah client memiliki password yang benar atau tidak.

### Message 2: Client → AP
**Apa yang dilakukan client:**
1. Menerima ANonce dari AP
2. Membuat SNonce (Supplicant Nonce) - angka acak yang dibuat oleh client
3. Menghitung PTK (Pairwise Transient Key)

**Bahan untuk menghitung PTK:**
- PMK (Pairwise Master Key)
- ANonce
- SNonce
- MAC Address AP
- MAC Address client

> [!NOTE]
> PMK didapat dari proses kriptografi yang menggabungkan password Wi-Fi dengan SSID.

**Setelah PTK terbentuk:**
- Client menghitung MIC (Message Integrity Check)
- Client mengirim:
  - SNonce
  - MIC

> [!IMPORTANT]
> Client mengirim MIC untuk membuktikan kepada AP bahwa dia memiliki PMK yang benar, yang artinya password Wi-Fi yang digunakan juga benar.

### Message 3: AP → Client
**Apa yang dilakukan AP:**
1. Menerima SNonce dari client
2. Menghitung PTK menggunakan rumus yang sama
3. Mengecek MIC yang dikirim oleh client

**Jika MIC valid:**
- Artinya password client benar
- AP melanjutkan dengan mengirim:
  - GTK (Group Temporal Key)
  - GTK dienkripsi menggunakan KEK (bagian dari PTK)
  - Disertai MIC untuk validasi

### Message 4: Client → AP
**Apa yang dilakukan client:**
1. Menerima GTK dari AP
2. Mengecek MIC dari AP

**Jika semua benar:**
- Client mengirim ACK (acknowledgment/konfirmasi akhir) ke AP

**Setelah Message 4:**
- 4-Way Handshake selesai
- Komunikasi data dimulai dengan kondisi:
  - Fully encrypted (terenkripsi penuh)
  - Menggunakan PTK yang unik untuk setiap client

## Diagram Alur 4-Way Handshake

```
AP                                    Client
│                                        │
│────-──── Message 1: ANonce ───────────>│
│                                        │
│                                    (Buat SNonce)
│                                    (Hitung PTK)
│                                    (Hitung MIC)
│                                        │
│<────── Message 2: SNonce + MIC ─-──────│
│                                        │
│ (Hitung PTK)                           │
│ (Verifikasi MIC)                       │
│                                        │
│──-── Message 3: GTK + MIC ────────────>│
│                                        │
│                                    (Verifikasi MIC)
│                                    (Simpan GTK)
│                                        │
│<──────── Message 4: ACK ───────────────│
│                                        │
│ ✓ Koneksi Aman Terbentuk               │
│ ✓ Komunikasi Terenkripsi               │
│                                        │
```

## Keamanan 4-Way Handshake

**Kelebihan:**
- Tidak ada transmisi password secara langsung
- PTK unik untuk setiap sesi
- MIC memastikan integritas data
- Mencegah replay attack dengan nonce

**Potensi Kelemahan:**
- Rentan terhadap brute force jika password lemah
- KRACK attack (Key Reinstallation Attack) pada implementasi yang belum dipatch
- Deauthentication attack untuk memaksa handshake ulang

## Kesimpulan

4-Way Handshake adalah proses yang sangat penting dalam keamanan Wi-Fi. Proses ini memastikan bahwa:
1. Client memiliki password yang benar
2. Komunikasi terenkripsi dengan kunci yang unik
3. Data tidak dapat diubah atau di-replay oleh pihak ketiga

Dengan memahami proses ini, kita dapat lebih mengerti bagaimana Wi-Fi melindungi komunikasi kita dan pentingnya menggunakan password yang kuat.
