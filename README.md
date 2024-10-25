<h1 align="center">Tractian Challenge</h1>
<p align="center">
  <a href="https://github.com/JoaoBall/projeto_atividade">
    <img alt="Made by João Vitor" src="https://img.shields.io/badge/-Github-3D7BF7?style=for-the-badge&logo=Github&logoColor=white&link=https://github.com/Anderson-Andre-P" />
  </a>
  <a href="https://www.linkedin.com/in/joaovitorsantosmartins/">
      <img alt="João Vitor" src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
   </a>
  </p>

  Este projeto foi desenvolvido como parte do desafio para a vaga na Tractian. Ele consiste em um aplicativo Flutter que gerencia ativos e localizações, permitindo a pesquisa e aplicação de filtros específicos para exibir informações relevantes.

## :link: Demo

<details>

<summary>Clique em mim para ver uma imagem de demonstração do aplicativo</summary>

|           Splash            |          Home           |            All Assets                 |
| :-------------------------: | :---------------------: |   :-----------------------------:     |
| ![Splash](/Demo/splash.jpg) | ![Home](/Demo/home.jpg) | ![Settings](/Demo/lista_assets.jpg)   |

|             Assets Filter 01             |             Assets Filter 02              |             Assets Filter 03              |
| :---------------------------------: | :---------------------------------------: | :---------------------------------------: |
| ![All Assets](/Demo/filtro_nome.jpg) | ![Assets Filter 01](/Demo/filtro_critico.jpg) | ![Assets Filter 02](/Demo/filtro_energia.jpg) |

</details>

## Funcionalidades

- Listagem de Ativos e Localizações.
- Pesquisa por nome de Ativo ou Localização.
- Filtros:
  - Status Crítico
  - Tipo de Sensor de Energia


## Tecnologias Utilizadas

- Flutter
- DIO e HTTP para requisições de API.

## Desafios e Soluções

### Filtros e Pesquisa

Um dos desafios foi garantir que a pesquisa e os filtros funcionassem corretamente em conjunto. A solução foi criar um método applyFilters que atualiza os filtros sempre que há uma mudança no estado.

### Hierarquia de Assets e Locations

Outro desafio foi gerenciar a hierarquia de localizações, garantindo que sublocalizações sejam filtradas corretamente e adicionadas em uma tree. O widget TreeViewWidget foi criado para gerenciar essa hierarquia.

### Considerações Finais

Este projeto foi uma excelente oportunidade para aplicar conhecimentos de Flutter e como gerenciar filtros de estado e strings utilizando uma api sem fazer utilização do SQlite. Agradeço pela oportunidade e estou à disposição para quaisquer dúvidas ou esclarecimentos.

## Contato

Em caso de dúvida ou sugestão sobre o projeto, fico a disposição atraves do meu e-mail joaovitorsantosmartins22@gmail.com .

<a href="#top">Voltar ao topo</a>

  