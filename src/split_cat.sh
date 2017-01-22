dwright@dwright-ubuntu:~/Documents/LPICCards$ split -b 10k LPICCards.pdf LPICCards_
dwright@dwright-ubuntu:~/Documents/LPICCards$ ls -lha
...
-rw-rw-r-- 1 dwright dwright  10K Jan 22 14:37 LPICCards_aa
-rw-rw-r-- 1 dwright dwright  10K Jan 22 14:37 LPICCards_ab
-rw-rw-r-- 1 dwright dwright  10K Jan 22 14:37 LPICCards_ac
-rw-rw-r-- 1 dwright dwright  10K Jan 22 14:37 LPICCards_ad
...
dwright@dwright-ubuntu:~/Documents/LPICCards$ cat LPICCards_a* > LPICCards_cat.pdf

