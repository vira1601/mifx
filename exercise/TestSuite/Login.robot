*** Settings ***
Library         Selenium2Library
Resource           ../Keywords/login.robot

Test Teardown        Custom Teardown

*** Test Cases ***

# Positive Case
User login in mifx website using registered account
    Given User open MIFX login page
    When User input email using registered email account
    And User input correct password
    And User click Login button
    Then User validate success login

User login in MIFX website using incorrect email
    Given User open MIFX login page
    When User input email using incorrect email
    And User input correct password
    And User click Login button
    Then User will see warning message Akun atau kata sandi salah

User login without input email Fields    
    Given User open MIFX login page
    When user input correct password
    And User click login button
    Then User will see warning message Please Fill All Fields
