# Netdiscover

Netdiscover adalah tool yang digunakan untuk menemukan host yang aktif di dalam sebuah jaringan lokal (LAN).

## Cara Instal

```
sudo apt-get install netdiscover
```

## Cara Menggunakan

```
sudo netdiscover -i [interface] -r [ip_range]
```

Contoh:

```
sudo netdiscover -i eth0 -r 192.168.1.1/24
```
