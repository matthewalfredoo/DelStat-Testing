*** Settings ***
Library     AppiumLibrary
Resource   ../Resources/android-res.robot

*** Variables ***

*** Test Cases ***
Login
    OpenDelStatApplication
    LoginUsingUserSiswa1
    Sleep    5
    Logout