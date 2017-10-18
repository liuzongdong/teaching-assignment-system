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

### Coding

Firstly, type: `git status` to check if your work tree clean or not.

You will type this command a lot of times.

Before Coding, be sure you create a new branch

`git branch adam-dev` or `git branch tifa-dev` or `git branch hugh-dev`

After that, you can type: `git checkout xxxx-dev` to change the branch. 

PLEASE EDIT CODE IN YOUR OWN BRANCH, DO NOT PULL IT INTO MASTER BRANCH.

### Add file and Commit

After coding, go back to Git Bash, and type: `git status`

You will see the changes you just made, and the filename will be displayed in red.

type: `git add .` to stage all changes.

type: `git commit -m "Here's the comment about your code"`

type: `git push orign xxxx-dev` xxxx is your own branch, for example: tifa-dev

After you push your code, Wechat me, I will review it.

### Keep your branch updated

Make sure do it everytime before coding, because the master branch maybe changed everytime.

Just type:

`git pull`

It will update your MASTER branch.

### After merge branch

If I merge your branch into master, now you can just delete your branch, because your master branch is always up tp date

`git branch -D xxxx-dev` is what you need, after deleting it, you can create a new branch with xxxx-dev again and keep coding.

Remember, DO NOT PUSH CODE INTO MASTER, which means, `git push orign xxxx-dev` is the only thing you need.

## API Documentation

Please check [here](http://111.121.193.214)
