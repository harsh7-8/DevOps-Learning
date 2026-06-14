dnf install -y java-21-openjdk-devel

PORTFOLIO_SERVICE=portfolio-service

useradd -r -s /bin/false appuser
mkdir -p /app

cp ${PORTFOLIO_SERVICE}.service /etc/systemd/system/${PORTFOLIO_SERVICE}.service

curl -L -o /tmp/${PORTFOLIO_SERVICE}.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/${PORTFOLIO_SERVICE}.tar.gz
cd /app
tar xzf /tmp/${PORTFOLIO_SERVICE}.tar.gz

cd /app
chmod +x gradlew
./gradlew bootJar --no-daemon -x test

cp /app/build/libs/*.jar /app/${PORTFOLIO_SERVICE}.jar
chown -R appuser:appuser /app
chmod o-rwx /app -R

systemctl daemon-reload
systemctl enable ${PORTFOLIO_SERVICE}
systemctl start ${PORTFOLIO_SERVICE}