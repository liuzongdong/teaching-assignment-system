# Teaching Assignment System
  This is a Java Project for UIC Year 3 students in Software Development Workshop II.

  This system aims to help CST management team to arrange the teaching assignments more conveniently.

## Project Set Up
### Download Apache Tomcat

  Download and unpack Apache Tomcat 8.5.23 from 
  [here](http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.23/bin/apache-tomcat-8.5.23.zip). 

  Put into separate directory on your local machine.

### Set up Tomcat environments
  ---

  For Windows Users:
  * Window - Preferences - Server - Runtime Environments

  For Mac Users:
  * Eclipse - Preferences - Server - Runtime Environments
  ---


  * Click Add button.

  * Select Apache - Apache Tomcat v8.5

  * Check "Create a new local server"

  * Name: You can set anything you want, by default, it is Apache Tomcat v8.5.

  * Tomcat installation directory: Your Tomcat directory, which you just downloaded a little while before.

  * Jre: Java SE 8 (1.8) or Java 9 (lastest version)

  * Click Finish and apply.

### Set up Git

  Please check [here](https://git-scm.com/downloads) to download the latest version of Git.

  For Mac users: macOS doesn't need to donwload or install this software.

### Cloning an Existing Repository
  If you want to get a copy of an existing Git repository – for example,
  a project you’d like to contribute to – the command you need is

  `git clone`

  To clone a repository you need to use git clone <url> (copy it by clicking the Green button on this page). 
  
  For example:

  `git clone https://github.com/liuzongdong/teaching-assignment-system.git`

  After execute this command, the latest version of TAS is in your computer now.

  For more Git operation Please check [here](https://guides.github.com/)

### Import project

  * In the Eclipse, Click File - Import - Genernal - Projects form Folder or Archive, and click next.

  * Click Directory... Button, and choose the project you just cloned from Github.

  * Click Finish, happy?

### Coding

  Firstly, type: `git status` to check if your work tree clean or not.

  For example: 
  
  `C:\Users\xxx\Desktop\Y3\workshop2\teaching-assignment-system>git status`

    If it is clean, it will show:

    `On branch master
    Your branch is up to date with 'origin/master'.

    nothing to commit, working tree clean`

  **** You will type this command a lot of times. ****


### Add file and Commit

  After coding, go back to Git Bash, and type: `git status`

  You will see the changes you just made, and the filename will be displayed in red.

  type: `git add .` to stage all changes.

  type: `git commit -m "Here's the comment about your code"`

  type: `git push`

  After you push your code, Wechat me, I will review it.

### Keep your branch updated

  Make sure do it everytime before coding, because the master branch maybe changed everytime.

  Just type:

  `git pull`

  It will update your MASTER branch.

## SQL

  Please check release to download the latest version of SQL file.

## API Documentation

  Please check [here](http://111.121.193.214)
