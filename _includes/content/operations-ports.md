
The following ports must be open for requests from your user population.<br>
<!--Changes made per Rohit, 1/9/2020
There are two main categories: operations and debugging.
|Port|Protocol|Service Name|Direction|Source|Destination|Description|
|----|--------|------------|---------|------|-----------|-----------|
|22|SSH|SSH|bidirectional|Administrators IP addresses|All nodes|Secure shell access. Also used for scp (secure copy).|
|80|HTTP|HTTP|bidirectional|All users IP addresses|All nodes|Hypertext Transfer Protocol for website traffic.|
|443|HTTPS|HTTPS|bidirectional|All users IP addresses|All nodes|Secure HTTP.|
|12345|TCP|Simba|bidirectional|Administrators IP addresses|All nodes|Port used by ODBC and JDBC drivers when connecting to ThoughtSpot.|
|2201|HTTP|Orion master HTTP|bidirectional|Administrator IP addresses|All nodes|Port used to debug the cluster manager.|
|2101|HTTP|Oreo HTTP|bidirectional|Administrator IP addresses|All nodes|Port used to debug the node daemon.|
|4001|HTTP|Falcon worker HTTP|bidirectional|Administrator IP addresses|All nodes|Port used to debug the data cache.|
|4251|HTTP|Sage master HTTP|bidirectional|Administrator IP addresses|All nodes|Port used to debug the search engine.|
-->

|Port|Protocol|Service Name|Direction|Source|Destination|Description|
|----|--------|------------|---------|------|-----------|-----------|
|22|SSH|SSH|bidirectional|Administrators IP addresses|All nodes|Secure shell access. Also used for scp (secure copy).|
|443|HTTPS|HTTPS|bidirectional|All users IP addresses|All nodes|Secure HTTP.|
|12345|TCP|Simba|bidirectional|Administrators IP addresses|All nodes|Port used by ODBC and JDBC drivers when connecting to ThoughtSpot.|
