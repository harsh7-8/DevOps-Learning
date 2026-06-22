dnf install -y golang
go version

#No spaces on either side of = while delaring variables in bash
AUTH_SERVICE=auth-service

useradd -r -s /bin/false appuser
mkdir -p /app

cp ${AUTH_SERVICE}.service /etc/systemd/system/${AUTH_SERVICE}.service

curl -L -o /tmp/${AUTH_SERVICE}.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/${AUTH_SERVICE}.tar.gz
cd /app
tar xzf /tmp/${AUTH_SERVICE}.tar.gz

cd /app
CGO_ENABLED=0 go build -o ${AUTH_SERVICE} ./cmd/server

chown -R appuser:appuser /app
chmod o-rwx /app -R

systemctl daemon-reload
systemctl enable ${AUTH_SERVICE}
systemctl start ${AUTH_SERVICE}