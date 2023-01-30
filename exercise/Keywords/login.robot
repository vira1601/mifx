*** Settings ***
Library         Selenium2Library
Resource        ../Element/login.robot

*** Keywords ***
User open MIFX login page
    Open Browser                             ${url}        ${browser}
    Maximize Browser Window

User input email using registered email account
    Wait Until Element Is Visible            ${email}
    Input Text                               ${email}    virahidayat16@gmail.com

user input correct password
    Wait Until Element Is Visible             ${password}
    Input Password                            ${password}    Virahidayat16

User click login button
    Wait Until Element Is Visible             ${login_btn}
    Click Element                             ${login_btn}    

User validate success login    
    Wait Until Element Is Visible             ${account_demo}
    Element Should Contain                    ${account_demo}    Vira

User input email using incorrect email
    Wait Until Element Is Visible             ${email}
    Input Text                                ${email}    virahidyat16@gmail.com


User will see warning message Akun atau kata sandi salah
    Wait Until Element Is Visible             ${warning_msg}   
    Element Should Contain                    ${warning_msg}    Akun atau kata sandi salah     

User will see warning message Please Fill All Fields
    Wait Until Element Is Visible             ${warn_leave_blank}   
    Element Should Contain                    ${warn_leave_blank}    Format email yang Anda masukkan salah 

Custom Teardown
    Run Keyword If Test Failed   Log   Test failed
    Run Keyword If Test Passed   Log   Test passed