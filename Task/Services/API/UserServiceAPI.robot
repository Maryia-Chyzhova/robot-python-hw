*** Settings ***
Library           Libs
Resource          ../../globalConfig/Common.robot

*** Keywords ***
Create valid user
    [Arguments]        ${login}=    ${password}=    ${firstName}=   ${lastName}=    ${accountId}=   ${email}=   ${enabled}=    ${accountAdmin}=
    ...                ${liteUser}=     ${engageUser}=     ${company}=        ${jobTitle}=       ${phone}=      ${address1}=       ${address2}=
    ...                ${country}=      ${state}=      ${zip}=        ${collaborateLogin}=      ${autoRefreshEnabled}=      ${autoRefreshInterval}=
    ${user}=    Create User Object   ${login}    ${password}    ${firstName}   ${lastName}    ${accountId}   ${email}   ${enabled}    ${accountAdmin}
    ...                ${liteUser}     ${engageUser}     ${company}        ${jobTitle}       ${phone}      ${address1}       ${address2}
    ...                ${country}      ${state}      ${zip}        ${collaborateLogin}      ${autoRefreshEnabled}       ${autoRefreshInterval}
    ${id}=      Create User     ${HOST}     ${PORT}  ${ADMIN_USER}    ${ADMIN_PASSWORD}       ${user}
    ${user.userId}=   Set Variable     ${id}
    Set Suite Variable  ${user}
    [Return]    ${user}

Delete User API
    [Arguments]    ${login}=    ${password}=    ${userId}=
    ${login} =    Set Variable If    '${login}' == ''    ${ADMIN_USER}    ${login}
    ${password} =    Set Variable If    '${password}' == ''    ${ADMIN_PASSWORD}    ${password}
    ${userId}=    Set Variable If    '${userId}' == ''    ${user.userId}    ${userId}
    ${deleteUserStatus} =    Delete User    ${HOST}    ${PORT}    ${login}    ${password}    ${userId}
    Set Suite Variable    ${deleteUserStatus}
    [Return]    ${deleteUserStatus}
