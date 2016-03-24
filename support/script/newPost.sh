clear
echo "请输入文件名："
read FILENAME
hexo new $FILENAME
echo "$FILENAME.md新建成功"
echo "本脚本由 Bitmoe Inc. 编写并提供技术支持！"
read TEMPINPUT