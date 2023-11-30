*** Settings ***
Library     SeleniumLibrary
Resource    ../Resource.robot
Resource    ../../variables/Credentials.robot


*** Variables ***
${IPT_USERNAME}     css=[data-test=username]
${IPT_PASSWORD}     css=[data-test=password]
${BTN_LOGIN}        id=login-button
${PAGE_TITLE}       Swag Labs


*** Keywords ***
Acessar a página
    Go To    ${URL}
    Wait Until Element Is Visible    ${IPT_USERNAME}
    Title Should Be    ${PAGE_TITLE}

Preencher credenciais válidas
    Preencher usuário    user=${USER}
    Preencher senha    password=${USER_PASSWORD}
    Clicar no botão Login

Preencher credenciais
    [Arguments]    &{credenciais}
    Log    ${credenciais}
    Preencher usuário    ${credenciais['user']}
    Preencher senha    ${credenciais['password']}
    Clicar no botão Login

Preencher usuário
    [Arguments]    ${user}
    Wait Until Element Is Visible    ${IPT_USERNAME}
    Input Text    ${IPT_USERNAME}    ${user}

Preencher senha
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${IPT_PASSWORD}
    Input Text    ${IPT_PASSWORD}    ${password}

Clicar no botão Login
    Wait Until Element Is Visible    ${BTN_LOGIN}
    Click Element    ${BTN_LOGIN}

Conferir mensagem de erro
    [Arguments]    ${mensagem}
    Page Should Contain    ${mensagem}
