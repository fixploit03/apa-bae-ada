# Linux Headers 6.16.8

## Cara Instal

#### 1. Cek Versi Kernel yang Lagi Dipake

```
uname -r
```

Output:

```
6.16.8+kali-amd64
```

> [!NOTE]
> Pastiin versi kernel sama persis sama Linux Headers yang mau lu install. Kalo beda, biasanya build driver bakal gagal.

#### 2. Instal Linux Headers

```
sudo dpkg -i *.deb
sudo apt-get -f install
```

#### 3. Verifikasi Instalasi

```
ls /lib/modules/$(uname -r)/build
```

Output:

```
arch  include  Makefile  Module.symvers  scripts  tools  vmlinux
```
