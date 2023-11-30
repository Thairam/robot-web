*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${FIRST_NAME}       css=[data-test=firstName]
${LAST_NAME}        css=[data-test=lastName]
${POSTAL_CODE}      css=[data-test=postalCode]
${BTN_CONTINUE}     css=input[value=CONTINUE]
${SUB_TOTAL}        css=div.summary_subtotal_label
${TAX}              css=div.summary_tax_label
${TOTAL}            css=div.summary_total_label
${BTN_FINISH}       //a[contains(text(), 'FINISH')]


*** Keywords ***
Preencher endereço de entrega
    Preencher primeiro nome
    Preencher último nome
    Preencher código postal
    Capture Page Screenshot
    Clicar no botão Continue

Preencher primeiro nome
    Wait Until Element Is Visible    ${FIRST_NAME}
    Input Text    text=Thairam    locator=${FIRST_NAME}

Preencher último nome
    Wait Until Element Is Visible    ${LAST_NAME}
    Input Text    text=Ataíde    locator=${LAST_NAME}

Preencher código postal
    Wait Until Element Is Visible    ${POSTAL_CODE}
    Input Text    text=Rua dos Engenheiros    locator=${POSTAL_CODE}

Clicar no botão Continue
    Wait Until Element Is Visible    ${BTN_CONTINUE}
    Click Element    ${BTN_CONTINUE}

Conferir se os preços estão corretos
    Wait Until Element Is Visible    ${SUB_TOTAL}
    Capture Page Screenshot
    Element Should Contain    ${SUB_TOTAL}    expected=$37.98
    Element Should Contain    ${TAX}    expected=$3.04
    Element Should Contain    ${TOTAL}    expected=$41.02

Finalizar Compra
    Wait Until Element Is Visible    ${BTN_FINISH}
    Click Element    ${BTN_FINISH}

Conferir mensagem "${mensagem}"
    Capture Page Screenshot
    Page Should Contain    ${mensagem}
