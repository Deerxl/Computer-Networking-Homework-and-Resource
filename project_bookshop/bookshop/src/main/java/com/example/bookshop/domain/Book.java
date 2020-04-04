package com.example.bookshop.domain;

import java.io.Serializable;
import java.time.Year;

/**
 SET NAMES utf8mb4;
 SET FOREIGN_KEY_CHECKS = 0;

 -- ----------------------------
 -- Table structure for book
 -- ----------------------------
 DROP TABLE IF EXISTS `book`;
 CREATE TABLE `book`  (
 `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
 `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书籍名称',
 `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者',
 `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片地址',
 `price` float(10, 2) NOT NULL COMMENT '价格',
 `type` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '类型：0：未分类 1：文学  2：科幻 3：悬疑',
 `score` float(4, 2) NULL DEFAULT NULL COMMENT '评分',
 `intro` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '无' COMMENT '简介',
 `nation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国家',
 `year` year NULL DEFAULT NULL COMMENT '年份',
 `hot` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '热门：0：未知 1：不热门 2：热门',
 PRIMARY KEY (`id`) USING BTREE
 ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

 SET FOREIGN_KEY_CHECKS = 1;

 */
public class Book implements Serializable {
    private String id;
    private String name;
    private String author;
    private String image;
    private double price;
    private int type;
    private double score;
    private String intro;
    private String nation;
    private Year year;
    private int hot;

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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public Year getYear() {
        return year;
    }

    public void setYear(Year year) {
        this.year = year;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", type=" + type +
                ", score=" + score +
                ", intro='" + intro + '\'' +
                ", nation='" + nation + '\'' +
                ", year=" + year +
                ", hot=" + hot +
                '}';
    }
}
