# Trainer
<p align="center">
<a href=''><img src='https://badgen.net/badge/iOS/17.0/:color?icon=apple'/></a>
<a href=''><img src='https://badgen.net/badge/Swift/5.9/orange'/></a>
<a href=''><img src='https://badgen.net/badge/Xcode/15.4/blue'/></a>
<a href=''><img src='https://badgen.net/badge/cocoapods/1.15.2/red?icon=cocoapods'/></a>
<a href=''><img src='https://badgen.net/badge/Ruby/3.1.4/red?icon=ruby'/></a>
</p>

Trainer é um aplicativo de treino inovador projetado para gerenciar múltiplos usuários e oferecer treinos personalizados de acordo com o perfil de cada um. Além disso, o Trainer permite a criação de treinos 100% customizados, adaptando-se às necessidades e objetivos específicos de cada usuário.

## Objetivo

Nosso objetivo é proporcionar uma experiência de treino eficiente e personalizada. Com o Trainer, os usuários podem:

- Receber treinos personalizados com base no seu perfil individual.
- Criar e personalizar seus próprios treinos de acordo com suas preferências e necessidades específicas.
- Gerenciar e acompanhar seu progresso ao longo do tempo.

## Tecnologias Utilizadas

Para oferecer uma experiência robusta e fluida, estamos utilizando as seguintes tecnologias:

- **XcodeGen**: Para gerar e gerenciar a estrutura do projeto Xcode de forma automatizada.
- **SwiftUI**: Para construir a interface do usuário de forma declarativa, permitindo uma experiência de uso intuitiva e responsiva.
- **SwiftData**: Para gerenciar e armazenar os dados de usuários e treinos de forma eficiente.

Além dessas, estamos integrando outras tecnologias modernas para garantir a melhor performance e usabilidade do aplicativo.


## Estrutura de Pastas

```
├── tools.sh
├── Rakefile
├── project.yml
├── Podfile
├── Gemfile
├── scripts
│   ├── podfile
│   └── rakefile
├── spm
├── xcodegen
└── libraries
    ├── core
    ├── domain
    └── ui
└── apps
    └── iOS
```

## Descrição dos Arquivos
- **tools.sh**: Script para instalação de ferramentas auxiliares do projeto.
- **Rakefile**: Script de automação utilizando Rake.
- **project.yml**: Arquivo de configuração para o XcodeGen.
- **Podfile**: Arquivo de definição de dependências do CocoaPods.
- **Gemfile**: Arquivo de definição de dependências do RubyGems.

## Como Configurar o Projeto

### Passo 1: Instalar Ferramentas Auxiliares

Execute o script `tools.sh` para instalar todas as ferramentas necessárias.

```sh
./tools.sh
```

### Passo 2: Automação com Rake

Você pode utilizar o Rake para diversas automações definidas no Rakefile. Por exemplo:

#### Gerar Projeto Xcode

Para gerar o projeto Xcode e instalar dependências do CocoaPods:

```sh
rake xcode:generate
```

#### Automação de Bibliotecas

Para abrir o arquivo `Package.swift` de automação:

```sh
rake libraries:project
```

Para criar um novo módulo de biblioteca:

```sh
rake libraries:create
```