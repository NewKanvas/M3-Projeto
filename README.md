# Projeto Resilia - Banco de Dados

## Descrição
Este projeto faz parte do Módulo 3 da Resilia, com o objetivo de modernizar o processo de armazenamento de dados e gerenciamento da estrutura de ensino da empresa.

## Conteúdo do Projeto
- [Contexto](#contexto)
- [Requisitos](#requisitos)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Funcionalidades](#funcionalidades)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Guia do Projeto](#guia-do-projeto)
- [Como Executar](#como-executar)
- [Contribuidores](#contribuidores)
- [Licença](#licença)
- [Status](#status)

## Contexto
O projeto envolve a modernizar o processo
de armazenamento de dados e construção para gerenciamento da estrutura
de ensino da empresa; 
Criação da modelagem do banco de dados, scripts SQL para criação e inserção de dados, além da execução de consultas estratégicas para a área de ensino da Resilia.

## Requisitos
- Representação das entidades e os respectivos atributos de cada uma delas;
- Modelagem completa do banco de dados com entidades, atributos e relacionamentos;
- Scripts SQL de criação do banco de dados e das respectivas tabelas com seus atributos e chaves;
- Scripts SQL de inserção dos dados nas respectivas tabelas;
- Scripts SQL com a resolução das 6 perguntas estratégicas da empresa.

## Tecnologias Utilizadas
- **Python:** Linguagem de programação utilizada para o desenvolvimento do menu.
- **CSV:** Formato de arquivo utilizado para armazenar dados localmente.
- **SQL:** Linguagem de consulta utilizada para interagir com o banco de dados.

## Funcionalidades
- Cadastro de Alunos, Facilitadores, Cursos e Turmas
- Consultas Estratégicas sobre os Dados
- Utilização de Banco de Dados para Armazenamento

## Estrutura do Projeto
O projeto está estruturado da seguinte forma:
- `index.py`: Contém o menu principal e a lógica de execução.
- `utils/`: Diretório com módulos utilitários.
  - `cores.py`: Cores para melhorar a apresentação no console.
  - `lines.py`: Funções para desenhar linhas decorativas.
  - `quiz.py`: Lógica relacionada ao quiz e armazenamento de dados.

## Guia do Projeto
- [PDF com Instruções e Detalhes do Projeto](https://resilia-files-production.s3.amazonaws.com/material/student/1694009852_SEDadosM3Projetoemgrupopdf.pdf?AWSAccessKeyId=ASIA5NG2YCRHAYDR5ANO&Expires=1700687524&Signature=N9ozkC4ThwUxlY55KDE9%2BY6MVN8%3D&x-amz-security-token=IQoJb3JpZ2luX2VjENP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIGTrySYLrbyJNC3KRiLIOILZEqjIvNx92Fazq8CIvwM8AiABaei8Yuvcq2XrZzTIaaP2KAP4o05dpAEERccP2cdgeCqzBQgsEAIaDDkyMTcyOTI0MjE5MCIMWkRfIYAH4X1cHr7WKpAFqeVx3KkZHk2VgI1Pa4n74wmeOgOWDGOFtBj0%2F2ZqG%2Fxr05npx%2BPLsbBmNgo7wkE9hvi0qQ3wtpTGYzBfx5fj6skCBKnWiSCm1tWeYKRjs7XyMEZNF4tatrBFj5RpFOXI%2FKeLxNuU6Y4MTG5IMHb3xMU5vDp%2ByAwt6Ggsz0lKtKbTxlEs%2BX4650H0YzweWB1yU2S%2BP9lI5O7xJWXNrtPb2FnpSVQL2%2B6rwOLHnfEWqJjVRoRXBexRlJ1%2BbJDDI2iiW5ceURx5QVcxeD2ilh9J%2FUIKQweNwd4ebcP%2BJgW4qModU7DAG57elVNK5vcoVH7D2y54CutanrFfAPsMUzs%2F6PcNS2Y%2F6nwGHEDKod%2BKwxHSNFSCsHwnOh7EqZydu4OTNoxkE%2BxAQvvKMF5I6qWkY%2BuE5SJV5arH49g8LTg0W6Yp%2BvxVJkvnknn6SKitpvbb6Osr2OZ36kzDNDECEUjsh6Swn2ayrYV2fFzgbcaa%2BKTjGyjtgPBMZCoLv7XprSSVUolIvYpL32D6vlm2rgoAOAVaUsDuh66i1w2SDeycUwqopZn4nynBAPfqIrS2BRXsKmlmYibXwpWk4fZntZnQsSv0MAyU6It%2BNKamleqFidjzDgMDQTAUupoah2c6WycDYQwiL1PoyDW930dazVZjgjR%2BL9ZH%2Bu20QptoiJSNL1sYyWpDbP%2FWVscLm2KIjOwOIvyXsXqowIqN%2FUC3P%2FGXH6HvolSEvE4Z3LzGAq26ZOUkd1vo7aD0XW09WdXnLHAF1v6%2Fy2CF44inowstkEy5hLpXR43Ecm6RyiDlw1rt2wfbX2eoUGNDDTDUoRC43WjQaL8GOBFtXk2z3bFQC40IyEC0peqIy72yS6RT67g%2FO4kw3b73qgY6sgFXo1ge9t%2B%2F8uPxAggO9iVgGFepLVnr4%2Fflb7Q8U7bLiWqAOEFcZpjSbf0yFWetrhkMEkRcvJcE8cQTNq2teRELQ5sOApXQ7L2n%2Fs81MLgCs37pKm1vAd7RubqrWCsk%2BqnWFr0I1KwhpUBCK1QcvYThdUJ1VOnTe%2BEoafCTib3iIUafBhBOWcjcxfg2068f37Aeco1U52%2FcdUBnpyq%2BM25kFplvIxvmRaL%2BoeYSmT4HEQM1)

## Como Executar
1. Clone o repositório para a sua máquina.
2. Execute os scripts SQL para criação e inserção de dados no banco.
3. Execute as consultas SQL propostas para análise exploratória.

## Contribuidores
- [Alessandro Brito](link-para-o-perfil-no-github)
- [Cássio Ramos](link-para-o-perfil-no-github)

## Licença

Este projeto é licenciado sob a [Licença MIT](LICENSE).

## Status

![GitHub Repo Size](https://img.shields.io/github/repo-size/NewKanvas/Projeto3?style=for-the-badge&logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/NewKanvas/Projeto3?style=for-the-badge&logo=git)
[![Licence](https://img.shields.io/github/license/NewKanvas/Projeto3?style=for-the-badge)](./LICENSE)
![Downloads](https://img.shields.io/github/downloads/NewKanvas/Projeto3/total?style=for-the-badge)
![Forks](https://img.shields.io/github/forks/NewKanvas/Projeto3?style=for-the-badge)
![Watchers](https://img.shields.io/github/watchers/NewKanvas/Projeto3?style=for-the-badge)
![Stars](https://img.shields.io/github/stars/NewKanvas/Projeto3?style=for-the-badge)
![Issues](https://img.shields.io/github/issues/NewKanvas/Projeto3?style=for-the-badge)
