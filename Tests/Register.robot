*** Settings ***
Library     AppiumLibrary
Resource   ../Resources/android-res.robot

*** Variables ***

*** Test Cases ***
Register
    OpenDelStatApplication
    RegisterUser