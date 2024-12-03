echo "Enter array elements separated by spaces:"
read -a array

sum=0
for num in "${array[@]}"; do
  sum=$((sum + num))
done

echo "The sum of the array elements is: $sum"
