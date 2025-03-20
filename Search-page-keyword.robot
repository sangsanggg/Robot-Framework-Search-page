*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/Search-page-variable.robot
*** Keywords ***
Open Webbrowser
    Open Browser    ${url}    ${browser}
    Wait Until Page Contains    Welcome to Kru P' Beam! 
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Wait Until Element Is Visible    ${locator_btn-login}
    Maximize Browser Window
Input Data for login page 
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text    ${locator_email}     user.test@krupbeam.com
    Input Text    ${locator_password}    123456789
    Click Element    ${locator_btn-login}    
    Wait Until Page Contains    Search Filters    5s
Select List All 
    Select List role
    Select List plan
    Select List status
    Click Element    ${btn_search} 
    Wait Until Element Is Not Visible    ${Locator_no-rows}    5s
    Verify Results - Dropdown Role    Admin
    Verify Results - Dropdown Plan    Basic
    Verify Results - Dropdown Status    Pending
Select List role
    Click Element    ${locator_role}  
    Wait Until Element Is Visible    ${locator_role-li}   5s
    Click Element    ${locator_role-li}  
Select List plan
    Click Element    ${locator_plan}  
    Wait Until Element Is Visible    ${locator_plan-li}    5s
    Click Element   ${locator_plan-li}
Select List status
    Click Element    ${locator_status}
    Wait Until Element Is Visible    ${locator_status-li}    5s
    Click Element    ${locator_status-li}
Verify Notification
    Click Element    ${btn_notifications}
    Wait Until Element Is Visible    ${txt_notification}    5s
    Wait Until Element Is Visible    ${btn_read-notifications}    5s
    Click Element    ${btn_read-notifications}
    Wait Until Element Is Not Visible    ${btn_read-notifications}    5s
Verify Profile Details
    Click Element    ${profile}
    Wait Until Element Is Visible    ${locator_profile_picture}    5s     
    Wait Until Element Is Visible    ${locator_profile_username}    5s    
    Wait Until Element Is Visible    ${locator_profile_role}    5s   
    Wait Until Element Is Visible    ${btn_logout}    5s
Logout
    Click Element    ${profile}   
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout} 
    Wait Until Page Contains    Welcome to Kru P' Beam!    5s
Select Dropdown filter - Test Template
    Open Webbrowser
    Input Data for login page 
    [Arguments]    ${role}    ${plan}    ${status} 
    IF  ${role} == 1  
        Select List role    
    END
    
    IF  ${plan} == 1  
        Select List plan    
    END

    IF  ${status} == 1  
        Select List status    
    END
    Click Element    ${btn_search} 
    Wait Until Element Is Not Visible    ${Locator_no-rows}    5s
    Wait Until Element Is Visible    ${locator_result_role}
    Wait Until Element Is Visible    ${locator_result_plan}
    Wait Until Element Is Visible    ${locator_result_status}

    IF  ${role} == 1  
        Verify Results - Dropdown Role    Admin    
    END
    
    IF  ${plan} == 1  
       Verify Results - Dropdown Plan    Basic        
    END

    IF  ${status} == 1  
        Verify Results - Dropdown Status    Pending        
    END
    Close Browser

Verify Results - Dropdown Role
    [Arguments]    ${expected_role}
    ${role_result}=    Get Text    ${locator_result_role}
    Should Be Equal As Strings    ${role_result}    ${expected_role}

Verify Results - Dropdown Plan
    [Arguments]    ${expected_plan}
    ${plan_result}=    Get Text    ${locator_result_plan}
    Should Be Equal As Strings    ${plan_result}    ${expected_plan}

Verify Results - Dropdown Status
    [Arguments]    ${expected_status}
    ${status_result}=    Get Text    ${locator_result_status}
    Should Be Equal As Strings    ${status_result}    ${expected_status}

# -----------------------------Add User---------------------------------------------------------------------------------
Verify Add User
    Wait Until Element Is Visible    ${btn_adduser}
    Click Element    ${btn_adduser}
    Wait Until Page Contains    Kru P' Beam    5s 
    Input Data for add user pass
    Verify user - after adduser
Input Data for add user pass
    Input Text    ${locator_Firstname}    sang
    Input Text    ${locator_lastname}    sung
    Input Text    ${locator_email_Adduser}    sangsang@gmail.com
    Input Text    ${locator_password_Adduser}    1234567890
    Input Text    ${locator_mobile-phone}     08222222222
    Select Radio Button       ${locator_gender}     female 
    Select Checkbox    ${locator_courses.SQL}    
    Select Checkbox    ${locator_courses.Test Manual} 
    Select Checkbox    ${locator_courses.Automate Test}
    Select Checkbox    ${locator_courses.Automate Test2}
    Select List nationality - Adduser
    Select List role - Adduser
    Select List plan - Adduser
    Click Element    ${locator_btn_sign-up} 
    Wait Until Page Contains    Register Success    5s
    Click Element    ${locator_btn_ok}
    Wait Until Page Contains    Search Filters     5s
Select List nationality - Adduser
    Click Element    ${locator_nationality}
    Wait Until Element Is Visible    ${locator_nationality-li}    5s
    Click Element    ${locator_nationality-li}
Select List role - Adduser
    Click Element    ${locator_role_Adduser}  
    Wait Until Element Is Visible    ${locator_role-li_Adduser}   5s
    Click Element    ${locator_role-li_Adduser}  
Select List plan - Adduser
    Click Element    ${locator_select-plan}  
    Wait Until Element Is Visible    ${locator_select-plan-li}    5s
    Click Element   ${locator_select-plan-li}
