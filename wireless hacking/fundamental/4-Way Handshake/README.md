Di materi ini, gw bakal ngebahas tentang proses 4-Way Handshake yang ada di jaringan Wi-Fi.

# 4-Way Handshake

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/4-Way%20Handshake/img/tangan.png" width="50%"/>
</div>

## Apa Itu 4-Way Handshake?
4-Way Handshake adalah proses tuker-tukeran 4 paket (frame) antara client sama AP yang kejadi pas waktu client mau konek ke Wi-Fi WPA/WPA2.

## Tujuan 4-Way Handshake
- Buat ngecek kalo client punya password yang bener
- Buat ngebikin kunci enkripsi buat ngamanin komunikasi antara client sama AP

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
> Bagen passwordnya sama, kalo SSID nya beda maka bakal ngehasilin PMK yang beda juga.

### 3. PMK

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/4-Way%20Handshake/img/pmk.png" width="50%"/>
</div>

PMK (Pairwise Master Key) adalah kunci inti yang jadi bahan dasar buat ngitung kunci-kunci turunan yang lain.

> [!NOTE]
> - PMK kaga dipake buat ngenkripsi data, yang dipake buat ngenkripsi data itu kunci turunannya.
> - Tiap jenis Wi-Fi cara bikinnya beda-beda.
> - PMK kaga pernah dikirim di udara, cuma diitung di sisi AP sama client.

#### Rumus Ngitung PMK Wi-Fi WPA/WPA2-PSK

```
PMK = PBKDF2(HMAC−SHA1, PSK, SSID, 4096, 256)
```

Keterangan:
- `PBKDF2`: Fungsi kriptografi yang dipake
- `HMAC−SHA1`: Algoritma hash yang dipake
- `PSK`: Password Wi-Fi
- `SSID`: Nama Wi-Fi
- `4096`: Jumlah iterasi (proses ngulang)
- `256`: Hasil output (dalam bentuk bit)

#### Rumus Ngitung PMK Wi-Fi WPA/WPA2-Enterprise

```
PMK = MSK[0..255 bit]
```

Keterangan:
- `MSK`: Master Session Key yang dihasilin dari proses autentikasi EAP (EAP-PEAP, EAP-TTLS, EAP-TLS)
- `0..255 bit` : Hasil output PMK 256 bit pertama dari MSK

### 4. Nonce
Nonce adalah angka acak yang dipake di proses 4-Way Handshake buat ngebantu ngebentuk kunci enkripsi yang lain.

Di Wi-Fi ada dua macem jenis Nonce:
- `ANonce`: Angka acak yang dibikin sama AP
- `SNonce`: Angka acak yang dibikin sama client (STA)

### 5. PTK
PTK (Pairwise Transient Key) adalah kunci turunan dari PMK yang dipake buat ngamanin komunikasi unicast antara client sama AP di jaringan Wi-Fi. 

> [!NOTE]
> Rumus buat ngitung PTK di Wi-Fi WPA/WPA2-PSK sama WPA/WPA2-Enterprise itu sama aja, yang beda cuma pas di cara ngitung PMK nya aja.

#### Rumus Ngitung PTK

```
PTK = PRF(PMK, "Pairwise key expansion", Min(AP_MAC, Client_MAC) || Max(AP_MAC, Client_MAC) || Min(ANonce, SNonce) || Max(ANonce, SNonce))
```

Keterangan:
- `PRF (Pseudo-Random Function)`: Fungsi kriptografi yang dipake
- `PMK`: Hasil ngitung PMK
- `"Pairwise key expansion"`: Label yang dipake buat jadi bahan input fungsi PRF
- `Min(AP_MAC, Client_MAC)`: MAC address yang nilainya lebih kecil (bisa dari AP atau client)
- `Max(AP_MAC, Client_MAC)`: MAC address yang nilainya lebih gede (bisa dari AP atau client)
- `Min(ANonce, SNonce)`: Nonce yang nilainya lebih kecil (bisa dari ANonce atau SNonce)
- `Max(ANonce, SNonce)`: Nonce yang nilainya lebih gede (bisa dari ANonce atau SNonce)

> [!NOTE]
> - Cara buat nentuin mana yang lebih gede mana yang lebih kecil itu diliat dari nilai hex nya.
> - Caranya: dibandingin byte per byte dari kiri ke kanan.
> - Contoh: `00:11:22:33:44:55` lebih kecil dari `AA:BB:CC:DD:EE:FF` soalnya byte pertamamya `00` < `AA`.


#### Kunci Turunan PTK

PTK dibagi jadi beberapa kunci:

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/4-Way%20Handshake/img/pmk.png" width="50%"/>
</div>

