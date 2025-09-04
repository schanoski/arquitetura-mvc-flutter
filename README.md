
# arquitetura_mvc

## História do MVC
O padrão MVC (Model-View-Controller) foi criado por Trygve Reenskaug em 1979, enquanto trabalhava na Xerox PARC. Inicialmente, o objetivo era organizar interfaces gráficas em aplicações Smalltalk, separando claramente a lógica de dados, a apresentação visual e o controle das interações do usuário. Com o tempo, o MVC se tornou um dos padrões de arquitetura mais populares, sendo adotado em diversas linguagens e frameworks, como Java, .NET, Ruby on Rails, e também em aplicações web e mobile modernas. Sua principal força está na separação de responsabilidades, facilitando manutenção, testes e evolução dos sistemas.

## Aula Completa: Padrão MVC no Flutter
### O que é MVC?
O padrão MVC (Model-View-Controller) é uma arquitetura de software que separa a aplicação em três camadas principais:

```
┌─────────────────────────────────────────────────────────┐
│                    PADRÃO MVC                           │
│                                                         │
│  ┌─────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │  VIEW   │◄──►│ CONTROLLER  │◄──►│    MODEL    │     │
│  │         │    │             │    │             │     │
│  │ • UI    │    │ • Lógica    │    │ • Dados     │     │
│  │ • Telas │    │ • Eventos   │    │ • API       │     │
│  │ • Forms │    │ • Estado    │    │ • Negócio   │     │
│  └─────────┘    └─────────────┘    └─────────────┘     │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

- **Model (Modelo):** Responsável pela lógica de dados, regras de negócio e comunicação com fontes externas (APIs, banco de dados, etc).
- **View (Visão):** Responsável pela interface gráfica e apresentação dos dados ao usuário.
- **Controller (Controlador):** Responsável por receber as ações do usuário, manipular os dados (Model) e atualizar a interface (View).


### Quando usar o MVC na empresa?
O padrão MVC é indicado principalmente para apps Flutter que:
- Possuem múltiplas telas ou funcionalidades complexas.
- Precisam de manutenção frequente e evolução constante.
- Demandam testes automatizados de widgets e lógica separadamente.
- Envolvem equipes grandes, onde a separação de responsabilidades é essencial.

#### Vantagens do uso do MVC na empresa
- Facilita o trabalho colaborativo entre desenvolvedores Flutter em diferentes camadas.
- Torna o código Flutter mais organizado e sustentável a longo prazo.
- Melhora a testabilidade de widgets, lógica de negócio e modelos separadamente.
- Permite reaproveitamento de widgets, controllers e modelos em diferentes telas.

```
CENÁRIO DE EQUIPE FLUTTER TRABALHANDO COM MVC:

┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  FLUTTER DEV 1  │    │  FLUTTER DEV 2  │    │   UX/UI DEV     │
│                 │    │                 │    │                 │
│ Trabalha nas    │    │ Trabalha nos    │    │ Colabora nas    │
│ VIEWS           │    │ CONTROLLERS     │    │ VIEWS (design)  │
│                 │    │                 │    │                 │
│ • Widgets       │    │ • Riverpod      │    │ • Layouts       │
│ • Screens       │    │ • Estado        │    │ • Componentes   │
│ • Navigation    │    │ • Business Logic│    │ • Material/iOS  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────────┐
                    │ FLUTTER DEV 3   │
                    │                 │
                    │ Trabalha nos    │
                    │ MODELS/SERVICES │
                    │                 │
                    │ • APIs REST     │
                    │ • Modelos Dart  │
                    │ • Validações    │
                    └─────────────────┘
