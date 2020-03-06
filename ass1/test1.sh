# Checking subset0
./legit-init
./legit-commit -m nothing
./legit-commit -m nothing agin
echo hello > a
./legit-add a
./legit-commit -m a
./legit-log
./legit-show 0:a #should be error
./legit-show 1:a
./legit-show 2:a #should be error
./legit-show :a
