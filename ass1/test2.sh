#Checking subset1
./legit-init
./legit-commit -m nothing
echo first line > a
./legit-add a
./legit-rm --cached a
./legit-rm a # should be error
./legit-add a
./legit-commit -m a
./legit-status
