---
title: "Quick start to using Git and GitHub"
date: "2017-04-12"
categories: ["ML & Stats"]
---

<center>
<img src="https://miro.medium.com/max/4000/1*8HHpgXJkc6jQSiNT42EiBg.png" width="100%">
</center>

Git is pretty awesome. My most common "use case" for Git is working as a solo developer, working on different machines (home and work machines) and using GitHub to keep my work in place.

Following is the most straightforward way to start use Git and Github in this no-brainer manner. During development, only run steps indicated by * (7 - code, 9 - stage, 10 - commit, 12 - push).

### Initial set-up

+ [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
+ [Create GitHub account](https://help.github.com/en/github/getting-started-with-github/signing-up-for-a-new-github-account)
+ [Create GitHub repository](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-new-repository)


### 1. Set up credentials, user.email:

```
git config --global user.email "<your github email>"
```

### 1a. Set up credentials, user.email, specific to a git repo only:

```
git config user.email "<your github email>"
```

### 2. Set up credentials, user.name:

```
git config --global user.name "<your github username>"
```

### 2a. Set up credentials, user.name, specific to a git repo only:

```
git config user.name "<your github username>"
```

### 2b. Show all config:

```
git config --list
```

### 3. Create the remote repo online on Github

### 4. Create a folder with the same name as the remote name locally

### 5. Initialize an empty repo: navigate to the folder in command line, then run:

```
git init
```

### 6. Pull the remote:

```
git pull <url of remote (.git)> <branch name, e.g. master>
```

### *7. Go ahead and code

### 8. Add remote repo:

```
git remote add <name of repo> <url of repo (.git)>
```

### *9. Stage all changes:

```
git add --all
```

### *10. Commit all staged changes:

```
git commit -m "<commit message>"
```

### 11. Set remote as upstream:

```
git push --set-upstream <repo name> <branch name, e.g. master>
```

### *12. Push to remote:

```
git push <repo name>
```