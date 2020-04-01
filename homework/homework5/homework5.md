# homework5

## nslookup www.whu.edu.cn

![nslookup](/resource/nslookup.png)

## P5

![P5](/resource/P5.png)

**Ans:**

a. 可以，状态码是 200。Tue，07 Mar 2008 12 : 39 : 45 GMT。

b. Sat 10 Dec2005 18:27:46 GMT

c. 3874

d.  被返回的前 5 个字节是：<!doc。同意。

## P6

![P6](/resource/P6.png)



**Ans:**

a.  客户端或服务器可以向对方表明它将关闭持久连接。通过在 http 请求 / 回复的 Connection-header 字段中包含连接令牌 “close” 来实现。

b. 未提供。

c. 不能。单用户客户端与任何服务器或代理的连接不得超过 2 个。

d. 是可能的。客户端可能已开始在服务器决定关闭“空闲”连接的同时发送新请求。从服务器的角度来看，连接在空闲时正在关闭，但是从客户端的角度来看，请求正在进行中。

## P7

![P7](/resource/P7.png)

**Ans:**

获得IP地址的总时间为 RTT1 + RTT2 ... RTTn。一旦知道 IP 地址，就会经过 RTT0 来建立 TCP 连接，而经过另一个 RTT0 来请求并接收小对象。 总响应时间为 2RTT0 + RTT1 + RTT2 ... RTTn。