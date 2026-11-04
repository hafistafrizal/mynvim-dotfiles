```markdown
# 🚀 My Dotfiles

Repositori ini berisi konfigurasi personal (*dotfiles*) untuk lingkungan pengembangan (*development environment*) saya di Windows dan Linux. Setup utama berfokus pada Neovim (berbasis NvChad), PowerShell 7, dan kustomisasi terminal menggunakan Oh-My-Posh.

## 📂 Struktur Direktori

```text
.
├── nvim/           # Konfigurasi Neovim (NvChad custom configs)
├── powershell/     # Profil konfigurasi PowerShell 7 ($PROFILE)
├── oh-my-posh/     # Tema kustom Oh-My-Posh (ys.omp.json)
├── .gitignore      # Mengabaikan file swap, backup, dan cache
└── README.md       # Dokumentasi repositori ini

```

## 🛠️ Persyaratan (Prerequisites)

Sebelum menggunakan konfigurasi ini, pastikan *tools* berikut sudah terpasang di sistem:

* [Neovim](https://neovim.io/) (v0.9.0+)
* [PowerShell 7](https://github.com/PowerShell/PowerShell) (pwsh)
* [Oh-My-Posh](https://ohmyposh.dev/)
* [MSYS2 (GCC)](https://www.msys2.org/) atau [Zig](https://ziglang.org/) (untuk kompilasi *Treesitter* di Windows)
* Nerd Fonts (misal: *JetBrainsMono NF* atau *CaskaydiaCove NF*)

## ⚙️ Cara Instalasi (Windows)

**1. Clone Repositori**

```powershell
git clone [https://github.com/hafistafrizal/mynvim-dotfiles.git](https://github.com/hafistafrizal/mynvim-dotfiles.git) ~/dotfiles

```

**2. Setup Neovim**
Hapus konfigurasi Neovim bawaan (jika ada), lalu hubungkan folder `nvim` dari repositori ini ke *AppData*:

```powershell
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim" -ErrorAction SilentlyContinue
New-Item -ItemType Junction -Path "$env:LOCALAPPDATA\nvim" -Target "$env:USERPROFILE\dotfiles\nvim"

```

**3. Setup PowerShell & Oh-My-Posh**
Hubungkan profil PowerShell kamu ke profil dari dotfiles ini:

```powershell
# Backup profil lama jika ada
Copy-Item -Force $PROFILE "$PROFILE.backup" -ErrorAction SilentlyContinue

# Buat symlink profil PowerShell
New-Item -ItemType HardLink -Path $PROFILE -Value "$env:USERPROFILE\dotfiles\powershell\Microsoft.PowerShell_profile.ps1" -Force

```

*Catatan: Pastikan lokasi path tema di dalam file `$PROFILE` sudah mengarah ke `~\dotfiles\oh-my-posh\ys.omp.json`.*

## 🌟 Fitur Konfigurasi Neovim

* **NvChad Base:** UI yang cepat dan estetis.
* **Pre-configured LSP & Formatters:** Setup untuk C, C++, PHP, Python, HTML, CSS, JavaScript, dll.
* **Treesitter Bypass (Windows):** Konfigurasi khusus yang memaksa penggunaan `gcc` secara internal untuk menghindari *silent crash* (error `Parser compilation failed`) saat instalasi parser di Windows.
* **LazyGit Integration:** Pengelolaan Git langsung dari dalam Neovim.

## 👤 Author

Konfigurasi ini dikelola untuk kebutuhan *coding* harian dan tugas perkuliahan.

```

---

### Cara Simpan dan Push README lewat Neovim:

1. Simpan perubahan file README di Neovim dengan menekan `:w`.
2. Buka terminal melayang Neovim dengan menekan **`Alt + i`**.
3. Jalankan perintah pembaruan Git ini:
   ```powershell
   git add README.md
   git commit -m "docs: add repository README"
   git push

```
