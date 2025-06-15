@echo off
echo Verificando ambiente de desenvolvimento...

echo.
echo 1. Verificando Java...
java -version
if %errorlevel% neq 0 (
    echo ERRO: Java nao encontrado! Por favor, instale o JDK 17
    exit /b 1
)

echo.
echo 2. Verificando Maven...
mvn -version
if %errorlevel% neq 0 (
    echo ERRO: Maven nao encontrado! Por favor, instale o Maven
    exit /b 1
)

echo.
echo 3. Verificando MySQL...
mysql --version
if %errorlevel% neq 0 (
    echo ERRO: MySQL nao encontrado! Por favor, instale o MySQL
    exit /b 1
)

echo.
echo 4. Verificando conexao com MySQL...
mysql -u root -proot -e "SELECT VERSION();" > nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Nao foi possivel conectar ao MySQL com as credenciais padrao
    echo Por favor, verifique se:
    echo - MySQL esta rodando
    echo - Usuario 'root' existe
    echo - Senha 'root' esta correta
    echo - Ou altere as credenciais em application.properties
    exit /b 1
)

echo.
echo 5. Verificando banco de dados...
mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS jwt_auth_db;" > nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Nao foi possivel criar o banco de dados
    exit /b 1
)

echo.
echo Ambiente verificado com sucesso!
echo.
echo Para rodar o projeto, execute:
echo mvn spring-boot:run
echo.
echo Para testar a API, use:
echo - Cadastro: POST http://localhost:8080/api/auth/signup
echo - Login: POST http://localhost:8080/api/auth/signin
echo. 