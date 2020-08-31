#!/usr/bin/python

import MySQLdb as mdb
import sys

con = None

try:

  con = mdb.connect('34.241.29.152', 'testuser','12345', 'mysql');
  cur = con.cursor()
  cur.execute("SELECT VERSION()")

  data = cur.fetchone()
  print "%s" % data

except mdb.Error, e:

  print "Error %d: %s" % (e.args[0],e.args[1])
  sys.exit(1)

finally:
  if con:
     con.close()
