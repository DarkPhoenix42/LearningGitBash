If we rename a file using the mv commmad git thinks that we deleted a file and added another. So, to rename a file so that git understands, we need to use 

```
git mv File.txt file.txt
```

and them commit these changes. Then, we verify this solution and go to the next level.