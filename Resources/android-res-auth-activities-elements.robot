*** Settings ***
Library     AppiumLibrary

*** Variables ***
# -- UI Elements in LoginActivity -- #
${ELEMENT_EMAIL_LOGIN_ACTIVITY}                         id=id.del.ac.delstat:id/edit_text_email_login
${ELEMENT_PASSWORD_LOGIN_ACTIVITY}                      id=id.del.ac.delstat:id/edit_text_password_login
${ELEMENT_BUTTON_LOGIN_LOGIN_ACTIVITY}                  id=id.del.ac.delstat:id/button_login
${ELEMENT_BUTTON_LUPA_PASSWORD_LOGIN_ACTIVITY}          id=id.del.ac.delstat:id/button_lupa_password
${ELEMENT_BUTTON_REGISTER_LOGIN_ACTIVITY}               id=id.del.ac.delstat:id/button_register

# -- UI Elements in RegisterActivity -- #
${ELEMENT_NAMA_REGISTER_ACTIVITY}                       id=id.del.ac.delstat:id/edit_text_nama_register
${ELEMENT_EMAIL_REGISTER_ACTIVITY}                      id=id.del.ac.delstat:id/edit_text_email_register
${ELEMENT_NO_HP_REGISTER_ACTIVITY}                      id=id.del.ac.delstat:id/edit_text_no_hp_register
${ELEMENT_PASSWORD_REGISTER_ACTIVITY}                   id=id.del.ac.delstat:id/edit_text_password_register
${ELEMENT_BUTTON_REGISTER_REGISTER_ACTIVITY}            id=id.del.ac.delstat:id/button_register