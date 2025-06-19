# Testes Unitários

Este diretório contém testes unitários para as classes principais do aplicativo DenebCorp Mobile. Estes testes foram projetados para rodar sem dependências externas (sem conexão com o Firebase, sem mocks).

## Estrutura dos Testes

### Testes de Entidades (`entities/`)
Testes para entidades de domínio que representam as principais estruturas de dados:

- **`cadastro_entity_test.dart`** - Testes para `CadastroEntity` (dados de cadastro de usuário)
- **`login_entity_test.dart`** - Testes para `LoginEntity` (credenciais de login)
- **`service_entity_test.dart`** - Testes para `ServiceEntity` (informações de serviço)
- **`service_offer_entity_test.dart`** - Testes para `ServiceOfferEntity` (ofertas de serviço)
- **`combined_service_offer_test.dart`** - Testes para `CombinedServiceOffer` (dados combinados de serviço e oferta)

### Testes de Repositórios (`repositories/`)
Testes para classes de repositório que manipulam operações de dados:

- **`cadastro_repository_test.dart`** - Testes para `RegisterRepository` (cadastro de usuário)
- **`login_repository_test.dart`** - Testes para `LoginRepository` (autenticação de usuário)
- **`buscar_repository_test.dart`** - Testes para `BuscarRepository` (busca de serviços)
- **`cadastrar_servico_repository_test.dart`** - Testes para `RegisterServiceRepository` (cadastro de serviço)

### Testes de DataSource (`datasources/`)
Testes para classes de fonte de dados que manipulam operações externas:

- **`remote_firesource_test.dart`** - Testes para `RemoteFiresource` (operações com Firebase)

## Como Rodar os Testes

### Rodar Todos os Testes
```bash
flutter test test/unit/all_tests.dart
```

### Rodar Arquivos de Teste Individualmente
```bash
# Rodar testes de entidades
flutter test test/unit/entities/cadastro_entity_test.dart
flutter test test/unit/entities/login_entity_test.dart
flutter test test/unit/entities/service_entity_test.dart
flutter test test/unit/entities/service_offer_entity_test.dart
flutter test test/unit/entities/combined_service_offer_test.dart

# Rodar testes de repositórios
flutter test test/unit/repositories/cadastro_repository_test.dart
flutter test test/unit/repositories/login_repository_test.dart
flutter test test/unit/repositories/buscar_repository_test.dart
flutter test test/unit/repositories/cadastrar_servico_repository_test.dart

# Rodar testes de datasource
flutter test test/unit/datasources/remote_firesource_test.dart
```

### Rodar Testes por Categoria
```bash
# Rodar todos os testes de entidades
flutter test test/unit/entities/

# Rodar todos os testes de repositórios
flutter test test/unit/repositories/

# Rodar todos os testes de datasource
flutter test test/unit/datasources/
```

## Cobertura dos Testes

Estes testes cobrem:

### Testes de Entidades
-  Validação do construtor
-  Acesso às propriedades
-  Funcionalidade do método `toMap()`
-  Funcionalidade do método `fromMap()` (quando aplicável)
-  Casos de borda (strings vazias, valores nulos, caracteres especiais)
-  Serialização de ida e volta (toMap -> fromMap)

### Testes de Repositórios
-  Verificação de implementação de interface
-  Validação dos parâmetros do construtor
-  Validação da assinatura dos métodos
-  Lógica básica de validação de entrada

### Testes de DataSource
-  Verificação de implementação de interface
-  Validação dos parâmetros do construtor
-  Validação da assinatura dos métodos
-  Lógica básica de validação (formato de e-mail, tamanho da senha, conversão de preço)
-  Validação da estrutura dos dados

