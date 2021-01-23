*** Settings ***
Library  minionlib.py


*** Variables ***

${minions}  [Kevin, Stuart, Bob]


***Test Cases***

Test funkcji wyrzucajacej cos do konsoli    
    Log to console  super mega ukulele
    [Tags]  quotes
    # [Documentation]    Example test
    
    # My Keyword    /tmp

Test funkcji wyrzucającej do konsoli miniony
    Log to console  ${minions}
    [Tags]  fandom

Test wykorzystania Keywordów
    Uruchom keyworda  Zagrało
    [Tags]  mechanics


Test działania biblioteki minionlib
    ${result}=  join two strings    Bob     Stewart
    Should be equal     ${result}     Bob Stewart
    [Tags]  mechanics

*** Keywords ***

Uruchom keyworda
    [Arguments]   ${jajko}
	Log to console   ${jajko}


