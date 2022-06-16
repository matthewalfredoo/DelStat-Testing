*** Settings ***
Library     AppiumLibrary
Resource   ../Resources/android-res.robot

*** Variables ***

*** Test Cases ***
LoginSiswa
    OpenDelStatApplication
    LoginUsingUserSiswa1
    Sleep    5
    Logout

LoginDosen
    OpenDelStatApplication
    LoginUsingUserDosen1
    Sleep    5
    Logout

WrongLogin
    OpenDelStatApplication
    LoginUsingWrongAccount
    Sleep    5
    Logout