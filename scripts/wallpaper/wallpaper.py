#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import configparser
import getopt
import json
import os
from random import randint
import sys
import requests

CONFIG = [
    # acg
    {
        "url": "https://www.dmoe.cc/random.php?return=json",
        "key": "imgurl",
        "tag": "ACG"
    },
    {
        "url": "https://acg.toubiec.cn/random.php?ret=json",
        "key": "imgurl",
        "tag": "ACG"
    },
    {
        "url": "https://api.ixiaowai.cn/api/api.php?return=json",
        "key": "imgurl",
        "tag": "ACG"
    },
    # menhear酱
    {
        "url": "https://api.ixiaowai.cn/mcapi/mcapi.php?return=json",
        "key": "imgurl",
        "tag": "ACG"
    },
    # 风景
    {
        "url": "https://api.ixiaowai.cn/gqapi/gqapi.php?return=json",
        "key": "imgurl",
        "tag": "SCENERY"
    },
]

CACHE_PATH = os.environ['HOME'] + "/.cache/bgcache"

def random(l):
    return randint(0, len(l)-1)


def filterTag(arg):
    if(arg.strip() == ''):
        return CONFIG
    return list(filter(lambda item: item['tag'] == arg, CONFIG))


def download(arg):
    l = filterTag(arg)
    item = l[random(l)]
    r = requests.get(item['url'])
    content = r.text.replace("'", "\"")
    if content.startswith(u'\ufeff'):
        content = content.encode('utf8')[3:].decode('utf8')
    jsonobj = json.loads(content)
    if type(jsonobj) == list:
        imgUrl = json.loads(content)[0][item['key']]
    else:
        imgUrl = json.loads(content)[item['key']]
    r = requests.get(imgUrl)
    ext = os.path.splitext(imgUrl)[1]
    path = '/tmp/bg'+ext
    with open(path, "wb") as code:
        code.write(r.content)
    setbg(path)
    write_cache(imgUrl, item['tag'])

def write_cache(url, tag):
    with open(CACHE_PATH, 'a+') as cache:
        cache.writelines(tag + '=' + url)
        cache.write('\n')

def read_cache():
    CACHE_PATH = os.environ['HOME'] + "/.cache/bgcache"
    conf = configparser.ConfigParser()
    conf.read(CACHE_PATH)
    print('-----------')
    print(conf.items('DEFAULT'))

def local():
    setbg("$HOME/Pictures/wallpaper")


def setbg(path):
    os.system('feh --bg-max --randomize --bg-fill ' + path)


def run():
    if os.system('ping -c1 baidu.com') == 0:
        download('')
    else:
        local()


def main(argv):
    try:
        opts, args = getopt.getopt(argv, "hlrt:")
        print(args)
    except getopt.GetoptError:
        sys.exit(2)
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            print("-t")
            sys.exit()
        elif opt in ("-t", "--type"):
            download(arg)
        elif opt in ("-l", "--local"):
            local()
        elif opt in ("-r", "--run"):
            run()
        else:
            sys.exit()


if __name__ == "__main__":
    main(sys.argv[1:])
