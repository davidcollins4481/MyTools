#!/usr/bin/env python

import smtplib
import sys
from optparse import OptionParser

#### this will be moved to a conf file
email_from = '###'
smtp_server = 'smtp.gmail.com:587'
smtp_username = '###'
smtp_password = '###'
####

parser = OptionParser()
parser.add_option("-t", "--to", dest="to",
    help="Send email to EMAIL_ADDRESS", metavar="EMAIL_ADDRESS")

parser.add_option("-s", "--subject", dest="subject",
     help="Email subject", metavar="SUBJECT")

parser.add_option("-m", "--message", dest="message",
     help="Message body", metavar="MESSAGE")

(options, args) = parser.parse_args()

to = options.to
message = options.message

if not to or not message:
    print parser.print_help()
    sys.exit(1)

subject = options.subject
content_type = "text/plain"

headers = ["From: " + email_from,
           "Subject: " + subject,
           "To: " + to,
           "MIME-Version: 1.0",
           "Content-Type:" + content_type]

headers = "\r\n".join(headers)

# The actual mail send  
server = smtplib.SMTP(smtp_server)

# what is tls?
server.starttls()
server.login(smtp_username,smtp_password)
server.sendmail(email_from, to, headers + "\r\n\r\n" + message)
server.quit() 

