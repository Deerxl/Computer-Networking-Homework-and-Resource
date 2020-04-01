# MyBatis

<!-- TOC -->

- [MyBatis](#mybatis)
    - [概述](#概述)
    - [入门和配置](#入门和配置)
        - [配置](#配置)
        - [注意事项：](#注意事项)
        - [入门](#入门)
    - [MyBatis 基于注解的入门案例](#mybatis-基于注解的入门案例)

<!-- /TOC -->

## 概述

MyBatis，**基于java的持久层框架**，内部封装了 jdbc ，使开发者只需要关注 sql 语言本身不需要花费精力去处理加载驱动、创建连接、创建 statement 等繁杂的过程。

myBatis 通过**xml**或**注解**的方式将要执行的各种 statement 配置起来，并通过 java 对象和 statement 中 sql 的动态参数进行映射生成最终执行的 sql 语句，最后由MyBatis框架执行 sql 并将结果映射为 java 对象并返回。

采用 ORM 思想解决了实体和数据库映射的问题，对 jdbc 进行了封装，屏蔽了 jdbc api 底层访问细节，使我们不用与 jdbc api 打交道，就可以完成对数据库的持久化操作。

```
ORM：Object Relational Mapping 对象关系映射

把数据库表和实体类及实体类的属性对应起来，让我们可以通过操作实体类就可以实现操作数据库表。
```

## 入门和配置

### 配置

1. pom.xml 配置，mybatis, mysql-connctor-java, junit, log4j

2. domain 包下，User 类，implements Serializable，实体类。数据库表的列名必须和实体类属性一样。生成 get 和 set 方法（右键 generate ，getter 和 setter）。最后生成 toString()。

3. dao 包下，创建接口，IUserDao 类。用户持久层接口。声明方法。例如 `List<User> findAll();`

4. resource 包下，SqlMapConfig.xml 文件，配置数据库环境。

5. 创建映射配置文件，IUserDao.xml 文件。\<select\>标签需要和方法名（例如， findAll ）完全相同。

### 注意事项：

1. idea 中，包和目录是不一样的。创建包时 com.demo.dao 是三级结构，创建目录时，是一级目录。

2. mybatis 的映射配置文件位置必须和 dao 接口的包结构相同。

3. 映射配置文件的操作配置（select），id 属性的取值必须是 dao 接口的方法名。

4. 映射配置文件的 mapper 标签 namespace 属性的取值必须是 dao 接口的全限定类名。

### 入门

1. 配置 log4j.properties 文件。

2. test 文件夹下 main 方法：

    ```
    public static void main(String[] args) throws Exception {
        // 1. 读取配置文件
        InputStream in = Resource.getResourceAsStream("SqlMapConfig.xml");
        // 2. 创建 SqlSessionFactory 工厂
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactoryBuilder factory = builder.build(in);
        // 3. 使用工厂生产 SqlSession 对象
        SqlSession session = factory.openSession();
        // 4. 使用 SqlSession 创建 Dao 接口的代理对象
        IUserDao userDao = session.getMapper(IUserDao.class);
        // 5. 使用代理对象执行方法
        List<User> users = userDao.findAll();
        for (User user : users) {
            System.out.println(user);
        }
        // 6. 释放资源
        session.close();
        in.close();
    }
    ```

3. 注意不要忘记映射配置中告知 mybatis 要封装到哪个实体类。注意 \<select> 标签里的返回值类型。

## MyBatis 基于注解的入门案例

把 IUserDao.xml 移除，在 dao 接口的方法上使用 @Select 注解，并且指定 SQL 语句，同时需要在 SqlMapConfig.xml 中的 mapper 配置时，使用 class 属性指定 dao 接口的全限定类名。

明确：在实际开发中，越简便越好，所以都是采用不写 dao 实现类的方式。不管使用 XML 还是注解配置。

impl 文件夹下，UserDaoImpl 类，实现 IUserDao 接口。
