app_prereq() {
    id appuser &>/dev/null
    if [ $? -ne 0 ]; then
        useradd -r -s /bin/false appuser
    fi

    mkdir -p /app
    curl -L -o /tmp/${PORTFOLIO_SERVICE}.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/${PORTFOLIO_SERVICE}.tar.gz
    cd /app
    tar xzf /tmp/${PORTFOLIO_SERVICE}.tar.gz
}

RC="\e[31m"
GC="\e[32m"
YC="\e[33m"
NC="\e[0m"
OUTPUT=/tmp/wmp.log
rm -f $OUTPUT


status_check() {
    if [ $? -eq 0 ]; then
        echo -e "${GC}Success${NC}"
    else
        echo -e "${RC}Failure${NC}"
    fi

}
