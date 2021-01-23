*** Variables ***
${minions}  'Kevin, Stuart, Bob'

***Test Cases***

Test funkcji wyrzucajacej cos do konsoli    
    Log to console  super mega ukulele
    # [Documentation]    Example test
    
    # My Keyword    /tmp

Test funkcji wyrzucającej do konsoli miniony
    Log to console  ${minions}
