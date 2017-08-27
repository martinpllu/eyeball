export EYEBALL_DIFF=diff
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
echo "Running eyeball-update"
./eyeball --update count
echo "Expecting pass"
./eyeball "echo One\nToo\Three" count
rm count
unset EYEBALL_DIFF