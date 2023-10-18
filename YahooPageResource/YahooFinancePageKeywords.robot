*** Settings ***
Library     SeleniumLibrary
Variables    ../PageLocators/YahooFinancePageLocators.py
Resource    ../Testcases/YahooFinanceTest.robot

*** Variables ***
${URL}            https://finance.yahoo.com/
${browser}        chrome


*** Keywords ***
Open Yahoo Finance
    [Arguments]    ${URL}   ${browser}
    Open Browser    ${URL}   ${browser}
    maximize browser window

Click Sign In Link
    Click Link      ${link_signIn}

Click Create an Account Link
    Click Link    ${btn_createacc}

Fill Registration Form
    [Arguments]  ${FIRST_NAME}  ${LAST_NAME}   ${EMAIL}  ${PASSWORD}  ${DOB_MON}   ${DOB_DA}  ${DOB_YR}
    Input Text  ${txt_firstName}    ${FIRST_NAME}
    Input Text  ${txt_lastName}     ${LAST_NAME}
    Input Text  ${txt_emailuserId}  ${EMAIL}
    Input Text  ${txt_password}     ${PASSWORD}
    select from list by label    ${dob_month}     ${DOB_MON}
    Input Text    ${dob_day}    ${DOB_DA}
    Input Text    ${dob_year}   ${DOB_YR}

Submit Registration Form
    click button    ${btn_continue}

Mobile Verification
    [Arguments]  ${MOBILE_NUM}
    Input Text  ${txt_mobilenumber}  ${MOBILE_NUM}
    click button    ${btn_sendcode}


Yahoo Finance Page Signup
    Open Yahoo Finance  ${URL}   ${browser}
    wait until element is visible   ${link_signIn}
    Click Sign In Link
    wait until element is visible    ${btn_createacc}
    Click Create an Account Link
    wait until page contains element    ${dob_month}
    Fill Registration Form  ${FIRST_NAME}   ${LAST_NAME}  ${EMAIL}  ${PASSWORD}  ${DOB_MON}   ${DOB_DA}  ${DOB_YR}
    sleep    5s
    Submit Registration Form
    sleep    5s
    Mobile Verification     ${MOBILE_NUM}







