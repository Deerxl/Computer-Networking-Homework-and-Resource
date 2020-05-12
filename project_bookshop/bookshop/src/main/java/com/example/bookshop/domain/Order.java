package com.example.bookshop.domain;

import java.sql.Timestamp;

/**
 * @author Alu
 * @date 2020/4/21 21:34

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
`id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`time` datetime(0) NOT NULL COMMENT '订单时间',
`buyer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下单者',
`address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
`price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
PRIMARY KEY (`id`) USING BTREE,
INDEX `fk_orderbuy_user`(`buyer`) USING BTREE,
INDEX `fk_order_address`(`address`) USING BTREE,
CONSTRAINT `fk_order_address` FOREIGN KEY (`address`) REFERENCES `address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT `fk_orderbuy_user` FOREIGN KEY (`buyer`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单信息' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

 */
public class Order {
    private String id;
    private Timestamp time;
    private String buyer;
    private String address;
    private double price;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", time=" + time +
                ", buyer='" + buyer + '\'' +
                ", address='" + address + '\'' +
                ", price=" + price +
                '}';
    }
}
