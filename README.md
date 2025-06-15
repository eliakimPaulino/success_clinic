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
├── main.dart                          # Ponto de entrada da aplicação Flutter
│
├── core/                              # Configurações e recursos reutilizáveis do núcleo da aplicação
│   ├── hive_config.dart               # Inicialização e configuração do Hive
│   ├── injector.dart                  # Injeção de dependências geral
│
│   ├── constants/                     # Constantes globais (strings, números fixos, etc.)
│   │   └── app_strings.dart           # Strings reutilizáveis por todo o app
│
│   ├── di/                            # Arquitetura de injeção de dependência
│   │   └── injection.dart             # Registro dos providers e bindings
│
│   ├── routes/                        # Gerenciamento centralizado das rotas
│   │   └── app_routes.dart            # Definição de todas as rotas nomeadas
│
│   ├── shared/                        # Componentes visuais reutilizáveis
│   │   └── widgets/                   # Widgets compartilhados
│   │       ├── primary_button.dart    # Botão padrão reutilizável
│   │       └── snackbars.dart         # Métodos para exibir SnackBars customizadas
│
│   ├── theme/                         # Gerenciamento de tema do app
│   │   ├── app_theme.dart             # Definições de tema (cores, fontes, etc.)
│   │   └── theme_provider.dart        # Controle dinâmico do tema (claro/escuro)
│
│   └── utils/                         # Utilitários e helpers genéricos
│       └── validators.dart            # Funções para validação de formulários e dados
│
├── data/                              # Implementações concretas e fontes de dados
│   ├── datasources/                   # Implementações de acesso a dados locais ou remotos
│   │   └── local_auth_datasource.dart # Fonte de autenticação usando armazenamento local
│
│   └── repositories/                   # Implementações dos contratos da domain
│       ├── auth_repository_impl.dart   # Implementação da autenticação
│       ├── hive_medicamento_repository.dart # Acesso a dados de medicamentos via Hive
│       └── hive_medico_repository.dart     # Acesso a dados de médicos via Hive
│
├── domain/                             # Lógica de negócio pura e isolada
│   ├── entities/                       # Entidades do domínio (sem dependências externas)
│   │   ├── medication_entity.dart      # Entidade central de medicamento
│   │   └── user.dart                   # Entidade central de usuário
│
│   ├── repositories/                   # Interfaces que descrevem os contratos que a camada de data implementa
│   │   ├── auth_repository.dart
│   │   ├── i_medicamento_repository.dart
│   │   ├── i_medico_repository.dart
│   │   └── medication_repository.dart
│    
│   └── usecases/                       # Casos de uso do sistema, responsáveis por orquestrar lógica de aplicação
│       ├── doctor/                     # Casos de uso relacionados aos médicos
│       │   ├── cadastrar_medico_usecase.dart
│       │   ├── listar_medico_usecase.dart
│       │   └── remover_medico_usecase.dart
│
│       ├── login/                      # Casos de uso relacionados à autenticação
│       │   ├── check_login_usecase.dart
│       │   ├── get_currente_user_name.dart
│       │   ├── login_usecase.dart
│       │   ├── logout_usecase.dart
│       │   └── register_usecase.dart
│
│       └── user/                       # (Possivelmente redundante com login/, atenção à duplicidade)
│           ├── check_login_usecase.dart
│           ├── login_usecase.dart
│           └── register_usecase.dart
│
├── models/                             # Modelos serializáveis (com Hive/JSON)
│   ├── medicamento.dart                # Modelo de dados de medicamento
│   ├── medications_details_list.dart   # Lista de detalhes dos medicamentos
│   ├── medication_info_model.dart      # Informações complementares dos medicamentos
│   ├── medication_model.dart           # Modelo principal de medicamento (Hive)
│   ├── medication_model.g.dart         # Código gerado do Hive
│   ├── medico.dart                     # Modelo de médico
│   ├── url.dart                        # Modelo de URL
│   └── video_info.dart                 # Informações sobre vídeos
│
│   └── adapters/                       # Adaptadores Hive gerados para serialização
│       ├── medicamento.g.dart
│       └── medico.g.dart
│
└── presentation/                       # Camada de interface e interação com o usuário
    ├── controllers/                    # Gerenciadores de estado (Provider, Riverpod, etc.)
    │   ├── auth_controller.dart
    │   ├── medicamento_controller.dart
    │   ├── medication_controller.dart
    │   └── medico_controller.dart
    │
    ├── dashboard/                      # Tela principal após login
    │   ├── dashboard_screen.dart
    │   └── widgets/                    # Componentes visuais da dashboard
    │       ├── dashboard_header.dart
    │       ├── helper_widgets.dart
    │       ├── medication_list.dart
    │       └── medication_tile.dart
    │
    ├── doctors/                        # Tela e recursos relacionados aos médicos
    │   ├── doctors_screen.dart
    │   ├── data/
    │   │   └── dummy_doctors.dart      # Dados de exemplo para testes
    │   └── widgets/
    │       └── doctor_tile.dart        # Item visual da lista de médicos
    │
    ├── login/                          # Tela de login
    │   └── login_screen.dart
    │
    ├── medication_form/                # Formulário para cadastrar medicamentos
    │   ├── medication_form_screen.dart
    │   └── widgets/
    │       ├── dosage_dropdown.dart
    │       ├── interval_dropdown.dart
    │       └── medication_dropdown.dart
    │
    ├── medication_info/                # Tela com informações detalhadas sobre medicamentos
    │   ├── medication_info_screen.dart
    │   ├── data/
    │   │   └── video_info.dart         # Dados dos vídeos informativos
    │   └── widgets/
    │       ├── info_section.dart
    │       ├── medication_header.dart
    │       └── video_preview_tile.dart
    │
    └── register/                       # Tela de cadastro
        └── register_screen.dart

# success_clinic
Aplicativo Flutter para gerenciamento de medicamentos e médicos, utilizando Hive como banco de dados local. Permite salvar, listar e organizar informações como nome, especialidade, CRM e prescrições de forma offline, com suporte a serialização JSON.

