# dbinstaller


An Image which installs the dbs on the db container

There is an environment variable (ADD_DUMMYDATA) which can be used to add dummydata for testing purposes.
It creates a category table in anspardb and a testuser with test:test


to start a mysql image just run:

docker run -d -p 3306:3306 --env MYSQL_ROOT_PASSWORD=my-secret-pw --name mysql mysql:8.0.26