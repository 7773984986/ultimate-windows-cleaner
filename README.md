██████╗ ██╗   ██╗███╗   ███╗██╗████████╗██╗     ███████╗
██╔══██╗██║   ██║████╗ ████║██║╚══██╔══╝██║     ██╔════╝
██████╔╝██║   ██║██╔████╔██║██║   ██║   ██║     █████╗  
██╔══██╗██║   ██║██║╚██╔╝██║██║   ██║   ██║     ██╔══╝  
██████╔╝╚██████╔╝██║ ╚═╝ ██║██║   ██║   ███████╗███████╗
╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝   ╚═╝   ╚══════╝╚══════╝

![Windows](https://img.shields.io/badge/Windows-10%20%7C%2011-blue?logo=windows)
![PowerShell](https://img.shields.io/badge/Runs%20On-PowerShell-5391FE?logo=powershell)
![Batch](https://img.shields.io/badge/Script-.BAT-yellow)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Version-v2.0-orange)
Ultimate Windows Cleaner v2
Full system repair • GPU optimization • DirectX fix • Installation cleanup • Performance stabilization

Ultimate Windows Cleaner v2 is an all‑in‑one Windows maintenance script designed to repair corrupted system components, clean GPU caches, fix DirectX issues, remove leftover installation junk, reset Windows Update, repair the network stack, and optimize overall system stability.

This tool is ideal for:

Gamers

Developers

Power users

Anyone facing Windows corruption, lag, stutters, GPU issues, or failed installations

⚡ One‑Line Activation Command
[![Run Ultimate Cleaner](https://img.shields.io/badge/Run-Ultimate%20Cleaner-blue?style=for-the-badge)](#)
Paste this into CMD or PowerShell:
powershell -command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/7773984986/ultimate-windows-cleaner/refs/heads/main/ultimate_windows_cleaner_v2.bat' -OutFile $env:TEMP\ultimate_cleaner.bat; Start-Process $env:TEMP\ultimate_cleaner.bat -Verb RunAs"


This will:

Download the latest version of the cleaner

Save it to your Temp folder

Run it automatically with Administrator privileges

No manual downloads.
No setup.
No extra steps.

🛠 Features
✔ System Repair
SFC scan

DISM health check

Component store cleanup

DirectX DLL re‑registration

✔ GPU Optimization
NVIDIA cache cleanup

AMD shader cleanup

Intel GPU cache cleanup

DirectX shader cache removal

Graphics pipeline reset

✔ Installation Cleanup
Removes corrupted MSI leftovers

Cleans Windows Installer cache

Resets Windows Update components

Deletes SoftwareDistribution junk

✔ Developer Cleanup
Removes node_modules

Deletes .git folders

Cleans build folders (dist, out, target)

✔ System Cleanup
Windows Temp

System Temp

LocalAppData Temp

Browser cache (Chrome, Edge)

Crash dumps

✔ Network Repair
Winsock reset

IP stack reset

DNS flush

✔ AppX / Windows Store Repair
Re-registers all AppX packages

📂 Repository Structure
Code
ultimate-windows-cleaner/
│
├── ultimate_windows_cleaner_v2.bat   # Main script
└── README.md                         # Documentation
🚀 How to Use
Method 1 — One‑Line Command (Recommended)
Paste the activation command into CMD or PowerShell.

Method 2 — Manual Run
Download the .bat file and run it as Administrator.

⚠️ Requirements
Windows 10 or Windows 11

Administrator privileges

PowerShell installed (default on Windows)

🧩 Notes
This script performs safe system repairs using official Windows commands.

No registry tweaks that harm performance.

No risky modifications.

100% reversible by Windows itself.

👤 Author
Pankaj  
Umm al‑Quwain, UAE
GitHub: https://github.com/7773984986

⭐ Future Enhancements
Silent mode

Auto‑update version

EXE installer

GUI version

Scheduled maintenance mode
## 📦 Releases
Official releases of Ultimate Windows Cleaner v2:

- **v2.0** — Initial public release  
- **v2.1** — Coming soon (silent mode + auto-update)
## 📝 Changelog

### v2.0
- Initial public release
- Added full system repair
- Added GPU optimization
- Added DirectX fix
- Added installation cleanup
- Added network repair
- Added AppX re-registration
## 🔢 Versioning
Ultimate Windows Cleaner follows semantic versioning:

- **MAJOR** — Big changes or new modules  
- **MINOR** — New features or improvements  
- **PATCH** — Small fixes or optimizations  

Example:  
`v2.1.3` → Major 2, Minor 1, Patch 3

📜 License
MIT License — free for personal and commercial use.
