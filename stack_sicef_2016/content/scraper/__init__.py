#!/usr/bin/env python
# -*- coding: utf-8 -*-


import urllib2
from BeautifulSoup import BeautifulSoup
import mysql.connector
from mysql.connector import errorcode


URL = 'http://www.time.rs/st/'
PARTS = ['vesti/', 'sport/']
CATS = [['srbija','ekonomija', 'svet', 'kultura'], ['fudbal', 'kosarka', 'tenis']]
SOURCES = ['ALO', 'Blic', 'B92', 'Telegraf', 'Politika', 'Novosti', 'RTS', 'Danas', 'Kurir']


class Item():
    def __init__(self):
        pass


def filter(test_str):
    ret = ''
    skip1c = 0
    skip2c = 0
    for i in test_str:
        if i == '[':
            skip1c += 1
        elif i == '(':
            skip2c += 1
        elif i == ']' and skip1c > 0:
            skip1c -= 1
        elif i == ')'and skip2c > 0:
            skip2c -= 1
        elif skip1c == 0 and skip2c == 0:
            ret += i
    return ret


def parse(item):
    try:
        ret = Item()
        # Title
        title = item.find('h1').find('a').string
        parts = title.split('|')
        ret.title = parts[0].rstrip()
        ret.title = filter(ret.title).lstrip().rstrip()
        # Date
        ret.date = item.find('span', {'class': ['when_now', 'when']}).string.lstrip().rstrip()
        # Desc
        ret.desc = item.find('p', {'class': 'snippet'}).string.lstrip().rstrip()
        # Link
        ret.links = []
        ret.links.append((item.find('h1').find('a')['href'], item.find('a', {'class': 'source'}).string))
        for link_div in item.findAll('div', {'class': 'related_article'}):
            link = link_div.find('a')['href']
            source = link_div.find('a', {'class': 'r_source'}).string
            ret.links.append((link, source))
        return ret
    except:
        return None


def get_by_url(url, id):
    page = urllib2.urlopen(url).read()
    soup = BeautifulSoup(page)
    soup.prettify()
    items = []
    for div in soup.find('body').findAll('div', {'class' : 'cluster'}):
        i = parse(div)
        if i is not None:
            i.category_id = id
            items.append(i)
    return items


def get_all():
    items = []
    id = 10
    for i, url_pat in enumerate(PARTS):
        for cat in CATS[i]:
            items += get_by_url(URL + url_pat + cat, id)
            id += 1
    return items


def make_news(obj):
    return {'title' : obj.title, 'summary' : obj.desc,
           'category_id' : obj.category_id}

def make_link(obj, id):
    try:
        source_id = SOURCES.index(obj[1]) + 1
    except:
        return None
    return {'link': obj[0], 'news_id': id, 'source_id': source_id}

def refreshDb():
    items = get_all()
    config = {
        'user' : 'root',
        'password' : 'root',
        'host' : 'localhost',
        'db' : 'sicef'
    }
    clear_news = "DELETE FROM sicef.news"
    clear_links = "DELETE FROM sicef.news_links"
    add_news = ("INSERT INTO sicef.news "
                  "(title, summary, date, category_id) "
                  "VALUES (%(title)s, %(summary)s, NOW(), %(category_id)s)")
    add_link = ("INSERT INTO sicef.news_links "
                "(source_id, news_id, link) "
                "VALUES (%(source_id)s, %(news_id)s, %(link)s)")
    cnx = cur = None
    try:
        cnx = mysql.connector.connect(**config)
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print('Something is wrong with your user name or password')
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    else:
        cur = cnx.cursor()
        cur.execute(clear_news)
        cur.execute(clear_links)
        for news in items:
            cur.execute(add_news, make_news(news))
            news_id = cur.lastrowid
            for link in news.links:
                obj = make_link(link, news_id)
                if obj is not None:
                    cur.execute(add_link, obj)
        cnx.commit()
        print("Inserted " + str(len(items)))
    finally:
        if cur:
            cur.close()
        if cnx:
            cnx.close()


refreshDb()
