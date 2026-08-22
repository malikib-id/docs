[Kembali ke Daftar Isi](Daftar-isi.md)

# Browser Context dan konsep Stateless

sebelum kita membuat sebuah skrip test, kita harus paham bagaimana konsep test itu di jalankan.

Docs Resmi:[ https://playwright.dev/docs/intro](https://playwright.dev/docs/intro)

## 1. Browser Context

Browser context singkatnya adalah ruangan steril tersendiri yang ada di dalam aplikasi browser, kita pernah pakai mode samaran/inconigto di browser kan? anggap setiap browser context tidak pernah tersentuh satu sama lain, dan data nya akan hilang saat browser itu di close.

ini penting untuk di pahami karena jika kita suatu saat ingin melakukan test yang membutuhkan 2 user tiruan secara bersamaan (real-time), kita bisa memanfaatkan browser context lebih dari satu.

contoh:

```typescript
import { test } from '@playwright/test';

test('Tes Chat antara Pembeli dan Penjual', async ({ browser }) => {
  // 1. Buat ruang steril untuk Pembeli
  const konteksPembeli = await browser.newContext();
  const halamanPembeli = await konteksPembeli.newPage();
  await halamanPembeli.goto('https://toko.com/login-pembeli');

  // 2. Buat ruang steril TERPISAH untuk Penjual (tidak akan bentrok!)
  const konteksPenjual = await browser.newContext();
  const halamanPenjual = await konteksPenjual.newPage();
  await halamanPenjual.goto('https://toko.com/login-penjual');

  // Sekarang kita bisa mengetes interaksi keduanya secara real-time!
});
```

## 2. Setiap test itu Stateless

Setiap test skenario yang ada, tidak akan pernah meninggalkan data saat test selesai di jalankan, seperti cookies, token, dan sebagai nya, Playwright di desain agar bisa berjalan dengan cepat, berbeda dengan test jadul lain, yang setiap test bisa saling merusak.

jadi nanti kita akan belajar bagaimana cara memasukan cookies, token ke tiap test yang ada. 

Ada yang gak tau apa itu token atau cookies? penjelasan nya di sini



 [kembali ke Daftar isi](Daftar-isi.md)
