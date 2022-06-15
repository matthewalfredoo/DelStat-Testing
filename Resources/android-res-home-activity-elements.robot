*** Settings ***
Library     AppiumLibrary

*** Variables ***
# -- UI Elements in HomeActivity -- #
# Bottom navigation bar
${ELEMENT_FRAGMEN_MATERI}        id=id.del.ac.delstat:id/materiFragment
${ELEMENT_FRAGMEN_LITERATUR}     id=id.del.ac.delstat:id/literaturFragment
${ELEMENT_FRAGMEN_QUIZ}          id=id.del.ac.delstat:id/quizFragment
${ELEMENT_FRAGMEN_PROFIL}        id=id.del.ac.delstat:id/profileFragment

# Action bar in HomeActivity
${ELEMENT_ACTION_BAR_ANALISIS_DATA}      id=id.del.ac.delstat:id/analisisDataActivity
${ELEMENT_ACTION_BAR_CHAT}               id=id.del.ac.delstat:id/notifikasiActivity
${ELEMENT_ACTION_BAR_NOTIFIKASI}         id=id.del.ac.delstat:id/notifikasiActivity