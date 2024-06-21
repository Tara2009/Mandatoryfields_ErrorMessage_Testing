# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Library                QWeb
Library                String
Resource               ../Resources/AppConnectRes.robot
Suite Setup            Setup Browser
Suite Teardown         End suite

*** Test Cases ***
InLine Error Message OnExist of field
    [Tags]             InLineErrmsgOnExit
    [Documentation]    Testing InLine Error message for all Mandatory fields, before Click save button. Identify the mandatory fields are empty.
    Appstate           Home
    LaunchApp          Sales
    ClickText          Accounts
    ClickUntil         New Account                 New
    UseModal           On
    TypeText           Phone                       +7207207178
    TypeText           Website                     www.tvsh.com
    ClickText          Name
    #ClickText          Save                        partial_match=False
    ${NameInlineErrMSG}=     IsElement             //div[@class\='slds-form-element__help']
    Log                      ${NameInlineErrMSG}
    Run Keyword If           '${NameInlineErrMSG}'=='True'    Failed Error Message
    ...                      ELSE                        Success mandatory field message
    UseModal                 Off

*** Keywords ***
Failed Error Message
    Log    Mandatory field is empty
    ${InLineERR}=    GetText    //div[@class\='slds-form-element__help']
    Log              ${InLineERR}
Success mandatory field message
    Log    Mandatory field have value