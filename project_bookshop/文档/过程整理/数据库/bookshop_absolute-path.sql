/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : bookshop

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 17/04/2020 14:10:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '湖北' COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '武汉' COMMENT '县市',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '洪山区武汉大学信息学部国际软件学院' COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id，要求：不允许含任何空格',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书籍名称，要求：不允许含任何空格',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者，要求：不允许含任何空格',
  `price` double(10, 2) NOT NULL COMMENT '价格，要求：不小于0',
  `press` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未知' COMMENT '出版社，默认\"未知\"',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址，支持相对/绝对路径，适用的图片格式为：bmp/gif/jpeg/jpg/png/raw/tif',
  `type` tinyint(3) NULL DEFAULT 1 COMMENT '类型：1：未分类',
  `score` double(4, 2) NULL DEFAULT 10.00 COMMENT '评分：[0, 10]',
  `intro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无' COMMENT '简介，默认\"无\"',
  `nation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未知' COMMENT '国家，默认\"未知\"',
  `year` year NULL DEFAULT NULL COMMENT '年份，默认NULL',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_book_type`(`type`) USING BTREE,
  CONSTRAINT `fk_book_type` FOREIGN KEY (`type`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '平凡的世界', '路遥', 23.90, '未知', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-ordinary-world.jpg?Expires=1902241771&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=WZWOzZ1uaLI7KnKbpSRJHvRw9Ns%3D', 3, 9.00, '《平凡的世界》是中国作家路遥创作的一部百万字的小说。这是一部全景式地表现中国当代城乡社会生活的长篇小说，全书共三部。1986年12月首次出版。\r\n该书以中国70年代中期到80年代中期十年间为背景，通过复杂的矛盾纠葛，以孙少安和孙少平两兄弟为中心，刻画了当时社会各阶层众多普通人的形象；劳动与爱情、挫折与追求、痛苦与欢乐、日常生活与巨大社会冲突纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。1991年3月，《平凡的世界》获中国第三届茅盾文学奖。2019年9月23日，该小说入选“新中国70年70部长篇小说典藏”。', '中国', 1986);
INSERT INTO `book` VALUES (2, '乌合之众', '勒庞', 16.00, '中央编译出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-crowd.jpg?Expires=1902241773&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=X%2Bzm4bAW8GoEJgkcxN1R%2Fvd0lE4%3D', 3, 8.20, '古斯塔夫・勒庞 Gustave Le Bon(1841-1931) 法国著名社会心理学家。他自1894年始，写下一系列社会心理学著作，以本书最为著名；在社会心理学领域已有的著作中，最有影响的，也是这本并不很厚的《乌合之众》。古斯塔夫・勒庞在他在书中极为精致地描述了集体心态，对人们理解集体行为的作用以及对社会心理学的思考发挥了巨大影响。《乌合之众--大众心理研究》在西方已印至第29版，其观点新颖，语言生动，是群体行为的研究者不可不读的佳作。\r\n\r\n', '法国', 2011);
INSERT INTO `book` VALUES (3, '如何阅读一本书', '莫提默·J. 艾德勒 / 查尔斯·范多伦', 38.00, '商务印书馆', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-how-to-read-a-book.jpg?Expires=1902241777&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=q1xEeoPKHNq2dXR0zgBEcb%2FlhZw%3D', 3, 8.40, '每本书的封面之下都有一套自己的骨架，作为一个分析阅读的读者，责任就是要找出这个骨架。一本书出现在面前时，肌肉包着骨头，衣服包裹着肌肉，可说是盛装而来。读者用不着揭开它的外衣或是撕去它的肌肉来得到在柔软表皮下的那套骨架，但是一定要用一双X光般的透视眼来看这本书，因为那是了解一本书、掌握其骨架的基础。\r\n\r\n《如何阅读一本书》初版于1940年，1972年大幅增订改写为新版。不懂阅读的人，初探阅读的人，读这本书可以少走冤枉路。对阅读有所体会的人，读这本书可以有更深的印证和领悟。', '美国', 2004);
INSERT INTO `book` VALUES (4, '少有人走的路', '斯科特·派克', 26.00, '吉林文史出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-road-less-traveled.jpg?Expires=1902241778&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=U1rVXfJ2QwVupXw%2BmELYHPv3K7A%3D', 3, 8.40, '这本书处处透露出沟通与理解的意味，它跨越时代限制，帮助我们探索爱的本质，引导我们过上崭新，宁静而丰富的生活；它帮助我们学习爱，也学习独立；它教诲我们成为更称职的、更有理解心的父母。归根到底，它告诉我们怎样找到真正的自我。\r\n\r\n正如开篇所言：人生苦难重重。M·斯科特·派克让我们更加清楚：人生是一场艰辛之旅，心智成熟的旅程相当漫长。但是，他没有让我们感到恐惧，相反，他带领我们去经历一系列艰难乃至痛苦的转变，最终达到自我认知的更高境界。', '美国', 2007);
INSERT INTO `book` VALUES (5, '追风筝的人', '卡勒德·胡赛尼', 29.00, '上海人民出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-kite-runner.jpg?Expires=1902241775&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=QY2U%2F8l8qY7K5MDlooG%2FOKtbeSk%3D', 3, 8.90, '12岁的阿富汗富家少爷阿米尔与仆人哈桑情同手足。然而，在一场风筝比赛后，发生了一件悲惨不堪的事，阿米尔为自己的懦弱感到自责和痛苦，逼走了哈桑，不久，自己也跟随父亲逃往美国。\r\n\r\n成年后的阿米尔始终无法原谅自己当年对哈桑的背叛。为了赎罪，阿米尔再度踏上暌违二十多年的故乡，希望能为不幸的好友尽最后一点心力，却发现一个惊天谎言，儿时的噩梦再度重演，阿米尔该如何抉择？\r\n\r\n故事如此残忍而又美丽，作者以温暖细腻的笔法勾勒人性的本质与救赎，读来令人荡气回肠。', '美国', 2006);
INSERT INTO `book` VALUES (6, '万历十五年', '黄仁宇', 18.00, '生活·读书·新知三联书店', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-fiveteen-years.jpg?Expires=1902241776&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=EKEYcXpgn97AC8vKqML4iuzf0Os%3D', 12, 8.90, '万历十五年，亦即公元1587年，在西欧历史上为西班牙舰队全部出动征英的前一年；而在中国，这平平淡淡的一年中，发生了若干为历史学家所易于忽视的事件。这些事件，表面看来虽似末端小节，但实质上却是以前发生大事的症结，也是将在以后掀起波澜的机缘。在历史学家黄仁宇的眼中，其间的关系因果，恰为历史的重点，而我们的大历史之旅，也自此开始……\r\n\r\n《万历十五年》是黄仁宇的成名之作，也是他的代表作之一。这本书融会了他数十年人生经历与治学体会，首次以“大历史观”分析明代社会之症结，观察现代中国之来路，给人启发良多。英文原本推出后，被美国多所大学采用为教科书，并两次获得美国书卷奖历史类好书的提名。', '美国', 1997);
INSERT INTO `book` VALUES (7, '红楼梦', '曹雪芹 / 高鹗', 18.50, '岳麓书社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-red-dream.jpg?Expires=1902241770&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=apETUPYtJkk3BRQv4OeRS3WAnYk%3D', 8, 9.60, '《红楼梦》是一部中国末期封建社会的百科全书。小说以上层贵族社会为中心图画，真实、生动地描写了十八世纪上半叶中国末期封建社会的全部生活，是这段历史生活的一面镜子和缩影，是中国古老封建社会已经无可挽回地走向崩溃的真实写照。《红楼梦》之所以成为“中国小说文学难以征服的顶峰”，不仅仅是因为它具有很高的思想价值，还在于它非凡的艺术成就。全书规模宏伟，结构严谨，人物生动，语言优美。此外还有一些明显的艺术特点值得后人品味、鉴赏。《红楼梦》一书，通过对“贾、史、王、薛”四大家族荣衰的描写，展示了广阔的社会生活视野，森罗万象，囊括了多姿多彩的世俗人情。人称《红楼梦》内蕴着一个时代的历史容量，是封建末世的百科全书。\r\n\r\n', '中国', 1999);
INSERT INTO `book` VALUES (8, '三体', '刘慈欣', 23.00, '重庆出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-three-body.jpg?Expires=1902241776&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=FGACfzCrXvo6Ghq3L%2BBkl%2FRzjGM%3D', 8, 8.80, '文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……\r\n\r\n四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时。他们接收到了地球发来的信息。在运用超技术锁死地球人的基础科学之后。三体人庞大的宇宙舰队开始向地球进发……\r\n\r\n人类的末日悄然来临。\r\n\r\n', '中国', 2008);
INSERT INTO `book` VALUES (9, '失控', '凯文·凯利', 88.00, '新星出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-out-of-control.jpg?Expires=1902241778&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=R0jrGSyQXcJNzcMyvqtZq1ux8lY%3D', 10, 8.70, '《失控》，全名为《失控：机器、社会与经济的新生物学》（Out of Control: The New Biology of Machines, Social Systems, and the Economic World）。\r\n\r\n2006年，《长尾》作者克里斯·安德森在亚马逊网站上这样评价该书：\r\n\r\n“这可能是90年代最重要的一本书”，并且是“少有的一年比一年卖得好的书”。“尽管书中的一些例子在十几年后可能有些过时，但（它们所表达的）信息却越来越成为真知灼见”。“在那时人们还无法想象博客和维基等大众智慧的突起，但凯利却分毫不差地预见到了。这可能是过去十年来最聪明的一本书。”\r\n\r\n这是一部思考人类社会（或更一般意义上的复杂系统）进化的“大部头”著作，对于那些不惧于“头脑体操”的读者来说，必然会开卷有益。\r\n\r\n《失控》成书于1994年，作者是《连线》杂志的创始主编凯文·...', '美国', 2010);
INSERT INTO `book` VALUES (10, '西方科学的起源', '戴维·林德伯格', 78.00, '湖南科学技术出版社', 'https://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-beginnings-of-western-science.jpg', 10, 9.30, '本书是论述近代以前西方科学的权威教材，也是一部非常优秀的科学史读物。它结合欧洲科学传统的哲学、宗教和体制背景，用一本书的篇幅深入浅出地介绍了从古希腊到中世纪晚期各个方面的科学成就，竭力避免从今天的科学观点出发来理解古代成就。1992年本书第一版问世后好评如潮。2007年，作者对该书做了重要修订，几乎每一页都有增补和调整，特别是扩充了关于拜占庭科学、美索不达米亚天文学、中世纪的炼金术和占星术等方面的内容，关于伊斯兰科学的一章和讨论中世纪对16、17世纪科学发展贡献的最后一章则完全重写。中译本即根据新版译出。', '美国', 2013);
INSERT INTO `book` VALUES (11, '白夜行', '东野圭吾', 29.80, '南海出版公司', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-day-nignt-walk.jpg?Expires=1902241770&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=xoq9ODEiBa9%2FtDrGJbM5OIQG7Ps%3D', 8, 9.10, '“只希望能手牵手在太阳下散步”，这个象征故事内核的绝望念想，有如一个美丽的幌子，随着无数凌乱、压抑、悲凉的故事片段像纪录片一样一一还原：没有痴痴相思，没有海枯石烂，只剩下一个冰冷绝望的诡计，最后一丝温情也被完全抛弃，万千读者在一曲救赎罪恶的凄苦爱情中悲切动容……\r\n\r\n', '中国', 2008);
INSERT INTO `book` VALUES (12, '不能承受的生命之轻', '米兰·昆德拉', 23.00, '上海译文出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-life-weight.jpg?Expires=1902241775&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=i3LODmgTvrAXiHKWYcgmUXKMnys%3D', 8, 8.50, '《不能承受的生命之轻》是米兰·昆德拉最负盛名的作品。小说描写了托马斯与特丽莎、萨丽娜之间的感情生活。但它不是一个男人和两个女人的三角性爱故事，它是一部哲理小说，小说从“永恒轮回”的讨论开始，把读者带入了对一系列问题的思考中，比如轻与重、灵与肉。\r\n\r\n《不能承受的生命之轻》是一部意象繁复的书，其中装载了多种涵义：被政治化了的社会内涵的揭示、人性考察、个人命运在特定历史与政治语境下的呈现，以及对两性关系本质上的探索等。昆德拉将这些元素糅合在一起，写成一部非同凡响的小说——其中既有隐喻式的哲学思考，也有人的悲欢离合的生命历程的展现。', '捷克', 2003);
INSERT INTO `book` VALUES (13, '社会心理学', '戴维·迈尔斯', 68.00, '人民邮电出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-social-phychology.jpg?Expires=1902241774&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=mRwnBZjk4Q%2BuByMIqGkCekGYIr8%3D', 13, 9.00, '《社会心理学》这本书被美国700多所大学或学院的心理系所采用，是这一领域的主导教材，已经成为评价其他教材的标准。\r\n\r\n这本书将基础研究与实践应用完美地结合在一起，以富有逻辑性的组织结构引领学生了解人们是如何思索、影响他人并与他人建立联系的。是人们了解自身、了解社会、了解自己与社会之间关系的最佳的指导性书籍。', '美国', 2006);
INSERT INTO `book` VALUES (14, '心理学与生活', '理查德·格里格 / 菲利普·津巴多', 88.00, '人民邮电出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-phychology-life.jpg?Expires=1902241772&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=agkYX3z5vrkqypi%2FgRfb8B4scr0%3D', 13, 8.80, '《心理学与生活》是美国斯坦福大学多年来使用的教材，也是在美国许多大学里推广使用的经典教材，被ETS推荐为GRE心理学专项考试的主要参考用书，还是被许多国家大学的“普通心理学”课程选用的教材。这本教科书写作流畅，通俗易懂，深入生活，把心理学理论与知识联系人们的日常生活与工作，使它同样也成为一般大众了解心理学与自己的极好读物。\r\n\r\n作为一本包含着丰富的教育思想和独特教学方法的成熟教材，原书中所有元素——如由600余条词汇及解释组成的“专业术语表”，2000余条“参考文献”，以及近1000条的“人名和主题索引”等等，对于教学、研究和学习都十分宝贵，此中译本完整地翻译和保留了这些资料。\r\n\r\n', '美国', 2003);
INSERT INTO `book` VALUES (15, '小王子', '安东尼·德·圣-埃克苏佩里', 22.00, '人民文学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-little-prince.jpg?Expires=1902241774&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=ozKTKJHNEJDXuV%2B2KScnsOo%2BfrY%3D', 3, 9.00, '小王子是一个超凡脱俗的仙童，他住在一颗只比他大一丁点儿的小行星上。陪伴他的是一朵他非常喜爱的小玫瑰花。但玫瑰花的虚荣心伤害了小王子对她的感情。小王子告别小行星，开始了遨游太空的旅行。他先后访问了六个行星，各种见闻使他陷入忧伤，他感到大人们荒唐可笑、太不正常。只有在其中一个点灯人的星球上，小王子才找到一个可以作为朋友的人。但点灯人的天地又十分狭小，除了点灯人他自己，不能容下第二个人。在地理学家的指点下，孤单的小王子来到人类居住的地球。\r\n\r\n小王子发现人类缺乏想象力，只知像鹦鹉那样重复别人讲过的话。小王子这时越来越思念自己星球上的那枝小玫瑰。后来，小王子遇到一只小狐狸，小王子用耐心征服了小狐狸，与它结成了亲密的朋友。小狐狸把自己心中的秘密——肉眼看不见事务的本质，只有用心灵才能洞察一切——作为礼物，送给小王子。用这个秘密，小王子在撒哈拉大沙漠与遇险的飞行员一起找到了生命的泉水。最后，小王子在蛇的帮助下离开地球，重新回到他的B612号小行星上。\r\n\r\n童话描写小王子没有被成人那骗人的世界所征服，而最终找到自己的理想。这理想就是连结宇宙万物的爱，而这种爱又是世间所缺少的。因此，小王子常常流露出一种伤感的情绪。作者圣埃克絮佩里在献辞中说：这本书是献给长成了大人的从前那个孩子。\r\n\r\n《小王子》不仅赢得了儿童读者，也为成年人所喜爱，作品凝练的语言渗透了作者对人类及人类文明深邃的思索。它所表现出的讽刺与幻想，真情与哲理，使之成为法国乃至世界上最为著名的一部童话小说。\r\n\r\n', '法国', 2003);
INSERT INTO `book` VALUES (16, '影响力', '罗伯特·西奥迪尼', 45.00, '中国人民大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-influence.jpg?Expires=1902241770&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=mhFCDbQVwJWqZNhmesHCOL5Rv7w%3D', 13, 8.60, '政治家运用影响力来赢得选举，商人运用影响力来兜售商品，推销员运用影响力诱惑你乖乖地把金钱捧上。即使你的朋友和家人，不知不觉之间，也会把影响力用到你的身上。但到底是为什么，当一个要求用不同的方式提出来时，你的反应就会从负面抵抗变成积极合作呢？\r\n\r\n在这本书中，心理学家罗伯特·B·西奥迪尼博士为我们解释了为什么有些人极具说服力，而我们总是容易上当受骗。隐藏在冲动地顺从他人行为背后的6大心理秘笈，正是这一切的根源。那些劝说高手们，总是熟练地运用它们，让我们就范。', '美国', 2006);
INSERT INTO `book` VALUES (17, '哥德尔、艾舍尔、巴赫', '侯世达', 88.00, '商务印书馆', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-godel-escher-bach.jpg?Expires=1902241773&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=W2I5GLykqtfhVxOh7roI9%2B3%2BdUI%3D', 13, 9.40, '集异璧－GEB，是数学家哥德尔、版画家艾舍尔、音乐家巴赫三个名字的前缀。《哥德尔、艾舍尔、巴赫书：集异璧之大成》是在英语世界中有极高评价的科普著作，曾获得普利策文学奖。它通过对哥德尔的数理逻辑，艾舍尔的版画和巴赫的音乐三者的综合阐述，引人入胜地介绍了数理逻辑学、可计算理论、人工智能学、语言学、遗传学、音乐、绘画的理论等方面，构思精巧、含义深刻、视野广阔、富于哲学韵味。\r\n\r\n中译本前后费时十余年，译者都是数学和哲学的专家，还得到原作者的直接参与，译文严谨通达，特别是在原作者的帮助下，把西方的文化典故和说法，尽可能转换为中国文化的典故和说法，使这部译本甚至可看作是一部新的创作，也是中外翻译史上的一个创举。', '美国', 1997);
INSERT INTO `book` VALUES (18, '通往奴役之路', '弗里德利希·奥古斯特·哈耶克', 16.00, '中国社会科学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-to-slaves.jpg?Expires=1902241772&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=5CIgjarpK4NR1%2FE5uFvcYfhzUPU%3D', 13, 8.80, '《通往奴役之路》一书在哈耶克的学术生涯中占有极其重要地位，这本书为他赢得广泛的注意，他的世界性声誉就是由此奠定的。他在这本书中论证道，当时正在计划中的福利国家不是为个人自由的战斗在和平时期的继续，倒是朝着专制的方向迈出了一步。因此，他认为追求计划经济，其无意识后果必然是极权主义。为了反对这种计划经济，哈耶克有力地重申了他一贯坚持的古典自由主义观点，同时，也允许适度的政府活动，但这仅限于符合他的法治概念的那些活动形式。应该强调的是，哈耶克的自由主义包括对许多有用的社会制度的赞赏，但这些制度只能是人的自发行动的后果，而不能是人设计的结果。这一论点是从休漠、亚当・斯密和苏格兰历史学派那里继承过来的，它在哈耶克的著作中占据了重要位置。由此出发，哈耶克认为，良好的社会不是简单地依赖于在政府所提供的法律框架内追求私利，相反，它应依赖于一套复杂的法律、道义传统和行为规则的框架，这套框架的特点应该为大多数社会成员所理解和认同。\r\n\r\n这部著作从问世直到今天，一直在学术界中存有争议。其中，一个重要原因在于这本书本身的内在悖论。我们知道，哈耶克这本书的观点来源于关于市场和其它非主观设计的制度所具有的“自发秩序”的特性的思想。这种思想使哈耶克遇到一些难以解决的问题，使他不可避免地陷于社会进化和团体选择的争端之中。他对选择机制特点的论述与自由主义的关系并不总是清楚的。这些论点的非理性特征与其高度理性的几近乌托邦的新自由主义思想，形成鲜明的对照。《通往奴役之路》一书所存在的这种缺陷，日后也为作者本人意识到，他在后来出版的《自由宪章》和《法律、立法和自由》三部曲中，多处涉及这个难题，试图将古典自由主义与“进代”的主题结合起来。至于这一尝试成功与否，尚有待评说，但哈耶克及其著作无疑对学术界产生了重要影响，并对政治思想领域中古典自由主义的复兴发挥了极大的作用。\r\n\r\n', '英国', 1997);
INSERT INTO `book` VALUES (19, '历史深处的忧虑', '林达', 19.00, '生活·读书·新知三联书店', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-history-consideration.jpg?Expires=1902241769&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=2CCfLhFHQ1s9Y93OZMQQb0cDuPE%3D', 12, 9.00, '美国的面积和中国差不多。和大多数留学生及新移民一样，当我们一脚踏上这块广袤的陌生土地时，最初落脚点的选择是十分偶然的。我们落在了一个普通的地方，居住的环境平常而宁静。周围的美国人老老少少都在辛勤劳作，过着普通得不能再普通的生活。要想谋出一番好的光景，对他们也不是一件轻而易举的事情。\r\n\r\n还来不及作任何思索，新移民所面临的生活压力就立即把我们投入了同样的辛勤劳作之中。这样，我们和周围的普通美国人之间，自然就有了共同谋生而产生的共同语言，也有了共同的经历，共同的喜怒哀乐。不少美国人还成了我们的好朋友。我们无形中发现，美国已经渐渐地从一堆抽象的概念中走出来，变成了脚下实实在在的土地，变成了一片片森林牧场，变成了一个一个美国人……', '中国', 1997);
INSERT INTO `book` VALUES (20, '霍乱时期的爱情', '加西亚·马尔克斯', 39.50, '南海出版公司', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-love-in-disaster.jpg?Expires=1902241777&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=Io5Q0R5iLvta7z7K06MgP9nMK2o%3D', 3, 9.00, '★马尔克斯唯一正式授权，首次完整翻译\r\n\r\n★《霍乱时期的爱情》是我最好的作品，是我发自内心的创作。——加西亚•马尔克斯\r\n\r\n★这部光芒闪耀、令人心碎的作品是人类有史以来最伟大的爱情小说。——《纽约时报》\r\n\r\n《霍乱时期的爱情》是加西亚•马尔克斯获得诺贝尔文学奖之后完成的第一部小说。讲述了一段跨越半个多世纪的爱情史诗，穷尽了所有爱情的可能性：忠贞的、隐秘的、粗暴的、羞怯的、柏拉图式的、放荡的、转瞬即逝的、生死相依的……再现了时光的无情流逝，被誉为“人类有史以来最伟大的爱情小说”，是20世纪最重要的经典文学巨著之一。', '哥伦比亚', 2012);
INSERT INTO `book` VALUES (21, '枪炮、病菌与钢铁', '贾雷德·戴蒙德', 45.00, '上海世纪出版集团', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-guns-germs-and-steel.jpg?Expires=1902241776&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=lo3XIL21inpmTNYhEoe%2Fueyyr7g%3D', 10, 8.70, '为什么是欧亚大陆人征服、赶走或大批杀死印第安人、澳大利亚人和非洲人，而不是相反？为什么么小麦和玉米、牛和猪以及现代世界的其他一些“不了起的”作物和牲畜出现在这些特定地区，而不是其他地区？在这部开创性的著作中，演化生物学家贾雷德.戴蒙德揭示了事实上有助于形成历史最广泛模式的环境因素，从而以震撼人心的力量摧毁了以种族主义为基础的人类史理论，因其突出价值和重要性，本书荣获1998年美国普利策奖和英国科普书奖，并为《纽约时报》畅销书排行榜作品。\r\n\r\n本书是理解人类社会发展史方面的一个重大进展，它记录了现代世界及其诸多不平等所以形成的原因，也是一部真正关于全世界各民族的历史，是对人类生活的完整一贯的叙述，娓娓道来，具有很强的可读性。\r\n\r\n', '美国', 2006);
INSERT INTO `book` VALUES (22, '月亮和六便士', '威廉·萨默塞特·毛姆', 15.00, '上海译文出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-moon-and-sixpence.jpg?Expires=1902241773&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=RwAU1Il0QGXWvQXpFSqyTJrKao0%3D', 3, 9.00, '一个英国证券交易所的经纪人，本已有牢靠的职业和地位、美满的家庭，但却迷恋上绘画，像“被魔鬼附了体”，突然弃家出走，到巴黎去追求绘画的理想。他的行径没有人能够理解。他在异国不仅肉体受着贫穷和饥饿煎熬，而且为了寻找表现手法，精神亦在忍受痛苦折磨。经过一番离奇的遭遇后，主人公最后离开文明世界，远遁到与世隔绝的塔希提岛上。他终于找到灵魂的宁静和适合自己艺术气质的氛围。他同一个土著女子同居，创作出一幅又一幅使后世震惊的杰作。在他染上麻风病双目失明之前，曾在自己住房四壁画了一幅表现伊甸园的伟大作品。但在逝世之前，他却命令土著女子在他死后把这幅画作付之一炬。通过这样一个一心追求艺术、不通人性世故的怪才，毛姆探索了艺术的产生与本质、个性与天才的关系、艺术家与社会的矛盾等等引人深思的问题。同时这本书也引发了人们对摆脱世俗束缚逃离世俗社会寻找心灵家园这一话题的思考，而关于南太平洋小岛的自然民风的描写也引人向往。\r\n\r\n《月亮和六便士》说问世后，以情节入胜、文字深刻在文坛轰动一时，人们争相传看。在小说中，毛姆用第一人称的叙述手法，借“我”之口，叙述整个故事，有人认为这篇小说的原型是法国印象派画家高更，这更增加了它的传奇色彩，受到了全世界读者的关注。', '英国', 2006);
INSERT INTO `book` VALUES (23, '民主的细节', '刘瑜', 25.00, '上海三联书店', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-democratic-details.jpg?Expires=1902241773&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=tX%2Bw%2BrEK%2FN7TGU0aH3%2FWpUCTnBU%3D', 4, 8.60, '这本书是作者过去几年给一些期刊报纸写的专栏文章结集，其中主要是给《南方人物周刊》的文章。全书中以讲故事的形式，把“美国的民主”这样一个概念性的东西拆解成点点滴滴的事件、政策和人物去描述。', '中国', 2009);
INSERT INTO `book` VALUES (24, '变化社会中的政治秩序', '塞缪尔·P·亨廷顿', 42.00, '上海人民出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-political-order-in-changing-societies.jpg?Expires=1902241770&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=idRNR%2BQFOvjt7zHEFcdg9XYCuZk%3D', 4, 9.30, '《变化社会中的政治秩序》凝住的关于发展中国家的知识广度和分析洞见是惊人的，并确立了亨氏作为他同时代人中最杰出政治学家之一的声誉。首先，亨廷顿论辩说，政治衰朽至少和政治发展一样可能发生。新近独立国家的实际经历是一种愈演愈烈的社会和政治混乱。其次，他提出，现代性中的好东西常常向交错的目标运动。特别是在社会动员超越政治机构发展时，新的社会行为者发现他们无法参与政治而产生挫折感。其结果便是亨氏名之为“普力夺主义”(praetorianism)的状况，也是导致反叛、军事政变以及软弱和组织不力政府的主要原因。经济发展和政治发展不是同一事物的严丝合缝的组成部分。后者随着诸如政党和法制系统之类组织的设立或衍变为更复杂的形式而具有自身的、另类的逻辑。', '美国', 2008);
INSERT INTO `book` VALUES (25, '学术与政治 : 韦伯的两篇演说', '马克斯·韦伯', 17.00, '生活·读书·新知三联书店', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-academic-and-olitics.jpg?Expires=1902241776&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=sWFB%2BJZU9owM5ZFupAuJmTrqRCo%3D', 4, 9.20, '《学术与政治》内容简介：研究韦伯者，无一不深知这两篇演说的重要性。因为它们不但浓缩着韦伯学术思想的精华，也由于他作为当时一名“精神贵族”式的德国知识界领袖，对其身边的思潮做出了十分个性化的回应，这是从韦伯其他学术著作中难得一见的。', '德国', 2005);
INSERT INTO `book` VALUES (26, '坏世界研究', '赵汀阳', 39.00, '中国人民大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-bad-world-research.jpg?Expires=1902241772&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=6glg81uZ4%2BNri1lSsoTJbNt93vU%3D', 4, 8.80, '《坏世界研究:作为第一哲学的政治哲学》讨论了决定人们命运的制度、自由、权利和权力，这《坏世界研究:作为第一哲学的政治哲学》揭示了治国、治人、治事的秘密、策略和智慧！《坏世界研究:作为第一哲学的政治哲学》最适合读者：学者、政治家、政府官员、企业管理者、传媒工作者、学生以及关心政治的各界人士。每个人的命运都掌握在他人手里，每个人都欠着别人的幸福和自由。人的命运是最大的哲学问题，而政治是命运的最大问题。虽然世界是个坏世界。但我们渴望一个好世界。马基雅维利教人制造坏世界，赵汀阳试图指出如何对付坏世界。', '未知', 2009);
INSERT INTO `book` VALUES (27, '政治学', '亚里士多德', 34.00, '商务印书馆', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-politics.jpg?Expires=1902241772&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=ecajSuAB8HpMzt%2B5UywF2KRL5vA%3D', 4, 9.10, '《政治学》是作者亚里士多德的“关于政体研究的专著”，具有多方面的学术价值，对于了解当时希腊社会的状况，了解古希腊人的政治、法律、伦理、教育思想，研究亚里士多德的学说，均有不可替代的作用。尽管这是一部论述政治问题的专著，但亚里士多德在探讨和阐释奴隶制各种政体及其统治形式的过程中也从教育与政治关系的角度，提出了一些教育的主张。', '古希腊', 1965);
INSERT INTO `book` VALUES (28, '南北战争三百年', '李硕', 59.00, '世纪文景 /上海人民出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-south-north-war-300-years.jpg?Expires=1902241775&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=H3RjOAPWQ9mm%2FEqAwnsCBBEZuWE%3D', 5, 8.10, '冷兵器战争究竟怎么打？\r\n\r\n写兵种、战术之细节 补正史、古籍之缺失\r\n\r\n揭六朝更迭种种真相 述血与剑的纷争乱世\r\n\r\n我们通常对古代战争的想象都源自演义、小说等文学作品，但这些作品中的战争场面都不过是小说家的幻想与虚构而已，并不是真实状况。本书对各种史料进行分析与整理，从散落史书各处的战争叙述中寻找线索，借助最新的史学研究成果，为我们描绘出了魏晋南北朝各场重大战役细节，展现出丰富、生动 的历史原貌。同时，本书对骑兵和步兵的作战模式和战术演变做了详细的论述，对战争中如地理、季节、财政等因素对战事所产生的影响进行了具体的讨论。由此，本书也补充了正史、古籍所未详述之处，通过一部军事史的写作，对魏晋南北朝历史进程做出了新的诠释。', '中国', 2018);
INSERT INTO `book` VALUES (29, '布局天下', '饶胜文', 21.00, '解放军出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-layout-world.jpg?Expires=1902241774&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=qWWufas9nevtlhmOtacdia%2F5Ypw%3D', 5, 8.80, '放在读者面前的这本书《布局天下——中国古代军事地理大势》，是一本历史军事地理著作。什么是历史军事地理?著名历史地理学家谭其骧先生认为：\"军事地理学研究军事与地理条件之间的关系，是人文地理的一个分支，也是军事科学的一个组成部分；其研究成果对指导军事行动具有重要意义。了解古代的军事地理是更好地认识当代军事地理的重要条件，因此，历史军事地理又是历史地理学，也是军事地理学中不可或缺的一部分篇章。\"(史念海《河山集·四集·谭其骧教授序》)饶胜文同志的这本书所论，是关于中国古代军事地理大势，虽然不是对古代军事地理作详细的考察，但其性质是历史军事地理著作，自无疑义。\r\n\r\n本书是一本历史军事地理著作。政治兴亡常与军事成败相关，而地理又与军事密切相关，故探讨中国古代军事地理大势，对于深入认识中国历史上历代兴亡，实为一个重要关键。本书的一个鲜明特点，是把中国古代军事地理大势形象地概括为\"棋盘型格局\"。全书内容亦由此而展开。因有\"棋盘型\"，乃有\"四角\"的分析，即关中、河北、东南、四川；乃有\"四边\"的阐述，即山西、山东、湖北、汉中；乃有关于\"合天下之全势\"的中原的认识。全书从地理形势、军事成败入手，最后落实到政治局面的变化，即历史上统一与分裂的成因及其类型。概而言之，全书由地理而言军事，由军事地理而论政治得失。', '中国', 2002);
INSERT INTO `book` VALUES (30, '经略幽燕', '曾瑞龙', 49.00, '北京大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-jing-lue-you-yan.jpg?Expires=1902241775&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=7xgj%2FivOKoV8MemeHnvyCTfhtiY%3D', 5, 8.80, '本书以北宋前期对辽作战为研究对象，从战略思维与文化、战役法、战术传统等层次分析宋辽战争中的成败关键。系统借鉴当代军事战略理论的研究成果和方法，有机地结合原始史料进行分析，不仅厘清了宋初军事史中若干疑点，而且跳出了传统史学叙述中以\"强干弱枝\"\"重文轻武\"或\"先南后北\"等粗略解释北宋对辽战争屡屡受挫的窠臼。提出，宋初对辽战争在不同时期体现出急速攻取、弹性防御、弭兵休战等不同取向和特征，其间也曾掺杂着和平外交解决的努力和可能性。而这些特点的出现又是从不同层面上受到战略思维、五代军事传统遗留、文人政治等因素影响的结果。\r\n\r\n举', '中国', 2013);
INSERT INTO `book` VALUES (31, '战争改变历史', '马克斯·布特', 68.00, '上海科学技术文献出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-war-change-history.jpg?Expires=1902241772&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=elOIMn5lmK8kGj1gMvcB1ZF%2BmQg%3D', 5, 9.10, '《战争改变历史:1500年以来的军事技术、战争及历史进程》从技术革命角度入手，将1500年以来的军事技术、战争与历史的画卷呈现在读者面前。《战争改变历史》由上海科学技术文献出版社出版。', '美国', 2011);
INSERT INTO `book` VALUES (32, '从丹药到枪炮', '欧阳泰', 68.00, '中信出版集团', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-gunpowder-age.jpg?Expires=1902241775&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=Yl%2Fu6Ne8%2F%2B8e0rGTAJWbr6KsR9s%3D', 5, 7.70, '用火|药烧出来的一本奇书。打通中国枪炮进化史，颠覆“鞭炮帝国”刻板印象。从皇权到共和，“玩火”是重点。刷新中国火|药历史，讲透火|药政治，说清火|药经济、重现火|药战争、细看火|药技术。从丹药到枪炮，复盘当代中国要看懂的历史K线图。\r\n\r\n为什么中国黑科技造就西方霸权？宋元明火枪战争为何被彻底遗忘？中国大炮如何力挽狂澜，在1661年中荷战争中大展神威？欧洲如何实现弯道超车，在1840年鸦片战争中击败中国？从唐朝炼丹炉到北洋旗舰定远号，中国从辉煌坠落到屈辱深渊。从君士坦丁堡沦陷到滑膛枪诞生，欧洲在战火洗礼中极速崛起。中国，西方，在军事格局上分道扬镳，大分流颠覆了经济、社会、政治与文明，散落在历史聚光镜下的火枪粉末，引燃思想火光，照亮技术变革。从丹药到枪炮出乎意料的命运，呼应世界史上的中国军事格局。从火器锻造到文明的冲突，重构军事史上真实的中国。\r\n\r\n显而易见，中国一度是世界上富有、技术先进、国力强盛的国家。然而，中国是怎么在18、19世纪丢掉优势，让位于西方的？世界史上的西方崛起和中国衰落不仅仅是中国人的心结，也是一个全球热议的话题。欧阳泰之前的作品《1661，决战热兰遮》，就是以具体战役为原点，探索中国军事与发展模式的真实状况。《从丹药到枪炮：世界史上的中国军事格局》则通过聚焦于火器战争，试图解释中西大分流这一问题。', '美国', 2019);
INSERT INTO `book` VALUES (33, '从丹药到枪炮', '欧阳泰', 68.00, '中信出版集团', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-gunpowder-age.jpg?Expires=1902241775&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=Yl%2Fu6Ne8%2F%2B8e0rGTAJWbr6KsR9s%3D', 5, 7.70, '用火|药烧出来的一本奇书。打通中国枪炮进化史，颠覆“鞭炮帝国”刻板印象。从皇权到共和，“玩火”是重点。刷新中国火|药历史，讲透火|药政治，说清火|药经济、重现火|药战争、细看火|药技术。从丹药到枪炮，复盘当代中国要看懂的历史K线图。\r\n\r\n为什么中国黑科技造就西方霸权？宋元明火枪战争为何被彻底遗忘？中国大炮如何力挽狂澜，在1661年中荷战争中大展神威？欧洲如何实现弯道超车，在1840年鸦片战争中击败中国？从唐朝炼丹炉到北洋旗舰定远号，中国从辉煌坠落到屈辱深渊。从君士坦丁堡沦陷到滑膛枪诞生，欧洲在战火洗礼中极速崛起。中国，西方，在军事格局上分道扬镳，大分流颠覆了经济、社会、政治与文明，散落在历史聚光镜下的火枪粉末，引燃思想火光，照亮技术变革。从丹药到枪炮出乎意料的命运，呼应世界史上的中国军事格局。从火器锻造到文明的冲突，重构军事史上真实的中国。\r\n\r\n显而易见，中国一度是世界上富有、技术先进、国力强盛的国家。然而，中国是怎么在18、19世纪丢掉优势，让位于西方的？世界史上的西方崛起和中国衰落不仅仅是中国人的心结，也是一个全球热议的话题。欧阳泰之前的作品《1661，决战热兰遮》，就是以具体战役为原点，探索中国军事与发展模式的真实状况。《从丹药到枪炮：世界史上的中国军事格局》则通过聚焦于火器战争，试图解释中西大分流这一问题。', '美国', 2019);
INSERT INTO `book` VALUES (34, '艺术', '理查德·加纳罗', 128.00, '北京大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/boo-art.jpg?Expires=1902241772&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=eWi0%2FN62YOHfTLDdru%2FGgDkm3iM%3D', 6, 8.70, '本书旨在向那些没有或者没有多少文科背景的学生介绍人文学带给我们的喜悦。一直以来，我们的目标就是交流我们对于作为心智与情感体验的人文学所怀有的热情。学生藉由学习审慎的思考，以及对于创造性艺术的认知，也将会更好地了解自身。\r\n\r\n本书叙述历史上人文学取得的杰出成就。尽管我们的方法是主题式，而不是编年史式的，但是历史语境仍然作为了解特定作品发挥着，并将继续发挥着重要的作用。我们感激过去了所取得的成就，这是因为我们非常相近的人过去并存在过，他们说过的话和做过的事可以帮助我们了解今天。我们会继续发现新的原因去体验喜悦，并在过去的、现在的、西方的、非西方的、男人的、女人的，以及在不同种族文化的作品中所体现出的感受力中得到的激励。', '美国', 2012);
INSERT INTO `book` VALUES (35, '艺术的故事', '贡布里希', 280.00, '广西美术出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-story-of-art.jpg?Expires=1902241774&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=tNdXnRGhsJ2aTYqQcb2pTxUkm%2Fs%3D', 6, 9.60, '《艺术的故事》概括地叙述了从最早的洞窟绘画到当今的实验艺术的发展历程，以阐明艺术史是“各种传统不断迂回、不断改变的历史，每一件作品在这历史中都既回顾过去又导向未来。\r\n\r\n继1997年三联版《艺术的故事》后，英国费顿出版社授权广西美术出版社独家出版，也是国内唯一合法授权的版本。\r\n\r\n', '英国', 2008);
INSERT INTO `book` VALUES (36, '旅行的艺术', '阿兰·德波顿', 16.80, '上海译文出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/the-art-of-travel.jpg?Expires=1902241771&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=CzW9x0%2FUYOLD2sp6okvU0Y7jOqM%3D', 6, 8.30, '这部书就像一场完美的旅程，教我们如何好奇、思考和观察，让我们重新对生命充满热情。旅行是什么，德波顿并不想急于提供答案，旅行为什么，德波顿似乎也不热心去考求。但释卷之后，相信每个读者都会得到一种答案——这答案，既是思辩的，也是感性的，既酣畅淋漓，又难以言说，因为，它更像是一种情绪 ，令人沉醉而不自知翻开这本书，你踏上的将是一次异乎寻常的阅读旅程。深信德波顿无处不在的智慧和机智将影响甚至改变你对旅行的看法，并有可能改变你日后的旅行心态和旅行方式。德波顿是一个知识渊厚且富有逻辑思辨能力的作者。他曾经是大学的哲学讲师，有着深厚的哲学素养，从苏格拉底、洪堡，到爱默生、尼采，他都有过系统的阅读。此外，对西方文学和艺术作品，他也有广泛的涉猎。因此，在论及“旅行”这一近平陈词滥调的题材时，他不仅时时表现出理性的悟觉，而且还能结合福楼拜、波德莱尔等文学家的创作，参照凡·高等画家的作品，多方位地观照“旅行”、剖析“旅行”。', '英国', 2004);
INSERT INTO `book` VALUES (37, '现代艺术150年', '威尔·贡培兹', 65.00, '广西师范大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-150-years-of-modern-art.jpg?Expires=1902241773&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=f3eHmd3nS6pLRegJ5gZwUcmUshY%3D', 6, 9.10, '要掌握现代艺术的游戏规则，你需要知道些什么？——涵括近百位艺术家及其代表作，梳理二十多个现代艺术流派的渊源流变，勾勒现代艺术的发展历程。这一百五十年来艺术究竟发生了什么？为什么到了今天，一件看似五岁小孩也能捣鼓出来的东西，居然会是艺术史上的旷世之作？\r\n\r\n这是艺术吗 ？这必须是艺术！——马列维奇的黑色正方形，蒙德里安的彩色格子，杜尚的小便池… 艺术不再必须与美有关，它更多地关乎理念。那些光怪陆离、五花八门的艺术流派，在揭开了其中的奥秘之后，实际上简单得惊人，但又绝妙乃至伟大。\r\n\r\n如果我们还能从一百五十多年前莫奈的《日出》、梵高的《星空》中，依稀辨认出艺术“原来”的模样，那么，一百五十年后安迪·沃霍尔的金汤宝罐头、达米恩·赫斯特的腌制鲨鱼，还有翠西·艾敏乱糟糟的床，足以让我们看到艺术的其他可能。回顾现代艺术一个半世纪的反叛之路，我们见证了一代又一代人如何变得愈发反叛、大胆、混乱。这背后，是艺术家对“何为艺术”的无尽追问，是他们对周遭世界的回应与抵抗。现代艺术的故事仍在继续，也许永远不会完成。', '英国', 2017);
INSERT INTO `book` VALUES (38, '艺术与视知觉', '阿恩海姆', 29.00, '四川人民出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-art-and-view.jpg?Expires=1902241772&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=%2BBznb7ngK4STMClW5WGMVI486qw%3D', 6, 8.60, '《艺术与视知觉》看起来，艺术似乎正面临着被大肆泛滥的空头理论扼杀的危险，近年来，真正堪称为艺术的作品已不多见了。它们似乎在大量书籍、文章、学术演讲、报告会、发言和指导等——这一切都是想要帮助我们弄清楚什么是艺术，什么不是艺术；什么人在什么情况下创造了什么作品，他为什么或为了谁才创造了这些作品等等——组成的洪流中淹没了。在我们眼前出现的是一具被大批急于求成的外科医生和外行的化验员们合力解剖开的小小的尸体。由于这批人总是喜欢用思考和推理的方式去谈论艺术，就不可避免地给人造成这样一种印象：艺术是一种使人无法捉摸的东西。', '美国', 1998);
INSERT INTO `book` VALUES (39, '认识艺术（全彩插图第8版）', '马克·盖特雷恩', 99.80, '世界图书出版公司', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-learn-art.jpg?Expires=1902241771&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=M9%2FWHR9SvvdK9aodvTiWm4dUpWU%3D', 6, 8.90, '本书为美国最畅销的艺术基础概论教材，自1985年第一版以来，不断再版，赢得过包括纽约图书展最佳设计和制作奖项在内的多项大奖，深受艺术院校师生的欢迎。本书采用史论结合的写法，综合了艺术理论与艺术史两种教材的优点，使读者在学习艺术理论时有丰富的例证具化抽象概念，反过来又能站在理论高度俯察艺术的历史进程，加深对人类艺术行为本身的理解。\r\n\r\n全书配有从世界各个文化和历史时期精心挑选的艺术品图片700 余幅，有助于读者直观的理解艺术。其中，理论部分提及的大部分图片，将以缩图的形式在艺术史部分中重现，这种“相关作品”专栏的设置，把全书的两大部分有机结合起来，方便读者达到最好的学习效果。\r\n\r\n本分册侧重艺术的基础理论，讨论了艺术的主题和目的，介绍了构成艺术品的艺术元素，进而分门别类地讲解了二维艺术形式（素描、绘画、版画、摄影机和计算机艺术、平面设计）和三维艺术形式（雕塑和装置、手工艺品、建筑）。', '美国', 2014);
INSERT INTO `book` VALUES (40, '地理学与生活', '阿瑟·格蒂斯 / 朱迪丝·格蒂斯 / 杰尔姆', 228.00, '后浪丨北京联合出版公司', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-introduction-to-geography.jpg?Expires=1902241769&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=7K0CyDrjaea2Whr2zeO3RzSv6NA%3D', 7, 9.00, '地理学是一门古老的学科，最初仅指地球的绘图与勘查，但发展到今天已经逐渐成为一门范围广泛的学科。本书共十三章，分四篇，囊括自然地理学、人口地理学、文化地理学、城市地理学等分支学科。全书以介绍地理学的发展、核心概念，以及四种系统性传统为开端，四大传统独立成篇。前三篇专门介绍地理学的分支学科，而区域分析传统作为全书最后一篇，利用前三种传统和主题，并通过相互参照对其进行综合。\r\n\r\n相对于其他地理学书籍，本书特别突出了地理学与生活的相关性。对人体有害的天气现象、城市土地利用模式、城市垃圾与危险废物的处理等与我们生活密切相关的问题均有涉及。平实、生动的文字与丰富的实例，使本书极具可读性，读者通过本书亦会获得一种新的思维方式。', '美国', 2017);
INSERT INTO `book` VALUES (41, '国家的常识', '迈克尔·罗斯金(Michael G. Roskin)', 68.00, '世界图书出版公司', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-countries-and-concepts.jpg?Expires=1902241771&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=Ctm1HRigCmrcMxV%2FbnKgiELxvmw%3D', 7, 8.80, '本书通过运用比较政治学的方法，深入浅出地对世界的部分典型国家进行观察和描述，从中选取了英国、法国、德国、日本、俄罗斯、印度、墨西哥、尼日利亚、伊朗这9个国家作为分析的模型，以生动简洁的语言从历史、制度、政治文化、现状、争论等5个方面讲述公民需要了解的“国家常识”。\r\n\r\n作者将国家的历史、地理与当代的发展现状紧密地联系在一起，运用大量篇幅追溯各国的历史，穿插地图直接展现各国所处的地缘环境，并且着重阐述了历史源流与地理环境对政治文化的变迁、制度的变更与当代议题的发展的影响。在叙述过程中，作者还强调了不同地域的民族文化特性、经济发展状况和教育制度。\r\n\r\n', '美国', 2013);
INSERT INTO `book` VALUES (42, '即将到来的地缘战争', '罗伯特•D．卡普兰（Robert D.Kaplan）', 49.80, '广东人民出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-revenge-of-geography.jpg?Expires=1902241771&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=mesU83WWW4BYQhBgJ8FYwJaHZd4%3D', 7, 7.80, '崛起的中国和印度，何以格外推崇马汉的海权论?“辽宁号”航母的诞生是否意味中国海军正在走向深蓝？\r\n\r\n作为北约成员国，土耳其为何要推动以色列和叙利亚的和谈，并率先与阿萨德作对？它为何又要在加沙以巴勒斯坦人的保护者自居？\r\n\r\n麦金德准确遇见了北约与苏联的对抗以及前苏联的解体？德国的中心地理位置及其内在文化态度讲怎样决定欧洲的走向？\r\n\r\n卡普兰在本书中以地理为主线，通过地图导出地缘政治，并将地理作为手术刀，结合其毕生观察、发现和相关理论来剖析国际关系和全球化中无法解释的冲突。同时，他以地理的逻辑解释历史现象，解析当前世界地缘政治热点，预测未来全球事件的演变。\r\n\r\n通过对气候、地势和地理位置的考察，卡普兰回顾和分析了欧洲、俄罗斯、中国、印度、土耳其、伊朗和中东等地的历史热点和潜在危机，并全面地预测了欧亚大陆的下一个冲突周期。\r\n\r\n本书睿智地辩驳了那些认为全球化会战胜地缘的观点，告诉读者地理对于塑造历史有多么重要，并进一步指出那些永恒的真相和地理的事实是如何能够帮助人们避免本世纪即将发生的灾难。', '美国', 2013);
INSERT INTO `book` VALUES (43, '神州', '段义孚', 88.00, '北京大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-shen-zhou.jpg?Expires=1902241774&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=5I2ZuIrF4zCQTd32J%2BHErCxqNMY%3D', 7, 6.80, '本书讲述了中国这一地理区域内，从史前文明直到今天如此巨大的历史跨度里，地理地貌发生的巨大改变。农田、山林、道路、桥梁、宫殿、苑囿、村落、城市等等，体现了中国人对环境持续不断的精微适应和塑造。从古代人与土地之间和谐、安定并充满美感的关系，到近代以来这种关系被西方殖民入侵、内战所打断，而在现当代工业化的巨大力量对大地景观再次进行强有力的重塑，这其中有令人震撼激动的奇迹，也有令人忧虑不安的眩惑。', '美国', 2019);
INSERT INTO `book` VALUES (44, '历史的空间与空间的历史', '辛德勇', 46.00, '北京师范大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-history-geography.jpg?Expires=1902241771&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=xK0FIgG9zyqnMxuxw2IyZ5fCX2A%3D', 7, 8.50, '本书以中国历史地理学专题研究为主，也包括一部分中国地理学史和历史文献学研究。 在历史经济地理领域，着重探讨了战国时期北方重要水利灌溉工程漳水十二渠的创始人以及长江三峡地区的农业开发进程问题。在历史军事地理领域，主要考证了战国至秦汉之际的一系列重大战役和军事设施的地理问题，其中包括魏国西长城的走向、闾左的身份与其地域来源的关系、巨鹿之战与刘邦还定三秦之役、楚汉彭城之战、韩信平齐之役、垓下之战等重要战役的地理进程。在当代中国历史地理学发展史方面，论述了史念海和侯仁之两位学科创始人的主要学术贡献。 在地理学史领域，重点阐述了唐代地理学的主要成就，以及明代地理学家章潢的学术创见，并剖析了清代徐松的历史地理名著《唐两京城坊考》所存在的一些严重问题。 在历史文献学方面，着力论述了中国古典目录学发展史上四部分类体系在两晋南北朝时期的演化轨迹，并揭示出书籍装帧史上之卷轴时代卷与帙的对应关系。同时，还对一些重要典籍及典籍研究著述，进行了考订和评议。 全书内容，在研究方法上，重视文献考证，侧重通过常见文献，解决学术研究中悬而未决的关键疑难问题。\r\n\r\n', '中国', 2005);
INSERT INTO `book` VALUES (45, '计算中的上帝', '罗伯特﹒J﹒索耶', 18.00, '四川科学技术出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-calculating-god.jpg?Expires=1902241777&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=0SFQ2XRhC1a9yj3%2B5m%2FMPbcy8Bk%3D', 8, 8.30, '本书是加拿大著名科幻作家罗伯特·J·索耶的得意之作。对于这部作品当年败给《哈里·波特与火焰杯》，未能最终获得雨果奖，索耶一直忿忿不平。\r\n\r\n本书充分展现了科幻小说的震撼性。两种不同的外星人同时来到地球，与地球上的古生物学家一同探寻不同星球文明同步同期性毁灭之谜，严格的科学外推法使探寻者逐渐接近事实真相：宇宙中竟然存在着一个操控一切的超级生命！可就在这时，一颗足以毁灭三个文明星球的超新星爆发了……\r\n\r\n', '加拿大', 2003);
INSERT INTO `book` VALUES (46, '你一生的故事', '特德·姜', 36.00, '译林出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-stories-of-your-life-and-others.jpg?Expires=1902241775&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=G1YToT%2F9A4a2ibyo1JGNy8l3lpM%3D', 8, 8.60, '一瞥之下，过去与未来轰轰然同时并至，\r\n\r\n我的意识成为长达半个世纪的灰烬，时间未至已成灰。\r\n\r\n五十年诸般纷纭并发眼底，我的余生尽在其中。\r\n\r\n还有，你的一生。\r\n\r\n《你一生的故事》结集特德·姜早期的七篇作品：代表作《你一生的故事》、处女作《巴比伦塔》以及《领悟》、《除以零》、《七十二个字母 》、《人类科学之演变》、《地狱是上帝不在的地方》——\r\n\r\n一个语言学家学会了一门外星语言，彻底改变了她的世界观。过去、现在、未来，在她眼前同时展开。\r\n\r\n为了离上帝更近，人类伐木烧砖，拉车砌塔，经过无数个世代的辛劳，终于建成一座巍峨耸立于天地之间的通天塔。\r\n\r\n只要一小瓶药水，就能拥有超人智慧，这个诱惑无人能挡。可惜超人不止一个，荡气回肠的超人对决之后，领悟终极的智慧。\r\n\r\n任何数字除以零，都不会得出一个有意义的结果。两个人的感情除以零，结果是什么？\r\n\r\n在一个“名字驱动一切”的世界，命名师们玩转七十二个字母，寻找人类种族繁衍的密码。\r\n\r\n当人类的所有科学研究仅仅局限在解读后人类的科研成果时，这种研究是否还有存在的必要？\r\n\r\n妻子在天使下凡时去世，丈夫却必须学习如何热爱上帝，以便死后与妻子团聚。', '美国', 2015);
INSERT INTO `book` VALUES (47, '怪胎', '绫辻行人', 29.90, '吉林出版集团有限责任公司', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-freaks.jpg?Expires=1902241772&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=5cM9aiMz6j%2Bg9MRHtNUDsKdTLxs%3D', 9, 7.00, '他们是病人，是异常者。他们的意识、认知、思维和情感都超脱常理。在他们的内心世界，一切都会颠倒、扭曲、错乱，最终化成盘根错节的谜团。\r\n\r\n三一三号房——小时候的我，总是梦见自己被掐住脖子的梦，而我的病人母亲，似乎知道梦境背后隐藏的真相……\r\n\r\n四〇九号房——车祸夺去了丈夫的生命，也将我摧残成身心俱灭的废人，而我唯一的慰藉，就是“丈夫深爱着我”这个事实……\r\n\r\n五六四号房—— “杀死J•M的是谁？”面对手稿结尾留下的谜题，我和我的侦探朋友试图找出解答，在推理的过程中我们意识到，手稿里描绘的四个“怪胎”似乎包含某种隐喻……\r\n\r\n在病人们失控的常识面前，这些看似一点即破的谜团背后，究竟包含怎样的惊人玄机？只有抛开一切常理和固有思维，才能踏入这片光怪陆离的禁区，探明真相……', '日本', 2014);
INSERT INTO `book` VALUES (48, '大唐悬疑录：兰亭序密码', '唐隐', 36.00, '紫焰传媒 / 上海交通大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-lan-ting-code.jpg?Expires=1902241776&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=Rppx3V0oNJRyNXxzpru5DuSlDYQ%3D', 9, 6.60, '《兰亭序》诞生二百余年籍籍无名，直到唐太宗亲手伪造，血腥推行，被捧为千古一帖，才得以流传至今。唐太宗伪造《兰亭序》真迹的背后，究竟隐藏着什么历史阴谋？《兰亭序》真迹今天到底藏在哪里？\r\n\r\n《兰亭序》原名《临河序》，在东晋时期史无记载。直到南朝刘孝标所注的《世说新语》中才提到此文，全文共153字。到了唐代，《临河序》改称《兰亭序》，在序文中增加了167字，全文共324字，此版本最终流传后世。1965年，郭沫若曾发文指出《兰亭序》并非王羲之所作，引发了一场轰动全国的学术大辩论。而在唐代，拉开悬案大幕的却是一桩自古未有的刺杀案。\r\n\r\n元和十年(815年)六月初三，长安街头，天光未亮，大唐宰相武元衡正走在上朝路上，随身卫队的灯笼突然被箭射灭，数十名杀手从黑暗中涌出，带头者手起刀落，砍断武元衡脖子，拎走头颅。\r\n\r\n次日，女神探裴玄静收到了武元衡死前一晚临摹的半部《兰亭序》，和一首神秘的五言诗。原来，武元衡对自己的死早有预感，留下一道连环谜题，解谜者必须步步踏对，倘若棋错一着，真相就将永远湮灭。裴玄静接受使命，开始了机关密布、阻力深重的解密之旅。此后，名动天下的女刺客聂隐娘、被后世尊为“八仙”之一的韩愈之侄韩湘子、“鬼才诗人”李贺等纷纷牵扯入局；藩镇势力奇计连连；朝廷权臣各怀心机；甚至皇室深宫中也是人影闪动，鬼胎暗结，试图遥控局势。\r\n\r\n但真相终于越来越近，终极答案指向的竟是一个最不可能而且至高无上的人……', '中国', 2015);
INSERT INTO `book` VALUES (49, '银行家的情人', '肯·福莱特', 46.00, '江苏文艺出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-a-dangerous-fortune.jpg?Expires=1902241769&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=MyIAODWuV83FulP3i%2FUIvuQJa6w%3D', 9, 8.10, '当代历史悬疑小说宗师肯•福莱特于本书中将目光投向了奢靡浮华的维多利亚时代，这是一幅描绘十九世纪英国社会的历史长卷，是一部书写银行业背后争权夺利的传奇之书。\r\n\r\n1866年一个炎热的夏日午后，封闭的温菲尔德校园里发生了一起学生意外溺亡的悲剧，在场的银行家族继承人休、爱德华和南美领主的儿子米奇等人卷入了这一神秘事件。随后，休因为父亲去世，支付不起学费而被迫离校，爱德华的母亲奥古斯塔为了袒护儿子免受谋杀溺亡学生的嫌疑，与米奇私通掩盖事实。\r\n\r\n真实的恶灵在他们的生命中注入了魔鬼般的力量，带给了他们贪婪和仇恨、自私与残忍。真相永远扑朔迷离沉入湖底，其中暗藏的阴谋与背叛裹挟着他们的命运，直到几十年后依然挥之不去……', '英国', 2013);
INSERT INTO `book` VALUES (50, '《长安骊歌》（全三册）', '郁馥', 108.00, '天地出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-chang-an-song.jpg?Expires=1902241774&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=INsbZ2Urwuixbz9oSOCewenljSY%3D', 9, 8.80, '李世民曾说：“吴王恪英果类我。”\r\n\r\n他独承隋唐两朝皇室血统，一生纵横捭阖，大开大合。\r\n\r\n他的母亲是李世民一生挚爱的女人，李世民曾想传皇位于他。\r\n\r\n太子谋反，他事先识破。突厥进犯，他带兵阻拦。他不仅文武双全，更是才貌过人。\r\n\r\n武则天屠尽李氏皇族，唯独留下了他的血脉。\r\n\r\n他的身上，有太多秘闻、逸事未被世人所知。\r\n\r\n他——就是被历史遗忘的神秘大唐皇子：李恪。\r\n\r\n本书以正史为准绳，以大唐李世民三子李恪一生的爱恨情仇为蓝本，以推理探案为叙事形式，将那个风云际会的大时代和大人物及大事件有机串联及演绎，讲述了一段浩浩汤汤、荡气回肠的动人故事。\r\n\r\n玄武门之变后，李世民独揽大权，然而危机未除，形势更加复杂，斗争愈发剧烈。既有前朝力量伺机复辟，又有来自兄弟、家庭和朝廷内外的各种压力，更有突厥等势力在外虎视眈眈。故事的主角李恪就是在这种波云诡谲的背景下登场。其身份特殊，为李世民与隋炀帝幼女淮阳公主之子。他文才武略，是李世民最为宠爱的皇子。他历任吴王、安州都督、大理寺卿、司空等，一生建功立业，成功探破太子谋反，平定突厥……本有能力成为一国之君，却无心做操纵生杀大权的孤家寡人，他宁做“周公”，辅佐“根正苗红”的九弟李治治理天下，最后却落入长孙无忌等人的步步构陷。他本能佣兵天下，却不愿以以他一人之故而重燃鲜血，最后慨然赴死，换来大唐盛世，空留骊歌一曲……', '中国', 2019);
INSERT INTO `book` VALUES (51, '悬疑小说创作指导', '詹姆斯·N·弗雷', 39.00, '中国人民大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-suspence-induction.jpg?Expires=1902241770&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=b7e7X30ppc%2FnEwEZXBoJG7LIyDc%3D', 9, 7.60, '詹姆斯•N•弗雷是一系列畅销全球的写作指南的作者，常年执教于高校和写作工坊。本书将引导你进行头脑风暴、制订计划、设计情节，直至最终完成一本悬疑小说。其中的第一步，就是创造出迷人而立体、动态而富有戏剧性的人物。一旦你让这些人物在笔下自主地活动起来，他们将为你制造出复杂而可信的情节，充满神秘、威胁和悬念。接下来，本书将为你演示如何写出扣人心弦的场景和令人激动的叙述。然后，它还将告诉你如何改写和润色加工，以及将手稿委托给代理商时可采用的策略。\r\n\r\n那么，阅读这本书，并按书里的原则实践，能保证你写出一本很棒的悬疑小说吗？抱歉，不能。这里有太多因素取决于你自己了。但是，如果你能把书中的技巧认真地应用起来，让你的人物展开属于各自的旅程，然后你写，写，写，然后改写，改写，改写，直到你的故事磨出烟儿来，那么你就可能获得巨大的成功。这将是一次充满乐趣的冒险之旅。', '美国', 2015);
INSERT INTO `book` VALUES (52, '公鸡已死', '英格丽特·诺尔', 29.00, '作家出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-hen-died.jpg?Expires=1902241771&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=9UKa4Fxe88YkO6ujxFMd1T0hsNY%3D', 9, 7.70, '热情、活泼、善解人意、充满爱心……52岁的保险公司女职员罗塞玛丽无疑将这些女性的优点集于一身，可这些优点却摧毁了女性生命中最重要的东西——爱情。\r\n\r\n在偶然参与的一次讲座上，她一见钟情爱上了一位中年男子，为了得到这个梦中情人，她不惜一切手段，甚至以谋杀犯罪为代价……一桩桩令警察毫无头绪的命案相继发生，是她将积蓄在内心深处的谋杀因子激活的信号，如今它们正犹如潘多拉魔盒，一发而不可收拾……\r\n\r\n', '德国', 2015);
INSERT INTO `book` VALUES (53, '从一到无穷大', '乔治·伽莫夫', 29.00, '科学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-from-1-to-infinity.jpg?Expires=1902241774&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=e1zExjt0kzTWLtjrn8OqredsQ%2Bk%3D', 10, 9.10, '《从一到无穷大：科学中的事实和臆测》是当今世界最有影响的科普经典名著之一，1970年代末由科学出版社引进出版后，曾在国内引起很大反响，直接影响了众多的科普工作者。\r\n\r\n作品以生动的语言介绍了20世纪以来科学中的一些重大进展。先漫谈一些基本的数学知识，然后用一些有趣的比喻，阐述了爱因斯坦的相对论和四维时空结构，并讨论了人类在认识微观世界（如基本粒子、基因）和宏观世界（如太阳系、星系等）方面的成就。', '美国', 2002);
INSERT INTO `book` VALUES (54, '别闹了，费曼先生', '费曼', 22.00, '生活·读书·新知三联书店', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-do-not-joking-feynman.jpg?Expires=1902241769&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=Yh9J6vAnzMWXfoYyqOIGsBTo%2F9A%3D', 10, 8.90, '无费曼得过诺贝尔奖，是现代最伟大的理论物理学家之一。但他同时也可能是历史上唯一被按摩院请去画裸体画、偷偷打开放着原子弹机密文件的保险箱，在巴西桑巴乐团担任鼓手的科学家。他曾跟爱因斯坦和波尔等大师讨论物理问题，也曾在赌城跟职业赌徒研究输赢机率。', '美国', 1997);
INSERT INTO `book` VALUES (55, '超越时空', '加来道雄', 36.00, '上海科技教育出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-hyperspace.jpg?Expires=1902241777&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=oXXBLGJWrobEKfVlb1gSj244Ask%3D', 10, 9.10, '当代物理学中一些非常重要而又艰深的思想，往往因为难以形象浅显地解说而不易为公众了解。本书作者不畏艰辛，用很生动的方式向读者展示了现代物理前沿之一——超空间理论。全书15章分为4篇，分别描述了超空间的研究历史，超空间理论通往爱因斯坦梦寐以求的“物理学圣杯”统一场论的可能性，通过超空间穿越时空的可能性的理论探讨，以及何时方能实际利用超空间理论所具有的潜在威力。详尽而又如此通俗地讲述这种理论，在本书之前尚未见先例。', '美国', 2009);
INSERT INTO `book` VALUES (56, '魔鬼出没的世界', '卡尔·萨根', 28.50, '吉林人民出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-demon-haunted-world.jpg?Expires=1902241777&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=a7Hc5QQmfqmCw%2B6ZbQf5QkuDvdU%3D', 10, 8.30, '精神世界是丰富多彩的，但是精神世界的源泉是什么？萨根在书中写道：“当科学与大自然相遇时，科学就必然会使人产生对大自然的敬畏的感觉。对大自然的真正的理解的行为是与自然的结合和融合的欢庆，即使是在很小程度上的结合也能使人感受到宇宙的宏伟和壮观。随着时间的流逝而积累起来的世界 范围内的知识体系使科学变成了跨国界、跨时代的超越所有界限的理智的东西。‘精神’一词是从拉丁文‘呼吸’变化而来的。我们呼吸的是空气，无论它多么稀薄，但毫无疑问它是物质.....”\r\n\r\n卡尔·萨根博士是美国康奈尔大学的天文学教授。同时他又是世界著名的科普作家。他对科学的精辟见解使他成为“唯一能够用简单扼要的语言说明科学是什么”的科学家。他成为本世纪最有影响的人物。《魔鬼出没的世界——科学，照亮黑暗的蜡烛》是他临终前的最后一部作品。当年便创下最佳畅销书第一名的记录。', '美国', 1998);
INSERT INTO `book` VALUES (57, '人性论（上下）', '大卫·休谟', 35.00, '商务印书馆', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-a-treatise-of-human-nature.jpg?Expires=1902241776&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=B6tJg3t1Z2AUKqhoUVoew1RnzIw%3D', 10, 8.70, '本书是十八世纪英国唯心主义哲学家、怀疑论者休谟的重要哲学著作。他认为一切科学都与人性有关，对人性的研究应是一切科学的基础。本书试图通过对人性的研究来揭示制约人的理智、情感和道德行为的准则。全书分三卷，第一卷讨论知性;第二卷讨论情感，第三卷讨论道德。\r\n\r\n', '英国', 1980);
INSERT INTO `book` VALUES (58, '历史', '希罗多德 (Herodotus)', 148.00, '上海人民出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-history.jpg?Expires=1902241768&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=3uk3FcTkH6cm4vCYNX801vtBxsU%3D', 12, 9.20, '人类壮举与斗争的首部记录\r\n\r\n所知世界各民族的全部真知\r\n\r\n希罗多德被誉为“历史之父”，他首创的历史叙述体例、开阔的世界观和持平的民族观，以及史料搜集和批判的精神，都为后世留下了宝贵财富。《历史》对于古典时代城邦制度、泛希腊的民族意识、波斯帝国沿革等学术研究的价值不必赘述。同时它更具有超越时间和空间的文化价值、精神价值。\r\n\r\n---------------------\r\n\r\n希罗多德所著《历史》是西方古代第一部历史学巨著，主要内容是对当时全世界各民族历史文化的“调查研究”，被后世学者分为九卷。作者以希腊人和异族人的相互关系为主线，叙述了吕底亚、米底、巴比伦、埃及、波斯、印度、斯基泰亚、利比亚以及希腊爱琴海地区的地理环境、民族分布、经济生活、政治制度、历史往事、风土人情、宗教信仰、名胜古迹等，接着集中记述古代“世界大战”——波希战争的经过，从战端初启，经过马拉松战役、萨拉米斯海战，直至普拉提亚之战和米卡列之战结束。\r\n\r\n希罗多德是一位故事大师，善于驾驭各种资料；著作内容广博、丰赡，文笔简练、优美，富有韵致，生动地展示了古代众多国家、地区和民族的相互关系和生活图景，保存了大量的历史学、地理学、人类学、民族学、神话学、宗教学以及地质学、生物学等方面的珍贵资料，俨如一部关于古代世界的“通志”和“百科全书”。', '古希腊', 2018);
INSERT INTO `book` VALUES (59, '血酬定律', '吴思', 23.80, '中国工人出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-law-of-blood-reward.jpg?Expires=1902241775&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=BoTnZyp1wyxaRCR3gW%2Buv2CyyF8%3D', 12, 8.20, '本书提出了血酬和元规则等概述，这些概念代表了我力所能及的深度。所谓血酬，即流血拼命所得的酬报，体现着生命与生存资源的交换关系。从晚清到民国，吃这碗饭的人比产业工人多得多。血酬的价值，取决于所拼抢的东西，这就是“血酬定律”。这个道理很浅显，却可以推出许多惊人的结论。如果再引入一些因素，一层一层地推论下去，还可以解释书中的其他概念，成为贯穿全书的基本逻辑。因此，作者把“血酬定律”当作书名。', '中国', 2003);
INSERT INTO `book` VALUES (60, '奥斯维辛', '劳伦斯·里斯', 64.00, '广西师范大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-auschwitz.jpg?Expires=1902241772&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=GJ9hFIR43pEaKRR5mqzXIBuBQhk%3D', 12, 9.50, '有奥斯维辛，就不能有上帝的存在。——普里莫•莱维\r\n\r\n无论我在思考什么，总要思考奥斯维辛。感谢那些要求、甚至逼迫我们讲述一切的人，因为他们想听到、想知道发生在奥斯维辛的那些人、那些事。——凯尔泰斯•伊姆莱\r\n\r\n我们要知道“人”真正是什么，毕竟，这是发明奥斯维辛毒气室，也是祈祷着走进毒气室的“存在”。——维克多•弗兰克\r\n\r\n本书力图以一个具体场所为切入点，对人类历史上最深重的罪行进行最透彻的诠释，这就是奥斯维辛。\r\n\r\n历史不是剧本，真相永远不止一个。奥斯维辛并不是专门用于杀害犹太人的灭绝营，也不仅仅与“最终解决”有关——奥斯维辛，是集中营指挥官霍斯等纳粹官员的奋斗史；是波兰人、吉卜赛人、苏联战俘、耶和华见证人的情感炼狱；它是一个八岁德国女孩一天起床，突然发现自己成了吉卜赛人，被扔进奥斯维辛的故事；它是战后幸存者回到家乡，却发现外面的世界比奥斯维辛更糟的故事……这部书没有孤证，每一个说出来的字，都出自两处以上的历史记录，包括苏联解体后的解密档案和亲历者访谈。\r\n\r\n“人们问我，你在奥斯维辛学到了什么？我想我只能确定一件事：没人真正了解自己。”1944年11月，希姆莱要求艾希曼停止驱逐匈牙利犹太人，并说：“到目前为止你一直都在灭绝犹太人，但我现在命令你从今天起变成犹太人的拥护者。”人的行为和信念能顷刻颠倒，因应自身处境（situation）而朝着没有预料到的方向演变，这恰恰是所谓的“人性”。\r\n\r\n奥斯维辛是一个更大的故事，我们从未真正了解它。这里所涉及的故事，有不少可以让我们更好地认识我们自己。\r\n\r\n', '英国', 2016);
INSERT INTO `book` VALUES (61, '历史的温度', '张玮', 49.00, '中信出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-warmth-of-history.jpg?Expires=1902241770&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=uIN5lwvXTrzWLVn4t%2BQB63mem2k%3D', 12, 7.90, '历史是万花筒，每个人看到的不同，每个角度看到的也不同。有的人看到了残酷，有的人看到了温情。有的人看到了杀戮，有的人看到了救赎。有的人看见了别人，有的人看见了自己。有的人假作真，有的人真作假。\r\n\r\n史书上的一段话、一个名字，在张玮的笔下呈现出一张张意想不到的面孔。\r\n\r\n张玮书写的历史，亦正亦暖。正，是因为，在“馒头说”的一个个历史故事中，张玮都尽量用一种第三方、不带感情色彩的口吻还原当时的历史事件。很多历史事件和人物，都有两面性，我们不能跳出当时的历史环境，现在用“上帝视角”去评价当时的人和事，这对当时的人来说，不公平。\r\n\r\n而暖，是有趣、有温度，历史不再是冷冰冰、生人勿近的，看似由时间、地点和一连串数据组成的历史事件，背后的主角是一个个活生生的人，有血有肉、有人性、有故事、有真的性情，风趣的文字让原本枯燥的历史变得活色生香。\r\n\r\n', '中国', 2017);
INSERT INTO `book` VALUES (62, '超越金融', '乔治·索罗斯', 28.00, '中信出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-soros-lectures.jpg?Expires=1902241773&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=Rr6jls1ajb2Rf5n9aHmZJNL%2BYxs%3D', 13, 8.40, '这是一本集纳索罗斯思维方式的书，而不仅仅像市面上大部分作品那样只告诉你索罗斯过去的所作所为。书中你将听到索罗斯亲自讲述，他的哲学和他对未来的种种分析——“我在人生过程中逐渐形成了一个理念架构，它既帮助了我经营对冲基金去赚钱，又使我以政策研究慈善家的身份去用钱。”\r\n\r\n这是一本涉猎广泛，而思想集中的著作，如果关于索罗斯你只想读一本书，那么这本书是你最好的选择。', '美国', 2010);
INSERT INTO `book` VALUES (63, '大问题（第10版）', '罗伯特·所罗门 / 凯思林·希金斯', 98.00, '清华大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-the-biggest-question.jpg?Expires=1902241769&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=jl27ToISnEHq6KSgJIfjs4LpMkw%3D', 13, 9.30, '本书的目的就是引导读者进入真正思考的大门。罗伯特•所罗门教授尤以擅长授课和写作清晰流畅著称，他不像一般哲学导论著作那样按照事件发生的顺序罗列哲学史上的一些观点，而是完全把读者当成一点都不了解哲学，从而按照一些大问题来组织材料，叙述生动，字里行间都透露出为普通读者的考虑。随着讨论的不断深入，读者会自然而然地进入哲学的殿堂，在不知不觉中熟悉哲学史上一些最重要的观点，而且很可能会对许多问题重新进行审视，真正享受思考的乐趣。\r\n\r\n哲学就是对智慧的爱。它是对价值重要性的坚持，是对完全陷入生活琐事而仅仅随波逐流的拒斥。我们渴望洞察，企盼理解，但我们的生活被常规攫住了，不时会被那些所谓的“消遣”或“娱乐”活动分神。我们失去的是思考的快乐、理解的挑战、灵感，以及哲学的慰藉。我们都是借着思想而生活的，所以问题的关键不在于是否从事哲学，而在于是接受一种廉价的、没有挑战的替代品，还是试图进行真正的思考。', '美国', 2018);
INSERT INTO `book` VALUES (64, '逻辑哲学论', '路德维希·维特根斯坦', 13.00, '商务印书馆', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-tractatus-logico-philosophicus.jpg?Expires=1902241769&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=UgWXZkx4P0dXIUELycD7XVpIhHk%3D', 13, 9.20, '《逻辑哲学论》是路德维希·维特根斯坦的主要著作，也是逻辑实证主义的早期重要著作。维特根斯坦在这本书中否定因果律，断言逻辑和数学的命题都是重言性质的，所有哲学史上争论的问题都是无意义的，哲学的任务只是对语言进行逻辑分析，即日常语言的明确化。这种思想对后来分析哲学的发展有巨大的影响。', '奥地利', 2009);
INSERT INTO `book` VALUES (65, '僧侣与哲学家', '让-弗朗索瓦•何维勒 / 马修•理查德', 39.00, '华东师范大学出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-lover-and-philosophe.jpg?Expires=1902241773&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=1AJa%2FcmUZTG10Q63dXlw8lBtarg%3D', 13, 8.80, '“对未来的史学家而言，二十世纪最重要的一件事情很可能就是佛教和西方基督教文明的接触。”\r\n\r\n生物学博士马修·理查德生于1946年，跟随诺贝尔生物医学奖得主导师从事分子生物学最尖端研究，然而，正在人生充满各种辉煌可能性的时候，他却突然远赴喜玛拉雅山麓，跟随藏传佛教老师，探求古老的东方智慧。20年后，1996年5月，他的父亲，法兰西学院院士、哲学家让-弗朗索瓦?何维勒来到尼泊尔加德满都，一个叫哈提班的宁静地方，与已经成为藏传佛教僧侣的马修·理查德进行了一场为期十天的对谈。所谈涉及社会、文明、生命、宇宙等诸多重大话题，这是一对父子相隔二十年的重逢，更是东方智慧与西方理性之间一次震撼心灵的碰撞。', '法国', 2014);
INSERT INTO `book` VALUES (66, '好妈妈胜过好老师', '尹建莉', 28.00, ' 作家出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-good-mom-better-than-teacher.jpg?Expires=1902241769&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=ac%2BlyZO5i5sPr30i0zcVtz%2FVMhs%3D', 11, 9.00, '本书是近年来难得一见的优秀的家庭教育原创作品，是教育专家尹建莉的教子手记，是一本还未上市就以“手抄本”流传的图书。\r\n\r\n相比许多家教图书，这本书有以下特点：\r\n\r\n第一，本书首次提出一些令人耳目一新的家庭教育原则，使父母在教育孩子的时候有章可循。\r\n\r\n第二，书中给出许多简单而又实用的操作办法，理论和实践完美结合。使父母们不仅立刻获得许多有效的经验，教育意识也随之改善。它是实事求是谈家教的典范，是家长们最实用的工具书。\r\n\r\n第三，本书不但告诉你怎么能提高孩子成绩，而且告诉你怎么教孩子做人，教你怎么培养一个自觉、自强、自立的孩子。', '中国', 2009);
INSERT INTO `book` VALUES (67, '大学的精神', '蒲实 / 陈赛', 68.00, '中信出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-college-sprint.jpg?Expires=1902241777&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=lG4plUbAyN%2BDSiRw7pbK9x5gHbg%3D', 11, 8.30, '无论在什么时代，“受教育”都是一个人最低成本的提升通道，而美国著名社会心理学家马斯洛将它总结为，“教育是让一个人 成为最好版本的自己。”\r\n\r\n本书作者历时7年，通过实地探访，集中采访大学校长、学院领导、教授、大学学生等，追寻7所世界名校的魅力与品格、积淀与气质：代表精英意志的哈佛、培养社会领袖的耶鲁、作为硅谷心脏的斯坦福、成为现代绅士摇篮的牛津、为读书而生的剑桥、思辨之地海德堡、让梦想起飞的麻省理工。\r\n\r\n从氛围到环境，从历史到现实，从制度到精神，本书对这7所世界名校进行了全方位的呈现，首先为国人真正了解它们提供全面、翔实的一手资料。 同时，面对国人对于大学生培养、大学定位、教育体制等问题的争论，本书能为国内教育实践者、大学生、学生家长等反思教育现状提供优秀范例与方向。\r\n\r\n当然，本书更加倡导一个“终身学习”的概念，“成为最好版本的自己”不应该被限定于一个时间段。读书求知，这个自我提升的过程，也许并不依赖于外部环境，不在于你在哪里读大学。阅读本书，可以帮助更多人燃起终身学习的理念，把这种智识生活的愿望长存于内心。\r\n\r\n', '未知', 2017);
INSERT INTO `book` VALUES (68, '大学的精神', '蒲实 / 陈赛', 68.00, '中信出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-college-sprint.jpg?Expires=1902241777&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=lG4plUbAyN%2BDSiRw7pbK9x5gHbg%3D', 11, 8.30, '无论在什么时代，“受教育”都是一个人最低成本的提升通道，而美国著名社会心理学家马斯洛将它总结为，“教育是让一个人 成为最好版本的自己。”\r\n\r\n本书作者历时7年，通过实地探访，集中采访大学校长、学院领导、教授、大学学生等，追寻7所世界名校的魅力与品格、积淀与气质：代表精英意志的哈佛、培养社会领袖的耶鲁、作为硅谷心脏的斯坦福、成为现代绅士摇篮的牛津、为读书而生的剑桥、思辨之地海德堡、让梦想起飞的麻省理工。\r\n\r\n从氛围到环境，从历史到现实，从制度到精神，本书对这7所世界名校进行了全方位的呈现，首先为国人真正了解它们提供全面、翔实的一手资料。 同时，面对国人对于大学生培养、大学定位、教育体制等问题的争论，本书能为国内教育实践者、大学生、学生家长等反思教育现状提供优秀范例与方向。\r\n\r\n当然，本书更加倡导一个“终身学习”的概念，“成为最好版本的自己”不应该被限定于一个时间段。读书求知，这个自我提升的过程，也许并不依赖于外部环境，不在于你在哪里读大学。阅读本书，可以帮助更多人燃起终身学习的理念，把这种智识生活的愿望长存于内心。\r\n\r\n', '中国', 2017);
INSERT INTO `book` VALUES (69, '爱心与教育', '李镇西', 22.80, '漓江出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-love-and-education.jpg?Expires=1902241770&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=XyJtfm9aU6UphpFQy%2FMvhx%2Bv40o%3D', 11, 9.10, '《爱心与教育:素质教育探索手记(增补本)》是著名教育家李镇西的成名作、代表作。以手记的形式，叙述了李镇西老师教书育人的感人故事。学生汪斌的父亲执意留下一筐鸡蛋感谢李老师对儿子的关爱，李老师每天用小煤油炉煮上一个鸡蛋给汪斌送去。家境困难而品学兼优的宁玮善良节俭，李老师送钱给她补充营养。在高考以几分之差落榜后，宁玮情绪波劝很大，李老师一直鼓励她，八年如一日的通信，电话联络，成为宁玮成功人生的最大动力。父亲病逝，家庭欠债的伍建有了辍学的念头，李老师支持同学们给他捐款捐物。假期，李老师带着学生步行三十多里山路，来到伍建劳作的田头。齐声大喊：“伍—建—你—好!”伍建泪水长流。李老师教育“后进生”万同转化的过程，更像一个惊心动魄的传奇故事。\r\n\r\n', '中国', 2007);
INSERT INTO `book` VALUES (70, '杀死一只知更鸟', '哈珀·李', 32.00, '译林出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-to-kill-a-mocking-bird.jpg?Expires=1902241777&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=SCkox3jFYUnNq9pEuNzzyxNAeR0%3D', 11, 9.20, '成长总是个让人烦恼的命题。成长有时会很缓慢，如小溪般唱着叮咚的歌曲趟过，有时却如此突如其来，如暴雨般劈头盖脸……三个孩子因为小镇上的几桩冤案经历了猝不及防的成长——痛苦与迷惑，悲伤与愤怒，也有温情与感动。这是爱与真知的成长经典。\r\n\r\n《杀死一只知更鸟》获1961年普利策奖。\r\n\r\n美国图书馆借阅率最高的书，英国青少年最喜爱的小说之一。\r\n\r\n美国中学推荐课外读物。\r\n\r\n由小说改编的电影获第25届奥斯卡三项大奖。\r\n\r\n美国电影协会评选的“100名银幕英雄与恶人”中，派克主演的芬奇律师名列英雄第一位。', '美国', 2012);
INSERT INTO `book` VALUES (71, '教育与美好生活', '伯特兰•罗素', 40.00, '上海人民出版社', 'http://couseraccess.oss-cn-beijing.aliyuncs.com/bookshop/book-education-and-nice-life.jpg?Expires=1902241776&OSSAccessKeyId=LTAI0vAYGEPYTiJ1&Signature=3nnUtjt%2FoQgYmDQDa%2Fq77geJy0E%3D', 11, 9.30, '《教育与美好生活》这部教育名著篇幅不长，除一个简短的引言之外，总共十九章，分三篇。该书的前两章构成了第一篇，综论现代教育的基本原理和目的。民主可以说是罗素教育思想的一条门槛式原则，他开宗明义地提出“我们所追求的未来的教育体制必须给每个孩子提供现有的最佳机会”，“如果一种教育方法不可能普及，我们就无法将其视为令人满意的”。正是基于这种精神，他对传统的教育理论、英国贵族式的传统教育特别是公学制度多有反思和批评，希望采用蒙台梭利等现代教育家摸索出的理论和方法破旧立新。不过，他并未一概否定古典人文教育的合理性和重要性，而是指出这方面的教育一定要在内容上有所取舍、方法上有所改良，“人类知识的总量和人类问题的复杂性正在不断增长，因此每一代人都必须为了找时间学习新东西而改进其教育方法”。罗素推重的第二个基本原则是自由。他认为，绝不能像旧时那样通过恐吓、强迫甚或体罚来管束和训导儿童，而应该培养儿童的自律和主动。一方面要借助现代心理学知识来把握和利用儿童的心理特性，另一方面要传授真正有价值的知识来激发儿童的学习欲望。品性和美德的养成绝非依赖外在强制，也不能诉诸意志控制，而是取决于儿童早期确立的良好习惯，“好习惯几乎可以自动产生大部分美德”。在罗素看来，理想人格的基础是活力、勇敢、敏锐和理智等四种品性。他特别指出，传统教育的一大缺陷是轻视理智，而没有理智， “教育者们常常因为热衷于灌输所谓的正确信念而疏于对理智的训练”。即便时至今日，这样的提醒仍旧值得我们谨记。', '英国', 2017);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book` int(11) NOT NULL AUTO_INCREMENT COMMENT '书籍',
  `count` int(11) NOT NULL COMMENT '数量',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_cart_user`(`user`) USING BTREE,
  INDEX `fk_cart_book`(`book`) USING BTREE,
  CONSTRAINT `fk_cart_book` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NOT NULL COMMENT '订单时间',
  `buyer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下单者',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `price` decimal(10, 2) NOT NULL COMMENT '总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_orderbuy_user`(`buyer`) USING BTREE,
  INDEX `fk_orderrcv_user`(`receiver`) USING BTREE,
  INDEX `fk_order_address`(`address`) USING BTREE,
  CONSTRAINT `fk_order_address` FOREIGN KEY (`address`) REFERENCES `address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderbuy_user` FOREIGN KEY (`buyer`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderrcv_user` FOREIGN KEY (`receiver`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book` int(11) NOT NULL AUTO_INCREMENT COMMENT '书籍',
  `count` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_oneorder_order`(`order`) USING BTREE,
  INDEX `fk_oneorder_book`(`book`) USING BTREE,
  CONSTRAINT `fk_oneorder_book` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_oneorder_order` FOREIGN KEY (`order`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `book` int(11) NOT NULL AUTO_INCREMENT COMMENT '书籍',
  `count` int(11) NOT NULL DEFAULT 0 COMMENT '剩余数量',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0：在售；1：下架；2：预售',
  `hot` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '热门：0：未知；1：不热门；2：热门，默认0',
  PRIMARY KEY (`book`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 460 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES (1, 20, 0, 2);
INSERT INTO `sales` VALUES (2, 20, 0, 2);
INSERT INTO `sales` VALUES (3, 200, 0, 2);
INSERT INTO `sales` VALUES (4, 100, 0, 2);
INSERT INTO `sales` VALUES (5, 32, 0, 2);
INSERT INTO `sales` VALUES (6, 54, 0, 2);
INSERT INTO `sales` VALUES (7, 6, 0, 2);
INSERT INTO `sales` VALUES (8, 454, 0, 2);
INSERT INTO `sales` VALUES (9, 43, 0, 2);
INSERT INTO `sales` VALUES (10, 0, 0, 0);
INSERT INTO `sales` VALUES (11, 65, 0, 2);
INSERT INTO `sales` VALUES (12, 87, 0, 2);
INSERT INTO `sales` VALUES (13, 54, 0, 2);
INSERT INTO `sales` VALUES (14, 23, 0, 2);
INSERT INTO `sales` VALUES (15, 23, 0, 2);
INSERT INTO `sales` VALUES (16, 65, 0, 2);
INSERT INTO `sales` VALUES (17, 76, 0, 2);
INSERT INTO `sales` VALUES (18, 87, 0, 2);
INSERT INTO `sales` VALUES (19, 54, 0, 2);
INSERT INTO `sales` VALUES (20, 23, 0, 2);
INSERT INTO `sales` VALUES (21, 65, 0, 2);
INSERT INTO `sales` VALUES (22, 87, 0, 2);
INSERT INTO `sales` VALUES (23, 35, 0, 2);
INSERT INTO `sales` VALUES (24, 86, 0, 2);
INSERT INTO `sales` VALUES (25, 97, 0, 2);
INSERT INTO `sales` VALUES (26, 23, 0, 2);
INSERT INTO `sales` VALUES (27, 54, 0, 2);
INSERT INTO `sales` VALUES (28, 62, 0, 2);
INSERT INTO `sales` VALUES (29, 43, 0, 2);
INSERT INTO `sales` VALUES (30, 87, 0, 2);
INSERT INTO `sales` VALUES (31, 97, 0, 2);
INSERT INTO `sales` VALUES (32, 35, 0, 2);
INSERT INTO `sales` VALUES (33, 76, 0, 2);
INSERT INTO `sales` VALUES (34, 35, 0, 2);
INSERT INTO `sales` VALUES (35, 23, 0, 2);
INSERT INTO `sales` VALUES (36, 86, 0, 2);
INSERT INTO `sales` VALUES (37, 52, 0, 2);
INSERT INTO `sales` VALUES (38, 65, 0, 2);
INSERT INTO `sales` VALUES (39, 76, 0, 2);
INSERT INTO `sales` VALUES (40, 23, 0, 2);
INSERT INTO `sales` VALUES (41, 63, 0, 2);
INSERT INTO `sales` VALUES (42, 74, 0, 2);
INSERT INTO `sales` VALUES (43, 23, 0, 2);
INSERT INTO `sales` VALUES (44, 98, 0, 2);
INSERT INTO `sales` VALUES (45, 343, 0, 2);
INSERT INTO `sales` VALUES (46, 54, 0, 2);
INSERT INTO `sales` VALUES (47, 64, 0, 2);
INSERT INTO `sales` VALUES (48, 345, 0, 2);
INSERT INTO `sales` VALUES (49, 43, 0, 2);
INSERT INTO `sales` VALUES (50, 23, 0, 2);
INSERT INTO `sales` VALUES (51, 54, 0, 2);
INSERT INTO `sales` VALUES (52, 76, 0, 2);
INSERT INTO `sales` VALUES (53, 58, 0, 2);
INSERT INTO `sales` VALUES (54, 37, 0, 2);
INSERT INTO `sales` VALUES (55, 94, 0, 2);
INSERT INTO `sales` VALUES (56, 68, 0, 2);
INSERT INTO `sales` VALUES (57, 37, 0, 2);
INSERT INTO `sales` VALUES (58, 96, 0, 2);
INSERT INTO `sales` VALUES (59, 35, 0, 2);
INSERT INTO `sales` VALUES (60, 86, 0, 2);
INSERT INTO `sales` VALUES (61, 47, 0, 2);
INSERT INTO `sales` VALUES (62, 97, 0, 2);
INSERT INTO `sales` VALUES (63, 68, 0, 2);
INSERT INTO `sales` VALUES (64, 4, 0, 2);
INSERT INTO `sales` VALUES (65, 54, 0, 2);
INSERT INTO `sales` VALUES (66, 0, 0, 0);
INSERT INTO `sales` VALUES (67, 0, 0, 0);
INSERT INTO `sales` VALUES (68, 0, 0, 0);
INSERT INTO `sales` VALUES (69, 0, 0, 0);
INSERT INTO `sales` VALUES (70, 0, 0, 0);
INSERT INTO `sales` VALUES (71, 0, 0, 0);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'id，非负整数',
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '中文类型名',
  `ename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '英文类型名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '书籍类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '未分类', 'none');
