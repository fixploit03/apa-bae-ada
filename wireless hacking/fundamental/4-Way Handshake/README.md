# 4-Way Handshake

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Handshake%20%26%20Proses%20Koneksi%20Wi-Fi/img/handshake.png" width="50%"/>
</div>

## Apa Itu 4-Way Handshake?
4-Way Handshake adalah proses tuker-tukeran 4 paket (frame) antara client sama AP yang kejadi pas waktu client mau konek ke Wi-Fi WPA/WPA2.

## Tujuan 4-Way Handshake
- Buat ngecek kalo client punya password yang bener
- Buat ngebikin kunci enkripsi buat ngamanin komunikasi antara client sama AP.

## Komponen-Komponen di 4-Way Handshake

### 1. PSK (Password Wi-Fi)
Ini bahan paling dasar buat ngitung PMK.

> [!NOTE]
> Panjang password Wi-Fi:
> - ASCII: 8-63 karakter
> - Hex: 64 karakter

### 2. SSID (Nama Wi-Fi)
SSID juga dipake buat dijadiin bahan buat ngitung PMK.

Fungsi SSID:
- Dipake sebagai salt di proses kriptografi
- Bikin PMK yang unik (beda-beda) buat tiap jaringan

Makanya:
> Bagen passwordnya sama, kalo SSID nya beda maka bakal ngehasilin PMK yang beda.

### 3. PMK

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Handshake%20%26%20Proses%20Koneksi%20Wi-Fi/img/pmk.png" width="50%"/>
</div>

PMK (Pairwise Master Key) adalah kunci inti yang jadi bahan dasar buat ngitung kunci-kunci turunan yang lain.

#### Rumus Ngitung PMK Wi-Fi WPA/WPA2-PSK

```
PMK = PBKDF2(HMAC−SHA1, PSK, SSID, 4096, 256)
```

Keterangan:
- `PBKDF2-HMAC-SHA1`: Fungsi kriptografi yang dipake
- `PSK`: Password Wi-Fi
- `SSID`: Nama Wi-Fi
- `4096`: Jumlah iterasi (proses ngulang)
- `256`: Hasil output (dalam bentuk bit)

#### Rumus Ngitung PMK Wi-Fi WPA/WPA2-Enterprise

```
PMK = MSK[0..255 bit]
```

Keterangan:
- `MSK`: Master Session Key yang dihasilin dari proses autentikasi EAP (EAP-PEAP, EAP-TTLS- EAP-TLS)
- `0..255 bit` : Hasil output PMK 256 bit pertama dari MSK

> [!NOTE]
> - PMK kaga dipake buat ngenkripsi data, yang dipake buat ngenkripsi data itu kunci turunannya.
> - Tiap jenis Wi-Fi cara bikinnya beda-beda.
> - PMK kaga pernah dikirim di udara, cuma diitung di sisi AP sama client.

### 4. Nonce
Nonce adalah angka acak yang dipake di proses 4-Way Handshake buat ngebantu ngebentuk kunci enkripsi yang lain.

Di Wi-Fi ada dua macem jenis Nonce:
- `ANonce`: Angka acak yang dibikin sama AP
- `SNonce`: Angka acak yang dibikin sama client (STA)

### 5. PTK
PTK (Pairwise Transient Key) adalah kunci turunan dari PMK yang dipake buat ngamanin komunikasi unicast antara client sama AP di jaringan Wi-Fi. 

> [!NOTE]
> Rumus buat ngitung PTK di Wi-Fi WPA/WPA2-PSK sama WPA/WPA2-Enterprise itu sama aja, yang beda cuma pas di cara ngitung PMK nya aja.

#### Cara Ngitung PTK

Rumus:

```
PTK = PRF(PMK, "Pairwise key expansion", Min(AP_MAC, Client_MAC) || Max(AP_MAC, Client_MAC) || Min(ANonce, SNonce) || Max(ANonce, SNonce))
```

