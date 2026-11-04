# 💻 Konfigurasi Terminal (PowerShell & Oh-My-Posh)

Panduan ini menjelaskan dua bagian yang bekerja bersama untuk membentuk tampilan dan perilaku terminal saya:

- **PowerShell 7** (`powershell/`): profil `$PROFILE` yang dimuat setiap kali terminal dibuka.
- **Oh-My-Posh** (`oh-my-posh/`): tema prompt kustom `ys.omp.json`.

> ⬅️ Kembali ke [README utama](../README.md) · 📝 Lihat juga [Konfigurasi Neovim](https://github.com/hafistafrizal/nvim-config) (repo terpisah)

## 🔗 Cara Kerjanya

```text
Terminal dibuka
      │
      ▼
PowerShell 7 memuat $PROFILE
(powershell/Microsoft.PowerShell_profile.ps1)
      │
      ▼
Profil memanggil Oh-My-Posh dengan tema
(oh-my-posh/ys.omp.json)
      │
      ▼
Prompt tampil dengan tema kustom
```

Profil PowerShell adalah "pintu masuknya", sedangkan file tema hanya berisi tampilan prompt. Keduanya terpisah folder agar tema bisa diganti tanpa menyentuh profil.

## 📂 Isi Folder

```text
.
├── powershell/
│   ├── Microsoft.PowerShell_profile.ps1   # Profil PowerShell 7
│   └── README.md                          # Panduan ini
└── oh-my-posh/
    └── ys.omp.json                        # Tema prompt kustom
```

## 🛠️ Persyaratan

| Tool | Keterangan |
|------|------------|
| [PowerShell 7](https://github.com/PowerShell/PowerShell) | Perintahnya `pwsh`, bukan Windows PowerShell 5.1 bawaan |
| [Oh-My-Posh](https://ohmyposh.dev/) | Mesin prompt yang membaca file tema |
| Nerd Font | Agar ikon dan simbol pada prompt tampil benar |
| [Windows Terminal](https://aka.ms/terminal) | Disarankan sebagai *terminal emulator* |

## ⚙️ Instalasi

Pastikan repositori sudah di-clone ke `~/dotfiles` (lihat [Quick Start](../README.md#-quick-start)).

### 1. Pasang Nerd Font

Cara tercepat memakai Oh-My-Posh:

```powershell
oh-my-posh font install
```

Pilih salah satu, misalnya **JetBrainsMono** atau **CascadiaCode**. Lalu atur font di Windows Terminal: **Settings → Profiles → Defaults → Appearance → Font face**, dan pilih font berakhiran `Nerd Font` (misal `JetBrainsMono NF`).

### 2. Pasang PowerShell 7 dan Oh-My-Posh

```powershell
winget install Microsoft.PowerShell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

Tutup dan buka kembali terminal setelah instalasi.

### 3. Hubungkan profil PowerShell

```powershell
# Pastikan folder profil ada
New-Item -ItemType Directory -Force (Split-Path $PROFILE) | Out-Null

# Backup profil lama (jika ada)
Copy-Item -Force $PROFILE "$PROFILE.backup" -ErrorAction SilentlyContinue

# Hubungkan profil ke file di repo ini
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$env:USERPROFILE\dotfiles\powershell\Microsoft.PowerShell_profile.ps1" -Force
```

> **Catatan:** `SymbolicLink` di Windows membutuhkan *Developer Mode* aktif (**Settings → For developers**) atau PowerShell yang dijalankan sebagai Administrator.
> Alternatif tanpa syarat tersebut: ganti `-ItemType SymbolicLink` dengan `-ItemType HardLink`. Kekurangannya, hard link bisa terputus jika file diganti oleh `git pull`.

### 4. Pastikan path tema benar

Di dalam profil harus ada baris yang memuat tema, kurang lebih seperti ini:

```powershell
oh-my-posh init pwsh --config "$env:USERPROFILE\dotfiles\oh-my-posh\ys.omp.json" | Invoke-Expression
```

Jika repo kamu clone ke lokasi lain, sesuaikan path `--config` tersebut.

### 5. Muat ulang profil

```powershell
. $PROFILE
```

Atau cukup tutup dan buka kembali terminal.

## ✅ Verifikasi

```powershell
$PSVersionTable.PSVersion     # harus 7.x
oh-my-posh --version          # harus menampilkan versi
Test-Path $PROFILE            # harus True
```

Jika prompt sudah berubah sesuai tema `ys` dan ikon tampil normal, instalasi berhasil.

## 🎨 Kustomisasi

**Mengganti tema**: ubah path pada parameter `--config` di profil. Tema bawaan Oh-My-Posh bisa dilihat dengan:

```powershell
Get-PoshThemes
```

atau lihat galeri di [ohmyposh.dev/docs/themes](https://ohmyposh.dev/docs/themes).

**Mengubah isi tema**: edit `oh-my-posh/ys.omp.json`. Strukturnya terdiri dari *blocks* dan *segments* (misalnya path, git, waktu). Dokumentasi segmen ada di [ohmyposh.dev/docs/segments](https://ohmyposh.dev/docs/segments/path).

**Menambah alias atau fungsi**: tambahkan di `powershell/Microsoft.PowerShell_profile.ps1`, contoh:

```powershell
Set-Alias -Name g -Value git
function dotfiles { Set-Location "$env:USERPROFILE\dotfiles" }
```

## 🩺 Troubleshooting

**`oh-my-posh : The term 'oh-my-posh' is not recognized`**
Terminal belum dimuat ulang setelah instalasi. Tutup semua jendela terminal lalu buka lagi. Jika masih gagal, periksa dengan `winget list JanDeDobbeleer.OhMyPosh`.

**Ikon tampil sebagai kotak atau `?`**
Font terminal belum memakai Nerd Font. Ulangi langkah [1. Pasang Nerd Font](#1-pasang-nerd-font) dan pastikan Windows Terminal (bukan hanya VS Code) memakai font tersebut. Di VS Code, atur juga `terminal.integrated.fontFamily`.

**`cannot be loaded because running scripts is disabled on this system`**
Izinkan eksekusi skrip lokal untuk akunmu:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

**Error saat membuat SymbolicLink (`Administrator privilege required`)**
Aktifkan *Developer Mode* atau jalankan PowerShell sebagai Administrator, atau pakai alternatif `HardLink` di langkah 3.

**Profil tidak dimuat**
Pastikan kamu membuka **PowerShell 7 (`pwsh`)**, bukan Windows PowerShell 5.1. Keduanya punya `$PROFILE` yang berbeda. Cek lokasinya dengan `$PROFILE`.
