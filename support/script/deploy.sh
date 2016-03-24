clear
echo "HEXO辅助配置脚本"
echo "Powered By Bitmoe"
echo ""
echo "进行这一步之前，请保证："
echo "已经注册了Github并且新建了如 用户名.github.io 的仓库；"
echo ""
echo "如果已经确认以上步骤，请按回车继续..."
read TEMPINPUT
echo "那好，请按照以下提示输入相关信息："
echo "1、请输入你的Github的用户名，输入完毕回车确认！"
read GITHUBID
echo "2、请输入你的Github注册邮箱，输入完毕回车确认！"
read GITHUBEMAIL
echo "进行安装步骤，此步骤耗时较长，请耐心等待...."

git config --global credential.helper store
git config --global user.name $GITHUBID
git config --global user.email $GITHUBEMAIL

githubrepo="https://$GITHUBID@github.com/$GITHUBID/$GITHUBID.github.io.git"

sed -i '/^  type:/d' _config.yml
sed -i '/^  repo:/d' _config.yml
sed -i '/^  branch:/d' _config.yml
sed -i '/^  message:/d' _config.yml

sed -i '$a\  type: git' _config.yml
sed -i '$a\  repo: '$githubrepo'' _config.yml
sed -i '$a\  branch: master' _config.yml
sed -i '$a\  message: 更新博客。' _config.yml

echo "下面将进行部署测试，稍后将有一个openssh的对话框出现，请输入你的github用户密码。"
echo "请按回车继续..."
read TEMPINPUT

hexo g
hexo d

echo "请访问 https://$GITHUBID.github.io 查看是否部署成功！"
echo "HEXO 的初步配置完毕，更多的配置请参考官方文档~自带中文哦！"
echo "本脚本由 Bitmoe Inc. 编写并提供技术支持！"
read TEMPINPUT