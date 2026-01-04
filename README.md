# pwd_implementation_C_ASM

`pwd_implementation_C_ASM` is a low-level implementation of the Linux `pwd` command, written in **C** and **x86_64 Assembly**.

This project demonstrates how to interact with the Linux kernel to retrieve the current working directory using system calls, providing an educational insight into how simple Linux utilities work internally.

---

## 📂 Project Structure

```
pwd_implementation_C_ASM/
├── _pwd_/
│   └── main.c
├── ASM_version/
│   └── main.asm
└── README.md
```

* ***pwd*/**:
  Implementation of `pwd` using C and Linux system calls.
* **ASM_version/**:
  Implementation using x86_64 Assembly with direct syscalls.

---

## ✨ Features

* Print the current working directory
* Manual handling of Linux system calls
* Educational focus on low-level system programming

---

## 🛠️ Compilation

### C Version

```bash
gcc main.c -o pwd
```

### Assembly Version

```bash
nasm -f elf64 main.asm -o program.o
ld program.o -o pwd
```

---

## 🚀 Usage

```bash
./pwd
```

This will print the absolute path of the current working directory.

---

## 🎯 Goals of This Project

* Learn how the `pwd` command works internally
* Practice system programming with C and Assembly
* Understand Linux syscalls and kernel interaction
* Improve debugging skills using tools like `gdb`

---

## ⚠️ Warning

This project is for **educational purposes only**.

---

## 👨‍💻 Author

**Soulaimane**
Computer Science student
Interested in:

* Low-level programming
* Linux internals
* Reverse engineering
* Cybersecurity

---

## 📜 License

This project is open for learning and experimentation.
