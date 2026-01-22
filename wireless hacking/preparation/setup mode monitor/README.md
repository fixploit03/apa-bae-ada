# Setup Mode Monitor

## Langkah-Langkah

#### 1. Cek Interface

```
iwconfig [interface]
```

Output:

```
wlan0     IEEE 802.11  ESSID:off/any  
          Mode:Managed  Access Point: Not-Associated   Tx-Power=20 dBm   
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Power Management:on
```

Buat tau adapter kita sedang dalam mode apa, liat di bagian `Mode`. Dari output di atas artinya adapter kita sedang dalam mode `Managed`.

> [!NOTE]
> Mode `Managed` kaga bisa di pake buat nyerang. Kalo mau nyerang harus ngaktifin mode monitor dulu.

#### 2. Aktifin Mode Monitor

```
sudo airmon-ng check kill
sudo airmon-ng start [interface]
```

#### 3. Cek Perubahan

```
iwconfig [interface]
```

Output:

```
wlan0     IEEE 802.11  Mode:Monitor  Frequency:2.462 GHz  Tx-Power=20 dBm   
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Power Management:on
```

Nah, dari output di atas adapter udah dalam mode `Monitor`. Ini bisa di pake buat nyerang.

#### 4. Balikin Mode Monitor

Kalo mode monitor udah kaga kepake lagi, harus di balikin ke mode `Managed`, biar bisa internetan lagi.

```
sudo airmon-ng stop [interface]
sudo systemctl restart NetworkManager
```

Kalo cara di atas kaga bisa pake ini:

```
sudo ip l set [interface] down
sudo iw dev [interface] set type managed
sudo ip l set [interface] up
sudo systemctl restart NetworkManager
```
