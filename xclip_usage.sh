./ls_dirs_name.sh app_commercial | awk '{print "include_directories("$0")" }' | xclip
xclip -o > ./include_dir_lists.txt