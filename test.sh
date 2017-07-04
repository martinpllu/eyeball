echo "Expecting init..."
./eyeball "echo One\nTwo\Three" count
echo "Expecting no diffs..."
./eyeball "echo One\nTwo\Three" count
echo "Expecting missing line..."
./eyeball "echo One\nTwo" count
echo "Expecting extra line..."
./eyeball "echo One\nTwo\Three\Four" count
echo "Expecting changed letter..."
./eyeball "echo One\nToo\Three" count
rm count.expected
rm count.actual