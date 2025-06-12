# 💼 Success Clinic

Success Clinic é um aplicativo desenvolvido com Flutter para gerenciamento de atendimentos clínicos, focando na organização de pacientes, agendamentos e usuários.

---

## 📱 Tecnologias Utilizadas

- Flutter
- Dart

---

## 📁 Estrutura do Projeto

```bash
lib/
│
├── core/                       # Núcleo reutilizável
│   ├── routes/                 # Todas as rotas nomeadas do app
│   │   └── app_routes.dart
│   ├── shared/                 # Temas, constantes, helpers genéricos
│   │   ├── constants.dart
│   │   ├── themes.dart
│   │   └── widgets/
│   │       └── custom_button.dart
│   └── services/               # Serviços globais, como local storage
│       └── storage_service.dart
│
├── data/                       # Fonte de dados (local ou remoto)
│   ├── datasources/            # Implementações concretas (SharedPreferences, APIs, Firebase, etc)
│   │   └── local_auth_datasource.dart
│   ├── models/                 # Representações serializáveis (DTOs)
│   │   └── user_model.dart
│   └── repositories/           # Implementações dos contratos da domain
│       └── auth_repository_impl.dart
│
├── domain/                     # Regras de negócio puras
│   ├── entities/               # Entidades do domínio (sem dependência externa)
│   │   └── user.dart
│   ├── repositories/           # Interfaces/contratos que a camada data implementa
│   │   └── auth_repository.dart
│   └── usecases/               # Casos de uso (regras de aplicação)
│       ├── login_usecase.dart
│       ├── register_usecase.dart
│       └── check_login_usecase.dart
│
├── presentation/              # Tudo que o usuário vê e interage
│   ├── login/
│   │   └── login_screen.dart
│   ├── register/
│   │   └── register_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── controllers/            # Gerenciadores de estado por módulo
│   │   └── auth_controller.dart
│   └── widgets/                # Widgets específicos da interface (cards, fields, etc.)
│       └── login_field.dart
│
└── main.dart                   # Inicialização da aplicação

# success_clinic
Aplicativo Flutter para gerenciamento de medicamentos e médicos, utilizando Hive como banco de dados local. Permite salvar, listar e organizar informações como nome, especialidade, CRM e prescrições de forma offline, com suporte a serialização JSON.

