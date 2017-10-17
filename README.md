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

For Mac users: macOS已经内置Git无需安装(谁来翻译一下嘛，反正你们都有权限修改的)

### Initializing a Repository in an Existing Directory (You don't need to do this).
If you have a project directory that is currently not under version control and you want to start controlling it with Git.

Firstly, you need to go to that project’s directory, and type:

`git init`

### Cloning an Existing Repository (This is what you need to do).
If you want to get a copy of an existing Git repository – for example,
a project you’d like to contribute to – the command you need is

`git clone`

Clone a repository with git clone <url>. For example:

`git clone https://github.com/liuzongdong/teaching-assignment-system.git`

After execute this command, the latest version of TAS is in your computer now.

For more Git operation Please check [here](https://guides.github.com/)

### Import project

* In the Eclipse, Click File - Import - Genernal - Projects form Folder or Archive, and click next.

* Click Directory... Button, and choose the project you just cloned from Github.

* Click Finish, happy?

## API Documentation

Please check [here](http://111.121.193.214)
