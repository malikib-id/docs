# List Book untuk belajar Linux

⭐ Baca utama: dibaca berurutan, ini yang paling direkomendasikan
📖 Referensi: dibuka saat butuh jawaban, jangan dibaca dari awal
➕ Opsional: kalau sempat atau kalau bacaan utama terasa kaku

## Tahap 1: Bash Shell
* ⭐ The Linux Command Line (Shotts): linuxcommand.org (bagian redirection, variabel, if/else, loop, grep/sed/awk dasar)
* 📖 Bash Guide: mywiki.wooledge.org/BashGuide
* 📖 Manual GNU awk: gnu.org/software/gawk/manual
* 📖 Manual GNU sed: gnu.org/software/sed/manual
* 📖 man grep

## Tahap 2: /proc dan /sys
* ⭐ Praktik langsung: cat /proc/meminfo, cat /proc/cpuinfo, ls /sys/class/
* 📖 man 5 proc: man7.org/linux/man-pages
* 📖 docs.kernel.org (cari "The /proc Filesystem" dan "sysfs")

## Tahap 3: System call dan proses
* ⭐ OSTEP bab 4, 5, 6 (Processes, Process API, Direct Execution): 
pages.cs.wisc.edu/~remzi/OSTEP/
* 📖 Man page bagian 2: man 2 open, read, write, fork, execve, ioctl
* 📖 strace (dipakai langsung di Codespaces)
* ➕ jvns.ca (tulisan tentang strace)
* ➕ xv6 book bab 1 (tunda sampai konsepnya mantap)

## Tahap 4: Memori dan CPU
* ⭐ OSTEP bagian Virtualization, dibaca berurutan:
bab 7 sampai 10 (CPU scheduling)
bab 12 sampai 22 (address space, paging, TLB, swapping)
* 📖 man 7 sched
* 📖 man 1 nice
* 📖 docs.kernel.org, bagian memory management (OOM killer)

## Tahap 5: Real-time Linux
*Tidak ada satu bacaan utama, jadi dibaca berurutan sebagai gabungan:
	* ⭐ Wiki PREEMPT_RT di Linux Foundation (cari "Real-Time Linux wiki"), sebagai pengantar
	* ⭐ Slide Bootlin, materi real-time: bootlin.com/training
	* 📖 docs.kernel.org, bagian scheduler dan real-time
