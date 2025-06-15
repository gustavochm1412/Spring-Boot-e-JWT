# Projeto de Autenticação com JWT

Este é um projeto de demonstração de autenticação usando Spring Boot e JWT (JSON Web Token).

## Tecnologias Utilizadas

- Java 17
- Spring Boot 3.2.3
- Spring Security
- JWT
- MySQL
- Maven

## Funcionalidades

- Cadastro de usuários
- Autenticação com JWT
- Controle de acesso baseado em roles (admin e user)
- Gerenciamento de usuários

## Requisitos

- JDK 17 ou superior
- MySQL 8.0 ou superior
- Maven

## Configuração

1. Clone o repositório
2. Configure o banco de dados MySQL no arquivo `application.properties`
3. Execute o projeto usando Maven:
```bash
mvn spring-boot:run
```

## Endpoints da API

### Autenticação

- POST `/api/auth/signup` - Cadastro de novo usuário
- POST `/api/auth/signin` - Login e obtenção do token JWT

### Usuários

- GET `/api/users` - Listar todos os usuários (apenas admin)
- GET `/api/users/{id}` - Obter usuário por ID (admin ou próprio usuário)
- PUT `/api/users/{id}` - Atualizar usuário (admin ou próprio usuário)
- DELETE `/api/users/{id}` - Deletar usuário (apenas admin)

## Exemplos de Uso

### Cadastro de Usuário

```json
POST /api/auth/signup
{
    "name": "Usuário Teste",
    "email": "teste@email.com",
    "password": "senha123",
    "roles": ["user"]
}
```

### Login

```json
POST /api/auth/signin
{
    "email": "teste@email.com",
    "password": "senha123"
}
```

## Segurança

- Todas as senhas são criptografadas usando BCrypt
- Tokens JWT são usados para autenticação
- Controle de acesso baseado em roles
- Proteção contra CSRF
- Validação de dados de entrada

## Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request 