Keterangan:
- `PRF (Pseudo-Random Function)`: Fungsi kriptografi yang dipake
- `PMK`: Hasil ngitung PMK
- `"Pairwise key expansion"`: Label yang dipake buat jadi bahan input fungsi PRF
- `Min(AP_MAC, Client_MAC)`: MAC address AP yang nilainya lebih kecil dari MAC address client
- `Max(AP_MAC, Client_MAC)`: MAC address client yang nilainya lebih gede dari MAC address AP
- `Min(ANonce, SNonce)`: Nonce dari AP kalo kaga dari client yang nilainya lebih kecil
- `Max(ANonce, SNonce)`: Nonce dari AP kalo kaga dari client yang nilainya lebih gede
  
#### Kunci Turunan PTK

PTK dibagi jadi beberapa kunci:

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Handshake%20%26%20Proses%20Koneksi%20Wi-Fi/img/pmk.png" width="50%"/>
</div>

1. **KCK (Key Confirmation Key)**
   - Ukuran Kunci: 128 bit
   - Fungsi: buat ngitung MIC, ngecek data handshake masih asli apa kaga
2. **KEK (Key Encryption Key)**
   - Ukuran Kunci: 128 bit
   - Fungsi: buat ngamanin GTK pas GTK dikirim dari AP ke client
4. **TK (Temporal Key)**
   - Ukuran Kunci: 128 bit
   - Fungsi: buat ngenkripsi data unicast antara client sama AP
5. **MIC keys**
   - Ukuran Kunci: 128 bit
   - Fungsi: buat ngamanin paket data di TKIP

#### Total Kunci PTK
- **CCMP:** 384 bit = KCK + KEK + TK
- **TKIP:** 512 bit = KCK + KEK + TK + MIC keys

> [!NOTE]
> PTK sifatnya unik per sesi sama dibikin ulang setiap kali client reconnect.

### 6. MIC 
MIC (Message Integrity Check) adalah hasil ngitung proses kriptografi yang dipake buat ngecek data di proses 4-Way Handshake masih asli apa kaga, biar data yang dikirim kaga bisa diubah di tengah jalan.

### 7. GTK
GTK (Group Temporal Key) adalah kunci yang dipake buat ngenkripsi traffic broadcast (data ke semua client) sama multicast (data ke beberapa client) di jaringan Wi-Fi, kaya ARP, DHCP, sama mDNS, yang dikirim dari AP ke banyak client sekaligus.

## Gambaran Proses 4-Way Handshake

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

## Tahapan 4-Way Handshake

### 1. Message 1 (AP ke Client)

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Handshake%20%26%20Proses%20Koneksi%20Wi-Fi/img/m1.png" width="50%"/>
</div>

Di tahap awal ini AP udah punya PMK, terus dia:
- Bikin ANonce
- Ngirim ANonce ke client.

### 2. Message 2 (Client ke AP)

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Handshake%20%26%20Proses%20Koneksi%20Wi-Fi/img/m2.png" width="50%"/>
</div>

Client nerima ANonce dari AP, terus dia:
1. Pake PMK yang udah dia punya sebelumnya
2. Bikin SNonce
3. Ngitung PTK 
4. Ngitung MIC
5. Ngirim SNonce sama MIC ke AP

> [!NOTE]
> Client ngirim MIC buat ngebuktiin ke AP kalo dia punya PMK yang bener, yang artinya password Wi-Fi yang dia pake itu bener, karena PMK dapetnya dari password Wi-Fi sama SSID.

### 3. Message 3 (AP ke Client)

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Handshake%20%26%20Proses%20Koneksi%20Wi-Fi/img/m3.png" width="50%"/>
</div>

AP nerima SNonce dari client, terus dia:
- Ngitung PTK
- Ngecek MIC yang dikirim sama client

Kalo MIC nya bener:
- Artinya password yang dipake sama client itu bener
- AP lanjut:
  - Ngirim GTK (yang udah diencrypt)
  - Ngirim MIC
  - Ngasih tau client buat nginstal kunci.

### 4. Message 4 (Client ke AP)

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/Handshake%20%26%20Proses%20Koneksi%20Wi-Fi/img/m4.png" width="50%"/>
</div>

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

## Intinya
4-Way Handshake itu proses yang paling penting buat keamanan Wi-Fi. 

Proses ini buat mastiin:
1. Client punya password yang bener
2. Komunikasi keenkripsi pake kunci yang unik
3. Data kaga bisa diubah atau direplay sama penyerang
