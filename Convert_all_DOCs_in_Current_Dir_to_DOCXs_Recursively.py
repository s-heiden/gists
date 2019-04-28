#!/usr/bin/env python

# TODO: fix issue during call of soffice that prevents running script

import fnmatch
import os
from subprocess import Popen, PIPE

for root, dirnames, filenames in os.walk('.'):
    for filename in fnmatch.filter(filenames, '*.doc'):
        dest_path = os.path.join(root, filename)
        dest_dir = root
        print ('/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to docx --outdir ' + dest_dir + ' ' + dest_path)
        process = Popen(['/Applications/LibreOffice.app/Contents/MacOS/soffice', '--', '--convert-to', 'docx', '--outdir', '"' + dest_dir + '"', '"' + dest_path + '"'], stdout=PIPE, stderr=PIPE)
        stdout, stderr = process.communicate()
        print (stdout)

