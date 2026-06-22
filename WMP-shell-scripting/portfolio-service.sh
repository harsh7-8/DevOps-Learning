source common.sh

dnf install -y java-21-openjdk-devel
PORTFOLIO_SERVICE=portfolio-service

cp ${PORTFOLIO_SERVICE}.service /etc/systemd/system/${PORTFOLIO_SERVICE}.service

app_prereq

cd /app
chmod +x gradlew
./gradlew bootJar --no-daemon -x test

cp /app/build/libs/*.jar /app/${PORTFOLIO_SERVICE}.jar
chown -R appuser:appuser /app
chmod o-rwx /app -R

systemctl daemon-reload
systemctl enable ${PORTFOLIO_SERVICE}
systemctl start ${PORTFOLIO_SERVICE}