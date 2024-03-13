We need to change the previous commit. So, for this we use the `--amend` flag while commiting.
We first modify the file.txt and fix our typo. We add file.txt to the staging area using `git add file.txt` and commit it as follows

> git commit --amend -s -S -m "Add Hello world"

After verifying, we see that we have passed this level.