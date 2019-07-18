####STASH
git add/ git commit/ git diff/ git stash/ .gitignore
git stash temporarily shelves (or stashes) changes you've made to your working copy so you can work on something else,
and then come back and re-apply them later on.
Stashing is handy if you need to quickly switch context and work on something else,
but you're mid-way through a code change and aren't quite ready to commit.
#git stash
Saved working directory and index state WIP on master: 5002d47 our new homepage
HEAD is now at 5xxxxx7 our new homepage
#git status
On branch master
nothing to commit, working tree clean
t this point you're free to make changes, create new commits, switch branches, and perform any other Git operations; then come back and re-apply your stash
when you're ready.
#git status
On branch master
nothing to commit, working tree clean
$ git stash pop
On branch master
Changes to be committed:
new file: style.css
Changes not staged for commit:
modified: index.html
Dropped refs/stash@{0} (32b3aa1d185dfe6d57b3c3cc3b32cbf3e380cc6a)
Popping your stash removes the changes from your stash and reapplies them to your working copy.
Alternatively, you can reapply the changes to your working copy and keep them in your stash with git stash apply:
#git stash apply
On branch master
Changes to be committed:
new file: style.css
Changes not staged for commit:
modified: index.html
This is useful if you want to apply the same stashed changes to multiple branches.
Now that you know the basics of stashing, there is one caveat with git stash you need to be aware of: by default Git won't stash changes made to untracked or ignored files.
#By default, running git stash will stash:
-changes that have been added to your index (staged changes)
-changes made to files that are currently tracked by Git (unstaged changes)
#But it will not stash:
-new files in your working copy that have not yet been staged
-files that have been ignored

Solution:
Adding the -u option (or --include-untracked) tells git stash to also stash your untracked files:
#git stash -u
===================================================================================
####Reset
git checkout/ git clean/ git revert/ git reset/ git rm
The git reset command is a complex and versatile tool for undoing changes. It has three primary forms of invocation. These forms correspond to command line arguments 
--soft, 
--mixed, 
--hard. 
The three arguments each correspond to Git's three internal state management mechanism's,
 The Commit Tree (HEAD), The Staging Index, and The Working Directory.
