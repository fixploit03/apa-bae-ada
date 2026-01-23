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
