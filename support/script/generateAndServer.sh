echo ""
unset HOME
unset USERPROFILE
unset HOMEPATH
export HEXOPHOME=`dirname $PWD`/home
export HOME=$HEXOPHOME
export USERPROFILE=$HEXOPHOME
export HOMEPATH=$HEXOPHOME
hexo g
echo ""
echo ""
echo "若显示 Hexo is running ，浏览器却打不开链接，请更换端口；"
echo "打开基准目录中的 启动命令行.bat ，并输入 hexo s -p6666 。"
echo ""
echo ""
hexo s
echo ""
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
echo "回车退出；"
read TEMPINPUT
