*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PO/LoginPage.robot
Resource            ../resources/PO/HomePage.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***
Login com sucesso
    LoginPage.Acessar a página
    LoginPage.Preencher credenciais válidas
    HomePage.Conferir que os produtos são listados

Login com credenciais incorretas
    &{credenciais}=    Create Dictionary    user=wrong_user    password=wrong_pass
    LoginPage.Acessar a página
    LoginPage.Preencher credenciais    &{credenciais}
    LoginPage.Conferir mensagem de erro    mensagem=Username and password do not match any user in this service
