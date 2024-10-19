# Priview

![Simulator Screen Recording - iPhone 15 - 2024-10-19 at 17 50 47](https://github.com/user-attachments/assets/ef8b8175-4e3c-48b2-9394-b5a1586954fb)

# MiniProjectObjCMVVM

MiniProjectObjC adalah sebuah proyek iOS yang menggunakan Objective-C dan menerapkan pola MVVM (Model-View-ViewModel). Proyek ini menampilkan data dari API menggunakan `UITableView` dan memastikan posisi scroll tetap di posisi terakhir ketika pengguna kembali dari halaman detail.

## Fitur

- Mengambil data dari API.
- Menampilkan data dalam bentuk list menggunakan `UITableView`.
- Mencari data dengan `UISearchBar`.
- Menyimpan posisi scroll terakhir ketika berpindah ke halaman detail dan mengembalikan ke posisi tersebut saat kembali ke halaman `UITableView`.
- Penerapan pola MVVM untuk pemisahan logika antara `ViewController` dan `ViewModel`.
- Penerapan alert untuk menampilkan pemberitahuan ketika tidak ada koneksi atau jaringan. Setelah pengguna menekan tombol 'OK', aplikasi akan mencoba memuat ulang data secara otomatis saat koneksi jaringan kembali tersedia.

## Arsitektur

Proyek ini menggunakan pola MVVM untuk pemisahan tanggung jawab:
- **Model**: Data yang diambil dari API.
- **View**: UI elemen seperti `UITableView` dan `UISearchBar`.
- **ViewModel**: Mengelola logika bisnis, mengambil data dari API, dan memproses data sebelum ditampilkan di View.

## Instalasi

1. Clone repositori ini:

    ```bash
    git clone https://github.com/maulanaahmadjobs/MiniProjectOjctiveCMVVM.git
    ```

2. Buka proyek menggunakan Xcode:

    ```bash
    open MiniProjectObjC.xcodeproj
    ```

3. Pastikan dependencies sudah di-install dan proyek siap dijalankan.

## Penggunaan

1. Jalankan aplikasi di simulator atau perangkat fisik.
2. Aplikasi akan mengambil data dari [JSONPlaceholder](https://jsonplaceholder.typicode.com/posts) dan menampilkannya dalam bentuk list.
3. Gunakan `UISearchBar` di bagian atas untuk mencari data berdasarkan judul.
4. Klik salah satu item untuk masuk ke halaman detail.
5. Kembali ke halaman list, dan posisi scroll akan tetap berada di posisi terakhir sebelum pindah ke detail.

## Struktur Folder

- `ViewController` — Mengatur tampilan dan interaksi pengguna.
- `ViewModel` — Mengelola pengambilan dan pemrosesan data.
- `Model` — Struktur data untuk menyimpan informasi dari API.

## Lisensi

Proyek ini menggunakan lisensi MIT. Silakan lihat file [LICENSE](./LICENSE) untuk informasi lebih lanjut.
