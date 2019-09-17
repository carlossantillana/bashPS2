#!/bin/bash
curl -X GET 'http://data.un.org/Handlers/DownloadHandler.ashx?DataFilter=itemCode:526&DataMartId=FAO&Format=csv&c=2,4,5,6,7&s=countryName:asc,elementCode:asc,year:desc'   -H 'Accept: */*'   -H 'Accept-Encoding: gzip, deflate'   -H 'Cache-Control: no-cache'   -H 'Connection: keep-alive'   -H 'Host: data.un.org'   -H 'Postman-Token: 0952408b-8031-41e6-b617-99eaffaa3501,9a397938-a06a-4745-8433-b082960c0037'   -H 'User-Agent: PostmanRuntime/7.16.3'   -H 'cache-control: no-cache' > text.tar.gz

 unzip -p text.tar.gz >apricots.csv

sed '/fnSeqID/,$d' apricots.csv  | sed '$d' > apricotsClean.csv
cat apricotsClean.csv | grep -i "\"2005\"" > apricotsYear.csv
sed 's/\"//g' apricotsYear.csv > apricotsNoQuotes.csv
cat apricotsNoQuotes.csv | grep -i "Area harvested" > apricotsHarvested.csv
sort -k5 -n -t, apricotsHarvested.csv > apricotsSort.csv
tail -n 10 apricotsSort.csv
