*** Settings ***
Library  minionlib.py
Library  SSHLibrary

*** Variables ***

${minions}  [Kevin, Stuart, Bob]
${HOST}                localhost
${USERNAME}            mkokot
${PASSWORD}            XXX
# w celu podania hasła uruchomić robota przez ```robot -v PASSWORD:wartość sample.robot```
***Test Cases***

Test funkcji wyrzucajacej cos do konsoli    
    Log to console  super mega ukulele
    [Tags]  quotes
    [Documentation]    Test piszący mój ulubiony cytat z Minionów

Test funkcji wyrzucającej do konsoli miniony
    Log to console  ${minions}
    [Tags]  fandom
    [Documentation]  Test pracy na zmiennych

Test wykorzystania Keywordów
    Uruchom keyworda  Zagrało
    [Tags]  mechanics
    [Documentation]  Test wykorzystania Keywordów

Test działania biblioteki minionlib
    ${result}=  join two strings    Bob     Stewart
    Should be equal     ${result}     Bob Stewart
    [Tags]  mechanics
    [Documentation]  Test połączenia z biblioteką minionlib: import i wywołanie funkcji minionlib.join_two_strings()

Test działania SSHLib
    [Tags]  mechanics
    [Documentation]  Pierwszy test który autentycznie testuje coś ciekawego
    Open Connection And Log In
    ${output} =     Execute Command  uname -a
    Should Start With   ${output}   Linux
    Close Connection

*** Keywords ***

Uruchom keyworda
    [Arguments]   ${jajko}
	Log to console   ${jajko}

Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}


