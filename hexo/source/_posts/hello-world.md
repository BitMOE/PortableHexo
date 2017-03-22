---
title: Hello World
---

![](https://portablehexo.bitmoe.cn/hexopp/hexop.png)

>**本版本仅适用于Win环境**
>本文关键字： **Hexo绿色版**，**Hexo便携版**，**Hexo配置**，**Hexo**，**U盘**

[Hexo](https://hexo.io/)是一个快速、简洁且高效的博客框架，支持 GitHub Flavored Markdown 的所有功能；具有超快生成速度，让上百个页面在几秒内瞬间完成渲染；还拥有各式各样的插件等等。

但是就像很多教程里面写的那样，搭建 Hexo 本地环境，需要安装 Node.js、Git 以及使用 npm 进行安装和配置。这对于毫无经验的新手来说，是一个很大的挑战。同时，由于这些环境的存在，导致如果需要更换计算机的时候，重新安装配置一个新的Hexo环境，又得花费一些功夫。

所以呢，锵锵，我们整合了一个 Hexo 便携版，来简化本地环境的部署。

####**版本介绍**
那么所谓的便携版到底是什么？便携版就是将 Hexo 本地环境所需要的各种依赖环境的整合到一起，做成的不需要安装的版本。

本便携版（Release 1.0.0）所包含的软件如下：
>- Git: 2.7.4
>- Nodejs: 6.10.1
>- Npm: 4.4.1
>- Hexo: 3.2.2

为了便携的需要，不能配置固定的环境变量，所以除此之外还有相应的批处理文件，下文将详细介绍。

####**从零开始，1分钟搭建Hexo写作环境**
说了这么多，我们这就开始教你如何在1分钟内，从零开始搭建Hexo写作环境！

#####1 注册一个Github帐号

1.1 进入[Github](https://github.com)，并在右边的3个框框中分别填写 用户名、邮箱地址、账户密码，并点击 **`Sign up for Github`**;

![图1.1.1](https://portablehexo.bitmoe.cn/hexopp/hexop2.png)

1.2 进入欢迎页面后，点击**`Finish sign up`**;

![图1.2.1](https://portablehexo.bitmoe.cn/hexopp/hexop3.png)

1.3 进入到这一步之后（**图1.3.1**），先别记着点任何东西，查看你的邮箱，应该会收到如下的邮件（**图1.3.2**），确认你的邮件。否则，你会看到错误页面（**图1.3.3**）。query完毕之后在**图1.3.1**所示的页面，点击**`+ New repository`**;

![图1.3.1](https://portablehexo.bitmoe.cn/hexopp/hexop5.png)

![图1.3.2](https://portablehexo.bitmoe.cn/hexopp/hexop6.png)

![图1.3.3](https://portablehexo.bitmoe.cn/hexopp/hexop7.png)

1.4 请在红框中的 **`Repository name`** 里面输入 **`用户名.github.io`** ( **用户名** 就是你刚刚 **步骤1.1** 中注册的用户名)，然后点击 **`Create repository`**;

![图1.4.1](https://portablehexo.bitmoe.cn/hexopp/hexop8.png)

1.5 至此，Github网页注册的部分完毕

####2 下载HEXO Portable

2.1 访问我们的 [HEXO Portable](https://project.bitmoe.cn/PortableHexo/) 页面，或者 [Github仓库](https://github.com/Bitmoe/PortableHexo) 下载最新的便携版；

2.2 双击得到的自解压文件，解压到你需要安装博客的地方，可以选择硬盘或者U盘；

####3 配置你的环境

3.1 在你的博客的文件夹，你会发现很多批处理文件，我先介绍下各个文件的用途：
>- 配置基本信息 >> 配置博客的基本环境
>- 配置Github部署 >> 配置博客的部署
>- 启动命令行 >> 启动带环境变量的Git-Bash，否则无法使用node、npm、git等命令
>- 新建文章 >> 新建一篇文章
>- 渲染并本地测试 >> 生成并本地预览
>- 渲染并部署 >> 生成并部署到GitHub
>- 重置配置文件 >> 重置_config.yml

3.2 我们继续进行环境配置，双击**`配置基本信息`**并按顺序输入以下信息：
>- 主标题：顾名思义
>- 副标题：顾名思义
>- 描述：顾名思义
>- 作者：顾名思义
>- 网站地址：填写 **用户名.github.io** （此处的用户名为**步骤1.1**中填写的用户名）
**如果您已经购买了域名，可以参看相关的文章！**

3.3 双击**`配置Github部署`**并按顺序输入以下信息：
>- Github的用户名：此处的用户名为**步骤1.1**中填写的用户名
>- Github注册邮箱：此处的注册邮箱为**步骤1.1**中填写的注册邮箱

3.4 输入完毕之后，会进行测试部署，等待屏幕提示**下面将进行部署测试，稍后将有一个openssh的对话框出现，请输入你的github用户密码。**的时候，按回车继续；（此处的用户密码为**步骤1.1**中填写的用户密码）

3.5 然后继续等待，此时屏幕会出现n多行，耐心等待即可；

3.6 等待屏幕提示**请访问 https://用户名.github.io 查看是否部署成功！**的时候，在浏览器中输入**https://用户名.github.io **，理论上可以看到你的Hexo站点！（此处的用户名为**步骤1.1**中填写的用户名）

3.7 至此，你的Hexo环境就配置完成了，这样你的这个Hexo博客文件夹无论移动到哪一台电脑，都能通过**启动命令行**出现的bash命令行，或者其余便捷的批处理文件比如**新建文章**、**渲染并本地测试**、**渲染并部署**进行相应的操作。

3.8 如果你在配置中出错，可以运行**重置配置文件**后，再重复**3.1~3.6步骤**

####4 开始享受纯粹的Hexo写作吧！

####5 备注
>- 本便携版以及本文均使用 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by/4.0/)协议；
>- 本文所有权归 [QistChan](http://qistchan.com) & [Bitmoe Inc.](https://wwww.bitmoe.com) 所有；
>- 本便携版由 [Bitmoe Inc.](https://www.bitmoe.com) 维护并提供技术支持；
>- 需要技术支持可以在[Github仓库](https://github.com/Bitmoe/PortableHexo) 提交**`Issues`**；
>-  Written with [StackEdit](https://stackedit.io/).