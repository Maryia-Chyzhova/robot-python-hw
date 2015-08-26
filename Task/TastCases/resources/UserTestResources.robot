*** Settings ***
Library           Selenium2Library
Resource          ../../globalConfig/Common.robot
Resource          ../../Services/API/UserServiceAPI.robot

*** Variables ***
${accountId}    0
${enabled}      true
${accountAdmin}       true
${liteUser}     false
${engageUser}     false
${company}     Clarabridge
${jobTitle}        QAEngineer
${phone}       911
${address1}      address
${address2}       address2
${country}      US
${zip}      24
${collaborateLogin}     hfygjgjh
${autoRefreshEnabled}        true
${autoRefreshInterval}      15

*** Keywords ***
TC1 Setup
    Set Environment for Testing
    Create valid user       \    \    \   \    ${accountId}   \   ${enabled}       ${accountAdmin}     ${liteUser}     ${engageUser}      ${company}
    ...                ${jobTitle}       ${phone}      ${address1}       ${address2}      ${country}      \      ${zip}        ${collaborateLogin}        ${autoRefreshEnabled}   ${autoRefreshInterval}

TC1 Teardown
    Close browser
    Delete User API
    Should be equal     ${deleteUserStatus}       Accepted

TC2 Setup
    TC1 Setup
    Delete User API
    Should be equal     ${deleteUserStatus}       Accepted

TC2 Teardown
    Close browser

