# 📝 Catatan Dasar Bash Scripting

Catatan santai buat belajar Bash scripting dari nol. Fokusnya ke hal-hal yang paling sering dipakai buat automasi tugas sehari-hari di terminal.

---

# 1. Struktur Utama & Shebang

Setiap file skrip Bash biasanya diawali dengan baris **shebang**. Baris ini kasih tahu sistem "pakai program apa buat jalanin file ini".

```bash
#!/bin/bash

echo "Halo, ini skrip Bash pertamaku!"
```

Beberapa poin penting:

- `#!/bin/bash` **harus** jadi baris pertama di file (nggak boleh ada spasi/baris kosong sebelumnya).
- Simpan file dengan ekstensi `.sh`, misalnya `skrip.sh` (opsional, tapi jadi standar biar gampang dikenali).

### Cara Menjalankan Skrip

Skrip yang baru dibuat belum tentu punya izin untuk dieksekusi. Cek dulu izinnya:

```bash
ls -l skrip.sh
```

Kalau belum ada `x` (execute) di izinnya, kasih izin eksekusi pakai `chmod`:

```bash
chmod +x skrip.sh
```

Setelah itu, jalankan skripnya dengan:

```bash
./skrip.sh
```

> 💡 **Kenapa harus `./`?**
> Karena folder kerja kita (`.`) biasanya nggak ada di `$PATH`, jadi harus ditunjuk eksplisit lokasi filenya.

---

# 2. Variabel & Input

## 2.1 Menyimpan Data ke Variabel

Di Bash, bikin variabel itu gampang — **tanpa spasi** di sekitar tanda `=`.

```bash
#!/bin/bash

nama="Olan"
umur=25

echo "Nama saya $nama, umur $umur tahun."
```

⚠️ Ini salah (ada spasi di sekitar `=`):

```bash
nama = "Olan"   # ❌ Error!
```

## 2.2 Menerima Input dari User (`read`)

Pakai perintah `read` buat nangkep input yang diketik user.

```bash
#!/bin/bash

echo "Siapa nama kamu?"
read nama

echo "Halo, $nama! Selamat belajar Bash."
```

Bisa juga digabung jadi satu baris pakai flag `-p` (prompt):

```bash
#!/bin/bash

read -p "Masukkan nama folder yang mau dibuat: " nama_folder
echo "Oke, folder '$nama_folder' akan dibuat."
```

---

# 3. Kondisional (If-Else)

Struktur dasar `if` di Bash:

```bash
if [ KONDISI ]; then
    # kode kalau kondisi benar
else
    # kode kalau kondisi salah
fi
```

## Contoh: Mengecek Apakah Folder Sudah Ada

```bash
#!/bin/bash

read -p "Masukkan nama folder: " nama_folder

if [ -d "$nama_folder" ]; then
    echo "Folder '$nama_folder' sudah ada."
else
    mkdir "$nama_folder"
    echo "Folder '$nama_folder' berhasil dibuat."
fi
```

### Beberapa Flag Pengecekan yang Sering Dipakai

| Flag  | Artinya                                          |
| ----- | ------------------------------------------------ |
| `-d`  | Cek apakah itu direktori/folder                  |
| `-f`  | Cek apakah itu file biasa                        |
| `-e`  | Cek apakah file/folder itu ada (apapun jenisnya) |
| `-z`  | Cek apakah string kosong                         |
| `==`  | Bandingkan dua string                            |
| `-eq` | Bandingkan dua angka (equal)                     |

Contoh percabangan lebih dari dua kondisi pakai `elif`:

```bash
#!/bin/bash

read -p "Masukkan angka: " angka

if [ "$angka" -gt 0 ]; then
    echo "Angka positif."
elif [ "$angka" -lt 0 ]; then
    echo "Angka negatif."
else
    echo "Angka nol."
fi
```

---

# 4. Perulangan (Loops)

## 4.1 `for` Loop

Cocok kalau kita sudah tahu daftar/jumlah item yang mau diproses.

