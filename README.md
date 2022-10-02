# 🎓 FreeCodeCamp: Relational Database

## ✨ Learn Bash by Building a Boilerplate
1. `echo hello terminal` `echo text >> filename`
2. `pwd` - print working directory
3. `ls` - list `ls <flag>` `ls -l` - list in long list format `ls -a` - list **all** the contents 
4. `cd <folder_name>` - change directory `cd ..` - go back `cd ../..` - go back two folders
6. `more <filename>` - see what's in a file 
7. `clear`
8. `mkdir <folder_name>` - make a new folder `mkdir <some_folder_name>/<new_folder_name>`
9. `touch <filename>` - create a new file
10. `cp <file> <destination>` - copy a file
11. `rm <filename>` - remove a file 
12. `mv <filename> <new_filename>` `mv <file> <destination>` - **rename** or **move** something
13. `find <folder_name>` - display the tree of a different folder `find -name <filename>` - search for something 
14. `rmdir <directory_name>` - remove a folder `rmdir <directory_name> -r` - remove directories and their contents recursively

## ✨ Learn Relational Databases by Building a Mario Database
1. `\l` - list databases `\c <database_name>` - connect to database `\d` - display the tables 

2. `CREATE DATABASE database_name;`
3. `ALTER DATABASE database_name RENAME TO new_database_name;`

4. `CREATE TABLE table_name();`
5. `CREATE TABLE table_name(column_name DATATYPE CONSTRAINTS);`
6. `DROP TABLE table_name;`

7. `ALTER TABLE table_name ADD COLUMN column_name DATATYPE;`
8. `ALTER TABLE table_name DROP COLUMN column_name;`
9. `ALTER TABLE table_name RENAME COLUMN column_name TO new_name;`

10. `UPDATE table_name SET column_name=new_value WHERE condition;`

11. `ALTER TABLE table_name ADD PRIMARY KEY(column_name);`
12. `ALTER TABLE table_name ADD PRIMARY KEY(column1, column2);`

13. `ALTER TABLE table_name DROP CONSTRAINT constraint_name;`

14. `ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES referenced_table_name(referenced_column_name);`
15. `ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column);`

16. `ALTER TABLE table_name ADD UNIQUE(column_name);`
17. `ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;`

18. `SELECT columns FROM table_name;`
19. `SELECT columns FROM table_name WHERE condition;`
20. `SELECT columns FROM table_name ORDER BY column_name;`
21. `SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;`

22. `INSERT INTO table_name(column_1, column_2) VALUES(value1, value2);`


## ✨ Learn Bash Scripting by Building Five Programs
1. `#!/bin/bash` - tell your program to use bash by placing a shebang at the very top of the file
2. `./script.sh` - run script
3. `-rw-r--r--`, `r` - means read, `w` - means write, `x` - means execute
4. `chmod +x script.sh` - give everyone executable permissions

5. `VARIABLE_NAME=VALUE`
6. `$VARIABLE_NAME` - to use a variable
7. `read VARIABLE_NAME`

8. 
```
if [[ CONDITION ]]
then
  STATEMENTS
fi
```
9. 
```
if [[ CONDITION ]]
then
  STATEMENTS
else
  STATEMENTS
fi
```
```
if (( CONDITION ))
then
  STATEMENTS
elif [[ CONDITION ]]
then
  STATEMENTS
fi
```
10. `-eq` - equal, `-ne` - not equal, `-lt` - less than, `-le` - less than or equal, `-gt` - greater than, `-ge` - greater than or equal
11.
```
for (( i = 10; i > 0; i-- ))
do
  echo $i
done
```
12.
```
while [[ CONDITION ]]
do
  STATEMENTS
done
```
```
until [[ CONDITION ]]
do
  STATEMENTS
done
```
`(( I-- ))` - to subtract one from I on each pass.
13. `$(( RANDOM % 6 ))` - get random number from 1 to 5
14. 
```
FUNCTION_NAME() {
  STATEMENTS
}
```
15. `=~` - pattern matching
