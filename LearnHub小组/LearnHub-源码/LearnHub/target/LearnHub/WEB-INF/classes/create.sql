CREATE DATABASE IF NOT EXISTS `learnhub` DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
use `learnhub`;
-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(200) NOT NULL,
  `courseType` varchar(200),
  `studyCount` int(11) NOT NULL DEFAULT '0',
  `courseDetail` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES('1','高级语言程序设计（Python）','计算机','171','“高级语言程序设计”课程面向无编程基础的学生，培养运用编程语言（Python语言）解决实际问题的编程能力。使学生掌握Python语言的基本语法、语句以及结构化程序设计的基本思想和方法，了解基本的算法和数据结构，培养良好的程序设计风格，为进一步学习其他专业课程和从事软件开发工作打下坚实的基础。');
INSERT INTO `course` VALUES('2','微软人工智能 - 深度学习框架和工具','计算机','313','在《微软人工智能公开课》中，我们将通过服务和API、数据分析平台、以及深度学习框架和工具三个层级和大家一起学习微软人工智能相关的服务、技术和工具。希望通过此系列课程，开发人员和数据科学家可以更加充分的借用云平台的力量，开发更加智能、更富有生命力的产品，服务大众。');
INSERT INTO `course` VALUES('3','数据结构与算法','计算机','471','“数据结构与算法”是理论和实际紧密结合的计算机类专业核心骨干课程，广泛用于数据存储和信息处理中。课程将系统介绍软件开发中常用的数据结构、存储结构和操作算法；简要介绍算法设计与分析中的设计策略，包括贪心法、分治法等。通过学习，使你能解决实际复杂工程问题，成为程序分析和设计“达人”。');
INSERT INTO `course` VALUES('4','人工智能实践：Tensorflow笔记','计算机','143','​这是人工智能入门课，将用八次课帮你梳理人工智能概念、机器学习方法、深度学习框架。如果你还不知道什么是人工智能、机器学习、深度学习，欢迎进来学习交流。结课时，你将会用Python搭建人工神经网络，实现特定物体的识别。一起编码感受人工智能 机器学习 深度学习 人工智能 机器学习 深度学习吧！');
INSERT INTO `course` VALUES('5','财务管理','经济管理','347','由最基础的财务报表、比率分析开始，让学生学到最实用的财务知识，进而引领学生利用所学的观念，了解公司的内部治理与投资决策，并结合当下时事，培养学生对金融时事的敏感度，将书本上的知识应用于日常生活中。');
INSERT INTO `course` VALUES('6','遗传学与社会','生命科学','147','本课程拟为非生物类专业的学生介绍与生活密切相关的遗传学热点问题；每一章都从案例开始，打破人类、动物、植物、微生物的格局，以TOPIC为节；而大多“章”又都是融入了相关法律、道德层面问题的“节”。希望各位同学能够和我们一起探索基因的奥秘，揭开动植物与人类遗传的神秘面纱。');
INSERT INTO `course` VALUES('7','应用写作技能与规范','文史','241','如今应用文已成为党政机关、企事业单位和个人处理事务、交流信息不可缺少的重要工具。应用写作能力是一个人综合素质和工作能力的具体体现。欢迎大家来这里，分享应用写作技巧；来这里，通晓实用文书、掌握行文规范，品味写作之道、提升写作能力，铺就成功之路、实现人生价值。');
INSERT INTO `course` VALUES('8','模拟电子技术基础','工学','130','当今社会可谓是“电子信息社会”，电子技术已深入工业、农业、国防、教育、医疗等方方面面，在国民经济和社会的发展中具有举足轻重的地位，也将对社会未来的发展产生巨大的影响。模拟电子技术是电子技术的重要组成部分，模拟电子技术基础课程就是进入“精彩”的电子世界的第一步。');
INSERT INTO `course` VALUES('9','宇宙新概念','理学','140','宇宙是如何起源，又是如何演化、发展、灭亡的？自古以来一直是人类最感兴趣和不断探索的问题之一，这也是本课程要向学习者介绍的内容，包括牛顿的万有引力理论，爱因斯坦的广义相对论，霍金的宇宙观，时间、历法，太阳系，恒星，星系，致密天体，宇宙论等。');
INSERT INTO `course` VALUES('10','消费者保护法','其他','413','本课程从消费安全、消费信息、消费公平、消费者保护职责等制度切入，针对现代生活实际，解析产品责任、消费欺诈3倍赔偿、不合格食品10倍赔偿、不公平消费合同条款、新兴消费维权、消费维权证据收集等内容，助力合法经营，提升自主学法、理性维权技能！');


