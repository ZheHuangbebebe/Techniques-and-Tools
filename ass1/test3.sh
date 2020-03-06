#Checking subset2
./legit-init
echo hello > a
./legit-commit -a -m first
./legit-branch
./legit-branch b1
./legit-branch -d b1
./legit-branch b1
./legit-branch
./legit-checkout b1
./legit-branch -d b1
./legit-checkout master #should be error
./legit-checkout b1 #should be error
