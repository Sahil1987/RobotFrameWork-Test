*** Settings ***
Resource    ../YahooPageResource/YahooFinancePageKeywords.robot

*** Variables ***
#Registration Form Values

${FIRST_NAME}   TAN
${LAST_NAME}    ZAN
${EMAIL}        ten_2337
${PASSWORD}     Querty#678
${DOB_MON}      January
${DOB_DA}       21
${DOB_YR}       1989
${MOBILE_NUM}   9898989898

*** Test Cases ***
Create Yahoo Finance Account
    Yahoo Finance Page Signup


