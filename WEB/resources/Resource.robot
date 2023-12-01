*** Settings ***
Library     SeleniumLibrary
Library     String


*** Variables ***
${BROWSER}      chrome
${URL}          https://www.saucedemo.com/v1/


*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser    about:blank    ${BROWSER}
    Delete All Cookies

Fechar navegador
    Capture Page Screenshot
    Close Browser
