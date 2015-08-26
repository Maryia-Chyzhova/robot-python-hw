*** Settings ***
Documentation     The test case intends to verify that new created user is able to login
Suite Setup       TC1 Setup
Suite Teardown    TC1 Teardown
Resource          ../services/UI/UIUserLib.robot
Resource          resources/UserTestResources.robot

*** Test Cases ***
TC1 - new created user is able to login
    Login UI
    Verify that user logged in