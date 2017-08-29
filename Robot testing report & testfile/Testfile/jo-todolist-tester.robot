*** Settings ***
Documentation     Jo-todolist testing
Library           OperatingSystem
Library           Selenium2Library

*** Variables ***
#${port}           8080
${port}          4000
${host}           localhost
#######################################################################################################################

*** Test Cases ***
Open_Connection
    [Documentation]    See if we can connect to the url and take a screenshot.
    [Setup]    Open Browser    http://${Host}:${port}    browser=Firefox    alias=guest
    #Start Virtual Display    1920    1080
    Title Should Be    Jo todolist
    Page Should Contain    Jo todolist
    Page Should Contain    What shoud I do?
    Capture Page Screenshot
    [Teardown]    Close Browser

Clear_Todolist
    [Documentation]    Run the reset todolist to clear all items and take a screenshot.
    [Setup]    Open Browser    http://${Host}:${port}    browser=Firefox    alias=guest
    Click Button    clr_btn_submit
    Capture Page Screenshot
    [Teardown]    Close Browser

Add_Users
    [Documentation]    Adding items to the testcase:
    ...
    ...    1. Clean room
    ...    2. Call mom
    ...    3. Call brother
    ...    4. Buy milk
    ...
    ...    Take a screenshot.
    [Setup]    Open Browser    http://${Host}:${port}    browser=Firefox    alias=guest
    [Template]    Add_todo_${todo_item}
    Clean room
    Call mom
    Call brother
    Buy milk
    [Teardown]    Close_Session

Rename_Todo_Item
    [Documentation]    Testing the rename feature and taking a screenshot.
    ...
    ...    Renaming "Call mom" to "Call sister" and "Call brother" to "Buy bread".
    [Setup]    Open Browser    http://${Host}:${port}    browser=Firefox    alias=guest
    Input Text    updatetodo_1    Call sister
    Click Button    edit_btn_submit_1
    Input Text    updatetodo_2    Buy bread
    Click Button    edit_btn_submit_2
    Capture Page Screenshot
    [Teardown]    Close Browser

Delete_Todo_Item
    [Documentation]    Testing the delete feature and taking a screenshot.
    ...
    ...    Delete Id 0 and 2.
    [Setup]    Open Browser    http://${Host}:${port}    browser=Firefox    alias=guest
    Click Link    delete_btn_0
    Click Link    delete_btn_2
    Capture Page Screenshot
    [Teardown]    Close Browser

Test_For_XSS
    [Documentation]    Testing for XSS vulnerability and taking a snapshot.
    [Setup]    Open Browser    http://${Host}:${port}    browser=Firefox    alias=guest
    Input Text    newtodo    <script>alert(1)</script>
    Click Button    add_btn_submit
    Page Should Contain    <script>alert(1)</script>
    Capture Page Screenshot
    [Teardown]    Close Browser

*** Keywords ***
Add_todo_${todo_item}
    Input Text    newtodo    ${todo_item}
    Click Button    add_btn_submit

Close_Session
    Capture Page Screenshot
    Close Browser
