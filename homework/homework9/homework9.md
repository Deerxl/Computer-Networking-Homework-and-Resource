# homework9-第五章习题任选五道

## P1

![P1](/resources/P1.jpg)

![P5-3](/resources/P5-3.png)

**Ans:**

y-x-u, y-x-v-u, y-x-w-u, y-x-w-v-u,

y-w-u, y-w-v-u, y-w-v-x-u, y-w-x-u, y-w-x-v-u,

y-z-w-u, y-z-w-v-u, y-z-w-x-u, y-z-w-v-x-u, y-z-w-x-v-u.

## P2

![P2](/resources/P2.png)

**Ans:**

**x -> z:**

x-y-z, x-y-w-z,

x-w-z, x-w-y-z,

x-v-w-z, x-v-w-y-z, 

x-u-w-z, x-u-w-y-z, x-u-v-w-z, x-u-v-w-y-z.

**z -> u:**

z-w-u, z-w-v-u, z-w-x-u, z-w-v-x-u, z-w-x-v-u, z-w-y-x-u, z-w-y-x-v-u,

z-y-x-u, z-y-x-v-u, z-y-x-w-u, z-y-x-w-v-u, z-y-x-v-w-u, 

z-y-w-u, z-y-w-v-u, z-y-w-x-u, z-y-w-v-u, z-y-w-v-x-u, z-y-w-x-v-u.

**z ->w:**

z-w,

z-y-w, z-y-x-w, z-y-x-v-w, z-y-x-u-w, z-y-x-u-v-w, z-y-x-v-u-w

## P3

![P3](/resources/P3.png)

**Ans:**

步骤		N'		D(t), ρ(t)		D(u), ρ(u)		D(v), ρ(v)		D(w), ρ(w)		D(y), ρ(y)		D(z), ρ(z)

   0		   x				∞					∞					3, x				 6, x				    6, x				8, x

   1		   xv			7, v				 6, v				  3, x 				6, x 				   6, x 			   8, x 

   2 		  xvu 		 7, v 				6, v				  3, x 				6, x 				   6, x 			   8, x 

   3 		  xvuw 	  7, v 				6, v 				 3, x 				6, x 				   6, x 			   8, x 

   4 		  xvuwy 	7, v 				6, v 				 3, x 				6, x					6, x				8, x 

   5		   xvuwyt    7, v				6, v   				3, x 				6, x					6, x				8, x 

   6		   xvuwytz  7, v				6, v 				  3, x 				6, x					6, x				8, x 

## P9

![P9](/resources/P9.png)

**Ans:**

不会。因为降低的链路成本不会导致循环。连接两个没有链路的节点等效于将链路权重从无限权重减小为有限权重。

## P10

![P10](/resources/P10.png)

![P5-6](/resources/P5-6.jpg)

**Ans:**

在每个步骤中，节点距离矢量的每次更新都基于 Bellman-Ford 方程，例如，仅减小其距离矢量中的那些值，价值没有增加。如果没有更新，则不会发送任何消息。 因此，D(x) 不增加。由于这些成本是有限的，因此最终距离矢量将以有限的步长稳定下来。