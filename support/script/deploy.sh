echo ""
unset HOME
unset USERPROFILE
unset HOMEPATH
export HEXOPHOME=`dirname $PWD`/home
export HOME=$HEXOPHOME
export USERPROFILE=$HEXOPHOME
export HOMEPATH=$HEXOPHOME
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "       感谢您长期以来的对 比特萌 HEXO 便携版的关注及支持！"
echo ""
echo "               Hexo Portable Version: v1.0.3"
echo ""
echo "          项目主页: HTTPS://PortableHexo.Bitmoe.cn"
echo ""
echo "     本程序由 比特萌公司（Bitmoe Inc.） 编写并提供技术支持"
echo ""
echo ""
echo "     当前 HEXO 便携版程序所在位置为 `echo $PortableHexo`"
echo "                 （本目录视为基准文件夹）"
echo "       本程序使用的 HOME 为基准文件夹中的 home 文件夹，"
echo "            本文件夹可能涉及隐私，请勿外传！！！"
echo "       HEXO 博客储存文件夹为基准文件夹中的 hexo 文件夹。"
echo ""
echo ""
echo ""
echo "       欢迎使用 Bitmoe HEXO Portable 辅助配置程序"
echo ""
echo "    进行这一步之前，请保证："
echo "  已经注册了 Github 并且新建了如 用户名.github.io 的仓库；"
echo ""
echo "如果已经确认以上步骤，请按回车继续..."
read TEMPINPUT
echo "那好，请按照以下提示输入相关信息："
echo "1、请输入你的 Github 的用户名，输入完毕回车确认！"
read GITHUBID
echo "2、请输入你的 Github 注册邮箱，输入完毕回车确认！"
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

echo "下面将进行部署测试，稍后将有一个 OpenSSH 的对话框出现，请输入你的 Github 用户密码。"
echo "请按回车继续..."
read TEMPINPUT

hexo g
hexo d

echo "请访问 https://$GITHUBID.github.io 查看是否部署成功！"
echo "HEXO 的初步配置完毕，更多的配置请参考官方文档~自带中文哦！"
echo "回车退出；"
read TEMPINPUT