DROP TABLE IF EXISTS `courseSection`;

CREATE TABLE `courseSection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '归属课程id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '归属章节id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '章节名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='课程章节表';

INSERT INTO `courseSection` VALUES('1','1','0','第一章 基础知识概述');
INSERT INTO `courseSection` VALUES('2','1','0','第二章 函数与控制结构');
INSERT INTO `courseSection` VALUES('3','1','0','第三章 常用数据结构');
INSERT INTO `courseSection` VALUES('4','1','1','1-1 程序设计的基础知识');
INSERT INTO `courseSection` VALUES('5','1','1','1-2 数据类型、运算符与表达式、变量赋值与简单I/O操作');
INSERT INTO `courseSection` VALUES('6','1','2','2-1 程序控制结构');
INSERT INTO `courseSection` VALUES('7','1','2','2-2 函数与递归函数');
INSERT INTO `courseSection` VALUES('8','1','3','3-1 字符串');
INSERT INTO `courseSection` VALUES('9','1','3','3-2 列表与元组');
INSERT INTO `courseSection` VALUES('10','1','3','3-3 字典与集合');
INSERT INTO `courseSection` VALUES('11','2','0','第一章 深度学习概览');
INSERT INTO `courseSection` VALUES('12','2','0','第二章 深度学习在计算机图形学中的结合与运用');
INSERT INTO `courseSection` VALUES('13','2','0','第三章 深度神经网络在语音中的应用');
INSERT INTO `courseSection` VALUES('14','2','0','第四章 深度视频分析与理解');
INSERT INTO `courseSection` VALUES('15','3','0','第一章 线性表');
INSERT INTO `courseSection` VALUES('16','3','0','第二章 栈和队列');
INSERT INTO `courseSection` VALUES('17','3','0','第三章 串');
INSERT INTO `courseSection` VALUES('18','4','0','第一章 梳理人工智能领域的基本概念');
INSERT INTO `courseSection` VALUES('19','4','0','第二章 串讲python语法');
INSERT INTO `courseSection` VALUES('20','4','0','第三章 讲解Tensorflow的关键词');
INSERT INTO `courseSection` VALUES('21','5','0','第一章 财务报表');
INSERT INTO `courseSection` VALUES('22','5','0','第二章 财务规划及营运资金管理');
INSERT INTO `courseSection` VALUES('23','5','0','第三章 投资策略');
INSERT INTO `courseSection` VALUES('24','6','0','第一章 遗传学的发展与社会的关系');
INSERT INTO `courseSection` VALUES('25','6','0','第二章 基因的表达');
INSERT INTO `courseSection` VALUES('26','6','0','第三章 基因工程');
INSERT INTO `courseSection` VALUES('27','7','0','第一章 事务文书');
INSERT INTO `courseSection` VALUES('28','7','0','第二章 公文');
INSERT INTO `courseSection` VALUES('29','7','0','第三章 日常文书');
INSERT INTO `courseSection` VALUES('30','8','0','第一章 半导体二极管及其应用');
INSERT INTO `courseSection` VALUES('31','8','0','第二章 半导体晶体管及放大电路基础');
INSERT INTO `courseSection` VALUES('32','8','0','第三章 集成运算放大器');
INSERT INTO `courseSection` VALUES('33','9','0','第一章 太阳系');
INSERT INTO `courseSection` VALUES('34','9','0','第二章 恒星');
INSERT INTO `courseSection` VALUES('35','9','0','第三章 星系');
INSERT INTO `courseSection` VALUES('36','10','0','第一章 消费者保护法概述及学习方法');
INSERT INTO `courseSection` VALUES('37','10','0','第二章 消费安全保护制度');
INSERT INTO `courseSection` VALUES('38','10','0','第三章 消费公平保护制度');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '123@123.com');
INSERT INTO `user` VALUES ('2', 'test1', '123456', '456@123.com');
INSERT INTO `user` VALUES ('3', 'test2', '123456','123@456.com');
INSERT INTO `user` VALUES ('4', 'qwe', '123456','123@789.com');

DROP TABLE IF EXISTS `CourseTypeDefine`;

CREATE TABLE `CourseTypeDefine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `CourseTypeDefine` VALUES ('1', '计算机');
INSERT INTO `CourseTypeDefine` VALUES ('2', '经济管理');
INSERT INTO `CourseTypeDefine` VALUES ('3', '生命科学');
INSERT INTO `CourseTypeDefine` VALUES ('4', '文史');
INSERT INTO `CourseTypeDefine` VALUES ('5', '工学');
INSERT INTO `CourseTypeDefine` VALUES ('6', '理学');
INSERT INTO `CourseTypeDefine` VALUES ('7', '其他');

