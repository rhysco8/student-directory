# student-directory #

The student directory script allows you to manage the list of students enrolled at Villains Academy.

## How to use ##

There are 2 versions of the directory currently.
1. The original, which can be run by using
```shell
ruby directory.rb
```
This version has an interactive menu which gives you the option to add student names (with the November cohort hardcoded), print the current list of students, save the list to a hardcoded a CSV file and load from that same file.
It loads students.csv by default but can also be passed a file with a list of students to load from the command line.

2. The modified version has had several fancy changes made to it, as per the exercises listed in the Makers Academy curriculum. It can be run by using
```shell
ruby modified_directory.rb
```
The current version asks for student names on startup and for each student you can specify their cohort. The cohorts are January to December and if left blank the cohort defaults to 'unknown'. Once all names and cohorts have been entered, the program prints a centered list of the students by cohort. If no student names have been entered then the list is not printed, just a message to say there are no students.
Previous iterations can be found in the commit history.
