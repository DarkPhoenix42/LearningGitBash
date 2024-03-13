When we do `git status` we see that two file `A.txt` and `B.txt` have been added to the staging area. 
To commit only one of them, we remove `B.txt` from the staging are by doing 

> git rm --cached B.txt

and then we commit by doing 

> commit -s -S -m "Commiting only A.txt"

and then we run `git verify` to verify that we have passed this level.