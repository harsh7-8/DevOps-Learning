# 1> Redirect stdout to a file (overwrite)
echo "This is a test message" 1> /tmp/output.txt
echo "This is second test message" 1> /tmp/output.txt

# 1>> Redirect stdout to a file (Append)
echo "This is a test message" 1>/tmp/output1.txt
echo "This is second test message" 1>> /tmp/output1.txt