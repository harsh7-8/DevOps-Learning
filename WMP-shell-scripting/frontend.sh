source common.sh

echo -e "${YC}Installing frontend dependencies...${NC}"
dnf module disable nginx -y &>>$OUTPUT
dnf module enable nginx:1.26 -y &>>$OUTPUT
dnf install -y nginx &>>$OUTPUT
status_check

echo -e "${YC}Update nginx configurations...${NC}"
cp nginx.conf /etc/nginx/nginx.conf &>>$OUTPUT
status_check

echo -e "${YC}Installing NodeJS...${NC}"
curl -fsSL https://rpm.nodesource.com/setup_22.x | bash - &>>$OUTPUT
dnf install -y nodejs &>>$OUTPUT &>>$OUTPUT
status_check

echo -e "${YC}Checking NodeJS and npm versions...${NC}"
node --version &>>$OUTPUT
npm --version &>>$OUTPUT
status_check

echo -e "${YC}Downloading frontend artifacts...${NC}"
curl -L -o /tmp/frontend.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/frontend.tar.gz &>>$OUTPUT
mkdir -p /tmp/frontend &>>$OUTPUT
cd /tmp
tar xzf /tmp/frontend.tar.gz &>>$OUTPUT
status_check

echo -e "${YC}Deploying frontend application...${NC}"
cd /tmp/frontend
npm ci &>>$OUTPUT
npm run build &>>$OUTPUT
status_check

echo -e "${YC}Copying frontend build to nginx html directory...${NC}"
rm -rf /usr/share/nginx/html/* &>>$OUTPUT
cp -r /tmp/dist/* /usr/share/nginx/html/ &>>$OUTPUT
status_check

echo -e "${YC}Starting nginx service...${NC}"
systemctl enable nginx &>>$OUTPUT
systemctl restart nginx &>>$OUTPUT
status_check