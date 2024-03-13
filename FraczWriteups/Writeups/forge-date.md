We need to change the date of the last commit. We modify the previous commit by making a new commit which amends the previous commit and while doing so, we set the date to 1987 using `--date` flag. Overall, we run the command

> git commit --amend -s -S -m "Finished work very early" --date="Wed Mar 13 15:27:08 1987 +0530"

We verify that we have passed and go the next level.