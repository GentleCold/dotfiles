#!/bin/bash
# Name cleardown
# Description move you files in ~/Downloads to ~/Documents/Office Files
# Author FungLeo
# WebSite http://blog.csdn.net/fungleo

# find .  -maxdepth 1 -type f
# Excel  Other  PDF  Photo  PPT  Word  Xmind  Zip

# 设定要整理的文件夹为下载目录
downFinder="${HOME}/downloads/"
# 准备将这些文件处理到哪里去
filesFinder="${HOME}/downloads/"

# 分辨文件类型，并给出放到哪里去的建议。这里大家可以根据自己的需求完善 case 语句
function fileType() {
  case $1 in
    'jpg' | 'png' | 'gif' | 'jpeg' | 'bmp')
      echo 'imgs'
    ;;
    'doc' | 'docx' | 'xls' | 'xlsx' | 'ppt' | 'pptx')
      echo 'office'
    ;;
    'zip' | '7z' | 'rar' | 'tar' | 'gz' | 'bz2')
      echo 'zip'
    ;;
    'pdf')
      echo 'pdf'
    ;;
    'ipynb' | 'c' | 'cpp' | 'py')
      echo 'code'
    ;;
    *)
      echo 'other'
    ;;
  esac
}

# 判断目标文件夹中是否包含这个文件
function hasfile() {
  if [ -f $1 ]; then
    echo 'has'
  else
    echo 'nohas'
  fi
}

# 给文件重新命个名字，我这里是在后面加了一个 1
function changeFileName() {
  local filename=$(basename $1)
  echo ${filename%.*}_.${filename##*.}
}

# 开始搬文件的函数
function mvFile() {
  # 这个函数需要传两个参数，一个是原文件名，一个是新文件名。
  local name=$1
  local newname=$2
  # 获取文件的后缀名，并且转化为小写
  local type=$(echo $1 | awk -F "." '{print $NF}' | tr "[:upper:]" "[:lower:]" )
  local classify=$(fileType $type)
  local file="$filesFinder$classify/$newname"
  # 判断新文件名在目标地址是否有同名文件
  local hasf=$(echo $(hasfile $file))
  if [ $hasf = 'has' ]; then
    mvFile $name $(changeFileName $newname)
  else
    mv "$downFinder$name" "$file"
  fi
}

# 设置分隔符为换行
OLD_IFS=$IFS
IFS=$'\n'
# 循环这些文件，并且进行处理
for i in $(find "$downFinder" -maxdepth 1 -type f -not -name ".*" | awk -F "/" '{print $NF}'); do
  mvFile $i $i
done

# 将分隔符设置为默认，以免影响后面的程序
IFS=$OLD_IFS
