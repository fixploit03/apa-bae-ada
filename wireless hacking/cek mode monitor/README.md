# Cek Mode yang Didukung Adapter Wi-Fi

## Bahan-Bahan
- PC/Laptop
- OS Linux
- Adapter Wi-Fi 
- Aircrack-NG suite
- iw
- Koneksi internet

## Instal Tools

```
sudo apt-get update
sudo apt-get install iw aircrack-ng
```

## Langkah-Langkah

#### 1. Cek Interface

```
iw dev
```

#### 2. Cek Mode yang Didukung

```
iw list | grep -A 8 "Supported interface modes"
```

Output:

```
Supported interface modes:
         * IBSS
         * managed
         * AP
         * AP/VLAN
         * monitor
```

Kalo ada output `AP` sama `monitor`, itu artinya adapter Wi-Fi support mode AP sama monitor.

#### 3. Cek Kemampuan Packet Injection

```
sudo airmon-ng check kill
sudo airmon-ng start [interface]
sudo aireplay-ng --test [interface]
```

Output:

```
01:17:43  Trying broadcast probe requests...
01:17:43  Injection is working!
01:17:45  Found 1 AP 

01:17:45  Trying directed probe requests...
01:17:45  48:A9:8A:2C:FC:E3 - channel: 11 - 'LATIHAN'
01:17:47  Ping (min/avg/max): 10.364ms/65.150ms/78.640ms Power: -33.00
01:17:47  30/30: 100%
```

Kalo ada output `Injection is working!`, itu artinya adapter Wi-Fi support packet injection.