```

#### Desvantagens do uso do MVC na empresa
- Pode aumentar a complexidade inicial em projetos Flutter simples.
- Exige disciplina na separação das camadas para evitar widgets com muita lógica.
- Pode gerar mais arquivos Dart e código boilerplate desnecessário.
- Nem sempre é a melhor escolha para apps Flutter muito simples ou protótipos rápidos.

### MVC vs Clean Architecture vs MVVM

#### Quando usar MVC:
- **Projetos pequenos a médios** com estrutura relativamente simples
- **Equipes iniciantes** em arquitetura de software
- **Prototipação rápida** onde a simplicidade é prioridade
- **Apps com poucas integrações** externas
- **Quando o time já conhece** o padrão MVC

#### Quando usar MVVM (Model-View-ViewModel):
- **Apps com interfaces complexas** e muito binding de dados
- **Quando há muita lógica de apresentação** (formatação, validação visual)
- **Projetos que usam** gerência de estado como BLoC ou Provider intensivamente
- **Separação clara entre lógica de negócio** e lógica de apresentação
- **Apps com muitas animações** e estados visuais complexos

#### Quando usar Clean Architecture:
- **Projetos grandes e complexos** com múltiplos módulos
- **Apps corporativos** que precisam de alta testabilidade
- **Sistemas que integram** múltiplas fontes de dados (API, cache, local storage)
- **Projetos de longo prazo** com muitas mudanças de requisitos
- **Equipes experientes** que precisam de máxima separação de responsabilidades
- **Quando há necessidade** de trocar facilmente frameworks ou fontes de dados

```
COMPLEXIDADE vs BENEFÍCIO:

Simples ←──────────────────────────────────→ Complexo
   │                                              │
   MVC                MVVM            Clean Arch  │
   │                   │                    │     │
   ├─ Rápido          ├─ Binding forte     ├─ Testável
   ├─ Fácil           ├─ UI complexa       ├─ Flexível  
   └─ Direto          └─ Estados visuais   └─ Escalável
```

### Problemas e Desafios do MVC
- **Complexidade inicial:** Para projetos pequenos, pode parecer “exagerado” separar tudo em camadas.
- **Comunicação entre camadas:** Em projetos grandes, pode ser difícil gerenciar a comunicação entre Controller, Model e View.
- **Boilerplate:** Pode gerar código repetitivo, principalmente em Flutter, onde widgets já possuem lógica de estado.
- **Manutenção:** Se não houver disciplina na separação, o Controller pode acabar acumulando muita responsabilidade.

### Exemplo prático neste projeto
Neste projeto, usamos o MVC com Riverpod para gerenciar o estado e a comunicação entre as camadas:

```
ESTRUTURA DO PROJETO MVC + FLUTTER

lib/
├── models/
│   └── todo_model.dart          ← MODEL: Define estrutura dos dados
├── services/
│   └── todo_service.dart        ← SERVICE: Comunicação com APIs
├── controllers/
│   └── todo_controller.dart     ← CONTROLLER: Lógica e estado
├── views/
│   └── todo_view.dart           ← VIEW: Interface do usuário
└── main.dart                    ← ENTRY POINT: Inicialização

FLUXO DE DADOS:
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│    VIEW     │───►│ CONTROLLER  │───►│   SERVICE   │
│ (todo_view) │    │(todo_control│    │(todo_service│
│             │◄───│    ler)     │◄───│    .dart)   │
└─────────────┘    └─────────────┘    └─────────────┘
       ▲                  │                   │
       │                  ▼                   ▼
       │           ┌─────────────┐    ┌─────────────┐
       └───────────│   RIVERPOD  │    │  API/MODEL  │
                   │  (Estado)   │    │ (Dados)     │
                   └─────────────┘    └─────────────┘
```

- O **Model** está em `lib/models/todo_model.dart`.
- O **Service** (auxiliar do Model) está em `lib/services/todo_service.dart`.
- O **Controller** está em `lib/controllers/todo_controller.dart`.
- A **View** está em `lib/views/todo_view.dart`.

O Controller utiliza o Service para buscar dados de uma API, e a View consome o Controller via Riverpod, exibindo os dados e permitindo navegação entre diferentes TODOs.
