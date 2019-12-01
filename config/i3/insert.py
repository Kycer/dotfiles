#! /usr/bin/env python
# -*- coding: utf-8 -*-
import os,json

abspath = os.path.dirname(os.path.abspath(__file__))
HOME = os.environ['HOME']

dir ='%s/conf' % abspath

# 循序生成
filenames = ['base','window','keymap','bar','gaps']

# 加载颜色配置
with open("%s/colors.json" % abspath,'r') as color_file:
    color = json.load(color_file)

def write_file():
  #  读取conf目录下文件
  file=open('%s/config' % abspath,'w')

  # 读取并输出到目录
  for filename in filenames:
    filepath=dir+'/'+filename
    for line in open(filepath):
      if(filename=='bar' and '$color' in line):
        line = line.replace('$color', format_color(color['bar'],True))
      file.writelines(line)
    if(filename =='base'):
      file.write('# 窗体配色\n')
      file.writelines(format_color(color['client'], False))
    file.write('\n')
  file.close()


def format_color(arr, bar):
  format = "{:<25}  {:>0}\n"
  if(bar):
    format = "\t{:<20}  {:>0}\n"
  content = ''.join([format.format(key, str(arr[key]).replace(',','\t\t')) for key in arr])
  return content


def scripts():
  path = HOME + '/.scripts'
  if not os.path.exists(path):
    os.makedirs(path)
  os.system('cp %s %s' % (os.path.abspath(os.path.join(abspath, "../../scripts/*")), path))
  os.system('mv %s %s' % (abspath+'/config', HOME + '/.config/i3/config'))
  os.system('chmod -R a+x %s' % path)
  os.system('i3-msg restart')



if __name__ == "__main__":
  write_file()
  scripts()
