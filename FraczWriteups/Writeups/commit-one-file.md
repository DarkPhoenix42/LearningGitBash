First, we do `git status` and see that two file `A.txt` and `B.txt` are new but none of them have been staged.

Since, we only need to commit one file, we only add one file to the staging area by doing 

```
git add A.txt
```

and then we commit by doing

```
git commit -s -S -m "Commiting only A.txt"
```

and then we do `git verify` to verify that we have solved this level and move on to the next one.