# Projeto de Autenticação com JWT

Este é um projeto Spring Boot que implementa autenticação JWT e controle de acesso baseado em roles (admin e user).

## Requisitos

- Java 17 ou superior
- Maven
- IDE de sua preferência (recomendado: IntelliJ IDEA ou Eclipse)

## Configuração

1. Clone o repositório
2. Abra o projeto em sua IDE
3. Execute o comando `mvn clean install` para baixar as dependências
4. Execute a aplicação através da classe `JwtAuthDemoApplication`

## Endpoints

### Autenticação

- `POST /api/v1/auth/register` - Registra um novo usuário
  ```json
  {
    "name": "Nome do Usuário",
    "email": "usuario@email.com",
    "password": "senha123",
    "role": "USER" // ou "ADMIN"
  }
  ```

- `POST /api/v1/auth/login` - Realiza login
  ```json
  {
    "email": "usuario@email.com",
    "password": "senha123"
  }
  ```

### Usuários

- `GET /api/v1/users` - Lista todos os usuários (apenas ADMIN)
- `GET /api/v1/users/{id}` - Obtém um usuário específico (ADMIN ou próprio usuário)
- `DELETE /api/v1/users/{id}` - Remove um usuário (apenas ADMIN)

## Segurança

- Todas as requisições (exceto login e registro) devem incluir o token JWT no header:
  ```
  Authorization: Bearer <token>
  ```

## Banco de Dados

O projeto utiliza o banco de dados H2 em memória. Para acessar o console H2:
- URL: http://localhost:8080/h2-console
- JDBC URL: jdbc:h2:mem:testdb
- Username: sa
- Password: (vazio)

## Funcionalidades

- Registro de usuários com roles (ADMIN ou USER)
- Autenticação com JWT
- Controle de acesso baseado em roles
- Gerenciamento de usuários (listar, visualizar, deletar)
- Proteção de endpoints baseada em roles 