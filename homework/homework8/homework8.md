## homework8

## P2

![P2](/resources/P2.png)

**Ans:**

a. 不能。通过共享总线一次只能转发一个分组。

b. 不能。通过共享总线一次只能进行一次内存读/写。

c. 不能。

## P3

![P3](/resources/P3.png)

**Ans:**

对于内存：(n-1)D；

对于总线：(n-1)D；

对于纵横式交换结构：0

## P6

![P6](/resources/P6.png)

**Ans:**

目的地址范围					链路接口

00000000

​	到										0

00111111



01000000 

​	到										1

01011111 



01100000 

​	到										2

01111111



10000000

​	到										2

10111111



11000000 

​	到										3

11111111 

接口 0 的地址数量：2^6 = 64

接口 1 的地址数量：2^5 = 32

接口 2 的地址数量：2^6 + 2^5 = 96

接口 3 的地址数量：2^6 = 64