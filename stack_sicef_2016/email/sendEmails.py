# -*- coding: utf-8 -*-

# Import smtplib for the actual sending function

from __future__ import unicode_literals

import smtplib
import credentials
import urllib2
import json

# Import the email modules we'll need
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

base_url = "http://mbakovic.com:8080/api"
front_url = "http://mbakovic.com:8080/#/single/"

def send_email_with_text(full_html, user_email):
	me = "klipa.nikola@gmail.com"
	you = user_email

	fullmsg = MIMEMultipart('alternative')
	fullmsg['Subject'] = "Ovo su Vase vesti za danas"
	fullmsg['From'] = me
	fullmsg['To'] = you

	msg = full_html
	html = MIMEText(msg, 'html')

	fullmsg.attach(html)

	# Send the message via our own SMTP server, but don't include the
	# envelope header.
	s = smtplib.SMTP('smtp.gmail.com')
	s.ehlo()
	s.starttls()
	s.login(credentials.email, credentials.password)
	s.sendmail(me, [you], fullmsg.as_string())
	s.quit()

def get_all_users():
	return urllib2.urlopen(base_url+"/users").read()

def get_news_for_user(id):
	return urllib2.urlopen(base_url+'/news/recommendedForUser/'+str(id)).read()

users = json.loads(get_all_users())


for user in users:
	downPart = 'email-template/downPart.html'
	headerPart = 'email-template/headerPart.html'
	footerPart = 'email-template/footerPart.html'
	upPart = 'email-template/upPart.html'

	f = open(headerPart, 'r')
	full = f.read()

	news = json.loads(get_news_for_user(user['id']))
	for one in news:
		f = open(upPart, 'r')
		part = f.read()
		part += "<a href=" + front_url + str(one["id"]) +"><h1>" + one['title'] + "</h1></a>"
		part += "<p>" + one['summary'] + "<p>"
		f = open(downPart, 'r')
		part += f.read()
		full += part

	f = open(footerPart, 'r')
	full += f.read()
	
	send_email_with_text(full.encode('utf-8'), user['email'])


