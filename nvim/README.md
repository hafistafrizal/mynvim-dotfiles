# 📝 Konfigurasi Neovim

Konfigurasi Neovim pribadi saya yang dibangun di atas [NvChad](https://nvchad.com/), dengan penyesuaian untuk kebutuhan *coding* harian dan tugas perkuliahan.

> ⬅️ Kembali ke [README utama](../README.md) · 💻 Lihat juga [Konfigurasi Terminal](../powershell/README.md)

## ✨ Fitur

- **NvChad sebagai basis:** UI cepat, ringan, dan estetis.
- **LSP & formatter siap pakai:** C, C++, PHP, Python, HTML, CSS, JavaScript, dan lainnya.
- **Treesitter fix untuk Windows:** konfigurasi khusus yang memaksa penggunaan `gcc` secara internal untuk menghindari *silent crash* (error `Parser compilation failed`) saat memasang parser.
- **Integrasi LazyGit:** kelola Git langsung dari dalam Neovim.
- **Terminal melayang:** buka terminal di dalam Neovim dengan `Alt+i`.

## 🛠️ Persyaratan

| Tool | Keterangan |
|------|------------|
| [Neovim](https://neovim.io/) | Versi 0.9.0 atau lebih baru |
| [Git](https://git-scm.com/) | Untuk clone repo dan *plugin manager* |
| Compiler C | [MSYS2 (GCC)](https://www.msys2.org/) atau [Zig](https://ziglang.org/), wajib di Windows untuk Treesitter. Di Linux cukup `gcc` |
| [LazyGit](https://github.com/jesseduffield/lazygit) | Untuk integrasi Git |
| Nerd Font | Agar ikon tampil benar. Lihat [cara memasangnya](../powershell/README.md#1-pasang-nerd-font) |

Opsional: [ripgrep](https://github.com/BurntSushi/ripgrep) untuk pencarian teks yang lebih cepat.

Pemasangan lewat `winget` di Windows:

```powershell
winget install Neovim.Neovim
winget install Git.Git
winget install JesseDuffield.lazygit
winget install BurntSushi.ripgrep.MSVC
```

## ⚙️ Instalasi

Pastikan repositori sudah di-clone (lihat [Quick Start](../README.md#-quick-start)).

### Windows (PowerShell)

Hapus konfigurasi lama (jika ada), lalu hubungkan folder `nvim` ke `AppData` memakai *junction*:

```powershell
# Backup konfigurasi lama
if (Test-Path "$env:LOCALAPPDATA\nvim") {
    Rename-Item "$env:LOCALAPPDATA\nvim" "nvim.bak"
}

# Buat junction ke folder nvim di repo
New-Item -ItemType Junction -Path "$env:LOCALAPPDATA\nvim" -Target "$env:USERPROFILE\dotfiles\nvim"
```

> Junction tidak memerlukan hak Administrator, berbeda dengan symlink.

### Linux

```bash
# Backup konfigurasi lama
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# Hubungkan folder nvim dari repo
ln -s ~/dotfiles/nvim ~/.config/nvim
```

## 🚀 Penggunaan Pertama Kali

1. Jalankan `nvim`. Plugin akan terpasang otomatis lewat [lazy.nvim](https://github.com/folke/lazy.nvim). Tunggu sampai selesai, lalu restart Neovim.
2. Pasang language server dan formatter lewat Mason:
   ```vim
   :Mason
   ```
3. Pasang parser Treesitter untuk bahasa yang kamu pakai, contoh:
   ```vim
   :TSInstall c cpp php python html css javascript
   ```
4. Cek kesehatan konfigurasi bila ada masalah:
   ```vim
   :checkhealth
   ```

## 📂 Struktur Folder

<!-- Sesuaikan dengan isi folder nvim/ yang sebenarnya -->
```text
nvim/
├── init.lua            # Titik masuk konfigurasi
└── lua/
    ├── chadrc.lua      # Pengaturan tema & UI NvChad
    ├── mappings.lua    # Keybinding kustom
    ├── options.lua     # Opsi Neovim
    ├── configs/        # Konfigurasi LSP, formatter, Treesitter
    └── plugins/        # Daftar plugin tambahan
```

## ⌨️ Keybinding

`<leader>` adalah tombol **Space**.

| Tombol | Fungsi |
|--------|--------|
| `Alt+i` | Buka/tutup terminal melayang |
| `Space` `c` `h` | Buka cheatsheet keybinding NvChad |
| `Space` `f` `f` | Cari file (Telescope) |
| `Ctrl+n` | Buka/tutup file explorer (NvimTree) |

<!-- Tambahkan keybinding kustom dan keybinding LazyGit di sini -->

> Keybinding di atas adalah bawaan NvChad. Keybinding kustom ada di `lua/mappings.lua`.

## 🔧 Kustomisasi

**Mengganti tema**: tekan `Space` `t` `h` untuk memilih tema, atau ubah nilai `theme` di `lua/chadrc.lua`.

**Menambah plugin**: tambahkan *spec* [lazy.nvim](https://github.com/folke/lazy.nvim) pada folder `lua/plugins/`, contoh:

```lua
return {
  "nama-user/nama-plugin",
  event = "VeryLazy",
  opts = {},
}
```

Lalu jalankan `:Lazy sync`.

**Menambah bahasa baru**: pasang server lewat `:Mason`, lalu daftarkan di konfigurasi LSP pada `lua/configs/`.

## 🩺 Troubleshooting

**`Parser compilation failed` saat `:TSInstall` di Windows**
Pastikan `gcc` (MSYS2) atau `zig` ada di `PATH`. Untuk MSYS2 UCRT64, tambahkan `C:\msys64\ucrt64\bin` ke `PATH`, lalu restart terminal dan jalankan ulang `:TSInstall`.

**Ikon tampil sebagai kotak atau karakter aneh**
Terminal belum memakai Nerd Font. Atur font terminal sesuai [panduan terminal](../powershell/README.md#1-pasang-nerd-font).

**Plugin tidak terpasang / error saat startup**
Jalankan `:Lazy sync`, lalu `:checkhealth`. Jika masih gagal, hapus cache plugin dan ulangi:

```powershell
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim-data"
```

**LazyGit tidak berjalan**
Pastikan `lazygit` sudah terpasang dan ada di `PATH`: `lazygit --version`.
