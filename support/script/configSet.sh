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
echo "请按照以下提示输入相关信息："
echo "主标题、副标题、描述、作者、网站地址"
echo "1、请输入博客的主标题"
read blogTitle
echo "2、请输入博客的副标题"
read blogSubTitle
echo "3、请输入博客的描述"
read blogDescription
echo "4、请输入您的昵称"
read blogAuthor
echo "5、请输入博客的网站地址"
echo "   -如果托管在 Github 请输入 用户名.github.io 的格式"
echo "   -如果已经购买了域名请输入 www.xxxxxxxx.xxx 的格式"
read blogUrl

sed -i '/^title: /c\title: '$blogTitle'' _config.yml
sed -i '/^subtitle:/c\subtitle: '$blogSubTitle'' _config.yml
sed -i '/^description:/c\description: '$blogDescription'' _config.yml
sed -i '/^author:/c\author: '$blogAuthor'' _config.yml
sed -i '/^url: /c\url: '$blogUrl'' _config.yml

echo "HEXO 的初步配置完毕，更多的配置请参考官方文档~自带中文哦！"
echo "本脚本由 比特萌公司（Bitmoe Inc.） 编写并提供技术支持！"
read TEMPINPUT