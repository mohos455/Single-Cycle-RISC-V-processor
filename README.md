# Single-Cycle-RISC-V-processor

Introduction:
In the dynamic landscape of computer architecture, the RISC-V instruction set has emerged as a beacon of innovation, offering an open and extensible foundation for processor design. As we navigate the intricate realm of RISC-V, this article serves as a compass, guiding us through the fundamental aspects of its instruction set and the intricacies of single-cycle and multi-cycle implementations. At the heart of RISC-V lies its instruction set architecture (ISA), characterized by a streamlined design philosophy that emphasizes simplicity, efficiency, and openness. As we delve into the RISC-V instruction set, we will decode the architecture's unique approach to command execution, exploring how it strikes a balance between performance and versatility. From its elegant simplicity to its comprehensive set of instructions, RISC-V beckons us to rethink the way processors interpret and execute commands. Venturing further, we will dissect the single-cycle implementation of RISC-V, where each instruction is executed in a single clock cycle. This efficient approach simplifies the pipeline and promises low-latency processing. We'll examine the intricacies of the single-cycle architecture, uncovering how it optimizes execution speed and resource utilization. Through detailed analysis, we aim to illustrate the strengths and limitations of the single-cycle paradigm, providing insights into its real-world applications and trade-offs.

Instruction Set Architecture:
Within the expansive RISC-V Instruction Set Architecture (ISA), I have taken a deliberate approach by carefully choosing a range of instructions that span various formats, including computational, control flow, and memory access. This selective approach will guide us as we design a custom Datapath and precisely specify the control signals needed to execute our chosen instructions efficiently. The instruction set in RISC-V is organized into distinct instruction formats, with each format comprising individual "fields." These fields are essentially separate unsigned integers, each serving as a dedicated container for conveying precise information about the intended operation to be executed.

![Screenshot 2024-02-08 024623](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/4aad6ff3-31b2-431b-b8da-e686005247cc)

Supported Instructions:

![Screenshot 2024-02-08 024807](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/df9e14f1-4a95-444a-8e2c-3d22edc05854)


Basic Architecture : I have modified the architecture to add more Instruction Set.

![d](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/5a38c550-ddba-45a1-8d3f-dbfdf1c1d009)


Basic Control unit : 

![Screenshot 2024-02-08 025042](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/d0bbb187-03b3-4424-9747-4c836ba600f2)

Simulatiom :

The code 

![Screenshot 2024-02-08 025155](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/f9e892e5-7e99-4d28-9bff-7ea89fe16b14)

The result :

![Screenshot 2024-02-08 023941](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/967ec45d-c286-4c7e-8c64-b93dab38ef33)

another Code : 

![Screenshot 2024-02-08 025318](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/f814503a-d64d-467b-b3b2-3a3a0a4eab5c)

Results :

![Screenshot 2024-02-08 003642](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/8bd490dc-307b-442d-bb8c-bf0ec91db098)


![Screenshot 2024-02-08 003758](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/43991175-29b0-4f1e-96a6-92831f19f14d)


Elaboration Design using VIVADO:

![Screenshot 2024-02-08 003921](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/a93c1ce7-106e-4f2c-a002-9b6d785dfc5c)

Synthesis using VIVADO:

![Screenshot 2024-02-08 004643](https://github.com/mohos455/Single-Cycle-RISC-V-processor/assets/106884579/56a227db-a10f-442f-bfb8-461515ab26b4)


Reference :

1- Digital Design and Computer Architecture Sarah Harris ,David Harris.

2-The RISC-V Instruction Set Manual Volume I: User-Level ISA Document Version 2.2









