# homework6

## 用 python 实现 16 位的检验和

```python
def checksum(data_list):
    sum = 0
    max_value = 0xFFFF
    min_value = 0x8000
    for i in data_list:
        i = '0b' + i
        i = int(i, base=2)
        sum += i
        if sum > max_value:
            sum -= min_value
            sum += 1
    return sum ^ max_value


def true_sum(data_list, check_sum):
    sum = 0
    max_value = 0xFFFF
    min_value = 0x8000
    for i in data_list:
        i = '0b' + i
        i = int(i, base=2)
        sum += i
        if sum > max_value:
            sum -= min_value
            sum += 1
    return sum + check_sum


data = ['0110011001100000', '0101010101010101', '1000111100001100']
check_sum = checksum(data)
cal_sum = true_sum(data, check_sum)
if cal_sum == "0xFFFF":
    print('ok')
else:
    print('fail')
```

运行结果如下：

![checksum_result](/resource/checksum_result.png)

## P1

![P1](/resource/P1.png)

**Ans:**

a. 源端口号：467；目的端口号：23。

b. 源端口号：513；目的端口号：23。

c. 源端口号：23；目的端口号：467。

d. 源端口号：23；目的端口号：513。

e. 可能。

f. 不可能。

## P2

![P2](/resource/P2.png)

<img src="/resource/pic_3-5.jpg" alt="3-5" style="zoom: 67%;" />

**Ans:**

假设主机 A，B，C 的 IP 地址分别为 a，b，c。

主机 A：源端口：80，目的端口：26145；源 IP ：b，目的 IP ：a。

到主机 C 左进程的源端口：80，目的端口：7532；源 IP ：b，目的 IP ：c。

到主机 C 右进程的源端口：80，目的端口：26145；源 IP ：b，目的 IP ：c。