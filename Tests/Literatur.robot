*** Settings ***
Library     AppiumLibrary
Resource   ../Resources/android-res.robot

*** Variables ***

*** Test Cases ***
View
    OpenDelStatApplication
    ViewLiteratur1

Create
    OpenDelStatApplication
    CreateNewLiteratur

Edit
    OpenDelStatApplication
    EditLiteratur

Delete
    OpenDelStatApplication
    DeleteLiteratur