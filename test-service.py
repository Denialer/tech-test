#!/usr/bin/python

import MySQLdb as mdb
import sys

con = None

try:

  con = mdb.connect('34.241.29.152', 'testuser','12345', 'mysql');
  cur = con.cursor()
  cur.execute("SELECT VERSION()")

  data = cur.fetchone()
  short_version = str(data)[2:5]
  print "%s" % short_version

except mdb.Error, e:

  print "Error %d: %s" % (e.args[0],e.args[1])
  sys.exit(1)

finally:
  if con:
     con.close()
