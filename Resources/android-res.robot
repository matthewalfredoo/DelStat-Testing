*** Settings ***
Library     AppiumLibrary
Resource    password.robot
Resource    android-res-auth-activities-elements.robot
Resource    android-res-home-activity-elements.robot

*** Variables ***
# -- Test Variables -- #

## Users' account
&{USER_SISWA_1}     email=matthewwalfredoo@gmail.com    password=${PASSWORD}
&{USER_SISWA_2}     email=joshuasilitonga@gmail.com     password=${PASSWORD}
&{USER_DOSEN_1}     email=dosen1@gmail.com              password=${PASSWORD}
&{USER_DOSEN_2}     email=dosen2@gmail.com              password=${PASSWORD}
&{USER_REGISTER_TEST}   nama=Testing1   email=testing1@gmail.com    no_hp=082323232323    password=${PASSWORD}

# -- UI Elements in ProfileFragment -- #
# UI Elements in ProfileFragment before logged in
${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}    id=id.del.ac.delstat:id/button_login
# UI Elements in ProfileFragment after logged in
${ELEMENT_BUTTON_EDIT_PROFIL_FRAGMENT_PROFIL}   id=id.del.ac.delstat:id/button_edit_profile
${ELEMENT_BUTTON_HASIL_KUIS_FRAGMENT_PROFIL}    id=id.del.ac.delstat:id/button_hasil_kuis
${ELEMENT_BUTTON_LOGOUT_FRAGMENT_PROFIL}        id=id.del.ac.delstat:id/button_logout

*** Keywords ***
OpenDelStatApplication
    Open Application    http://localhost:4723/wd/hub    platformName=Android	deviceName=emulator-5554    appPackage=id.del.ac.delstat        appActivity=id.del.ac.delstat.presentation.activity.HomeActivity        automationName=Uiautomator2


# -- Keywords related to Login function -- #
OpenFragmentProfil
    Wait Until Page Contains Element    ${ELEMENT_FRAGMEN_PROFIL}
    Click Element                       ${ELEMENT_FRAGMEN_PROFIL}

LoginUsingUserSiswa1
    OpenFragmentProfil

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_SISWA_1}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_SISWA_1}[password]
    Click Element                       ${ELEMENT_BUTTON_LOGIN_LOGIN_ACTIVITY}

LoginUsingUserSiswa2
    Wait Until Page Contains Element    ${ELEMENT_FRAGMEN_PROFIL}
    Click Element                       ${ELEMENT_FRAGMEN_PROFIL}
    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_SISWA_2}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_SISWA_2}[password]

LoginUsingUserDosen1
    Wait Until Page Contains Element    ${ELEMENT_FRAGMEN_PROFIL}
    Click Element                       ${ELEMENT_FRAGMEN_PROFIL}
    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_DOSEN_1}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_DOSEN_1}[password]

LoginUsingUserDosen2
    Wait Until Page Contains Element    ${ELEMENT_FRAGMEN_PROFIL}
    Click Element                       ${ELEMENT_FRAGMEN_PROFIL}
    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_DOSEN_2}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_DOSEN_2}[password]

Logout
    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGOUT_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGOUT_FRAGMENT_PROFIL}

# -- Keywords related to Register function -- #
RegisterUser
    OpenFragmentProfil

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_REGISTER_LOGIN_ACTIVITY}
    Click Element                       ${ELEMENT_BUTTON_REGISTER_LOGIN_ACTIVITY}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_REGISTER_ACTIVITY}

    Input Text    ${ELEMENT_NAMA_REGISTER_ACTIVITY}    ${USER_REGISTER_TEST}[nama]
    Input Text    ${ELEMENT_EMAIL_REGISTER_ACTIVITY}    ${USER_REGISTER_TEST}[email]
    Input Text    ${ELEMENT_NO_HP_REGISTER_ACTIVITY}    ${USER_REGISTER_TEST}[no_hp]
    Input Password    ${ELEMENT_PASSWORD_REGISTER_ACTIVITY}    ${USER_REGISTER_TEST}[password]
