set -x
ls /tmp/ >/tmp/output.txt
echo "The exit status of this command : $?"

ls /tmp2/ 2>/tmp/error.txt
echo "The exist status of command: $?"