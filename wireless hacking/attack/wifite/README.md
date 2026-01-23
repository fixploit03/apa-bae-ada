# Hack Wi-Fi Secara Otomatis (Wifite)

## Bahan-Bahan
- PC/Laptop
- OS Linux
- Adapter Wi-Fi (support mode monitor)
- Wifite
- Koneksi internet

## Instal Tools

```
sudo apt-get update
sudo apt-get install wifite python3 wireless-tools net-tools aircrack-ng tshark reaver bully cowpatty hashcat hashcat-data john john-data hcxdumptool hcxtools
```

## Langkah-Langkah

#### 1. Aktifin Mode Monitor

```
sudo airmon-ng check kill
sudo airmon-ng start [interface]
```

#### 2. Scan Wi-Fi

```
sudo wifite
```

![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/wifite/img/1.png)

Wifite bakal secara otomatis ngescan semua jenis Wi-Fi yang ada di sekitar. Kalo target Wi-Fi yang lu cari udah ketemu, teken `CTRL+C` buat stop proses scanning nya.

#### 3. Pilih Target yang Mau Diserang

![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/wifite/img/2.png)

Masukin nomor target AP yang mau diserang, nomornya ada di kolom `NUM`.

#### 4. Wifite Pertama Kali Bakal Nyoba Nyerang Lewat WPS

![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/wifite/img/4.png)

Wifite bakal nyoba semua jenis serangan WPS:
- Pixie Dust Attack
- NULL PIN Attack
- PIN Brute Force Attack

> [!NOTE]
> Kaga semua device rentan sama semua jenis serangan WPS di atas, kemungkinan serangannya bakalan gagal.
  
Dari output gambar di atas, Wifite gagal nyerang lewat WPS.

#### 5. Kalo Serangan Lewat WPS Gagal, Wifite Bakal Nyoba Nyerang Lewat PMKID

![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/wifite/img/4.png)

Buat nyerang lewat PMKID, Wifite ngasih timeout (waktu nyoba) sekitar 5 menitan buat ngecapture PMKID nya.

> [!NOTE]
> Kaga semua AP ngedukung PMKID. Kemungkinan serangannya bakalan gagal. Kalo timeout nya udah lewat sekitar 1 menitan ke atas, teken `CTRL+C` aja, terus teken `C` buat ngelanjutin ke serangan berikutnya.

#### 6. Kalo Serangan Lewat PMKID Gagal, Wifite Bakal Nyoba Nyerang Lewat Handshake

![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/wifite/img/3.png)

Wifite bakal secara otomatis ngecapture 4-way handshake sama deauth client. Kita tinggal nunggu aja sampai 4-way handshake nya dapet.

#### 7. Crack Password Wi-Fi

![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/wifite/img/5.png)

Wifite bakal secara otomatis ngecrack password Wi-Fi kalo 4-way handshake nya udah dapet, pake `aircrack-ng` terus wordlist nya pake wordlist bawaan `wordlist-probable.txt`.

#### 8. Lihat Hasil Crack

```
cat cracked.json
```

![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/wifite/img/6.png)

Wifite bakal nyimpen password Wi-Fi yang udah berhasil dia crack ke file `cracked.json`.

Password Wi-Fi: `12345678`
