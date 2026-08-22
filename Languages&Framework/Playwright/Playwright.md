# Playwright 🎭

ini adalah catatan tentang Playwright, murni hanya rangkuman dari pemahaman penulis: [Malikib](https://malikib.my.id/portofolio)

jika ada pembaca yang melihat catatan ini, dan merasa ada yang keliru, jangan ragu untuk **koreksi**.

Terimakasih.

Docs Resmi:[ https://playwright.dev/docs/intro](https://playwright.dev/docs/intro)

# 1.About

## Apa itu Playwright?

Playwright adalah sebuah framework Open Source untuk melakukan Otomatiasi Browser dan pengujian Aplikasi Website yang rilis dan di kembangkan oleh **[Microsoft](https://id.wikipedia.org/wiki/Microsoft)** pada 31 Januari 2020.

Playwright memungkinkan para Pengembang web atau teknisi bisa melakukan pengetesan secara otomatis, lebih tepatnya adalah mengotomatiskan tugas hal yang repetitif, seperti pengujian ujung ke ujung aplikasi website.

## kapan pakai playwright?

Umum nya kita memakai Playwright ketika kita membutuhkan Pengujian yang di lakukan secara otomatis, apa maksudnya? misal ketika kita ingin test apakah Halaman Login pengguna itu berfungsi seperti bisa memasukan email, memasukan password dan klik tombol masuk, akhirnya pengguna bisa masuk ke dashboard, pengujian seperti ini bersifat rendudan atau lebih jelasnya akan di lakukan secara berulang ulang.

Memang terdengar simple jika hanya perlu mengetest halaman login kembali saat ada perubahan kode, tetapi, bagaimana jika kita masih ada tugas menguji fitur lain yang scenario nya ratusan hingga ribuan? akan lebih baik jika ada suatu alat semacam robot yang bisa melakukan test sebelumnya secara otomatis dan gak akan lelah. itulah **Playwright**

## Kenapa Pakai Playwright? apa kelebihan nya?

Ada beberapa alasan yang sulit di lakukan oleh manusia biasa, seperti contohnya melakukan pengambilan(scraping) Data secara masif, melakukan pengujian di browser yang berbeda beda dalam waktu yang sama dan alur yang sama persis. dan masih banyak contoh lainnya.

beberapa keunggulan Playwright adalah berikut:

- **Eksekusi yang cepat**: Playwright berkomunikasi langsung dengan browser memakai protokol WebSocket, juga penggunaan Browser Context yang memungkinkan setiap skenario test berjalan secara independen.

- **Pengujian yang Konsisten**: jika suatu tombol masih belum bisa di klik, maka playwright bisa menunggu secara otomatis dan klik tombol itu ketika siap, Playwright akan check kondisi seperti tulisan yang muncul, tombol yang gagal di klik, dan memeriksa nya berulang kali sebelum dia menyatakan suatu test di bilang Gagal.

- **Dukungan Jenis Browser dan Platform**: Mendukung beberapa jenis browser seperti Chrome,  Firefox dan Safari, juga mendukung banyak bahasa pemograman seperti Python, Javascript dan Typescript, C#, Java. 

- **Fitur Pengujian yang kuat**: Playwright bisa membuka multi tab dalam 1 skenario yang sama, juga bisa menangani Jaringan seperti memalsukan response API dari server di skrip ketika Backend belum siap.

- **Alat bantu yang canggih**: ada **Codegen**, jadi kita bisa klik suatu tombol, kode akan otomatis di buat dan bisa di salin, membantu banget, ada **Playwright Inspector**, kita bisa stop pengujian di titik tertentu, periksa element web, dan lihat langkah langkah nya. ada juga **Trace Viewer**, ini alat berguna saat mencari hal yg gak beres, kita bisa lihat screenshots, video perekaman, hingga aktivitas jaringan tiap langkah setelah pengujian selesai.

## Kekurangan Playwright yang perlu di perhatikan

walau Playwright adalah alat yang bagus dan canggih, tentu kita harus objektif terhadap kekurangan nya juga, salah satu kekurangan nya adalah berikut:

- **Komunitas yang belum besar**: belum sebesar komunitas Selenium, jadi mungkin ada error spesifik yang belum ada solusi nya di komunitas PLaywright, beberapa orang menganggap ini bukan kekurangan.

- **Tidak mendukung Browser lama**: seperti Chrome versi jadul, internet explorer jadul tidak akan bisa di jalankan di playwright

- **Bisa test web mobile, tapi bukan aplikasi mobile**: yaa.. bener sih.. Playwright emang dasar nya di buat untuk pengujian aplikasi website

- **Berbasis Code**: tidak seperti Katalon yang bisa di jalankan tanpa kode, walau Playwright punya fitur Codegen, kita harus paham dasar bahasa pemograman

- **Bahasa pemograman anak emas**: Playwright di rilis pertama kali menggunakan bahasa Typescript, jadi bahasa lain seperti Python, java, C# akan di kesampingkan dulu untuk perilisan fitur baru.

## Harus bisa bahasa Pemograman?

hmmm🤔... sayangnya iya, walau ada fitur Codegen yang bisa bikin kode secara otomatis hanya dengan klik klik browser mengikuti alur, kita tetap harus memahami **dasar-dasar** bahasa pemograman. ini bisa jadi kekurangan bagi mereka yang merasa gak punya waktu untuk belajar bahasa pemograman

bebas mau pakai bahasa pemograman apa, seperti:

- [Python](../Python.md)

- Java

- C#

- Javascript

- [Typescript](../TypeScript.md)

Rekomendasi nya, memakai bahasa Typescript, karena alasan seperti Fitur yang lebih unggul, juga metode Asynchronus yang cepat.

## apakah Playwright menggantikan QA manual?

Maksudnya QA Automation yang menggantikan QA manual? jangan bahas di sini sebenernya, tapi ku jawab singkat, Playwright hanya alat, dia hanya mengotomatisasi test yang sudah di lakukan sebelumnya, oleh siapa? ya QA secara **Manual**,

Terus kalau udah otomatis, kita ngapain? kerjaan akan jadi lebih efisien, fitur yang lama akan di jalankan dan di test ulang secara otomatis, kita bisa fokus pada fitur yang masih di kembangkan dan perlu di test secara detail. jadi ga ada ya QA yang di gantikan oleh Playwright, emang ada ya yang tanya gini? ntah lah, aku juga gak tau apa ada yg baca catatan ini selain aku.

# 2.Installasi Playwright

Sebelum install PLaywrihght, kita harus install dulu Node.js, gak tau apa itu Node.js? bisa baca catatan nya di [sini](../../Concepts&Architecture/Node.js.md), tapi singkatnya aja deh, kalian bisa install langsung di terminal sesuai OS masing-masing.

## Windows

  jika pakai CMD atau Powershell, kita bisa ketik:

```
winget install OpenJS.NodeJS.LTS
```

## Mac

Jika Macos(Homebrew), bisa ketik:

```
brew install node@22
```

## Linux

Jika linux, macem macem sih, tapi kalau ubuntu dan arch-linux bisa ketik ini:

Ubuntu:

```
sudo apt-get install -y nodejs
```

Arch-Linux:

```
sudo pacman -S nodejs
```

## Install PLaywright setelah install Node.js

nahh.. kalau udah terpasang Node.js nya, ada npm yang otomatis terpasang.

cara check, bisa ketik:

```
node -v
npm -v
```

kalau sudah, kalian bisa ketik:

```
npm init playwright@latest
```

Akan muncul pilihan:

- TypeScript atau JavaScript (default: TypeScript)
- nama Tests folder  (default: `tests`, or `e2e` if `tests` kalau sudah ada)
- tambahkan ke github actions (rekomendasi untuk CI nanti)
- Install Playwright browsers (default: yes)

Selamat, Playwright kita sudah terinstall, sekarang tinggal belajar nya aja :)

# 3. code and run

## Folder yang terpasang

setelah kita install, dan mungkin kita yes semua saat instalasi, maka kita akan dapet folder yang isi nya:

```
playwright.config.ts         # Konfigurasi Test
package.json                 # info dependencies, dan info lain
package-lock.json            # mengunci versi asli saat ini
tests/                       # folder tempat test skrip
  example.spec.ts            # contoh test skrip
```

Penjelasan secara singkat

- **playwright.config.ts** ini adalah file konfigurasi test untuk mengatur beberapa hal seperti batas timeout click tombol berulang kali, menunggu, mengulang, menaruh report hasil test dan sebagai nya

- **package.json** ini adalah file yang berisi informasi seperti identitas seperti nama proyek, versi, deskripsi, terus apa aja yang dependencies yang di install, bahkan custom scripts

- **package-lock.json** ini adalah file yang di buat otomatis oleh npm, file ini menjamin konsistensi dependecies yang di install di komputer lain akan 100% sama

- **tests/** ini adalah tempat test berada, bisa di atur lagi, di pisah seperti menjadi beberapa bagian, contoh `api-test`, `ui-test`. `e2e-tests`

- **example.spec.ts** ini adalah contoh test, kita bisa ubah nama nya menjadi login.spec.ts atau sebagai nya, juga bisa di atur di playwrigt.config.ts

## Jalanin Test nya

kita bisa coba jalankan dengan ketik:

```
npx playwright test 
```

dan tampilan nya akan seperti ini:

```
Running 6 tests using 5 workflows
  6 passed(3.4s)

to open last HTML Report run:
 npx playwright show report
```

# 4. penjelasan lainnya

## selanjutnya

> Penjelasan di bawah ini, kita  memakai bahasa Typescript, jadi kita harus pahami dasar-dasar syntax nya dulu

barusan itu masih perkenalan tentang Playwright, di bawah ini ada penjelasan lebih lengkap nya

di[ Daftar isi](Daftar-isi.md)