1. **KCK (Key Confirmation Key)**
   - Ukuran Kunci: 128 bit
   - Fungsi: buat ngitung MIC, ngecek data handshake masih asli apa kaga
2. **KEK (Key Encryption Key)**
   - Ukuran Kunci: 128 bit
   - Fungsi: buat ngamanin GTK pas GTK dikirim dari AP ke client
3. **TK (Temporal Key)**
   - Ukuran Kunci: 128 bit
   - Fungsi: buat ngenkripsi data unicast antara client sama AP
4. **MIC keys**
   - Ukuran Kunci: 128 bit
   - Fungsi: buat ngamanin paket data di TKIP

#### Total Kunci PTK
- **CCMP:** 384 bit = KCK + KEK + TK
- **TKIP:** 512 bit = KCK + KEK + TK + MIC keys

> [!NOTE]
> PTK sifatnya unik per sesi sama dibikin ulang setiap kali client reconnect.

### 6. MIC 
MIC (Message Integrity Check) adalah hasil ngitung proses kriptografi yang dipake buat ngecek data di proses 4-Way Handshake masih asli apa kaga, biar data yang dikirim kaga bisa diubah di tengah jalan.

#### Rumus Ngitung MIC

```
MIC = HMAC-SHA1(KCK, Data_Paket_Handshake)
```

Keterangan:
- `HMAC-SHA1`: Algoritma hash yang dipake
- `KCK`: Kunci KCK (128 bit pertama dari PTK)
- `Data_Paket_Handshake`: Frame EAPOL-Key (yang udah MIC nya di zero kan)
- `Output`: 160 bit (20 byte)
- `MIC`: 128 bit pertama dari output

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

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/4-Way%20Handshake/img/handshake.png" width="50%"/>
</div>

### 1. Message 1 (AP ke Client)

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/4-Way%20Handshake/img/m1.png" width="50%"/>
</div>

Di tahap awal ini AP:
- Bikin ANonce
- Ngirim ANonce ke client.

> [!NOTE]
> Tujuan AP ngirim ANonce ke client adalah buat ngebantu client ngebikin kunci enkripsi yang lain.

### 2. Message 2 (Client ke AP)

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/4-Way%20Handshake/img/m2.png" width="50%"/>
</div>

Client nerima ANonce dari AP, terus dia:
1. Bikin SNonce
2. Ngitung PTK 
3. Ngitung MIC
4. Ngirim SNonce sama MIC ke AP

> [!NOTE]
> Tujuan client ngirim MIC ke AP adalah buat ngebuktiin kalo dia punya PMK yang bener.

### 3. Message 3 (AP ke Client)

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/4-Way%20Handshake/img/m3.png" width="50%"/>
</div>

AP nerima SNonce dari client, terus dia:
- Ngitung PTK
- Ngecek MIC yang dikirim sama client

Kalo MIC nya bener:
- Artinya password yang dipake sama client bener
- AP lanjut:
  - Ngirim GTK (yang udah keenkripsi)
  - Ngirim MIC
  - Ngasih tau client buat nginstal kunci

> [!NOTE]
> Tujuan AP ngirim GTK sama MIC ke client adalah buat nyegah data yang dikirim di udara biar kaga bisa disadap atau dimodifikasi.

### 4. Message 4 (Client ke AP)

<div align="center">
  <img src="https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/fundamental/4-Way%20Handshake/img/m4.png" width="50%"/>
</div>

Abis itu client:
- Nerima GTK dari AP
- Ngecek MIC dari AP
- Nginstal PTK sama GTK

Kalo semuanya bener:
- Client ngirim ACK (konfirmasi akhir) ke AP

> [!NOTE]
> Abis ACK dikirim sama client, AP jadi tau kalo client udah kelar nginstal PTK sama GTK, terus koneksinya udah siap dipake buat komunikasi yang aman (keenkripsi).

## Keamanan 4-Way Handshake
**Kelebihan:**
- Password kaga dikirim langsung lewat udara
- PTK sifatnya unik buat tiap sesi
- MIC buat mastiin keaslian data
- Nyegah replay attack pake nonce

**Kelemahan:**
- Rawan sama offline attack (kalo passwordnya gampang ditebak)
- Rawan sama deauth attack (kalo kaga ngaktifin PMF)
- Rawan sama KRACK attack (kalo firmwarenya kaga diupdate)

## Kesimpulan
Intinya, 4-Way Handshake itu proses yang paling penting buat keamanan Wi-Fi. 

Proses ini buat mastiin:
1. Client punya password yang bener
2. Komunikasi keenkripsi pake kunci yang unik (beda-beda)
3. Data kaga bisa disadap atau dimodifikasi
