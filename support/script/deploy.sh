#!/bin/env bash
clear
echo ""
echo -ne "                     欢迎使用 HEXO Portable 辅助配置脚本\n\n"
echo -ne "                          由 比特萌公司 创建并维护\n\n"
echo "                       WebSite: https://www.bitmoe.com"
echo ""
echo "在您执行本步骤之前，请您确认："
echo ""
echo "    1、您已经注册了 Github ；
    2、新建一个以 您用户名开始，.github.io 结尾的仓库。
        ➜ 例如我们的注册帐号为 Bitmoe , 需要创建名为 bitmoe.github.io 的仓库。"
echo ""
echo "如果您确认已完成以上步骤，请按 回车键 继续..."
echo ""
read TEMPINPUT
echo "OK，根据提示信息，完成您的 HEXO Portable 初始化工作！"
echo ""
echo "第一步，请输入您的 Github 用户名并按下 回车键 确认以上操作！"
read GITHUBID
echo "第二步，请输入您的 Github 注册邮箱并按下 回车键 确认以上操作！"
read GITHUBEMAIL
echo "正在执行 HEXO Portable 安装步骤，本步骤耗时较长，请您耐心等待..."

git config --global credential.helper store
git config --global user.name $GITHUBID
git config --global user.email $GITHUBEMAIL

githubrepo="https://$GITHUBID@github.com/$GITHUBID/$GITHUBID.github.io.git"

sed -i '/^  type:/d' _config.yml
sed -i '/^  repo:/d' _config.yml
sed -i '/^  branch:/d' _config.yml
#sed -i '/^  message:/d' _config.yml

sed -i '$a\  type: git' _config.yml
sed -i '$a\  repo: '$githubrepo'' _config.yml
sed -i '$a\  branch: master' _config.yml
#sed -i '$a\  message: 更新博客。' _config.yml

echo ""
echo "                        HEXO Portable 即将执行部署测试，
                   稍后系统将会弹出一个 OpenSSH 确认对话框，
			请您输入您的 Github 账户密码。"
echo ""
echo "    请您按下 回车键 执行部署操作..."
read TEMPINPUT

hexo g
hexo d

echo "                      HEXO Portable 的初始化完毕，"
echo "            请您访问 https://$GITHUBID.github.io 查看您的个人网站！！！"
echo "               更多配置信息请参考官方文档~（自带中文哦！）"
echo "         HEXO 官方简体中文文档：https://hexo.io/zh-cn/docs/"
echo "         HEXO 官方繁体中文文档：https://hexo.io/zh-tw/docs/"
echo ""
echo "           感谢您对我们的支持，您的支持是我们继续走下去的原动力！"
echo ""
echo ""
echo "请输入 “exit” 退出初始化界面。"
read TEMPINPUT
