# Handshake & Proses Koneksi Wi-Fi

## Apa Itu Handshake di Wi-Fi?
Handshake itu ibarat jabat tangan virtual antara HP lu sama router Wi-Fi sebelum bener-bener bisa internetan. 

Prosesnya:
- Client sama AP tukeran pesen
- Buat bikin koneksi yang aman
- Sebelom data beneran dikirim

Di Wi-Fi, handshake yang paling penting namanya **4-Way Handshake** yang dipake buat autentikasi sama enkripsi.

---

## Komponen di 4-Way Handshake

### 1. Passphrase (Password Wi-Fi)
Ini bahan paling dasar buat ngitung PMK.

> [!NOTE]
> Panjang password Wi-Fi:
> - ASCII: 8-63 karakter
> - Hex: 64 karakter

### 2. SSID (Nama Wi-Fi)
SSID juga dipake buat jadi bahan ngitung PMK.

Fungsi SSID:
- Dipake sebagai salt di proses kriptografi
- Bikin PMK yang unik (beda-beda) buat tiap jaringan

Makanya:
> Walaupun passwordnya sama, kalo SSID-nya beda maka ngehasilin PMK yang beda.

### 3. PMK (Pairwise Master Key)
PMK adalah kunci inti (kalo di tim bola ibaratnya dia itu kaptennya).

Cara bikin PMK:
- PMK dibikin dari password Wi-Fi yang digabungin sama SSID
- Terus diproses secara kriptografi pake:
  - Fungsi: PBKDF2-HMAC-SHA1
  - 4096 iterasi
  - Outputnya 256-bit (32 byte)

PMK ini:
- Kaga dikirim ke jaringan
- Kaga keliatan di handshake
- Jadi bahan buat bikin kunci yang lain

### 4. Nonce (ANonce & SNonce)
Nonce adalah angka acak sekali pake.

ANonce:
- Dibikin sama AP
- Dikirim di Message 1

SNonce:
- Dibikin sama client
- Dikirim di Message 2

Fungsi Nonce:
- Bikin kunci yang unik buat tiap koneksi
- Biar kaga bisa di-replay attack
- Biar kaga bisa pake kunci lama

### 5. PTK (Pairwise Transient Key)
PTK adalah kunci utama buat komunikasi client sama AP.

PTK dibikin dari:
- PMK
- ANonce
- SNonce
- MAC Address AP
- MAC Address client

PTK ini:
- Unik per client
- Unik per session
- Dipake buat enkripsi data sama bikin MIC

### 6. Sub-Key di Dalam PTK
PTK bukan satu kunci doang, tapi dipecah jadi beberapa bagian kunci:

#### 1. KCK (Key Confirmation Key)
Dipake buat:
- Bikin & verifikasi MIC

Ini kunci yang:
- Ngebuktiin password bener

#### 2. KEK (Key Encryption Key)
Dipake buat:
- Ngenkripsi GTK

Supaya GTK kaga bocor di udara.

#### 3. TK (Temporal Key)
Dipake buat:
- Enkripsi data user

Ini yang bener-bener dipake pas internetan.

### 7. MIC (Message Integrity Check)
MIC itu bukan kunci, tapi hasil perhitungan kriptografi.

MIC ini:
- Dibikin pake KCK
- Dipake buat ngebuktiin kunci bener
- Ngecek data handshake kaga diubah

MIC ada di:
- Message 2 (dibikin client)
- Message 3 (dibikin AP)

### 8. GTK (Group Temporal Key)
GTK adalah kunci buat:
- Broadcast
- Multicast
- (ARP, beacon, dll)

Ciri GTK:
- Sama buat semua client di 1 AP
- Dikirim di Message 3
- Dienkripsi pake KEK

---

## Gambaran Alur Komponen

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

---

## Apa Itu 4-Way Handshake?
4-Way Handshake adalah proses kriptografi yang kejadian abis perangkat client udah konek sama AP. 

Tujuannya:
- Bikin Pairwise Transient Key (PTK) yang unik buat setiap sesi koneksinya

## Tahapan 4-Way Handshake

### 1. Message 1 (AP ke Client)
Di tahap awal ini, AP ngirim ANonce ke client.

Penjelasan:
- ANonce = angka acak yang dibikin sama AP
- Tujuannya buat bahan bikin kunci enkripsi yang unik
- Di tahap ini belon ada proses enkripsi data, cuma tukeran bahan kunci doang

### 2. Message 2 (Client ke AP)
Client nerima ANonce dari AP, terus dia:
1. Ngebikin SNonce
2. Ngitung PTK 
3. Ngitung MIC pake KCK
4. Ngirim SNonce sama MIC

> [!IMPORTANT]
> Client ngirim MIC buat ngebuktiin ke AP kalo dia punya PMK yang bener, yang artinya password Wi-Fi yang dipake juga bener.

### 3. Message 3 (AP ke Client)
AP nerima SNonce dari client, terus:
1. AP ngitung PTK pake rumus yang sama
2. AP ngecek MIC yang dikirim sama client

Kalo MIC valid:
- Artinya password client itu bener
- AP lanjut ngirim:
  - GTK
  - GTK ini dienkripsi pake KEK
  - Disertai MIC lagi buat validasi

### 4. Message 4 (Client ke AP)
Client terus:
1. Nerima GTK dari AP
2. Ngecek MIC dari AP

Kalo semuanya bener:
- Client ngirim ACK (konfirmasi akhir) ke AP

Abis ini:
- 4-Way Handshake kelar
- Komunikasi data mulai:
  - Full terenkripsi
  - Pake PTK yang unik (beda-beda) buat tiap-tiap client

## Diagram Alur 4-Way Handshake

```
AP                                    Client
│                                        │
│────-──── Message 1: ANonce ───────────>│
│                                        │
│                                    (Bikin SNonce)
│                                    (Ngitung PTK)
│                                    (Ngitung MIC)
│                                        │
│<────── Message 2: SNonce + MIC ──-─────│
│                                        │
│ (Ngitung PTK)                          │
│ (Verifikasi MIC)                       │
│                                        │
│──────── Message 3: GTK + MIC ─────────>│
│                                        │
│                                    (Verifikasi MIC)
│                                    (Simpen GTK)
│                                        │
│<──────── Message 4: ACK ───────────────│
│                                        │
│ Koneksi Aman Udah Jadi                 │
│ Komunikasi Terenkripsi                 │
│                                        │
```

---

## Keamanan 4-Way Handshake

Kelebihan:
- Kaga ada transmisi password secara langsung
- PTK unik buat tiap sesi
- MIC mastiin keaslian data
- Nyegah replay attack pake nonce

Potensi Kelemahan:
- Rentan sama brute force kalo password lemah
- KRACK attack (Key Reinstallation Attack) kalo firmare nya belom diupdate
- Deauthentication attack buat maksa handshake ulang

## Kesimpulan

4-Way Handshake adalah proses yang penting banget buat keamanan Wi-Fi. 

Proses ini memastiin:
1. Client punya password yang bener
2. Komunikasi terenkripsi pake kunci yang unik
3. Data kaga bisa diubah atau di-replay sama pihak ketiga

Dengan ngerti proses ini, kita jadi lebih paham gimana Wi-Fi ngelindungin komunikasi kita dan pentingnya pake password yang kuat.
