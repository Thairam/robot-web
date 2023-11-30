*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PO/LoginPage.robot
Resource            ../resources/PO/HomePage.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***
Realizar compra com sucesso
    # TODO Desafio
    @{itens}=    Create List    Sauce Labs Backpack    Sauce Labs Onesie
    LoginPage.Acessar a página
    LoginPage.Preencher credenciais válidas
    HomePage.Adicionar itens ao carrinho    @{itens}
    CarrinhoPage.Conferir se os itens estão presentes    @{itens}
    CarrinhoPage.Fazer Checkout
    CheckoutPage.Preencher endereço de entrega
    CheckoutPage.Conferir se os preços estão corretos
    CheckoutPage.Finalizar Compra
    CheckoutPage.Conferir mensagem "THANK YOU FOR YOUR ORDER"
