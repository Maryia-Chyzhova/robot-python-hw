*** Settings ***
Library           Selenium2Library
Resource          ../../GlobalConfig/Common.robot

*** Variables ***
${USERNAME_TEXTBOX_LOCATOR}    j_username
${PASSWORD_TEXTBOX_LOCATOR}    j_password
${LOGIN_BUTTON_LOCATOR}    //button[@type='submit']
${ERROR_MESSAGE_LOCATOR}    //font[@color='red']
${LOGO}     //a[@class='logoLink']/img

*** Keywords ***
Open Login Page
    [Arguments]    ${loginUrl}    ${browser}
    Set Selenium Speed    ${SELENIUM_SPEED}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Set Selenium Timeout    ${SELENIUM_DEFAULT_TIMEOUT}
    Open Browser    ${loginUrl}    ${browser}
    Maximize Browser Window
    Page Should Contain Button    ${LOGIN_BUTTON_LOCATOR}

Login
    [Arguments]    ${login}    ${password}
    Input Text    ${USERNAME_TEXTBOX_LOCATOR}    ${login}
    Input Password    ${PASSWORD_TEXTBOX_LOCATOR}    ${password}
    Click Button    ${LOGIN_BUTTON_LOCATOR}

Get Error message on login UI
    ${status}=   Run Keyword And Return Status    Element Should Be Visible   ${ERROR_MESSAGE_LOCATOR}
    ${error}=   Run Keyword If  '${status}'=='True'     Get Text    ${ERROR_MESSAGE_LOCATOR}    ELSE    Set variable    No error
    Set Suite Variable      ${error}
    [Return]  ${error}

Verify the error
    [Arguments]    ${TEXTERROR}
    Should Be Equal     ${error}        ${TEXTERROR}

Login UI
    [Arguments]    ${loginUrl}=    ${browser}=    ${login}=    ${password}=
    ${loginUrl}    Set Variable If    "${loginUrl}"==""    ${CMP_LOGIN_URL}    ${loginUrl}
    ${browser}    Set Variable If    "${browser}"==""    ${WEB_BROWSER}    ${browser}
    ${isUserExists}    Run Keyword And Return Status    Variable Should Exist    ${user}
    ${defLogin}    Set Variable If    ${isUserExists}    ${user.login}    ${ADMIN_USER}
    ${login}    Set Variable If    "${login}"==""    ${defLogin}    ${login}
    ${defPassword}    Set Variable If    ${isUserExists}    ${user.password}    ${ADMIN_PASSWORD}
    ${password}    Set Variable If    "${password}"==""    ${defPassword}    ${password}
    Open Login Page    ${loginUrl}    ${browser}
    Login    ${login}    ${password}

Verify that user logged in
    Page Should Contain Element     ${LOGO}