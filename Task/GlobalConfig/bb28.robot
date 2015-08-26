*** Variables ***
${PROTOCOL}       http://
${HOST}           blackbox28.clarabridge.net
${PORT}           80
${CMP_LOGIN_URL}    ${PROTOCOL}${HOST}:${PORT}/cmp/login
${ADMIN_USER}     admin
${ADMIN_PASSWORD}    admin
${DB_TYPE}        postgre
${DB_CONNECT_STRING}    database='postgres', user='postgres', password='Clarabr1dge', host='10.80.253.162', port=5432
${SYSTEM_SCHEMA}    cbss_6106
