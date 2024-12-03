
echo "Enter the file path:"
read file
echo "Enter the word to search:"
read word

if [ -f "$file" ]; then
  count=$(grep -o -w "$word" "$file" | wc -l)
  echo "The word '$word' appears $count times in the file '$file'."
else
  echo "File does not exist."
fi
