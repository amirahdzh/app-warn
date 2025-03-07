# Aplikasi Warning PowerShell ⚠️

Skrip PowerShell ini menampilkan peringatan sebelum menjalankan aplikasi tertentu.

## ✨ Fitur
- Menampilkan peringatan dengan UI Windows Forms
- Meminta konfirmasi sebelum menjalankan aplikasi
- Menggunakan gambar custom sebagai background (opsional)

## 🚀 Cara Menggunakan
1. **Download atau Clone Repo Ini:**  
   ```sh
   git clone https://github.com/username/aplikasi-warning.git
   ```

2. **Cari Shortcut Aplikasi yang Akan Diberi Warning**  
   - Klik kanan pada shortcut → **Properties**
   - Pada kolom lokasi, masukkan:  
     ```sh
     powershell -File "C:\Path\Ke\warning.ps1" "C:\Path\Ke\Aplikasi.exe"
     ```
   - Klik **Apply** 

3. **Simpan dan Gunakan**  
   - Setiap kali membuka aplikasi melalui shortcut ini, skrip akan berjalan lebih dulu untuk menampilkan peringatan sebelum menjalankan aplikasi.

## 🛠️ Konfigurasi
- Gambar background bisa diubah di `imagePath`
- Warna & teks tombol bisa disesuaikan di kode


Copyright (c) 2025 Amiw Dzh

Diberikan izin untuk menggunakan, menyalin, memodifikasi, menggabungkan, menerbitkan, mendistribusikan, memberikan lisensi, dan menjual salinan perangkat lunak ini...
