*** Variables ***
${TEST_ENVIRONMENT}    Local    # Set one of available test enviroments: bb28, qa10, qa11
${WEB_BROWSER}    firefox
${DB_TIMEOUT}     900
${DB_RETRY_INTERVAL}    1
${API_TIMEOUT}    900
@{CALENDARS}      Standard Calendar    European Calendar    NRF Calendar
@{LANGUAGES}      auto    @u    nl    en    fr    de    it
...               pt    ru    es
${DEFAULT_SUBMIT_DATA_HEADER_PATH}    ${EMPTY}
${DEFAULT_SUBMIT_DATA_PATH}    ${EMPTY}
${GLOBAL_RETRY_INTERVAL}    1
${SELENIUM_SPEED}    0.2
${IMPLICIT_WAIT}    15
${SELENIUM_DEFAULT_TIMEOUT}    30
${STALE_ELEMENT_REFERENCE_EXCEPTION_ACTION_IN_FOR_LOOP_TRIES_COUNT}    2
${CPS_HOST}       10.9.210.168
${CPS_PORT}       80

*** Keywords ***
Set Environment for Testing
    [Arguments]    ${environmentName}=${TEST_ENVIRONMENT}
    [Documentation]    Add this keyword to each test suite setup.
    ...
    ...    It imports relevant resourse and sets the parameters of a test environment selected in globalConfig/Common.robot/${TEST_ENVIRONMENT} as suite variables.
    ...
    ...    By default {environmentName} = globalConfig/Common.robot/${TEST_ENVIRONMENT}.
    ...
    ...    Available test environments are: bb28, qa10, qa11
    ...
    ...    When a test suite requires any special test environment, different from specified in globalConfig/Common.robot/${TEST_ENVIRONMENT}, set it as an argument:
    ...    [Suite Setup] Set Environment | BB1
    ...
    ...    CAUTION: Make sure that environmentName.robot exists in globalConfig folder.
    ...
    ...    Do not hesitate to add configs in case they not exist yet.
    Import Resource    ${CURDIR}/${environmentName}.robot
    Set Suite Variable    ${PROTOCOL}
    Set Suite Variable    ${HOST}
    Set Suite Variable    ${PORT}
    Set Suite Variable    ${CMP_LOGIN_URL}
    Set Suite Variable    ${ADMIN_USER}
    Set Suite Variable    ${ADMIN_PASSWORD}
    Run Keyword If    '${DB_TYPE}'=='postgre'    Set Suite Variable    ${DB_API_MODULE_NAME}    psycopg2
    Run Keyword If    '${DB_TYPE}'=='oracle'    Set Suite Variable    ${DB_API_MODULE_NAME}    cx_Oracle
    Set Suite Variable    ${DB_CONNECT_STRING}
    Set Suite Variable    ${SYSTEM_SCHEMA}
