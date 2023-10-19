### Code review for auth.php

- Database credentials are hard coded. It should be retrieved from configuration for each environment instead.
- The query is vulnerable to SQL Injection attack. Input parameters should be validated to mitigate the risk
- Message variable is assigned but not used anywhere
- Password check is done with plain text which is a security risk. Password should be hashed before saving and the
  verification should be done by using hashed comparison
- There is no check in place fore database connection. Exception handling should be implemented

### Log file analysis
- The most dangerous line is the following line

`178.62.75.41 - - [06/Oct/2019:21:57:27 +0300] "GET /tmp/s53hkls980JHD.jpg.php HTTP/1.1" 200 25346 "-" "Mozilla/5.0 (Windows NT 5.1) Gecko/20100101 Firefox/4.0.1"`

This line looks like a backdoor.
The line can be found with the following command:

`egrep -v "sql|403|cgi|wp-|302|301|xmlrpc" somesite.log | grep php`

- I would also block the following IPs as they are trying to access unauthorized paths very frequently  

16 66.249.75.52 "GET 403

40 66.249.64.116 "GET 403

The following command lists IPs getting 403 responses sorted by frequency in ascending order

`awk {'print $1,$6,$9'} somesite.log | sort | uniq -c | sort -n | grep -v '200\|302'`
