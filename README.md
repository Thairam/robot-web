# Projeto de automação WEB com Robot Framework

## Execução dos testes

### Pré-requisitos
- Python (+v3.11.5)
  - https://www.python.org/downloads/
- Robot Framework (+v6.1.1)
  - `$ pip install robotframework`
- SeleniumLibrary
  - `$ pip install robotframework-seleniumlibrary`
- VS Code
  - https://code.visualstudio.com/
- Robot Code Extension
  - https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode

Para executar os testes, abra o terminal na raiz do projeto (`.../robot_web/`) e execute o comando:

```bash
robot -d ./results ./WEB
```