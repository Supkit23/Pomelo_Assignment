*** Settings ***
Library             Selenium2Library
Resource            ../Part02_Robot/resource.robot

Test Teardown       Close Browser
   
*** Test Cases ***
Pomelo Assignment: Part02
    log      Please go to https://www.pomelofashion.com/th/en/ and focus automate testing on "My Shopping Bag" page
    OPEN AND LOGIN WEBSITE 
    
    log      A customer adds the products any cetegory and click "Cart" Icon
    ADD ITEM                            Sustainable Puffed Sleeve Denim Dress - Blue        M      
    ADD ITEM                            Abstract Print Crop Top - White                     M    
    OPEN SHOPPIBG BAG

    log     A customer be able to adjusts quantity of product items or items.
    ADJUSTS ITEM QUANTITY AND CHECK     Sustainable Puffed Sleeve Denim Dress - Blue        3

    log     A customer be able to adjusts size of product items or items.
    ADJUSTS ITEM SIZE AND CHECK         Abstract Print Crop Top - White                     XXL

    log     A customer be able to adjust and delete product items or items.
    ADJUSTS DELETE ITEM AND CHECK       Abstract Print Crop Top - White 

    log     A customer be able to fill-in and click apply promo code. (even if promocode is not eligible)
    FILL IN PROMO CODE                  TestPromoCode
    CHECK PROMO CODE INVALID
    FILL IN PROMO CODE                  GET30TH
    CHECK PROMO CODE VALID

    log     A customer be able to validate proceed to checkout button.
    CHECK OUT FROM BAG AND CHECK

RESET SHOPPING BAG: For can run AUTOMATE Script Again
    log     Reset Shopping Bag
    OPEN AND LOGIN WEBSITE
    OPEN SHOPPIBG BAG 
    ADJUSTS DELETE ITEM AND CHECK       Sustainable Puffed Sleeve Denim Dress - Blue 
    CHECK BAG IS EMPTY 




