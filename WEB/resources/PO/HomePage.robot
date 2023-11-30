*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${PRODUCTS_LIST}    css=#inventory_container .inventory_list


*** Keywords ***
Conferir que os produtos são listados
    Element Should Be Visible    ${PRODUCTS_LIST}
