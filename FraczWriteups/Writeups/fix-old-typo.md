The goal of this exercise is to fix the typo in a file made two commits ago.
TO do this we go to the state of our working directory two commits ago by using 

```
git rebase -i HEAD~2
```

When we get the interactive interface, we choose the edit option against the commit in which the typo in the file was introduced. Then, we fix the typo in the file, add it to the staging area and do

```
git rebase --continue
```

at this stage we also need to modify the commit message to fix the typo in it.
We move on to the next commit now. Here we will get merge conflicts, which we need to fix manually with a text editor. After fixing them, we again do `git add file.txt` and `git rebase --continue`. We finally reach the original HEAD with the commit history that we would like.

