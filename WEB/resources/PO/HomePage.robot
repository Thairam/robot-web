*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${PRODUCTS_LIST}    css=#inventory_container .inventory_list


*** Keywords ***
Conferir que os produtos são listados
    Element Should Be Visible    ${PRODUCTS_LIST}

Adicionar itens ao carrinho
    [Arguments]    @{itens}
    FOR    ${itemName}    IN    @{itens}
        ${xpath}=    Set Variable
        ...    //div[@class='inventory_item']//div[contains(text(), '${itemName}')]/ancestor::div[@class='inventory_item']//button[text()='ADD TO CART']
        Click Button    ${xpath}
    END
