#!/usr/bin/env python
# -*- coding: utf-8 -*-

import urllib2
import json

import mysql.connector
from mysql.connector import errorcode

base_local_url = "http://localhost:8080/api"

base_url = "http://api.smmry.com"
get_parameters = "SM_LENGTH=2&SM_KEYWORD_COUNT=4&SM_API_KEY=427DA630C5&SM_URL="

def get_smmry(id, url):
	print "trying with id: " + str(id) + " and url: " + url
	smmry_response = json.loads(urllib2.urlopen(base_url+"?"+get_parameters+url).read())
	print "have response"
	refreshDb(id, smmry_response)


def refreshDb(id, smmry):
    config = {
        'user' : 'root',
        'password' : 'root',
        'host' : 'localhost',
        'db' : 'sicef'
    }

    update_news = ("UPDATE sicef.news "
                  "SET summary=%(summary)s "
                  "WHERE id=%(id)s")
    add_keyword = ("INSERT INTO sicef.news_keywords "
                "(keyword, news_id) "
                "VALUES (%(keyword)s, %(news_id)s)")
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
        
        cur.execute(update_news, {"summary":smmry["sm_api_content"], "id":id})

        print "updated database"
        
        counting = 0
        for keyword in smmry["sm_api_keyword_array"]:
        	if len(keyword) > 4:
        		try:
	        		cur.execute(add_keyword, {"keyword":keyword, "news_id":id})
	        		cnx.commit()
	        	except:
					print "promasih"
        	print counting
        	counting += 1
        
        print("Inserted")
    finally:
        if cur:
            cur.close()
        if cnx:
            cnx.close()

all_news = json.loads(urllib2.urlopen(base_local_url+"/news").read())
for news in all_news:
    if news["id"] < 554:
        continue
    try:
        links = json.loads(urllib2.urlopen(base_local_url+"/news/links/"+str(news["id"])).read())
        get_smmry(news["id"], links[0]["link"])
    except:
        continue

print "well, I'm done"