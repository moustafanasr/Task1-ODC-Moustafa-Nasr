echo "Enter the directory path:"
read dir

if [ -d "$dir" ]; then
  for file in "$dir"/*; do
    mv "$file" "${file,,}"
  done
  echo "All filenames converted to lowercase."
else
  echo "Directory does not exist."
fi