Verify user - after adduser
    Select List role
    Select List plan
    Click Element    ${btn_search} 
    Wait Until Element Is Not Visible    ${Locator_no-rows}    5s
    Verify Results - Username    sang sung
    Verify Results - Email    sangsang@gmail.com    
    Verify Results - Dropdown Role    Admin
    Verify Results - Dropdown Plan    Basic 
Input Data for add user 
    Input Text    ${locator_Firstname}    sang
    Input Text    ${locator_lastname}    sung
    Input Text    ${locator_email_Adduser}    sangsang@gmail.com
    Input Text    ${locator_password_Adduser}    1234567890
    Input Text    ${locator_mobile-phone}     08222222222
    Select Radio Button       ${locator_gender}     female 
    Select Checkbox    ${locator_courses.SQL}    
    Select Checkbox    ${locator_courses.Test Manual} 
    Select Checkbox    ${locator_courses.Automate Test}
    Select Checkbox    ${locator_courses.Automate Test2}
    Select List nationality - Adduser
    Select List role - Adduser
    Select List plan - Adduser
Verify Results - Username
    [Arguments]    ${expected_username}
    ${username_result}=    Get Text    ${locator_Username}
    Should Be Equal As Strings    ${username_result}    ${expected_username}
Verify Results - Email
    [Arguments]    ${expected_email}
    ${email_result}=    Get Text    ${locator_Email_user}
    Should Be Equal As Strings    ${email_result}    ${expected_email}
Input Data fail - Test Template
    Open Webbrowser
    Input Data for login page 
    Wait Until Element Is Visible    ${btn_adduser}
    Click Element    ${btn_adduser}
    Wait Until Page Contains    Kru P' Beam    5s
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${phone}    ${gender}    ${checkbox}    ${nationality}    ${role}    ${plan}    ${locator}    ${msg}    
    Input Text    ${locator_Firstname}    ${firstname}
    Input Text    ${locator_lastname}    ${lastname} 
    Input Text    ${locator_email_Adduser}    ${email}
    Input Text    ${locator_password_Adduser}    ${password}
    Input Text    ${locator_mobile-phone}     ${phone}

    IF  '${gender}' != 'emp'
        Select Radio Button       ${locator_gender}     ${gender}  
    END
    
    IF  ${checkbox} == 1
        Select Checkbox    ${locator_courses.SQL}    
    ELSE IF  ${checkbox} == 2
        Select Checkbox    ${locator_courses.SQL}
        Select Checkbox    ${locator_courses.Test Manual} 
    
    ELSE IF  ${checkbox} == 3
        Select Checkbox    ${locator_courses.SQL}
        Select Checkbox    ${locator_courses.Test Manual} 
        Select Checkbox    ${locator_courses.Automate Test}
    
    ELSE IF  ${checkbox} == 4
        Select Checkbox    ${locator_courses.SQL}
        Select Checkbox    ${locator_courses.Test Manual} 
        Select Checkbox    ${locator_courses.Automate Test}
        Select Checkbox    ${locator_courses.Automate Test2}
    END
    
    IF  ${nationality} == 1  
        Select List nationality - Adduser
    END
    
    IF  ${role} == 1  
        Select List role - Adduser
    END

    IF  ${plan} == 1  
        Select List plan - Adduser
    END
    
    Click Element    ${locator_btn_sign-up}    
    Verify error msg     ${locator}    ${msg}  
    Close Browser
Verify error msg 
    [Arguments]    ${locator}    ${msg}=${EMPTY}
    ${txt}=    Get Text     ${locator}
    Should Be Equal As Strings    ${txt}    ${msg}
Verify Button Scroll back to top
    Wait Until Element Is Visible    ${btn_adduser}
    Click Element    ${btn_adduser}
    Wait Until Page Contains    Kru P' Beam    5s 
    Set Focus To Element    ${locator_btn_sign-up}
    Wait Until Element Is Visible     ${locator_btn_scroll}
    Click Element     ${locator_btn_scroll}
    Wait Until Element Is Visible    ${locator_formuser}
# ---------------------------------------------------------------------------------------------------------------------------
Verify click icon profile 
    Wait Until Element Is Visible    ${locator_result_profile_user}
    Click Element    ${locator_result_profile_user}
    Wait Until Page Contains    Project List    
Verify Rows per page 
    Wait Until Element Is Visible    ${locator_roles_per_page}
    Set Focus To Element    ${locator_roles_per_page}
    Click Element    ${locator_roles_per_page}
    Wait Until Element Is Visible     ${locator_role_per_page_li}
    Click Element    ${locator_role_per_page_li}
    Wait Until Element Is Visible    ${locator_roleNumber}
    ${num}=    Get Text    ${locator_roleNumber}
    Should Be Equal As Strings    ${num}    1–18 of 18
Verify Go to next page
    Wait Until Element Is Visible    ${locator_btn_nextpage}
    Set Focus To Element    ${locator_btn_nextpage}
    Click Element    ${locator_btn_nextpage}
    Wait Until Element Is Visible    ${locator_roleNumber}
    ${num}=    Get Text    ${locator_roleNumber}
    Should Be Equal As Strings    ${num}    11–18 of 18
Verify Go to previous page 
    Verify Go to next page
    Wait Until Element Is Visible    ${locator_btn_previouspage}
    Click Element    ${locator_btn_previouspage}
    Wait Until Element Is Visible    ${locator_roleNumber}
    ${num}=    Get Text    ${locator_roleNumber}
    Should Be Equal As Strings    ${num}    1–10 of 18

   