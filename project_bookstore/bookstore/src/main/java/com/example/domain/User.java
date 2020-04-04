package com.example.domain;

import java.io.Serializable;


/**
 SET NAMES utf8mb4;
 SET FOREIGN_KEY_CHECKS = 0;

 -- ----------------------------
 -- Table structure for user
 -- ----------------------------
 DROP TABLE IF EXISTS `user`;
 CREATE TABLE `user`  (
 `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
 `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
 `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
 `tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话',
 `authority` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0-管理员；1-顾客',
 PRIMARY KEY (`id`) USING BTREE
 ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

 -- ----------------------------
 -- Records of user
 -- ----------------------------
 INSERT INTO `user` VALUES ('0330', 'alu', '123456', '17362447819', 1);
 INSERT INTO `user` VALUES ('0331', 'legend', '123456', '17362440819', 1);

 SET FOREIGN_KEY_CHECKS = 1;
 */

public class User implements Serializable {
    private String id;
    private String name;
    private String password;
    private String tel;
    private int authority;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getAuthority() {
        return authority;
    }

    public void setAuthority(int authority) {
        this.authority = authority;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                ", authority=" + authority +
                '}';
    }
}