```bash
#!/bin/bash

for buah in apel jeruk mangga; do
    echo "Aku suka makan $buah"
done
```

### Contoh Praktis: Memproses Banyak File Sekaligus

```bash
#!/bin/bash

# Ubah semua file .txt di folder ini jadi .bak
for file in *.txt; do
    cp "$file" "$file.bak"
    echo "Backup dibuat untuk: $file"
done
```

## 4.2 `while` Loop

Cocok kalau kondisi berhentinya belum pasti dari awal (loop terus selama kondisi masih benar).

```bash
#!/bin/bash

counter=1

while [ $counter -le 5 ]; do
    echo "Perulangan ke-$counter"
    counter=$((counter + 1))
done
```

### Contoh Praktis: Baca File Baris per Baris

```bash
#!/bin/bash

while read -r baris; do
    echo "Isi baris: $baris"
done < daftar_file.txt
```

---

# 5. Fungsi (Functions)

Fungsi berguna buat membungkus kode yang mau dipakai berulang kali, biar nggak perlu nulis ulang.

## Struktur Dasar

```bash
nama_fungsi() {
    # kode di sini
}
```

## Contoh Sederhana

```bash
#!/bin/bash

sapa() {
    echo "Halo, selamat datang!"
}

# Panggil fungsinya
sapa
```

## Contoh dengan Parameter

Parameter di dalam fungsi diakses lewat `$1`, `$2`, dst (sama seperti argumen skrip).

```bash
#!/bin/bash

buat_folder() {
    nama_folder=$1

    if [ -d "$nama_folder" ]; then
        echo "Folder '$nama_folder' sudah ada."
    else
        mkdir "$nama_folder"
        echo "Folder '$nama_folder' berhasil dibuat."
    fi
}

# Panggil fungsi dengan argumen
buat_folder "project_baru"
buat_folder "backup"
```

---

# 6. Otomasi Perintah Linux Dasar

Inti dari Bash scripting adalah menggabungkan perintah-perintah terminal yang biasa kita ketik satu-satu, jadi satu alur otomatis.

Perintah yang sering dipakai: `mkdir`, `cp`, `mv`, `rm`, `ls`, `cd`.

## Contoh: Skrip Backup Sederhana

```bash
#!/bin/bash

# Skrip untuk membuat folder backup dan memindahkan file lama ke sana

folder_backup="backup_$(date +%Y%m%d)"

# 1. Buat folder backup kalau belum ada
mkdir -p "$folder_backup"

# 2. Salin semua file .log ke folder backup
cp *.log "$folder_backup"/

# 3. Konfirmasi ke user
echo "Backup selesai! File .log disalin ke folder: $folder_backup"
```

## Contoh: Gabungan Loop + Fungsi + Perintah Linux

```bash
#!/bin/bash

rapikan_file() {
    ekstensi=$1
    folder_tujuan=$2

    mkdir -p "$folder_tujuan"

    for file in *."$ekstensi"; do
        if [ -f "$file" ]; then
            mv "$file" "$folder_tujuan"/
            echo "Memindahkan $file ke $folder_tujuan/"
        fi
    done
}

# Rapikan semua file gambar dan dokumen
rapikan_file "jpg" "folder_gambar"
rapikan_file "pdf" "folder_dokumen"

echo "Semua file sudah dirapikan!"
```

---

# 📌 Ringkasan Cepat

- `#!/bin/bash` → wajib di baris pertama, lalu `chmod +x` biar bisa dieksekusi.
- Variabel: `nama="isi"` (tanpa spasi), input: `read -p "teks: " variabel`.
- Kondisional: `if [ KONDISI ]; then ... else ... fi`.
- Loop: `for` buat daftar yang jelas, `while` buat kondisi yang belum pasti.
- Fungsi: bungkus kode berulang dengan `nama_fungsi() { ... }`.
- Semua di atas bisa digabung buat automasi tugas Linux (mkdir, cp, mv, dll) secara otomatis.
