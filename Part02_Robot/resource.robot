*** Variables ***
${BWS}                                      chrome
${URL}                                      https://www.pomelofashion.com/th/en/
${EMAIL}                                    suppakrit@outlook.com   #เป็น Accout ที่ใช้ทำ Test
${PASSWORD}                                 supkitpomelo230742      #เป็น Accout ที่ใช้ทำ Test
${OPEN_LOGIN_BUTTON}                        //button[@data-cy="nav_login"]
${EMAIL_TEXTBOX}                            //input[@id="Email"]
${PASSW_TEXTBOX}                            //input[@id="Password"]
${LOGIN_BUTTON}                             //button[@data-cy="auth__login__email__button"]
${HEADPAGE}                                 //div[@class="jsx-1555558674 header-section header-logo"]
${SEARCH_BUTTON}                            //li[@data-cy="nav_user__search"]
${SEARCH_TEXTBOX}                           //input[@placeholder="What are you looking for today?..."]
${ADD_BAG_BUTTON}                           //span[text()="Add To Bag"]
${ADDED_ALERT}                              //span[text()="Item added to Bag"]
${CLOSE_BAG_NOTICE_BUTTON}                  //span[@data-cy="close_cart_notice"]
${CLOSE_BAG_BUTTON}                         //span[@data-cy="close_cart"]
${OPEN_BAG_BUTTON}                          //*[@data-cy="nav_user__cart"]
${PROMO_TEXTBOX}                            //input[@placeholder="Enter Promo Code"]
${APPLY_PROMO_CODE_BUTTON}                  //button/span[text()="Apply"]
${PROMO_CODE_USED}                          //div[@class="cart-discount__card"]
${PROMO_CODE_INVALID_ALERT}                 //span[contains(text(),"Invalid voucher code")]
${CHECK_OUT_BUTTON}                         //button/span[text()="Check out now"]
${SHIPPING_STEP}                            //label[@for="CHECKOUT_STEPS_SHIPPING"]
${PAYMENT_STEP}                             //label[@for="CHECKOUT_STEPS_PAYMENT"]
${CONFIRM_STEP}                             //label[@for="CHECKOUT_STEPS_CONFIRM"]
${EMPTY_BAG_ALERT}                          //span[text()="Your Bag is Empty"]

*** Keywords ***
OPEN AND LOGIN WEBSITE 
    Open Browser    ${URL}      ${BWS}
    Wait Until Element Is Visible           ${HEADPAGE} 
    Click Element                           ${OPEN_LOGIN_BUTTON}    
    Input Text                              ${EMAIL_TEXTBOX}                    ${EMAIL}  
    Input Text                              ${PASSW_TEXTBOX}                    ${PASSWORD} 
    Click Element                           ${LOGIN_BUTTON}  
    Wait Until Element IS Not Visible       ${OPEN_LOGIN_BUTTON}    
  
ADD ITEM
    [Arguments]     ${item_name}        ${item_size}
    Click Element                           ${SEARCH_BUTTON} 
    Input Text                              ${SEARCH_TEXTBOX}                   ${item_name} 
    Press Keys                              ${SEARCH_TEXTBOX} 	                RETURN
    Wait Until Element Is Visible           //span[text()="${item_name}"]
    Click Element                           //span[text()="${item_name}"]
    Wait Until Element Is Visible           //button[text()="${item_size}"]
    Click Element                           //button[text()="${item_size}"]
    Click Element                           ${ADD_BAG_BUTTON} 
    Wait Until Element Is Visible           ${ADDED_ALERT} 
    Click Element                           ${CLOSE_BAG_NOTICE_BUTTON} 

OPEN SHOPPIBG BAG
    Click Element                           ${OPEN_BAG_BUTTON}  

ADJUSTS ITEM QUANTITY AND CHECK
    [Arguments]     ${item_name}    ${item_number}   
    Wait Until Element Is Visible           //a[text()="${item_name}"]/../../../div/div/div/div/div/select   
    Select From List By Label               //a[text()="${item_name}"]/../../../div/div/div/div/div/select        ${item_number}  
    Wait Until Element Is Visible           //a[text()="${item_name}"]
    List Selection Should Be                //a[text()="${item_name}"]/../../../div/div/div/div/div/select        ${item_number}  

ADJUSTS ITEM SIZE AND CHECK
    [Arguments]     ${item_name}    ${item_number}   
    Wait Until Element Is Visible           //a[text()="${item_name}"]/../../../div/div/div/div/select  
    Select From List By Label               //a[text()="${item_name}"]/../../../div/div/div/div/select            ${item_number}   
    Wait Until Element Is Visible           //a[text()="${item_name}"]
    List Selection Should Be                //a[text()="${item_name}"]/../../../div/div/div/div/select            ${item_number}  

ADJUSTS DELETE ITEM AND CHECK
    [Arguments]     ${item_name}
    Wait Until Element Is Visible           //a[text()="${item_name}"]/../../../../div/div[@role="button"]
    Click Element                           //a[text()="${item_name}"]/../../../../div/div[@role="button"]
    Wait Until Element Is Not Visible       //a[text()="${item_name}"]

FILL IN PROMO CODE
    [Arguments]     ${promo_code}
    Wait Until Element Is Visible           ${PROMO_TEXTBOX}
    Input Text                              ${PROMO_TEXTBOX}                    ${promo_code}
    Click Element                           ${APPLY_PROMO_CODE_BUTTON}   

CHECK PROMO CODE VALID
    Wait Until Element Is Visible           ${PROMO_CODE_USED}                          

CHECK PROMO CODE INVALID
    Wait Until Element Is Visible           ${PROMO_CODE_INVALID_ALERT} 

CHECK OUT FROM BAG AND CHECK
    Click Element                           ${CHECK_OUT_BUTTON}
    Wait Until Element Is Visible           ${SHIPPING_STEP}                            
    Wait Until Element Is Visible           ${PAYMENT_STEP}                          
    Wait Until Element Is Visible           ${CONFIRM_STEP} 

CHECK BAG IS EMPTY 
    Wait Until Element Is Visible           ${EMPTY_BAG_ALERT}    