#!/usr/bin/env python

import sys
import os.path
import pdb
from subprocess import Popen, PIPE

pdb.set_trace()
filename = None

if len(sys.argv) < 2:
    sys.exit('Please provide a valid image name')

filename = sys.argv[1]

# make sure the file exists
if not os.path.isfile(filename):
    sys.exit(filename + " does not exist")

# get the file type
name, imagetype = filename.split(',')

if not imagetype:
    sys.exit('An image type is required')

process = Popen(["openssl base64", None, filename], stdout=PIPE)
(output, err) = process.communicate()
print output
#openssl base64 < $1 | tr -d '\n'


