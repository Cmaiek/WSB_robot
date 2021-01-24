*** Settings ***
Library  minionlib.py
Library  SSHLibrary
Library  SeleniumLibrary

*** Variables ***

${minions}  [Kevin, Stuart, Bob]
${HOST}                localhost
${USERNAME}            mkokot
${PASSWORD}            XXX
# w celu podania hasła uruchomić robota przez ```robot -v PASSWORD:wartość sample.robot```
${BROWSER}          Headless Firefox
${WP_LOGIN}         testerwsb_t1
${WP_PASSWORD}      XXXX
# w celu podania hasła uruchomić robota przez ```robot -v PASSWORD:wartość -v WP_PASSWORD:wartość sample.robot```
${WP_LOGIN_URL}        https://poczta.wp.pl
${WP_LOGIN_INPUT_ID}         //*[@id='login']
${WP_PASSWORD_INPUT_ID}      //*[@id='password']
${WP SUBMIT BUTTON}     css:.nSubmit

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

Ping Test serwisu Altostratus.pl
    [Tags]  mechanics
    [Documentation]  Sprawdzamy czy hosting ALTOstratus.pl nie poległ (ip 167.71.43.51)
    Open Connection And Log In
    ${result} =     Execute Command  ping -c 1 altostratus.pl
    Should Contain  ${result}    64 bytes from 167.71.43.51
    Close Connection


Test poczta.wp.pl z wykorzystaniem Selenium - poprawny login
    [Tags]  mechanics
    [Documentation]  Wchodzimy w poważne tematy testersko-sieciowe - poprawny login
    
    Wywołaj ekran logowania WP
    Input text  ${WP_LOGIN_INPUT_ID}   ${WP_LOGIN}
    Input password   ${WP_PASSWORD_INPUT_ID}    ${WP_PASSWORD}
    Zatwierdź dane logowania WP
    Page Should Contain  pixel.wp.pl
    Close Browser

Test poczta.wp.pl z wykorzystaniem Selenium - niepoprawny login
    [Tags]  mechanics
    [Documentation]  Wchodzimy w poważne tematy testersko-sieciowe - niepoprawny login
    
    Wywołaj ekran logowania WP
    Input text  ${WP_LOGIN_INPUT_ID}   banana
    Input password   ${WP_PASSWORD_INPUT_ID}    ${WP_PASSWORD}
    Zatwierdź dane logowania WP
    Page Should Not Contain  pixel.wp.pl
    Close Browser

*** Keywords ***

Uruchom keyworda
    [Arguments]   ${jajko}
	Log to console   ${jajko}

Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}

Wywołaj ekran logowania WP
    Open Browser  about:blank   ${BROWSER}
    Go To   ${WP_LOGIN_URL}

Zatwierdź dane logowania WP    
    Click element   ${WP SUBMIT BUTTON}
    Sleep  5s
    Capture Page Screenshot


