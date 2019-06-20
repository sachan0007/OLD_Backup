**Install Git using package manager.**

- yum install git
- Git --version

**Initialize a local git repository**

**Run git status command**

**Create a file README.md**

- mkdir git
- cd git
- Git init

**Run git status command**

**Add file README.md in your local repository**

**Add My first interaction with Git content in README.md**

- git status

output:

[root@ip-172-31-16-86 ec2-user]# mkdir git

[root@ip-172-31-16-86 ec2-user]# cd git/

[root@ip-172-31-16-86 git]# ls

[root@ip-172-31-16-86 git]# git init

Initialized empty Git repository in /home/ec2-user/git/.git/

[root@ip-172-31-16-86 git]# git status

On branch master

No commits yet

nothing to commit (create/copy files and use &quot;git add&quot; to track)

[root@ip-172-31-16-86 git]#

- nano README.md  (My first interaction with Git)

**Run git status command**

**Update file README.md in your local repository**

**Run git status command**

**Create files README1.md README2.md README3.md README4.md**

- git status

Output:

[root@ip-172-31-16-86 git]# git status

On branch master

No commits yet

Untracked files:

  (use &quot;git add \&lt;file\&gt;...&quot; to include in what will be committed)

        README.md

nothing added to commit but untracked files present (use &quot;git add&quot; to track)

[root@ip-172-31-16-86 git]# git status

On branch master

No commits yet

Untracked files:

  (use &quot;git add \&lt;file\&gt;...&quot; to include in what will be committed)

        README.md

        README1.md

        README2.md

        README3.md

        README4.md

nothing added to commit but untracked files present (use &quot;git add&quot; to track)



**Run git status command**

**Add all the newly added files in your local repository without giving their name.**

**Run git status command**

**Remove files README1.md README2.md from local repository**

**Add content in Temporary content in README3.md**

- git add -A
- rm -R README1.md README2.md
- nano README3.md (Temporary content)

Output:

 root@ip-172-31-16-86 git]# git add -A

[root@ip-172-31-16-86 git]# git status

On branch master

No commits yet

Changes to be committed:

  (use &quot;git rm --cached \&lt;file\&gt;...&quot; to unstage)

     new file:   README.md

     new file:   README1.md

     new file:   README2.md

     new file:   README3.md

     new file:   README4.md



**Run git status command**

**Find out the content that is added in README3.md**

- Git status
- Git diff README3.md

Output:

Changes not staged for commit:

  (use &quot;git add/rm \&lt;file\&gt;...&quot; to update what will be committed)

  (use &quot;git checkout -- \&lt;file\&gt;...&quot; to discard changes in working directory)

     deleted: README1.md

     deleted: README2.md

     modified:   README3.md

[root@ip-172-31-16-86 git]# git diff README3.md

diff --git a/README3.md b/README3.md

index 3f64dc1..8e63299 100644

--- a/README3.md

+++ b/README3.md

@@ -1 +1,2 @@

 My first interaction

**+Temporary content**



**Undo the changes in README3.md file**

**Run git status command**

**Create a branch ninja from current branch**

**Create sensei branch from ninja branch and switch to sensei branch**

**List out all the local branches**

**Delete sensei branch**

**Find out the current branch**

**List out all the commits that have been done**

- git checkout -- README3.md
- git status

Master branch will not appear until you commit once.

- git branch ninja

Switch to ninja branch

git checkout ninja

Create branch sensei and switch to it

git checkout -b sensei

git branch -a

For deleting branch first need to merge:

git merge sensei  ninja

Switch to ninja branch and delete sensei

git branch -d sensei



Output:

[root@ip-172-31-16-86 git]# git checkout -- README3.md

[root@ip-172-31-16-86 git]# git status

On branch master

No commits yet

Changes to be committed:

  (use &quot;git rm --cached \&lt;file\&gt;...&quot; to unstage)

     new file:   README.md

     new file:   README1.md

     new file:   README2.md

     new file:   README3.md

     new file:   README4.md

Changes not staged for commit:

  (use &quot;git add/rm \&lt;file\&gt;...&quot; to update what will be committed)

  (use &quot;git checkout -- \&lt;file\&gt;...&quot; to discard changes in working directory)

     deleted: README1.md

     deleted: README2.md

Output after creating branch sensei:

[root@ip-172-31-16-86 git]# git branch -a

  **master**

**  ninja**

**\* sensei**

Output after delete:

[root@ip-172-31-16-86 git]# git branch

  master

\* ninja

[root@ip-172-31-16-86 git]# git log

commit 5510c02cc5187d0858d8dc7f4385b49b25a009f0 (HEAD -\&gt; ninja, master)

Author: abhishek.sachan \&lt;abhishek.sachan@mygurukulam.org\&gt;

Date:   Tue Jun 18 05:55:48 2019 +0000

 First commit