DROP TABLE IF EXISTS `Article`;

CREATE TABLE `Article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `article_type` varchar(200) NOT NULL,
  `date` DATE NOT NULL DEFAULT '2018-07-10',
  `praise_num` int(11) NOT NULL DEFAULT '0',
  `comment_num` int(11) NOT NULL DEFAULT '0',
  `click_num` int(11) NOT NULL DEFAULT '0',
  `summary` varchar(500) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `Article` VALUES ('1', 'Spring依赖注入与控制反转理解','1','admin','计算机','2018-07-10','4','0','130','1111111111','1111111111111111111111111111111111111111');
INSERT INTO `Article` VALUES ('2', '经济管理经济管理经济管理','1','admin','经济管理','2018-07-11','7','0','413','222222222222222222222222222','33333333333333333333333333333333');
INSERT INTO `Article` VALUES ('3', '生命科学生命科学生命科学','1','admin','生命科学','2018-07-12','3','0','199','333333','66666666666666666666666666666666666666666666');

DROP TABLE IF EXISTS `Comment`;

CREATE TABLE `Comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `date` DATE NOT NULL DEFAULT '2018-07-11',
  `comment_type` int(11) NOT NULL COMMENT '课程评论为1,文章为2,回答为3',
  `comment_ref_id` int(11) NOT NULL COMMENT '课程或文章或回答的id',
  `praise_num` int(11) NOT NULL DEFAULT '0',
  `reply_num` int(11) NOT NULL DEFAULT '0',
  `comment_content` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `Comment` VALUES ('1', '1','admin','2018-07-12','1','1','13','2','我是评论111111111111111111111111111');


DROP TABLE IF EXISTS `Reply`;

CREATE TABLE `Reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `date` DATE NOT NULL DEFAULT '2018-07-11',
  `reply_type` int(11) NOT NULL COMMENT '课程评论为1,文章为2,回答为3',
  `reply_ref_id` int(11) NOT NULL COMMENT '课程或文章或回答的id',
  `reply_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论为0,回复为被回复的评论的id',
  `praise_num` int(11) NOT NULL DEFAULT '0',
  `reply_content` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `Reply` VALUES ('1', '1','admin','2018-07-12','1','1','1','130','我是回复222222222222222222222222222');
INSERT INTO `Reply` VALUES ('2', '1','admin','2018-07-12','1','1','1','13','我是回复333333333333');

DROP TABLE IF EXISTS `Question`;

CREATE TABLE `Question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `date` DATE NOT NULL DEFAULT '2018-07-11',
  `type` varchar(200) NOT NULL,
  `answer_num` int(11) NOT NULL DEFAULT '0',
  `click_num` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `Question` VALUES ('1','1','admin','2018-07-12','计算机','3','130','我是问题哈哈哈哈哈哈哈','我是第一个问题的内容哈哈哈哈');
INSERT INTO `Question` VALUES ('2','1','admin','2018-07-13','经济管理','2','13','我是第二个问题哈哈哈哈','我是第二个问题的内容哈哈哈哈');
INSERT INTO `Question` VALUES ('3','1','admin','2018-07-13','经济管理','0','13','我是第三个问题哈哈哈哈','我是第三个问题的内容哈哈哈哈');

DROP TABLE IF EXISTS `Answer`;

CREATE TABLE `Answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `question_id` int(11) NOT NULL,
  `date` DATE NOT NULL DEFAULT '2018-07-11',
  `comment_num` int(11) NOT NULL ,
  `praise_num` int(11) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `Answer` VALUES ('1','2','test1','1','2018-07-12','0','13','我是回答222222222222222222222222222');
