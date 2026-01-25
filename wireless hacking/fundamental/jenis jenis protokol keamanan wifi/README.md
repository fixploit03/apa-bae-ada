# Protokol Keamanan Wi-Fi

Sebelum masuk ke wireless hacking, penting juga buat ngerti jenis‑jenis protokol keamanan Wi‑Fi yang biasa dipake. Biar lu bisa tau mana jaringan yang gampang dibobol, mana yang lumayan aman, sama mana yang paling susah buat dibobol. Nah, di sini lu bakal kenalan sama jenis-jenis protokol keamanan Wi‑Fi yang sering ditemuin di lapangan.

## Jenis-Jenis Protokol Keamanan Wi-Fi

### 1. Open (Kaga Pake Password)
- Ciri-cirinya:
  - Kaga pake password, semua orang bisa konek.
  - Biasanya ada di Wi-Fi publik kaya di kafe kalo kaga di mall.
- Kekurangannya:
  - Semua data yang lewat bisa disadap.
  - Paling kaga aman kalo dipake buat transaksi yang sifatnya sensitif.
 
### 2. WEP (Wired Equivalent Privacy)
- Tahun: 1997
- Ciri-cirinya:
  - Pake enkripsi RC4.
  - Kunci bisa 64-bit kalo kaga 128-bit.
- Kekurangannya:
  - Cepet banget dibobol.
  - Kaga aman buat dipake di jaringan modern.

Kapan ketemunya sama modelan yang kaya gini?: Biasanya cuma ada di AP jadul atau jaringan yang kaga diupdate.

> [!NOTE]
> Jangan pake WEP buat jaringan penting, pake kalo cuma buat belajar aja.

### 3. WPA (Wi-Fi Protected Access)
- Tahun: 2003
- Ciri-cirinya:
  - Ngegantiin WEP karena kebapukannya.
  - Pake enkripsi TKIP (Temporal Key Integrity Protocol).
  - Lebih aman dari WEP.
- Kekurangannya:
  - Masih bisa dibobol make tools tertentu.

Kapan ketemunya sama modelan yang kaya gini?: Biasanya cuma ada di jaringan rumah pas awal-awal taun 2000-an.

### 4. WPA2
- Tahun: 2004
- Ciri-cirinya:
  - Standar yang paling populer sebelum adanya WPA3.
  - Pake AES (Advanced Encryption Standard) yang jauh lebih kuat buat enkripsinya.
  - Ngedukung WPA2-PSK (personal) sama WPA2-Enterprise (perusahaan, pake server RADIUS).
- Kekurangannya:
  - Bisa kena serangan KRACK (Key Reinstallation Attack) kalo firmwarenya kaga diupdate.
 
Kapan ketemunya sama modelan yang kaya gini?: Biasanya ketemu di hampir semua router modern sebelum taun 2018.

### 5. WPA3
- Tahun: 2018
- Ciri-cirinya:
  - Standar yang paling baru sama yang paling aman buat jaman sekarang.
  - Pake enkripsi yang lebih kuat, namanya SAE (Simultaneous Authentication of Equals) buat Wi-Fi personal.
  - Aman dari yang namanya serangan offline kaya brute force sama dictionary attack.
- Kekurangannya:
  - Masih belum sepamor WPA2, tapi makin kesini makin banyak router terbaru yang ngedukung WPA3.
 
Kapan ketemunya sama modelan yang kaya gini?: Biasanya ada di router baru dari taun 2018 ke atas, tapi sekarang makin banyak router modern yang ngedukung WPA3.

## Kesimpulan
Nah, sekarang lu udah paham kan bedanya protokol-protokol keamanan Wi-Fi dari yang paling gampang buat dibobol sampe yang paling susah? Dari Open yang kalo mau konek kaga pake password, WEP yang udah bapuk, WPA yang udah mulai ketinggalan jaman, WPA2 yang masih jadi standar di mana-mana, sampe WPA3 yang paling aman buat jaringan jaman sekarang.
