*** Settings ***
Library     AppiumLibrary
Resource    password.robot
Resource    android-res-auth-activities-elements.robot
Resource    android-res-home-activity-elements.robot
Resource    android-res-materi-activities-elements.robot
Resource    android-res-literatur-activities-elements.robot

*** Variables ***
# -- Test Variables -- #

## Users' account
&{USER_SISWA_1}     email=matthewwalfredoo@gmail.com    password=${PASSWORD}
&{USER_SISWA_2}     email=joshuasilitonga@gmail.com     password=${PASSWORD}
&{USER_DOSEN_1}     email=dosen1@gmail.com              password=${PASSWORD}
&{USER_DOSEN_2}     email=dosen2@gmail.com              password=${PASSWORD}
&{USER_WRONG}       email=dosen2@gmail.com              password=salahcuy
&{USER_REGISTER_TEST}   nama=Testing1   email=testing1@gmail.com    no_hp=082323232323    password=${PASSWORD}

# -- UI Elements in ProfileFragment -- #
# UI Elements in ProfileFragment before logged in
${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}    id=id.del.ac.delstat:id/button_login
# UI Elements in ProfileFragment after logged in
${ELEMENT_BUTTON_EDIT_PROFIL_FRAGMENT_PROFIL}   id=id.del.ac.delstat:id/button_edit_profile
${ELEMENT_BUTTON_HASIL_KUIS_FRAGMENT_PROFIL}    id=id.del.ac.delstat:id/button_hasil_kuis
${ELEMENT_BUTTON_LOGOUT_FRAGMENT_PROFIL}        id=id.del.ac.delstat:id/button_logout

# Materi Video Link #
&{VIDEO2_LINK}      link=https://www.youtube.com/watch?v=h8Nur-4DAWs

#Literatur Inputs
&{JUDUL_LITERATUR}      judul=Probabilitas Sederhana
&{PENULIS_LITERATUR}    penulis=Rinaldi Munir
&{TAHUN_LITERATUR}      tahun=2020  tahun2=2021
&{TAG_LITERATUR}        tag=mahasiswa
&{FILE_LITERATUR}       file=

*** Keywords ***
OpenDelStatApplication
    Open Application    http://localhost:4723/wd/hub    platformName=Android	deviceName=emulator-5554    appPackage=id.del.ac.delstat        appActivity=id.del.ac.delstat.presentation.activity.HomeActivity        automationName=Uiautomator2


# -- Keywords related to Login function -- #
OpenFragmentProfil
    Wait Until Page Contains Element    ${ELEMENT_FRAGMEN_PROFIL}
    Click Element                       ${ELEMENT_FRAGMEN_PROFIL}

OpenFragmentMateri
    Wait Until Page Contains Element    ${ELEMENT_FRAGMEN_MATERI}
    Click Element                       ${ELEMENT_FRAGMEN_MATERI}

OpenFragmentLiteratur
    Wait Until Page Contains Element    ${ELEMENT_FRAGMEN_LITERATUR}
    Click Element                       ${ELEMENT_FRAGMEN_LITERATUR}

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
    Click Element                       ${ELEMENT_BUTTON_LOGIN_LOGIN_ACTIVITY}

LoginUsingUserDosen1
    Wait Until Page Contains Element    ${ELEMENT_FRAGMEN_PROFIL}
    Click Element                       ${ELEMENT_FRAGMEN_PROFIL}
    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_DOSEN_1}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_DOSEN_1}[password]
    Click Element                       ${ELEMENT_BUTTON_LOGIN_LOGIN_ACTIVITY}

LoginUsingUserDosen2
    Wait Until Page Contains Element    ${ELEMENT_FRAGMEN_PROFIL}
    Click Element                       ${ELEMENT_FRAGMEN_PROFIL}
    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_DOSEN_2}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_DOSEN_2}[password]
    Click Element                       ${ELEMENT_BUTTON_LOGIN_LOGIN_ACTIVITY}

LoginUsingWrongAccount
    Wait Until Element Is Visible       ${ELEMENT_FRAGMEN_PROFIL}
    Click Element                       ${ELEMENT_FRAGMEN_PROFIL}
    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_DOSEN_2}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_WRONG}[email]
    Click Element                       ${ELEMENT_BUTTON_LOGIN_LOGIN_ACTIVITY}

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

WrongRegisterUser
    OpenFragmentProfil

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_REGISTER_LOGIN_ACTIVITY}
    Click Element                       ${ELEMENT_BUTTON_REGISTER_LOGIN_ACTIVITY}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_REGISTER_ACTIVITY}

    Input Text    ${ELEMENT_NAMA_REGISTER_ACTIVITY}    ${USER_REGISTER_TEST}[nama]
    Input Text    ${ELEMENT_EMAIL_REGISTER_ACTIVITY}    ${USER_REGISTER_TEST}[email]
    Input Text    ${ELEMENT_NO_HP_REGISTER_ACTIVITY}    ${USER_REGISTER_TEST}[no_hp]

