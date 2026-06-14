dnf install -y python3.12 python3.12-pip python3.12-devel gcc

ANALYTICS_SERVICE=analytics-service
useradd -r -s /bin/false appuser
mkdir -p /app

cp ${ANALYTICS_SERVICE}.service /etc/systemd/system/${ANALYTICS_SERVICE}.service

curl -L -o /tmp/${ANALYTICS_SERVICE}.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/${ANALYTICS_SERVICE}.tar.gz
cd /app
tar xzf /tmp/${ANALYTICS_SERVICE}.tar.gz

cd /app
pip3.12 install --no-cache-dir .
chown -R appuser:appuser /app
chmod o-rwx /app -R

systemctl daemon-reload
systemctl enable ${ANALYTICS_SERVICE}
systemctl start ${ANALYTICS_SERVICE}