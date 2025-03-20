*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/Search-page-variable.robot
Resource    ${CURDIR}/Search-page-keyword.robot
Suite Setup    Set Selenium Speed     0.5s
Suite Teardown    Close All Browsers
Test Setup     Open Webbrowser
Test Teardown    Close Browser

*** Test Cases ***
TC001-Verify Notification
    [Documentation]    ใช้สำหรับทดสอบตรวจสอบการกด Icon Notification
    [Tags]    Test Pass
    Input Data for login page 
    Verify Notification
TC002-Verify Header Icon Profile
    [Documentation]    ตรวจสอบการกดไอคอนรูป Profile(ในส่วนของ Header)
    [Tags]    Test Pass
    Input Data for login page 
    Verify Profile Details
TC003-Logout
    [Documentation]    ตรวจสอบการกดปุ่ม Logout
    [Tags]    Test Pass
    Input Data for login page 
    Logout
TC004-Clear Data
    [Documentation]    ใช้สำหรับทดสอบในกรณีที่ Clear ข้อมูล
    [Tags]    Test Fail
    Input Data for login page 
    Select List All 
    Click Element    ${btn_clear} 
    Wait Until Element Is Visible    ${Locator_no-rows}
TC005-Select Dropdown Case
    [Setup]
    [Documentation]    ตรวจสอบการเลือกหลาย Dropdown
    [Tags]    Test Pass
    [Template]    Select Dropdown filter - Test Template
# role  plan status
    1    0    0         
    1    1    0     
    0    1    1
    0    0    1
    0    0    0
    1    0    1
    0    1    0
    1    1    1 
    [Teardown]    Close Browser

# -----------------------------Add User---------------------------------------------------------------------------------
TC006-Verify Add User
    [Documentation]   ตรวจสอบการ Add User
    [Tags]    Test Pass
    Input Data for login page 
    Verify Add User
TC007-Reset Data
    [Documentation]    ใช้สำหรับทดสอบในกรณีที่ Clear ข้อมูล(หน้า Form User)
    [Tags]    Test Pass
    Input Data for login page 
    Wait Until Element Is Visible    ${btn_adduser}
    Click Element    ${btn_adduser}
    Wait Until Page Contains    Kru P' Beam    5s 
    Input Data for add user 
    Wait Until Element Is Visible     ${locator_btn_scroll}
    Click Element     ${locator_btn_scroll}
    Wait Until Element Is Visible    ${locator_reset}    
    Click Element    ${locator_reset}
TC008-Button Back 
    [Documentation]    ตรวจสอบการกดปุ่ม BACK (ย้อนกลับไปยังหน้า Search Filters)
    [Tags]    Test Pass
    Input Data for login page 
    Wait Until Element Is Visible    ${btn_adduser}
    Click Element    ${btn_adduser}
    Wait Until Page Contains    Kru P' Beam    5s 
    Click Element    ${locator_btn_back}
    Wait Until Page Contains    Search Filters    5s 
TC009-Verify case fail
    [Setup]
    [Documentation]    ใช้สำหรับทดสอบในกรณีกรอกข้อมูลไม่ครบถ้วน
    [Tags]    Test Fail
    [Template]    Input Data fail - Test Template
    ${EMPTY}  sung       sangsang@gmail.com      1234567890    08222222222    female    1    1    1    1    ${locator_error-firstname}     This field is required
    sang      ${EMPTY}   sangsang@gmail.com      1234567890    08222222222    female    1    1    1    1    ${locator_error-lastname}      This field is required
    sang      sung       ${EMPTY}                1234567890    08222222222    female    1    1    1    1    ${locator_error-email}         This field is required
    sang      sung       sangsang@gmail.com      ${EMPTY}      08222222222    female    1    1    1    1    ${locator_error-password}      This field is required
    sang      sung       sangsang@gmail.com      1234567890    ${EMPTY}       female    1    1    1    1    ${locator_error-mobile-phone}  This field is required
    sang      sung       sangsang@gmail.com      1234567890    08222222222    emp       1    1    1    1    ${locator_error-gender}        This field is required
    sang      sung       sangsang@gmail.com      1234567890    08222222222    female    0    1    1    1    ${locator_error-chk}           This field is required
    sang      sung       sangsang@gmail.com      1234567890    08222222222    female    1    0    1    1    ${locator_error-nationality}   This field is required
    sang      sung       sangsang@gmail.com      1234567890    08222222222    female    1    1    0    1    ${locator_error-role}          This field is required
    sang      sung       sangsang@gmail.com      1234567890    08222222222    female    1    1    1    0    ${locator_error-plan}          This field is required
    [Teardown]    Close Browser
TC0010-Scroll back to top
    [Documentation]    ตรวจสอบการกดปุ่ม Scroll back to top
    [Tags]    Test Pass
    Input Data for login page 
    Verify Button Scroll back to top
# --------------------------------------------------------------------------------------------------------------------------------
TC0011-Profile Result - Click Icon
    [Documentation]   ตรวจสอบการกดไอคอนรูป Profile(ในส่วนแสดงผลลัพธ์ที่ได้จากการ Search)
    [Tags]    Test Pass
    Input Data for login page 
    Select List All 
    Verify click icon profile 
TC0012-Verify Dropdown Row per page 
    [Documentation]   ตรวจสอบการเลือก Rows per page
    [Tags]    Test Pass
    Input Data for login page 
    Select List status
    Click Element    ${btn_search}
    Wait Until Element Is Not Visible    ${Locator_no-rows}    5s
    Verify Rows per page 
TC0013-Verify Icon go to next page
    [Documentation]   ตรวจสอบการกดปุ่ม Icon Go to next page
    [Tags]    Test Pass
    Input Data for login page 
    Select List status
    Click Element    ${btn_search}
    Wait Until Element Is Not Visible    ${Locator_no-rows}    5s
    Verify Go to next page
TC0014-Verify Icon go to previous page 
    [Documentation]   ตรวจสอบการกดกดปุ่ม Icon Go to previous page 
    [Tags]    Test Pass
    Input Data for login page 
    Select List status
    Click Element    ${btn_search}
    Wait Until Element Is Not Visible    ${Locator_no-rows}    5s
    Verify Go to previous page  