ViewMateri1
    OpenFragmentMateri

    Wait Until Page Contains Element    ${ELEMENT_MATERI1_ACTIVITY}
    Click Element                       ${ELEMENT_MATERI1_ACTIVITY}

EditMateri
    OpenFragmentProfil

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_DOSEN_1}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_DOSEN_1}[password]
    Click Element                       ${ELEMENT_BUTTON_LOGIN_LOGIN_ACTIVITY}

    OpenFragmentMateri

    Wait Until Page Contains Element    ${ELEMENT_MATERI1_ACTIVITY}
    Click Element                       ${ELEMENT_MATERI1_ACTIVITY}

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_EDIT_MATERI_ACTIVITY}
    Click Element                       ${ELEMENT_BUTTON_EDIT_MATERI_ACTIVITY}

    Wait Until Page Contains Element    ${ELEMENT_LINK2_MATERI1_ACTIVITY}
    Input Text                          ${ELEMENT_LINK2_MATERI1_ACTIVITY}    ${VIDEO2_LINK}[link]
    Click Element                       ${ELEMENT_BUTTON_SIMPAN_MATERI_ACTIVITY}

ViewLiteratur1
    OpenFragmentLiteratur

    Wait Until Page Contains Element    ${ELEMENT_LITERATUR1_ACTIVITY}
    Click Element                       ${ELEMENT_LITERATUR1_ACTIVITY}

CreateNewLiteratur
    OpenFragmentProfil

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_DOSEN_1}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_DOSEN_1}[password]
    Click Element                       ${ELEMENT_BUTTON_LOGIN_LOGIN_ACTIVITY}

    OpenFragmentLiteratur

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_TAMBAH_LITERATUR_ACTIVITY}
    Click Element                       ${ELEMENT_BUTTON_TAMBAH_LITERATUR_ACTIVITY}

    Wait Until Page Contains Element    ${ELEMENT_JUDUL_LITERATUR_ACTIVITY}
    Input Text    ${ELEMENT_JUDUL_LITERATUR_ACTIVITY}       ${JUDUL_LITERATUR}[judul]
    Input Text    ${ELEMENT_PENULIS_LITERATUR_ACTIVITY}     ${PENULIS_LITERATUR}[penulis]
    Input Text    ${ELEMENT_TAHUN_LITERATUR_ACTIVITY}       ${TAHUN_LITERATUR}[tahun]
    Input Text    ${ELEMENT_TAG_LITERATUR_ACTIVITY}         ${TAG_LITERATUR}[tag]
    Input Text    ${ELEMENT_FILE_LITERATUR_ACTIVITY}        ${FILE_LITERATUR}[file]
    Click Element                       ${ELEMENT_BUTTON_CREATE_LITERATUR_ACTIVITY}

EditLiteratur
    OpenFragmentProfil

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_DOSEN_1}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_DOSEN_1}[password]
    Click Element                       ${ELEMENT_BUTTON_LOGIN_LOGIN_ACTIVITY}

    OpenFragmentLiteratur

    Wait Until Page Contains Element    ${ELEMENT_LITERATUR1_ACTIVITY}
    Click Element                       ${ELEMENT_LITERATUR1_ACTIVITY}

    Wait Until Page Contains Element    ${ELEMENT_ICON_EDIT_LITERATUR_ACTIVITY}
    Click Element                       ${ELEMENT_ICON_EDIT_LITERATUR_ACTIVITY}

    Wait Until Page Contains Element    ${ELEMENT_JUDUL_LITERATUR_ACTIVITY}
    Input Text    ${ELEMENT_TAHUN_LITERATUR_ACTIVITY}       ${TAHUN_LITERATUR}[tahun2]
    Click Element                       ${ELEMENT_BUTTON_EDIT_LITERATUR_ACTIVITY}

 DeleteLiteratur
    OpenFragmentProfil

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}
    Click Element                       ${ELEMENT_BUTTON_LOGIN_FRAGMENT_PROFIL}

    Wait Until Page Contains Element    ${ELEMENT_EMAIL_LOGIN_ACTIVITY}
    Input Text                          ${ELEMENT_EMAIL_LOGIN_ACTIVITY}    ${USER_DOSEN_1}[email]
    Input Password                      ${ELEMENT_PASSWORD_LOGIN_ACTIVITY}  ${USER_DOSEN_1}[password]
    Click Element                       ${ELEMENT_BUTTON_LOGIN_LOGIN_ACTIVITY}

    OpenFragmentLiteratur

    Wait Until Page Contains Element    ${ELEMENT_LITERATUR1_ACTIVITY}
    Click Element                       ${ELEMENT_LITERATUR1_ACTIVITY}

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_DELETE_LITERATUR_ACTIVITY}
    Click Element                       ${ELEMENT_BUTTON_DELETE_LITERATUR_ACTIVITY}

    Wait Until Page Contains Element    ${ELEMENT_BUTTON_YES_LITERATUR_ACTIVITY}
    Click Element                       ${ELEMENT_BUTTON_YES_LITERATUR_ACTIVITY}

