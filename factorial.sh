factorial() {
  local n=$1
  local result=1
  for ((i = 1; i <= n; i++)); do
    result=$((result * i))
  done
  echo $result
}

echo "Enter a number to calculate its factorial:"
read number
factorial "$number"
