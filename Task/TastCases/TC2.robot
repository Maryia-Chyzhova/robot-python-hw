*** Settings ***
Documentation     The test case intends to verify that deleted user cannot login
Suite Setup       TC2 Setup
Suite Teardown    TC2 Teardown
Resource          ../services/UI/UIUserLib.robot
Resource          resources/UserTestResources.robot

*** Variables ***
${TEXTERROR}        Incorrect login or password.

*** Test Cases ***
TC2 - deleted user cannot login
    Login UI
    Get Error message on login UI
    Verify the error        ${TEXTERROR}