INSERT INTO `Answer` VALUES ('2','3','test2','1','2018-07-12','0','130','我是回答333333333333');
INSERT INTO `Answer` VALUES ('3','1','admin','1','2018-07-12','0','1','有人来回答我的问题吗');
INSERT INTO `Answer` VALUES ('4','2','test1','2','2018-07-13','0','13','我是回答333333333333');
INSERT INTO `Answer` VALUES ('5','3','test2','2','2018-07-13','0','130','我是回答222222222222222222222222222');

DROP TABLE IF EXISTS `Exam`;

CREATE TABLE `Exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(600) NOT NULL,
  `course_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `Exam` VALUES ('1','Python程序设计考试','1');
INSERT INTO `Exam` VALUES ('2','实验室安全考试','0');
INSERT INTO `Exam` VALUES ('3','考试333333333333','0');



DROP TABLE IF EXISTS `ExamQuestion`;

CREATE TABLE `ExamQuestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(600) NOT NULL,
  `option_a` varchar(600) NOT NULL,
  `option_b` varchar(600) NOT NULL,
  `option_c` varchar(600) NOT NULL,
  `option_d` varchar(600) NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL COMMENT '课程评论为1,文章为2,回答为3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `ExamQuestion` VALUES ('1','1.Python1111111111111111','false','false','true','false','3','1');
INSERT INTO `ExamQuestion` VALUES ('2','2.Python1111111111111111','false','false','true','false','3','1');
INSERT INTO `ExamQuestion` VALUES ('3','3.Python1111111111111111','false','false','true','false','3','1');
INSERT INTO `ExamQuestion` VALUES ('4','4.Python1111111111111111','false','false','true','false','3','1');
INSERT INTO `ExamQuestion` VALUES ('5','5.Python1111111111111111','false','false','true','false','3','1');
INSERT INTO `ExamQuestion` VALUES ('6','6.Python1111111111111111','false','true','false','false','2','1');
INSERT INTO `ExamQuestion` VALUES ('7','7.Python1111111111111111','false','true','false','false','2','1');
INSERT INTO `ExamQuestion` VALUES ('8','8.Python1111111111111111','false','true','false','false','2','1');
INSERT INTO `ExamQuestion` VALUES ('9','9.Python1111111111111111','false','true','false','false','2','1');
INSERT INTO `ExamQuestion` VALUES ('10','10.Python1111111111111111','false','true','false','false','2','1');

DROP TABLE IF EXISTS `UserFocus`;

CREATE TABLE `UserFocus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `focus_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '课程为1,用户为2,问题为3',
  `read_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程为Section的ID,用户(文章)为文章ID,问题为回答ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `UserFocus` VALUES ('1','1','6','2','11');
INSERT INTO `UserFocus` VALUES ('2','1','1','1','6');
INSERT INTO `UserFocus` VALUES ('3','1','1','3','2');

DROP TABLE IF EXISTS `UserPraise`;

CREATE TABLE `UserPraise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `praise_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '文章为1,回答为2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `UserPraise` VALUES ('1','1','1','2');
INSERT INTO `UserPraise` VALUES ('2','1','2','2');
INSERT INTO `UserPraise` VALUES ('3','1','3','2');
INSERT INTO `UserPraise` VALUES ('4','2','1','2');
INSERT INTO `UserPraise` VALUES ('5','2','2','2');
INSERT INTO `UserPraise` VALUES ('6','3','1','2');
INSERT INTO `UserPraise` VALUES ('7','1','4','2');
INSERT INTO `UserPraise` VALUES ('8','1','5','2');
INSERT INTO `UserPraise` VALUES ('9','2','5','2');
