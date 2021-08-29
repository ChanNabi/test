***Settings***
Library  Selenium2Library
Library  String
Suite Setup  Log to console  Shopping Iphone
Suite Teardown  Log to console  Thank you

***Variables***
${HOMEPAGE}  https://www.apple.com/th
${BROWSER}   Firefox

***Keywords***
Go To homepage
     Open Browser  ${HOMEPAGE}  ${BROWSER}
     Maximize Browser Window
     Log to console  Welcome    

Scroll To Element With Java Script
    [Arguments]    ${xpath}
    ${element}     Set Variable    document.evaluate("${xpath}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    Execute Javascript    ${element}.scrollIntoView();


***Test Cases***
Open Browser Apple    
    Go To homepage
    Click Element       //*[@class="ac-gn-link ac-gn-link-iphone"]
    Location Should Be  ${HOMEPAGE}/iphone/

Select Product Iphone
    Click Element       //*[@class="chapternav-link"]
    Location Should Be  https://www.apple.com/th/iphone-12-pro/
    Click Element       //*[@class="ac-ln-button"]
    Location Should Be  https://www.apple.com/th/shop/buy-iphone/iphone-12-pro
    Click Element       //*[@class="as-dimension-chicklets"]
    Click Element       //span[text()="แปซิฟิกบลู" and @class="form-label-small"]   
    Click Element       //span[text()="128" and @class="form-selector-title"]

Select product   
    ${TestXpath}     Set Variable    //*[text()='ไม่มีการคุ้มครอง AppleCare+']
    Scroll To Element With Java Script    ${TestXpath}
    Wait Until Element Is Visible    //*[@name="add-to-cart"] 
    Click Button   //*[@name="add-to-cart"] 

Check Product
    Wait Until Element Is Visible    //*[@class="rf-summary-header-producttitle"] 
    Click Element   //button[@class="button button-block button-super"]

Verify Prices  
    Page Should Contain     iPhone 12 Pro ความจุ 128GB สีแปซิฟิกบลู 
    Wait Until Element Is Visible   //div[text()="ยอดชำระเงินของคุณ" and @class="rs-summary-label"]  
    Page Should Contain Element   //*[text()='฿36,900.00' and @class="rs-summary-value"]//parent::div[@class="rs-summary-labelandvaluecontainer rs-summary-total"]   
    Click Button    //*[@id="shoppingCart.actions.checkout"]
    Close Browser