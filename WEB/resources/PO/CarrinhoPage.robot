*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${CART_ICON}        css=#shopping_cart_container > a
${BTN_CHECKOUT}     //a[contains(text(), 'CHECKOUT')]


*** Keywords ***
Acessar o carrinho
    Wait Until Element Is Visible    ${CART_ICON}
    Click Element    ${CART_ICON}

Conferir se os itens estão presentes
    [Arguments]    @{itens}
    FOR    ${itemName}    IN    @{itens}
        ${xpath}=    Set Variable
        ...    //div[contains(text(), '${itemName}')]
        Element Should Be Visible    ${xpath}
    END
    Capture Page Screenshot

Realizar Checkout
    Wait Until Element Is Visible    ${BTN_CHECKOUT}
    Click Element    ${BTN_CHECKOUT}
