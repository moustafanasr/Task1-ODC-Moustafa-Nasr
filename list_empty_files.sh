echo "Enter the directory path:"
read dir

if [ -d "$dir" ]; then
  find "$dir" -type f -empty
else
  echo "Directory does not exist."
fi
