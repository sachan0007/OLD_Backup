**Assignment 4**

[https://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/](https://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/)

**Create a GitLab account if it doesn&#39;t exists already.**

**Create a repo GitCommand in your GitLab account .**

**Delete repo \*GitCommand&quot;**

git clone [git@gitlab.com](mailto:git@gitlab.com):sachan007/gitcommand.git

mkdir GitCommand

cd GitCommand

Gir init

touch README.md

git status

git add README.md

git status

git commit -m &quot;add README&quot;

git push -u origin master

When you run git clone \&lt;repo\_url\&gt; to clone a repository, the default remote origin is created automatically. If the repository is created by git init, there is no default remote, no origin. You need to set it up by yourself.

git remote add origin git@gitlab.com:sachan007/gitcommand.git

Because the project is in your own namespace, you will need to create a new group to fork it into.

**Fork https://github.com/joshnh/Git-Commands in your GitLab account with the name GitCommand**

[**https://docs.gitlab.com/ee/user/project/import/github.html**](https://docs.gitlab.com/ee/user/project/import/github.html)

1. From the top navigation bar, click + and select New project.
2. Select the Import project tab and then select GitHub.
3. Select the first button to List your GitHub repositories. You are redirected to a page on github.com to authorize the GitLab application.
4. Click Authorize gitlabhq. You are redirected back to GitLab&#39;s Import page and all of your GitHub repositories are listed.
5. Continue on to [selecting which repositories to import](https://docs.gitlab.com/ee/user/project/import/github.html#selecting-which-repositories-to-import).

**Clone GitCommand repo using http protocol**

**Delete the cloned code**

**Clone GitCommand repo using git protocol at ~/ninja**

**Create a folder ninja**

**Create a file README.md in ninja folder**

**Make your changes available to GitCommand remote repo**



git clone https://gitlab.com/sachan007/GitCommand.git

rm -rf GitCommand

mkdir ninja

Git init

git clone [git@gitlab.com](mailto:git@gitlab.com):sachan007/GitCommand.git

Cd GitCommand

mkdir ninja

cd ninja

touch README.md

git add README.md

git commit -m &quot;ninja/README.md commit&quot;

git status

git pull

git push origin master

========================================================================

**Assignment 5**

**Create a folder ninja at the root level of your cloned code**

**Add a file README.md with content &quot;Trying fast forward merge&quot;**

**Create a branch ninja and move to it**

**Run git status command**

**Commit your changes to ninja branch**

**Merge ninja branch to master branch, make sure that a new commit get&#39;s created**

**Assuming you are in master branch, modify README.md with content Changes in master branch, commit the changes in master branch.**

**Switch to ninja branch, modify README.md with content Changes in ninja branch, commit the changes in ninja branch.**



mkdir ninja

cd ninja

echo &quot;Trying fast forward merge&quot; \&gt;\&gt; README.md

git checkout -b ninja

Git status

Output:

[root@ip-172-31-16-86 ninja]# git branch

  master

\* ninja

git add -A

git commit -m &quot;ninja branch commit&quot;

Git checkout master

git merge --no-ff ninja (give message when ask)

git log

Output:

commit ac55debb521018473031a6a8389c1647127cefdb (HEAD -\&gt; master)

Merge: d067c6b 7951ecc

Author: abhishek.sachan \&lt;abhishek.sachan@mygurukulam.org\&gt;

Date:   Wed Jun 19 06:40:08 2019 +0000

    Merge branch &#39;ninja to master

nano README.md

Add text &quot;Not Trying forward merge&quot;

Git add README.md

git commit -m &quot;README.md update and commit master&quot;

git checkout ninja

git branch

nano ninja/README.md (Modify it)

git add -A

git commit -m &quot;readme modify in ninja branch&quot; (due to font of &quot; this will not work in terminal if copy pasted)

**Merge master branch to ninja branch in such a fashion that changes of master branch overrides changes in ninja branch**

**Revert the above merge commit**

git merge master

git mergetool

vimdiff

In vimdiff tool

:diffg REM

REM or say name of 3rd window i.e. master&#39;s

Just write the name of that window from which you want as final change.

:wqa (to save and close vimdiff)

git commit -am &quot;commit after conflict&quot;

commit 4ce27a01519d059c6e1eec5d8c18f4ef23589c54 (HEAD -\&gt; ninja)

Merge: 3f86908 7e204c2

Author: abhishek.sachan \&lt;abhishek.sachan@mygurukulam.org\&gt;

Date:   Wed Jun 19 08:32:12 2019 +0000

    commit after conflict

git revert -m 1 4ce27a01519d059c6e1eec5d8c18f4ef23589c54

[root@ip-172-31-16-86 GitCommand]# git revert -m 1 4ce27a01519d059c6e1eec5d8c18f4ef23589c54

[ninja 4a46e0f] Revert &quot;commit after conflict&quot;

 1 file changed, 1 insertion(+), 1 deletion(-)

**Merge master branch to ninja branch in such a fashion that changes of ninja branch overrides changes in master branch**

**Revert the above merge commit**

git merge master

git mergetool

vimdiff

In vimdiff tool

:diffg LOC (select top left pane i.e. of ninja local branch)

:wqa (to save and close vimdiff)

git commit -am &quot;Commit after revert&quot;



commit 578ff3e45fec0680ce271a28a2145bab96195ff4 (HEAD -\&gt; ninja)

Merge: 4c06c93 4988799

Author: abhishek.sachan \&lt;abhishek.sachan@mygurukulam.org\&gt;

Date:   Wed Jun 19 10:56:09 2019 +0000

    Commit after revert



git revert -m 1 4c06c937021f094750a722be21e4a24900860427



**Merge master branch to ninja branch in such a fashion that changes of both branches gets accumulated.**

git merge master

git mergetool

vimdiff

In vimdiff tool

:diffg LOC (Select left pane and also include changes manually in bottom pane to include changes from both master and ninja)

:wqa (to save and close vimdiff)

git commit -am &quot;Commit with changes from master and ninja both&quot;

commit 48cb95cb6214abe4e680fb46c36a2c7b186dc8f4 (HEAD -\&gt; ninja)

Merge: 24df42b 75a5397

Author: abhishek.sachan \&lt;abhishek.sachan@mygurukulam.org\&gt;

Date:   Wed Jun 19 11:54:22 2019 +0000

    Commit with changes from master and ninja both
