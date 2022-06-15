*** Settings ***
Library     AppiumLibrary

*** Variables ***
${ELEMENT_LITERATUR_FRAGMENT_BEST}   id=id.del.ac.delstat:id/literaturFragment  #not using any xpath here
${XPATH_LITERATUR_FRAGMENT}      //android.widget.FrameLayout[contains(@resource-id,'literaturFragment')]
${XPATH_LITERATUR_FRAGMENT2}       //android.widget.FrameLayout[@resource-id='id.del.ac.delstat:id/literaturFragment']
${ELEMENT_QUIZ_FRAGMENT}    id=id.del.ac.delstat:id/quizFragment
${ELEMENT_PROFILE_FRAGMENT}    id=id.del.ac.delstat:id/profileFragment

*** Test Cases ***
Open_Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android	deviceName=emulator-5554    appPackage=id.del.ac.delstat        appActivity=id.del.ac.delstat.presentation.activity.HomeActivity        automationName=Uiautomator2
    Wait Until Page Contains Element    ${ELEMENT_LITERATUR_FRAGMENT_BEST}
    Wait Until Page Contains Element    ${ELEMENT_QUIZ_FRAGMENT}
    Wait Until Page Contains Element    ${ELEMENT_PROFILE_FRAGMENT}
    Click Element    ${ELEMENT_LITERATUR_FRAGMENT_BEST}
    Click Element    ${ELEMENT_QUIZ_FRAGMENT}
    Click Element    ${ELEMENT_PROFILE_FRAGMENT}
