# On Memory & CPU Architecture

> Designed in January 8, 2026. Written in January 15, 2026.

![Memory & CPU Diagram](assets/diagrams/os-architecture.jpg)

---

This note is an attempt to organize how I currently understand memory and CPU interactions inside a modern operating system.  
Not as an exhaustive specification, but as a mental model: where things live, who owns what, and how control flows between layers.

I am intentionally mixing concrete examples (mostly in C) with conceptual explanations. Memory is not only about addresses and bytes, but about **responsibility**: who is allowed to touch what, and under which conditions.

---

## Stack versus Heap

When a program is running, its memory is not a single flat space. Even though everything is virtual, the address space is _structured_. Two of the most discussed regions are the **stack** and the **heap**.

They solve different problems and follow very different rules.

---

### Stack

The stack lives in **user space**, inside the **process virtual address space**.  
It is created by the kernel when a process (or thread) starts.
As abstraction, you can imagine as a literal stack of things (that grows down, see why some abstractions doesn't work well?)

The stack is:

- automatically managed (in LIFO ordering)
    
- bounded in size
    
- grows toward **lower virtual addresses**
    
- tightly coupled to function calls
    

Local variables usually live here.

```
void foo() {
	int x = 42;     
	char buffer[128]; 
}
```

In this example:

- `x` and `buffer` live on the **stack**
    
- their lifetime is bound to the execution of `foo`
    
- when `foo` returns, this memory is considered invalid
    

The CPU participates directly in stack management through registers:

- `RSP` points to the top of the stack
    
- `RBP` (when used) marks the base of the current stack frame
    

The stack is fast, predictable, and fragile.  
Overflowing it is not a “logic error” — it is a **memory violation**, and the kernel will step in.

---

### Heap

The heap also lives in **user space**, inside the process virtual address space, but unlike the stack, it is **explicitly managed**.

Memory on the heap is usually requested via allocators:

`int *arr = malloc(10 * sizeof(int));`

Here:

- `arr` lives on the stack
    
- the memory returned by `malloc` lives on the **heap**
-  that's why arr is a pointer!!
    

The heap:

- grows toward **higher virtual addresses**
    
- has no automatic lifetime
    
- exists until explicitly freed (or until process termination)
    

`free(arr);`

Unlike the stack, the heap introduces **temporal complexity**.  
You can free memory too early, too late, or never.

The kernel does not manage heap blocks directly. It provides **virtual memory regions**, and user-space allocators organize them.

---

## MMAP

`mmap` is where the abstraction becomes explicit.

Instead of asking for “objects” or “arrays”, a program asks the kernel:

> “Map a virtual memory region for me.”

```
`void *ptr = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);`
```

What lives where:

- the returned pointer lives on the **stack**
    
- the mapped memory lives in a **virtual memory region**
    
- the mapping metadata lives in the **kernel**
    

`mmap` regions can back:

- files
    
- shared memory
    
- large buffers
    
- custom allocators
    

Unlike the heap, `mmap` works in **pages**, not bytes. 

A memory page is like a OS WORD

> Definitions
> OS WORD --> lowest chunk of bits a Operating System fetches, decodes and executes (usually 32 or 64 bits)
> 
> Memory page --> lowest amount of RAM a kernel manages (usually 4KB)
> 

This is where virtual memory stops pretending to be continuous and starts revealing its page-based nature.

---

## Kernel

The kernel does **not** live in user space.

Each process has its own virtual address space, but the kernel is **mapped into all of them**, at a reserved, protected region. User code cannot access it directly.

The kernel lives in **kernel space**, and it owns:

- page tables
    
- process descriptors
    
- file descriptors
    
- hardware drivers
    
- scheduling state
    

---

### Kernel interactions with user-space programs

User programs interact with the kernel through **system calls**.

`write(1, "hello\n", 6);`

This single line causes:

1. A transition from **user mode (ring 3)** to **kernel mode (ring 0)**
    
2. The kernel to validate arguments
    
3. The kernel to interact with a device driver
    
4. A return back to user mode
    

The important point:  
**user programs never touch hardware or physical memory directly**.  
They request services, and the kernel decides.

---

### Kernel interactions with hardware

The kernel is the only software allowed to:

- configure the MMU
    
- handle interrupts
    
- manage page faults
    
- access I/O ports and memory-mapped devices
    

When a page fault occurs:

1. The CPU traps into the kernel
    
2. The kernel inspects the faulting address
    
3. The kernel decides whether:
    
    - to map a page
        
    - to load data from disk
        
    - or to kill the process
        

This is not an error path — it is **normal execution**.

---

## Hardware

At the lowest visible level, everything converges into hardware.
"**The Silicon**"

---

### RAM && MMU

RAM is physical memory.  
Programs never see it directly.

The MMU (Memory Management Unit) sits between:

- the CPU (that generates a virtual address)
    
- and physical memory
    

Every memory access follows this path:

`CPU → virtual address → MMU → physical address → RAM`

Page tables live in **RAM**, but are **owned and managed by the kernel**.

A virtual address:

- may map to physical RAM
    
- may map to a file
    
- may map to nothing
    

When it maps to nothing, the kernel gets involved.

This is why memory is not just storage — it is policy and management.


## Conclusion

Memory and CPU Architecture often are taking as two separate subjects in videos. Although its a good way to differentiate between topics, they are intricately together. To understand memory you need to understand the basics of CPU Architecture and vice-versa. After all of this reading, this note helped me organizing better my thought on memory and I hope it helps someone too. 
