/*
Navicat MySQL Data Transfer

Source Server         : local-123456
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : blogifier_

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-05-02 19:04:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aspnetroleclaims
-- ----------------------------
DROP TABLE IF EXISTS `aspnetroleclaims`;
CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of aspnetroleclaims
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetroles
-- ----------------------------
DROP TABLE IF EXISTS `aspnetroles`;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of aspnetroles
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetuserclaims
-- ----------------------------
DROP TABLE IF EXISTS `aspnetuserclaims`;
CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of aspnetuserclaims
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetuserlogins
-- ----------------------------
DROP TABLE IF EXISTS `aspnetuserlogins`;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` varchar(255) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of aspnetuserlogins
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetuserroles
-- ----------------------------
DROP TABLE IF EXISTS `aspnetuserroles`;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of aspnetuserroles
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetusers
-- ----------------------------
DROP TABLE IF EXISTS `aspnetusers`;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` bit(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` bit(1) NOT NULL,
  `TwoFactorEnabled` bit(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` bit(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of aspnetusers
-- ----------------------------
INSERT INTO `aspnetusers` VALUES ('aaf8b4bc-d6d2-46b7-a522-4e9ff817b853', 'admin', 'ADMIN', 'admin@us.com', 'ADMIN@US.COM', '\0', 'AQAAAAEAACcQAAAAEOfmSjAsoHfKVMcXfFnqMtklcSWdyatPDsH5hs+aOJTO9/nHwKNCbFtwiEKv6/DXuw==', 'XUYYR36V4GC5TCLVOKCUBM6M7RSYJPX5', '1acd1746-603d-4db6-939d-f7572819466f', null, '\0', '\0', null, '', '0');
INSERT INTO `aspnetusers` VALUES ('b4f4ef57-b3f4-4e79-819a-bf2ba16ed831', 'demo', 'DEMO', 'demo@us.com', 'DEMO@US.COM', '\0', 'AQAAAAEAACcQAAAAEJsFPg0Pnsc/jXHJe5SLmuO8APcOZvOS1w9FQBIZ6TKLGBam16/kBEpWGGjQ2x1Wdw==', 'VOBX6OQZVBXDFA3HVKOTSYIPY3JN4BFQ', '0259f90e-8db8-4451-8ccf-74f64bf7c5db', null, '\0', '\0', null, '', '0');

-- ----------------------------
-- Table structure for aspnetusertokens
-- ----------------------------
DROP TABLE IF EXISTS `aspnetusertokens`;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of aspnetusertokens
-- ----------------------------

-- ----------------------------
-- Table structure for authors
-- ----------------------------
DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AppUserId` varchar(160) DEFAULT NULL,
  `AppUserName` varchar(160) DEFAULT NULL,
  `Email` longtext,
  `DisplayName` varchar(160) NOT NULL,
  `Bio` longtext,
  `Avatar` varchar(160) DEFAULT NULL,
  `IsAdmin` bit(1) NOT NULL,
  `Created` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of authors
-- ----------------------------
INSERT INTO `authors` VALUES ('1', null, 'admin', 'admin@us.com', 'Administrator', '<p>Something about <b>administrator</b>, maybe HTML or markdown formatted text goes here.</p><p>Should be customizable and editable from user profile.</p>', 'data/admin/avatar.png', '', '2018-08-22 17:54:42.034652');
INSERT INTO `authors` VALUES ('2', null, 'demo', 'demo@us.com', 'Demo user', 'Short description about this user and blog.', null, '\0', '2018-09-01 17:54:42.069331');

-- ----------------------------
-- Table structure for blogposts
-- ----------------------------
DROP TABLE IF EXISTS `blogposts`;
CREATE TABLE `blogposts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorId` int(11) NOT NULL,
  `Title` varchar(160) NOT NULL,
  `Slug` varchar(160) NOT NULL,
  `Description` varchar(450) NOT NULL,
  `Content` longtext NOT NULL,
  `Categories` varchar(2000) DEFAULT NULL,
  `Cover` varchar(255) DEFAULT NULL,
  `PostViews` int(11) NOT NULL,
  `Rating` double NOT NULL,
  `IsFeatured` bit(1) NOT NULL,
  `Published` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of blogposts
-- ----------------------------
INSERT INTO `blogposts` VALUES ('1', '1', 'Welcome to Blogifier!', 'welcome-to-blogifier!', 'Blogifier is simple, beautiful, light-weight open source blog written in .NET Core. This cross-platform, highly extendable and customizable web application brings all the best blogging features in small, portable package.\r\n\r\n\r\n\r\n#### To login:\r\n\r\n* User: demo\r\n\r\n* Pswd: demo', '## What is Blogifier\r\n\r\n\r\n\r\nBlogifier is simple, beautiful, light-weight open source blog written in .NET Core. This cross-platform, highly extendable and customizable web application brings all the best blogging features in small, portable package.\r\n\r\n\r\n\r\n## System Requirements\r\n\r\n\r\n\r\n* Windows, Mac or Linux\r\n\r\n* ASP.NET Core 2.1\r\n\r\n* Visual Studio 2017, VS Code or other code editor (Atom, Sublime etc)\r\n\r\n* SQLite by default, MS SQL Server tested, EF compatible databases should work\r\n\r\n\r\n\r\n## Getting Started\r\n\r\n\r\n\r\n1. Clone or download source code\r\n\r\n2. Run application in Visual Studio or using your code editor\r\n\r\n3. Use admin/admin to log in as admininstrator\r\n\r\n4. Use demo/demo to log in as user\r\n\r\n\r\n\r\n## Demo site\r\n\r\n\r\n\r\nThe [demo site](http://blogifier.azurewebsites.net) is a playground to check out Blogifier features. You can write and publish posts, upload files and test application before install. And no worries, it is just a sandbox and will clean itself.\r\n\r\n\r\n\r\n![Demo-1.png](/data/admin/admin-editor.png)', 'welcome,blog', 'data/admin/cover-blog.png', '5', '4.5', '', '2018-09-11 17:54:42.160286');
INSERT INTO `blogposts` VALUES ('2', '1', 'Blogifier Features', 'blogifier-features', 'List of the main features supported by Blogifier, includes user management, content management, plugin system, markdown editor, simple search and others. This is not the full list and work in progress.', '### User Management\r\n\r\nBlogifier is multi-user application with simple admin/user roles, allowing every user write and publish posts and administrator create new users.\r\n\r\n\r\n\r\n### Content Management\r\n\r\nBuilt-in file manager allows upload images and files and use them as links in the post editor.\r\n\r\n\r\n\r\n![file-mgr.png](/data/admin/admin-files.png)\r\n\r\n\r\n\r\n### Plugin System\r\n\r\nBlogifier built as highly extendable application allowing themes, widgets and modules to be side-loaded and added to blog at runtime.\r\n\r\n\r\n\r\n### Markdown Editor\r\n\r\nThe post editor uses markdown syntax, which many writers prefer over HTML for its simplicity.\r\n\r\n\r\n\r\n### Simple Search\r\n\r\nThere is simple but quick and functional search in the post lists, as well as search in the image/file list in the file manager.\r\n\r\n\r\n\r\n### Features in the work\r\n\r\n* Plugin management', 'blog', 'data/admin/cover-globe.png', '15', '4', '\0', '2018-10-26 17:54:42.172170');
INSERT INTO `blogposts` VALUES ('3', '2', 'Demo post', 'demo-post', 'This demo site is a sandbox to test Blogifier features. It runs in-memory and does not save any data, so you can try everything without making any mess. Have fun!', 'This demo site is a sandbox to test Blogifier features. It runs in-memory and does not save any data, so you can try everything without making any mess. Have fun!\r\n\r\n\r\n\r\n#### To login:\r\n\r\n* User: demo\r\n\r\n* Pswd: demo', null, 'data/demo/demo-cover.jpg', '25', '3.5', '\0', '2018-12-10 17:54:42.172275');
INSERT INTO `blogposts` VALUES ('5', '1', 'dotnet restore', 'dotnet-restore', 'dotnet restore', 'Maira Wenzel  olprod  joyhooei  OpenLocalizationService\r\n本主题适用于：? .NET Core SDK 1.x ? .NET Core SDK 2.x\r\nname\r\ndotnet restore - 恢复项目的依赖项和工具。\r\n摘要\r\n.NET Core 2.x\r\n.NET Core 1.x\r\n\r\n复制\r\ndotnet restore [<ROOT>] [--configfile] [--disable-parallel] [--force] [--ignore-failed-sources] [--no-cache]\r\n    [--no-dependencies] [--packages] [-r|--runtime] [-s|--source] [-v|--verbosity] [--interactive]\r\ndotnet restore [-h|--help]\r\n说明\r\ndotnet restore 命令使用 NuGet 还原依赖项以及在 project 文件中指定的特定于项目的工具。 默认情况下会并行执行对依赖项和工具的还原。\r\n 备注\r\n\r\n从 .NET Core 2.0 SDK 开始，无需运行 dotnet restore，因为它由所有需要还原的命令隐式运行，如 dotnet new、dotnet build 和 dotnet run。 在执行显式还原有意义的某些情况下，例如 Azure DevOps Services 中的持续集成生成中，或在需要显式控制还原发生时间的生成系统中，它仍然是有效的命令。\r\n为了还原依赖项，NuGet 需要包所在的源。 通常通过 NuGet.config 配置文件提供源。 安装 CLI 工具时提供一个默认的配置文件。 可以通过在项目目录中创建自己的 NuGet.config 文件来指定其他源。 也可以在命令提示符处指定每次调用的其他源。\r\n对于依赖项，使用 --packages 参数指定还原操作期间放置还原包的位置。 如未指定，将使用默认的 NuGet 包缓存，可在所有操作系统上的用户主目录中的 .nuget/packages 目录找到它。 例如 Linux 上的 /home/user1 或 Windows 上的 C:Usersuser1。\r\n对于特定于项目的工具，dotnet restore 首先还原打包工具所在的包，然后继续还原 project 文件中指定的工具依赖项。\r\ndotnet restore 命令的行为会受 Nuget.Config 文件（如果有）中某些设置的影响。 例如，在 NuGet.Config 中设置 globalPackagesFolder 会将还原的 NuGet 包置于指定的文件夹中。 这是在 dotnet restore 命令中指定 --packages 选项的替代方法。 有关详细信息，请参阅 NuGet.Config reference（NuGet.Config 引用）。\r\n隐式 dotnet restore\r\n从 .Net Core 2.0 开始，当发出下列命令时，如有必要，将隐式运行 dotnet restore。\r\ndotnet new\r\ndotnet build\r\ndotnet build-server\r\ndotnet run\r\ndotnet test\r\ndotnet publish\r\ndotnet pack\r\n在大多数情况下，不再需要显式使用 dotnet restore 命令。\r\n有时，隐式运行 dotnet restore 可能不方便。 例如，某些自动化系统（如生成系统）需要显式调用 dotnet restore，以控制还原发生的时间，以便可以控制网络使用量。 要防止隐式运行 dotnet restore，可以通过上述任意命令使用 --no-restore 标记以禁用隐式还原。\r\n自变量\r\nROOT\r\n\r\n要还原的项目文件的可选路径。\r\n选项\r\n.NET Core 2.x\r\n.NET Core 1.x\r\n--configfile <FILE>\r\n\r\n供还原操作使用的 NuGet 配置文件 (NuGet.config)。\r\n--disable-parallel\r\n\r\n禁用并行还原多个项目。\r\n--force\r\n\r\n强制解析所有依赖项，即使上次还原已成功，也不例外。 指定此标记等同于删除 project.assets.json 文件。\r\n-h|--help\r\n\r\n打印出有关命令的简短帮助。\r\n--ignore-failed-sources\r\n\r\n如果存在符合版本要求的包，则源失败时警告。\r\n--no-cache\r\n\r\n指定不缓存包和 HTTP 请求。\r\n--no-dependencies\r\n\r\n当使用项目到项目 (P2P) 引用还原项目时，还原根项目，不还原引用。\r\n--packages <PACKAGES_DIRECTORY>\r\n\r\n指定还原包的目录。\r\n-r|--runtime <RUNTIME_IDENTIFIER>\r\n\r\n指定程序包还原的运行时。 这用于还原 .csproj 文件中的 <RuntimeIdentifiers> 标记中未显式列出的运行时的程序包。 有关运行时标识符 (RID) 的列表，请参阅 RID 目录。 通过多次指定此选项提供多个 RID。\r\n-s|--source <SOURCE>\r\n\r\n指定要在还原操作期间使用的 NuGet 包源。 此设置会替代 NuGet.config 文件中指定的所有源。 多次指定此选项可以提供多个源。\r\n--verbosity <LEVEL>\r\n\r\n设置命令的详细级别。 允许使用的值为 q[uiet]、m[inimal]、n[ormal]、d[etailed] 和 diag[nostic]。\r\n--interactive\r\n\r\n允许命令停止并等待用户输入或操作（例如，完成身份验证）。 从 .NET Core 2.1.400 开始。\r\n示例\r\n还原当前目录中项目的依赖项和工具：\r\ndotnet restore\r\n\r\n还原在给定路径中找到的 app1 项目的依赖项和工具：\r\ndotnet restore ~/projects/app1/app1.csproj\r\n\r\n通过将提供的文件路径用作源，在当前目录中还原项目的依赖项和工具：\r\ndotnet restore -s c:packagesmypackages\r\n\r\n通过将提供的两个文件路径用作源，在当前目录中还原项目的依赖项和工具：\r\ndotnet restore -s c:packagesmypackages -s c:packagesmyotherpackages\r\n\r\n还原当前目录中项目的依赖项和工具，并仅显示最少的输出：\r\ndotnet restore --verbosity minimal\r\n\r\n反馈', null, 'lib/img/cover.png', '0', '0', '\0', '2019-04-04 05:59:14.000000');
INSERT INTO `blogposts` VALUES ('6', '1', '你想离职？IBM的AI九成五已经猜到', '你想离职？ibm的ai九成五已经猜到', '你想离职？IBM的AI九成五已经猜到', '\r\n投递人 itwriter 发布于 2019-04-04 11:46 评论(2) 有461人阅读 原文链接 [收藏] ? ?\r\n\r\n　　新浪科技讯，北京时间 4 月 4 日上午消息，IBM 公司 CEO 罗睿兰（Ginni Rometty）本周二在接受 CNBC 采访的时候表示，该公司每天都会收到超过 8000 份简历。这家科技巨头当前大约拥有 35 万名员工，在员工管理方面他们拥有一个秘密武器，能够让他们知道哪些员工正在寻找其他的工作机会。罗睿兰透露，IBM 的人工智能技术能够预测哪些员工即将离职，而且它的预测准确度达到了 95%。\r\n\r\n　　在过去 7 年中，作为 IBM CEO 的罗睿兰一直在努力提升该公司用于员工留存的人工智能技术。她说到：“挽留员工最好的时机，就是在他们做出离职决定之前。”\r\n\r\n　　IBM 的 HR 有一个“预测性消耗项目”，他们与 Watson 一起开发了这个员工离职预测系统，当系统预测员工即将离职之后，它会对管理人员进行提醒，让管理人员与员工进行交流。罗睿兰拒绝透露有关这个系统的详细信息，她只是表示这个系统依靠的是 IBM 内部的大量数据。该公司的官方说法是它的预测准确率达到了 95%。\r\n\r\n　　罗睿兰说到：“让公司管理层相信它的准确度，这花了一段时间。”她透露，截止到目前这个 AI 已经为 IBM 节省了将近 3 亿美元的员工留存成本。\r\n\r\n　　这个 AI 员工留存工具是 IBM 所打造的用于替代传统人力资源管理的产品之一。罗睿兰认为，传统的人力资源模型需要一次全面修订，在她看来人力资源是一个需要人工智能进行辅助的行业。\r\n\r\n　　罗睿兰表示，由于 IBM 使用了这个技术，该公司的全球人力资源部门的团队规模缩小了 30%。但是她同时也表示，该公司留下来的人力资源员工能够获得更高的薪资，而且正在进行价值更高的工作。她说到：“无论你做什么，都应该把 AI 与它结合在一起。”\r\n\r\n　　更加清晰的职业路径\r\n\r\n　　很长一段时间以来，无论是人力资源部门，还是用人部门的管理者，有一件事情做的都不够好，那就是让员工在清晰的职业路径上前行，以及辨别他们的技能。然而人工智能却能很好的完成这个工作。\r\n\r\n　　罗睿兰表示，让每一个员工清晰地看到自己的职业发展，这是一件重要的事情，然而很多公司到如今也没能做好这件事，而且这个问题将会变得越来越严重。她说到：“我预计，在未来5-10 年中，人工智能将会改变所有职业。”\r\n\r\n　　管理人员需要坦诚对待员工，这意味着管理人员需要告诉员工他们需要哪些技能，尤其是员工缺失哪些技能。IBM 的管理人员会和员工探讨那些哪些技能在市场上很稀有，以及哪些技能已经过剩。\r\n\r\n　　罗睿兰说到：“如果你所掌握的技能在未来不再有需求，而且在市场上已经过剩，或是不符合公司战略需求，你就不适合留在公司中。我相信企业需要坦诚对待员工和员工所掌握的技能。”\r\n\r\n　　通过对数据模式以及相关技能进行更好的了解，IBM 的 AI 可以分析每一名员工的优势。而这个 AI 能够帮助管理人员指导员工，让他们看到未来的机会。而在使用传统的管理方法时，管理人员是无法做到这一点的。罗睿兰说到：“我们发现，管理人员的问卷调查不太准确。在进行评分的时候，管理人员脱不开主观因素的干扰。然而在使用数据的时候，我们就可以得到更加准确的结果。”\r\n\r\n　　IBM 的这个技术能够看到员工正在进行那些任务，他们接受过那些培训，以及他们在培训中所取得的排名。通过这些数据，这个 AI 能够对员工的技能进行分析，HR 经理也能够对每一名员工的技能进行更好的了解，其准确度远远高于传统的管理人员评定。\r\n\r\n　　AI 还能够更好地为员工提供职业反馈。IBM 的 MYCA AI 虚拟助理可以让员工知道自己需要提升哪些技能。他们的另外一个 AI，Blue Match，则能够根据员工所掌握的技能向他们推荐开放职位。罗睿兰透露，在 2018 年获得新职位或晋升的员工中，27% 都获得了 Blue Match 的协助。\r\n\r\n　　她说到：“AI 在进入工作流程之后，它将会改变所有工作，这也是最有意义的一种 AI。是的，一些职位会被 AI 取代，但是这并不是最重要的事情，最重要的事情是要让人们和 AI 协同工作。这是一个关于技能的游戏，要让人们掌握正确的技能，每个人的工作都在发生着改变。”\r\n\r\n　　替代传统 HR 系统\r\n\r\n　　罗睿兰认为，很多企业对于 HR 部门的投资都不够，这使得传统的 HR 部门分裂成了两个部分。首先，它变成了一个自助式系统，员工不得不充当自己的职业发展经理；其次，它变成了一个用于处理低表现员工的防御系统。\r\n\r\n　　她说到：“我们要把 AI 带到所有地方，然后放弃现存的自助系统。”IBM 的员工如今不再需要自己决定哪些培训项目才能帮助他们实现自我提升。该公司的 AI 能给每一名员工提供建议，让他们知道要学会哪些新技能才能在职业发展道路上更进一步。\r\n\r\n　　同时，员工的低表现也不再是管理人员、HR、法务部门和财务部门需要解决的问题，它变成了解决方案集团需要解决的问题。IBM 正在使用他们的“pop-up”解决方案中心来帮助管理人员提升员工的表现力。罗睿兰表示，大多数企业都在依赖“员工卓越中心“来提升员工的表现力，但是 IBM 则将这项工作交给了解决方案中心。\r\n\r\n　　IBM 相信，未来机器能够比 HR 人员更好的了解员工。罗睿兰表示，她对 AI 的信任并不是为了打击 HR 这个职业，她认为 HR 是一个“充满爱的工作”，而且自己也是这项职业的拥护者。\r\n\r\n　　但是在新的时代中，以 AI 为中心的 HR 相比传统的以人为中心的 HR 更高效，因为机器能够处理成百上千万的数据节点，并且用新的方式进行学习。它能够发现员工真正的潜力，并且成为企业的增长引擎。\r\n\r\n　　她说到：“HR 工作的重点是了解每一个个人。技能是员工的可再生资产，你要重视技能的力量。”(永妍)', null, 'lib/img/cover.png', '0', '0', '\0', '2019-04-04 06:06:24.000000');

-- ----------------------------
-- Table structure for customfields
-- ----------------------------
DROP TABLE IF EXISTS `customfields`;
CREATE TABLE `customfields` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorId` int(11) NOT NULL,
  `Name` longtext,
  `Content` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of customfields
-- ----------------------------
INSERT INTO `customfields` VALUES ('1', '0', 'blog-title', 'my blogifier');
INSERT INTO `customfields` VALUES ('2', '0', 'blog-description', 'Short blog description');
INSERT INTO `customfields` VALUES ('3', '0', 'blog-items-per-page', '10');
INSERT INTO `customfields` VALUES ('4', '0', 'blog-cover', 'lib/img/cover.png');
INSERT INTO `customfields` VALUES ('5', '0', 'blog-logo', 'lib/img/logo-white.png');
INSERT INTO `customfields` VALUES ('6', '0', 'culture', 'zh-CN');
INSERT INTO `customfields` VALUES ('7', '0', 'blog-theme', 'Standard');
INSERT INTO `customfields` VALUES ('8', '0', 'moments-Newsletter-header', '<p>Subscribe to our newsletter to get latest posts delivered directly to your inbox.</p>');
INSERT INTO `customfields` VALUES ('9', '0', 'moments-Newsletter-thankyou', 'Thank you!');
INSERT INTO `customfields` VALUES ('10', '0', 'moments-Post List-auth', 'All');
INSERT INTO `customfields` VALUES ('11', '0', 'moments-Post List-cat', 'All');
INSERT INTO `customfields` VALUES ('12', '0', 'moments-Post List-max', '10');
INSERT INTO `customfields` VALUES ('13', '0', 'moments-Post List-tmpl', '<li class=\"widget-posts-item\">\r\n\r\n	<a href=\"/posts/{0}\" class=\"widget-posts-link\">\r\n\r\n		<h5 class=\"widget-posts-title\">{1}</h5>\r\n\r\n		<span class=\"widget-posts-date\">July 19, 2018</span>\r\n\r\n		<span class=\"widget-posts-cat\">News</span>\r\n\r\n		<img class=\"widget-posts-img\" src=\"~/data/admin/cover-blog.png\" alt=\"[POSTTITLE]\">\r\n\r\n		<p class=\"widget-posts-desc\">Blogifier is simple, beautiful, light-weight open source blog written in .NET Core. This cross-platform, highly extendable and customizable web application brings all the best blogging features in small, portable package.</p>\r\n\r\n	</a>\r\n\r\n</li>');
INSERT INTO `customfields` VALUES ('14', '0', 'moments-Recent Posts-auth', 'All');
INSERT INTO `customfields` VALUES ('15', '0', 'moments-Recent Posts-cat', 'All');
INSERT INTO `customfields` VALUES ('16', '0', 'moments-Recent Posts-max', '2');
INSERT INTO `customfields` VALUES ('17', '0', 'moments-Recent Posts-tmpl', '<li class=\"widget-posts-item\">\r\n\r\n	<a href=\"/posts/{0}\" class=\"widget-posts-link\">\r\n\r\n		<h5 class=\"widget-posts-title\">{1}</h5>\r\n\r\n		<span class=\"widget-posts-date\">{2}</span>\r\n\r\n		<img class=\"widget-posts-img\" src=\"/{3}\" alt=\"{1}\">\r\n\r\n		<p class=\"widget-posts-desc\">{4}</p>\r\n\r\n	</a>\r\n\r\n</li>');
INSERT INTO `customfields` VALUES ('18', '0', 'moments-Categories-auth', null);
INSERT INTO `customfields` VALUES ('19', '0', 'moments-Categories-cat', null);
INSERT INTO `customfields` VALUES ('20', '0', 'moments-Categories-max', '10');
INSERT INTO `customfields` VALUES ('21', '0', 'moments-Categories-tmpl', '<li><a href=\"/categories/{0}\">{0} <span>({1})</span></a></li>');
INSERT INTO `customfields` VALUES ('22', '0', 'moments-Tags-auth', null);
INSERT INTO `customfields` VALUES ('23', '0', 'moments-Tags-cat', null);
INSERT INTO `customfields` VALUES ('24', '0', 'moments-Tags-max', '100');
INSERT INTO `customfields` VALUES ('25', '0', 'moments-Tags-tmpl', '<li><a href=\"/categories/{0}\">{0}</a></li>');

-- ----------------------------
-- Table structure for htmlwidgets
-- ----------------------------
DROP TABLE IF EXISTS `htmlwidgets`;
CREATE TABLE `htmlwidgets` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Theme` longtext,
  `Author` longtext,
  `Content` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of htmlwidgets
-- ----------------------------
INSERT INTO `htmlwidgets` VALUES ('1', 'Social Buttons', 'Standard', '0', '');

-- ----------------------------
-- Table structure for newsletters
-- ----------------------------
DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE `newsletters` (
  `Id` int(11) NOT NULL,
  `Email` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of newsletters
-- ----------------------------

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorId` int(11) NOT NULL,
  `AlertType` int(11) NOT NULL,
  `Content` longtext,
  `DateNotified` datetime(6) NOT NULL,
  `Notifier` longtext,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for __efmigrationshistory
-- ----------------------------
DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of __efmigrationshistory
-- ----------------------------
INSERT INTO `__efmigrationshistory` VALUES ('20180810003517_InitAppDb', '2.2.3-servicing-35854');
INSERT INTO `__efmigrationshistory` VALUES ('20180915222836_Notifications', '2.2.3-servicing-35854');
INSERT INTO `__efmigrationshistory` VALUES ('20180917014904_HtmlWidgets', '2.2.3-servicing-35854');
INSERT INTO `__efmigrationshistory` VALUES ('20181013050615_CustomFields', '2.2.3-servicing-35854');
INSERT INTO `__efmigrationshistory` VALUES ('20181220174710_Newsletters', '2.2.3-servicing-35854');
INSERT INTO `__efmigrationshistory` VALUES ('20181220175110_RebuildHtmlWidgets', '2.2.3-servicing-35854');
