-- This sql file is executed during the docker build

-- Create the native root user
-- This user uses mysql_native_password as authentication method
-- instead of the default. This user is also used by phpMyAdmin.
CREATE USER 'root_native'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
GRANT ALL PRIVILEGES ON * . * TO 'root_native'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;