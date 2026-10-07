======================================================
ROADMAP LINUX UNTUK SYSTEMS CONTROL ENGINEERING (SCE)
======================================================

1. INTERAKSI & OTOMATISASI TERMINAL (BASH SHELL)
   ├── I/O Redirection & Pipes (>, >>, <, |)
   ├── Variabel Lingkungan & Logika ($PATH, $HOME, $?, If-Else, Loops)
   └── Pemrosesan Teks Murni (grep, sed, awk)

2. MEMBEDAH ISI PERUT KERNEL (VIRTUAL FILE SYSTEM)
   ├── Eksplorasi /proc (Membaca meminfo, cpuinfo, stat)
   └── Eksplorasi /sys (Manipulasi hardware via /sys/class/)

3. JEMBATAN APLIKASI KE KERNEL (SYSTEM CALLS & PROSES)
   ├── Analisis runtime menggunakan perintah 'strace'
   ├── Syscalls Fundamental (open, read, write, close, ioctl)
   └── Siklus Hidup Proses (fork, execve)

4. MANAJEMEN MEMORI & CPU DI LINUX (SYSTEM ARCHITECTURE)
   ├── Virtual Memory & Paging (RAM fisik vs Virtual, Swap, OOM Killer)
   └── Process Scheduling & Priority (Antrean CPU via perintah nice/renice)

5. REAL-TIME LINUX (MISSION-CRITICAL SYSTEMS)
   ├── Konsep Determinisme & Kernel Latency
   └── Modifikasi kernel menggunakan PREEMPT_RT Patch (Hard Real-Time)
