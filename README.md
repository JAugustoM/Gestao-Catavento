# 2024/2 - RUNA FEHU  
<p align="center">
  <img src="./srcRD/catavento.jpeg" height='350px'>
</p>

# Sobre
A empresa Catavento, cliente da equipe Fehu, é especializada na manufatura e comercialização de produtos para festas, com destaque para os bolos "fakes". No momento, o processo produtivo desses bolos é gerenciado de maneira informal e manual, utilizando uma planilha de demandas. Esta planilha é impressa e distribuída entre os departamentos responsáveis. Após a conclusão das demandas, os funcionários registram as informações diretamente na planilha, o que pode gerar inconsistências e dificultar o acompanhamento do processo.  
Além disso, a cliente mencionou situações em que os funcionários, conscientes de todas as demandas futuras, tendem a priorizar a entrega de tarefas mais simples em detrimento das que exigem maior esforço. 
Nesse contexto, surge a oportunidade de implementar uma solução tecnológica que centralize o controle das demandas. Essa abordagem permitirá que: 

- Gerentes de cada departamento tenham acesso em tempo real ao status de cada demanda, assegurando um melhor controle da produção. 

- Funcionários possam visualizar apenas a demanda atual, evitando a priorização de tarefas específicas em detrimento de outras, o que promoverá uma gestão mais equilibrada e eficiente das atividades. 

# Objetivo e Tecnologias
O aplicativo tem como principal objetivo otimizar o gerenciamento das demandas do processo produtivo dos bolos "fakes". Ele substituirá a abordagem atual, que utiliza uma planilha impressa, por uma solução tecnológica que facilitará o controle da produção. 
 

Para o desenvolvimento do projeto, serão empregadas as seguintes tecnologias: 

1. Linguagem Dart: Esta é a principal linguagem utilizada, tanto para a definição do frontend através do Flutter, quanto para a implementação da lógica de negócios e a comunicação com o Supabase. 

1. Flutter: Um framework de desenvolvimento mobile multiplataforma, que será utilizado na construção do frontend da aplicação. 

1. Supabase: Um serviço de backend que oferece diversas ferramentas, incluindo comunicação com um banco de dados PostgreSQL e autenticação de usuários com diferentes níveis de acesso, entre outros recursos. 

# Principais Recursos
- Integração de um sistema de transferência de informação de uma planilha excel para o aplicativo visando fácil adição das demandas.
- Gerenciamento e acompanhamento demandas por um menu com quadro de prioridade, demandas completas, restantes, em fabricação e em espera.
- Gerenciamento de funcionários e metas.

# Como Executar o Projeto

O projeto pode ser executado seja utilizando os [binários](https://github.com/FGA0138-MDS-Ajax/2024.2-Fehu/releases/tag/v0.9.0-beta) compilados pela equipe, disponíveis na aba [Releases](https://github.com/FGA0138-MDS-Ajax/2024.2-Fehu/releases), ou compilando o projeto como orientado abaixo.

## Pré-requisitos

Para executar o projeto é necessário ter instalado o Flutter, seja para desenvolvimento Android ou para Windows. Informações de como instalar o Flutter podem ser vistos na [documentação](https://docs.flutter.dev/get-started/install) do mesmo.

Além disso, para compilar o projeto para Android é necessário a utilização do Java JDK 17 especificamente, para especificar o caminho da JDK pode ser utilizado o seguinte comando: 

```bash
flutter config --jdk-dir <path_to_jdk>
```

## Clonar o Repositório

Para compilar o projeto clone o repositório em sua máquina pessoal utilizando o comando:

```bash
git clone https://github.com/FGA0138-MDS-Ajax/2024.2-Fehu.git
```

## Instalar Dependências

Já dentro da pasta do projeto, utilize os comandos a seguir para entrar na pasta com os arquivos do flutter, instalar as dependências do projeto e atualizar essas dependências, respectivamente:

```bash
cd catavento
```

```bash
flutter pub get
```

```bash
flutter pub upgrade
```

## Rodando o Projeto

Tendo executado todos os passos anteriores basta executar o comando a seguir para executar o projeto localmente.

```bash
flutter run
```

# Autores

 <table>
    <tr>
     <td valign="top">
        <a href="https://github.com/xt2012">
          <img align="center" src="https://github.com/xt2012.png" height="100" />
          <p align="center"> Henrique Bernardes </p>
        </a>
      </td>
     <td valign="top">
        <a href="https://github.com/dudaa28">
          <img align="center" src="https://github.com/dudaa28.png" height="100" />
          <p align="center"> Maria Eduarda </p>
        </a>
      </td>
      <td valign="top">
        <a href="https://github.com/gabrieladouradof">
          <img align="center" src="https://github.com/gabrieladouradof.png" height="100" />
          <p align="center"> Gabriela Dourado </p>
        </a>
      </td>
      <td valign="top">
        <a href="https://github.com/JAugustoM">
          <img align="center" src="https://github.com/JAugustoM.png" height="100" />
          <p align="center"> José Augusto </p>
        </a>
      </td>
      <td valign="top">
        <a href="https://github.com/marianaps2701">
          <img align="center" src="https://github.com/marianaps2701.png" height="100" />
          <p align="center"> Mariana Pereira </p>
        </a>
      </td>
      <td valign="top">
        <a href="https://github.com/Pedro-Henrique3">
          <img align="center" src="https://github.com/Pedro-Henrique3.png" height="100" />
          <p align="center"> Pedro Henrique </p>
        </a>
      </td>
      <td valign="top">
        <a href="https://github.com/danielle-soaress">
          <img align="center" src="https://github.com/danielle-soaress.png" height="100" />
          <p align="center"> Danielle Soares </p>
        </a>
      </td>
      <td valign="top">
        <a href="https://github.com/Leticia-Arisa-K-Higa">
          <img align="center" src="https://github.com/Leticia-Arisa-K-Higa.png" height="100" />
          <p align="center"> Leticia Arisa</p>
        </a>
      </td>
       <td valign="top">
        <a href="https://github.com/Prg-maker">
          <img align="center" src="https://github.com/Prg-maker.png" height="100" />
          <p align="center"> Daniel Fernandes </p>
        </a>
      </td>
             <td valign="top">
        <a href="https://github.com/SamaraAlvess">
          <img align="center" src="https://github.com/SamaraAlvess.png" height="100" />
          <p align="center"> Samara Alves </p>
        </a>
      </td>
    </tr>
  </table>