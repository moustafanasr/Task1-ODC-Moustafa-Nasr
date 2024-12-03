echo "Enter the file path:"
read file

if [ -f "$file" ]; then
  sort "$file" | uniq > temp.txt && mv temp.txt "$file"
  echo "Duplicate lines removed."
else
  echo "File does not exist."
fi
