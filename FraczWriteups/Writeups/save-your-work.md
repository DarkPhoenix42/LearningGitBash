We first save our work and reset the working directory to the previous commit by doing 

```
> git stash
```

We then fix the bug in bug.txt and add it to the staging area and commit it.

```
> git add equation.txt
> git commit -s -S -m "Fixed bug.txt"
```

We then resume our work using 

```
> git stash pop
```

and finish our work, add it to the staging area and commit it.


```
> git add .
> git commit -s -S -m "Finished work"

```

We then run `git verify` to conclude that we have passed this level and go to the next level.