INSERT INTO `type` VALUES (2, '其他', 'others');
INSERT INTO `type` VALUES (3, '文学', 'literature');
INSERT INTO `type` VALUES (4, '政治', 'politics');
INSERT INTO `type` VALUES (5, '军事', 'military');
INSERT INTO `type` VALUES (6, '艺术', 'art');
INSERT INTO `type` VALUES (7, '地理', 'geography');
INSERT INTO `type` VALUES (8, '科幻', 'fiction');
INSERT INTO `type` VALUES (9, '悬疑', 'suspense');
INSERT INTO `type` VALUES (10, '科学', 'science');
INSERT INTO `type` VALUES (11, '教育', 'education');
INSERT INTO `type` VALUES (12, '历史', 'history');
INSERT INTO `type` VALUES (13, '哲学', 'philosophy');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id：要求：不允许含任何空格',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名，要求：不允许含任何空格，包括“”，\\t， \\n， \\r等',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码，要求：不允许含任何空格',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话，要求：11位手机号码',
  `authority` tinyint(1) NULL DEFAULT 1 COMMENT '权限，0-管理员；1-顾客，默认1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10000', 'admin', '123456', '17362447820', 0);
INSERT INTO `user` VALUES ('10001', 'guest', '123456', '17362447821', 1);

-- ----------------------------
-- Triggers structure for table book
-- ----------------------------
DROP TRIGGER IF EXISTS `ins_add_trigger`;
delimiter ;;
CREATE TRIGGER `ins_add_trigger` AFTER INSERT ON `book` FOR EACH ROW INSERT INTO sales(book) VALUES(new.id)
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table book
-- ----------------------------
DROP TRIGGER IF EXISTS `ins_update_trigger`;
delimiter ;;
CREATE TRIGGER `ins_update_trigger` AFTER UPDATE ON `book` FOR EACH ROW UPDATE sales SET book = new.id WHERE book = old.id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table book
-- ----------------------------
DROP TRIGGER IF EXISTS `ins_delete_trigger`;
delimiter ;;
CREATE TRIGGER `ins_delete_trigger` AFTER DELETE ON `book` FOR EACH ROW DELETE FROM sales WHERE book = old.id
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
