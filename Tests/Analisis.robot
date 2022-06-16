*** Settings ***
Library     AppiumLibrary
Resource   ../Resources/android-res.robot

*** Variables ***

*** Test Cases ***
View
    OpenDelStatApplication
    ViewAnalisis1

Create
    OpenDelStatApplication
    RequestAnalisis
