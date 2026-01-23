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
