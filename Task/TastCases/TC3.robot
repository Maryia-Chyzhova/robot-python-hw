*** Settings ***
Documentation     The test case intends to verify that user gets proper error if incorrect login or password is entered
Suite Setup       TC1 Setup
Suite Teardown    TC2 Teardown
Resource          ../services/UI/UIUserLib.robot
Resource          resources/UserTestResources.robot

*** Variables ***
${TEXTERROR}        Incorrect login or password.
${WRONGLOGIN}       wronglogin
${WRONGPASSWORD}        wrongPassword1

*** Test Cases ***
TC3 - user gets proper error if incorrect login is entered
    Login UI    \   \   ${WRONGLOGIN}
    Get Error message on login UI
    Verify the error        ${TEXTERROR}

TC3 - user gets proper error if incorrect password is entered
    Login UI    \   \   \   ${WRONGPASSWORD}
    Get Error message on login UI
    Verify the error        ${TEXTERROR}