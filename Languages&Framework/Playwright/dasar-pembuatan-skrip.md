[kembali ke daftar isi](Daftar-isi.md)

# Pembuatan skrip

Ini catatan tentang dasar pembuatan skrip, kita akan mulai dari UI test terlebih dahulu, setelah itu baru API

Docs Resmi:[ https://playwright.dev/docs/intro](https://playwright.dev/docs/intro)

## Pembuatan file dan import

pertama tama, kita bisa bikin file bebas yang di akhiri dengan format .spec.ts. 

contoh `dashboard.spec.ts`

setelah itu, kita bisa buka file itu dengan text editor atau IDE masing-masing, lalu ketik ini di awal:

```typescript
import { test, expect } from '@playwright/test';
```

kita mengambil 2 function dasar yang sering di pakai, `test` dan `expect` dan akan di jelaskan cara penggunaan nya di bawah ini

## Pengunaan function test

`test` ini adalah function utama yang akan di jalankan sebagai test scenario, `test` bisa terus di gunakan sebanyak mungkin, contoh seperti ini:

```typescript
import { test, expect } from '@playwright/test'; // ini penting

// ini test scenario ke 1
test('masuk ke halaman beranda', async({ page }) => { 
    // ini kode test
    await page.goto('https://malikib.my.id')
    // ini kode assertion(validasi)
    await expect(page.getByText('malikib').toBeVisible()
});

// ini test scenario ke 2
test('masuk ke halaman login', async({ page }) => {
    // ini kode test
    await page.goto('https://malikib.my.id/login'); // link palsu
    // ini kode assertion(validasi)
    await await expect(page.getByText('Selamat Datang').toBeVisible();
});
```

kita bisa terus menggunakan `test` sesuai skenario yang kita butuhkan. ingat, setiap test berjalan secara **independent**, tidak bergantung satu sama lain.

```typescript
test('dekripsi skenario', async({ page }) => {});
// penulisan kode skenario ada di dalam {}   ^^^
```

ini cara menulis test dan penggunaan nya, awal kita tulis judul atau penjelasan singkat tentang skenario test nya, usahakan simple dan jelas seperti:

`'login menggunakan email dan password yang valid'`

#### Asynchronus

lalu kita beri koma `,` setelah judul, lalu kita tambahkan `async()` sebagai argumen kedua.

 jika ada yang tidak mengerti apa itu `async` bisa lihat penjelasan teori tentang **synchronus** dan **asynchronus** di [sini](../../Concepts&Architecture/Synchronus&Asynchronus.md).

singkat dan kasaran nya, penulisan `async()` akan memberitahu Playwright bahwa di dalam fungsi ini ada syntax yang membutuhkan waktu untuk di jalankan di tandai syntax `await`.

di dalam `async()` kita memasukan parameter/argumen milik Playwright yang tepat seperti `page` dan di tulis di dalam `{}`, jadi contoh nya `async({ page })`

#### Fixtures

kita lihat ada `{ page }` di dalam `async()`, apa sebenernya itu? 

`page` adalah salah satu fixtures bawaan dari playwright, apa itu fixtures? 

kasaran dan singkatnya Fixtures adalah lingkungan atau object yang di siapkan, di isolasi, dan di bersihkan otomatis oleh Playwright untuk setiap `test` 

contoh `page` adalah fixtures penting untuk mewakili satu tab browser, contoh ketika kita ingin klik tombol tertentu di sebuah halaman, kita bisa ketik syntax:

`page.locator('email').click()` 

Masih ada fixtures lain seperti `request`, `context`, `browser` dan sebagai nya, namun kita akan fokus pada `Page` terlebih dahulu. 

ada penjelasan lanjut tentang cara membuat fixtures custom sendiri nanti nya.

#### Penulisan Syntax Perintah

sekarang adalah tanda `=> {}`, contoh:

```typescript
async({ page }) => {});
                   ^^^
```

di sini kita akan memerintah kan function test untuk menjalankan syntax atau perintah yang kita inginkan, seperti `page.goto()` untuk pergi ke link tertentu, `page.click()` untuk menekan tombol, `page.fill()` untuk mengisi kolom dan seterus nya.

biasa nya agar mudah di baca, kita akan kasih enter di tengah `{}` yang hasilnya jadi seperti ini:

```typescript
test('dekripsi skenario', async({ page }) => {
    // penulisan kode di sini
});
```

> penjelasan dan syntax lebih lengkap nya akan di jelaskan di file selanjutnya.

## Pengunaan Expect

Expect adalah sebuah fungsi yang di gunakan untuk memverifikasi atau validasi sebuah kondisi tertentu yang di inginkan, contoh kita ingin setelah login, kita ingin pastikan login berhasil dengan tanda yang akan ada jika kita berhasil seperti tulisan `'berhasil login'`.

normalnya, jika tanda tersebut tidak ada, maka itu tanda login tidak berhasil, maka Playwright akan menganggap ini test yang gagal.

penulisan nya akan terlihat seperti ini: 

```typescript
test('masuk ke halaman beranda', async({ page }) => { 
    // ini kode test

    // penggunaan expect untuk memastikan tulisan ini ada
    await expect(page.getByText('malikib').toBeVisible() 
});
```

> penjelasan dan syntax lebih lengkap nya akan di jelaskan di file selanjutnya.

## Selanjutnya..

oke kita udah mengetahui kerangka dasar penggunaan test, selanjutnya kita akan bahas syntax nya lebih lengkap di sini:

- [Page](syntax-page.md) 

- Expect

Jika ingin [kembali ke Daftar isi](Daftar-isi.md)


