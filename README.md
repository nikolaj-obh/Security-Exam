# Project
## Installation procedure
1. Run the following Docker command:
   ***docker run -d --name mysqldb -p 3307:3306 -e MYSQL_ROOT_PASSWORD=123456 -h127.0.0.1 mysql:latest***
2. Open MySQL Workbench
3. Connect to the MySQL connection
4. Open the Dump_dbtest_v4.sql file and execute the file in MySQL Workbench
5. Open the application in your preferred IDE

Per default the Spring Boot app use port:8080 and the Angular app use port:4200
