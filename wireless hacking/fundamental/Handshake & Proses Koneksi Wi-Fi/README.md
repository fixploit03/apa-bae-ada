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
> Bagen passwordnya sama, kalo SSID nya beda maka bakal ngehasilin PMK yang beda.

### 3. PMK

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Handshake%20%26%20Proses%20Koneksi%20Wi-Fi/img/pmk.png" width="50%"/>
</div>

PMK (Pairwise Master Key) adalah kunci utama yang jadi bahan dasar buat ngitung kunci-kunci turunan yang lain di jaringan Wi-Fi, khususnya di proses 4-Way Handshake.

> [!NOTE]
> PMK kaga dipake buat ngenkripsi data, yang dipake buat ngenkripsi data itu kunci turunannya.

Cara ngitung PMK:
- PMK dihasilin dari password Wi-Fi yang digabungin sama SSID
- Terus diproses secara kriptografi pake:
  - Fungsi: PBKDF2-HMAC-SHA1
  - 4096 iterasi
  - Outputnya 256-bit (32 byte)

Ciri-cirinya:
- PMK jadi kunci inti di proses 4-Way Handshake
- PMK dipake bareng ANonce sama SNonce buat ngitung PTK
- PMK kaga pernah dikirim lewat udara, cuma diitung di sisi AP sama client

### 4. Nonce
Nonce adalah angka acak yang dipake di proses 4-Way Handshake buat ngebantu ngebentuk kunci enkripsi, biar tiap koneksi Wi-Fi hasilnya beda-beda sama kaga bisa direplay (dipake ulang).

Di Wi-Fi ada dua macem Nonce:
- ANonce (Authenticator Nonce): angka acak yang dibikin sama AP
- SNonce (Station Nonce): angka acak yang dibikin sama client (STA)

Ciri-cirinya:
- Nonce sifatnya unik (beda-beda) di tiap koneksi
- Nonce dipake bareng sama PMK buat ngitung PTK
- ANonce ada di Message 1
- SNonce ada di Message 2

### 5. PTK

PTK (Pairwise Transient Key) adalah kunci sementara yang dipake buat ngamanin komunikasi unicast antara client sama AP di jaringan Wi-Fi. PTK ini dipake buat ngenkripsi data user abis proses 4-Way Handshake kelar.

Ciri-cirinya:
- PTK diitung dari:
  - PMK
  - ANonce
  - SNonce
  - MAC address AP
  - MAC address client
- PTK dibagi jadi beberapa kunci:
  - KCK: buat ngitung MIC, ngecek data handshake masih asli apa kaga
  - KEK: buat ngamanin GTK pas GTK dikirim dari AP ke client
  - TK: buat ngenkripsi data unicast antara client sama AP

### 6. MIC 
MIC (Message Integrity Check) adalah hasil ngitung kriptografi yang dipake buat ngecek data di proses 4-Way Handshake masih asli apa kaga, biar data yang dikirim kaga bisa diubah di tengah jalan.

Ciri-cirinya:
- Diitung pake KCK
- Dipake buat ngebuktiin password yang dipake itu bener
- Ada di Message 2
- Ada di Message 3

### 7. GTK
GTK (Group Temporal Key) adalah kunci yang dipake buat ngenkripsi traffic broadcast (data ke semua client) sama multicast (data ke beberapa client) di jaringan Wi-Fi, kaya ARP, DHCP, sama mDNS, yang dikirim dari AP ke banyak client sekaligus.

Ciri-cirinya:
- Sama buat semua client yang kehubung ke satu AP
- Dienkripsi pake KEK supaya GTK kaga bisa disadap di udara
- Ada di Message 3

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

## Apa Itu 4-Way Handshake?
4-Way Handshake adalah proses konek sama ngebikin kunci enkripsi antara AP sama client pas pertama kali nyambung ke jaringan Wi-Fi (WPA/WPA2/WPA3-Personal).

## Tahapan 4-Way Handshake

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Handshake%20%26%20Proses%20Koneksi%20Wi-Fi/img/handshake.png" width="50%"/>
</div>

### 1. Message 1 (AP ke Client)
Di tahap awal ini AP udah punya PMK, terus dia:
- Bikin ANonce
- Ngirim ANonce ke client.

### 2. Message 2 (Client ke AP)
Client nerima ANonce dari AP, terus dia:
1. Ngitung PMK
2. Bikin SNonce
3. Ngitung PTK 
4. Ngitung MIC
5. Ngirim SNonce sama MIC ke AP

> [!NOTE]
> Client ngirim MIC buat ngebuktiin ke AP kalo dia punya PMK yang bener, yang artinya password Wi-Fi yang dia pake itu bener, karena PMK dapetnya dari password Wi-Fi sama SSID.

### 3. Message 3 (AP ke Client)
AP nerima SNonce dari client, terus dia:
- Ngitung PTK
- Bikin GTK
- Ngecek MIC yang dikirim sama client

Kalo MIC nya bener:
- Artinya password yang dipake sama client itu bener
- AP lanjut ngirim:
  - GTK (yang udah diencrypt)
  - MIC

### 4. Message 4 (Client ke AP)
Client:
- Nerima GTK dari AP
- Ngecek MIC dari AP
- Nginstal PTK sama GTK

Kalo semuanya bener:
- Client ngirim ACK (konfirmasi akhir) ke AP

> [!NOTE]
> Abis ACK dikirim sama client, AP jadi tau kalo client udah kelar nginstal PTK sama GTK, terus koneksinya udah siap dipake buat komunikasi yang aman (keenkripsi).

## Keamanan 4-Way Handshake
Kelebihan:
- Kaga ada transmisi password secara langsung di udara
- PTK sifatnya unik buat tiap sesi
- MIC buat mastiin keaslian data
- Nyegah replay attack pake nonce (angka acak)

Potensi Kelemahan:
- Rentan sama serangan offline (kalo passwordnya lemah)
- Rentan sama KRACK attack (Key Reinstallation Attack) kalo firmwarenya kaga diupdate
- Deauth attack buat dapetin handshake

## Kesimpulan
4-Way Handshake itu proses yang paling penting buat keamanan Wi-Fi. 

Proses ini buat mastiin:
1. Client punya password yang bener
2. Komunikasi keenkripsi pake kunci yang unik
3. Data kaga bisa diubah atau direplay sama penyerang
