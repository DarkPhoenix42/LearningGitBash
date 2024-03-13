The goal of this level make `chase-branch` to point to the same commit as the `escaped` branch.
So, we need to merge chase-branch with escaped, hence we use the command

> git merge escaped

After doing this, we run `git verify` to verify that we have passed this level and move on to the next one.