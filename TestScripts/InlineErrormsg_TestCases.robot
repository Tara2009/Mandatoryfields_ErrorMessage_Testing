# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Library                QWeb
Library                String
Resource               ../Resources/AppConnectRes.robot
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Variables ***
${comval}=             48,910.10

*** Test Cases ***
Account Creation
    [Tags]             Account
    Appstate           Home
    LaunchApp          Sales
    ClickText          Accounts
    ClickUntil         New Account                 New
    UseModal           On
    TypeText           Phone                       +7207207174
    TypeText           Name                        tara siri Insurance45
    TypeText           Website                     www.tvsh.com
    VerifyText         Additional Information
    PickList           Type                        Prospect
    TypeText           Employees                   88
    PickList           Industry                    Apparel
    TypeText           Annual Revenue              84000000
    TypeText           Description                 New need to do hardwork to improve the business
    TypeText           Billing Street              My New House Hanumannagar 4th line
    TypeText           Billing City                guntur
    TypeText           Billing State/Province      ap
    TypeText           Billing Zip/Postal Code     522006
    TypeText           Billing Country             india
    TypeText           Shipping Street             My New House hanumannagar 4th line
    TypeText           Shipping City               guntur
    TypeText           Shipping State/Province     ap
    TypeText           Shipping Zip/Postal Code    52206
    TypeText           Shipping Country            india
    ClickText          Save                        partial_match=False
    UseModal           Off

    ClickText          Details
    VerifyText         tara siri Insurance45
    VerifyText         +7207207174
    VerifyText         www.tvsh.com

    # End Account creation test case


Edit an Account
    [Tags]             EdAcct
    [Documentation]    Edit annual income field by storing the value in variable then add an amount to that existing amount.
    Appstate           Home
    LaunchApp          Sales
    ClickText          Accounts
    ClickText          Select a List View: Accounts
    ClickText          All Accounts
    TypeText           Search this list...         tara siri Insurance45\n
    ClickText          tara siri Insurance45
    ClickText          Details
    ClickText          Edit Annual Revenue
    ${totalamt}=       GetInputValue               Annual Revenue
    ${conint}=         Convert To Number           ${totalamt}
    Log To Console     ${totalamt}
    Log                ${totalamt}
    Log                ${conint}
    ${contotamt}       Evaluate                    ${conint}+10000
    #${te1}            Remove String Using Regexp                              ${37,960.00}    ,
    Log                ${comval}
    ${te2}             Remove String               ${comval}                   ,     
    ${removecomm}      Evaluate                    ${te2}+10000
    #Log               ${te1}
    Log                ${te2}
    Log                ${removecomm}
    Log To Console     ${contotamt}
    Log                ${contotamt}
    TypeText           Annual Revenue              ${contotamt}
    ClickText          Save                        anchor=Account Owner
    ClickText          Accounts
    Sleep              2s
    #${AnnulaAmt}=     GetInputValue               Annual Revenue
    #Log               ${AnnulaAmt}
    #${conannamt}=     Set Variable                ${AnnulaAmt}
    #${addingamt}=     Set Variable                ${10000}
    #${AfterSum}=      Set Variable                ${conannamt}+${addingamt}
    #${AnnulaAmt1}=    Convert To Number           ${AnnulaAmt}
    #Log               ${AnnulaAmt1}
    #${conannuamt}     Convert To Number           ${AnnulaAmt}+100
    #${AfterSum}=      Evaluate                    ${conannamt}+${addingamt}
    #${Afterminus}=    Evaluate                    ${conannamt}-${addingamt}
    #${Afterminus}=    Set Variable                ${conannamt}-${addingamt}
    #Log To Console    ${AfterSum}
    #log               ${AfterSum}
    # Log              ${Afterminus}
Open Existing Record
    [Tags]             OpenRcd
    [Documentation]    Open a record by clicking the record in the grid
    Appstate           Home
    LaunchApp          Sales
    ClickText          Accounts
    ClickText          Select a List View: Accounts
    ClickText          All Accounts
    UseTable           Account Name
    ClickCell          r4/c?Account Name           tag=a
    Sleep              10s