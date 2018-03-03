# Delete files recursively (for nested directories), thanks to:
# https://unix.stackexchange.com/questions/116389/recursively-delete-all-files-with-a-given-extension

find . -type f -name '*~' -delete
find . -type f -name '*\#*' -delete
