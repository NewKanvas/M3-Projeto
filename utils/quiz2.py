import os
from time import sleep
from utils.cores import *
from utils.lines import *
from utils.aluno import Aluno


def sair(x):
    x = str(x)
    if x == "0":
        print(f"{g}\nObrigado por usar nosso Quiz.{rt}")
        print(f"{g}Respostas foram salvas no arquivo {y}'alunos.csv'.{rt}")
        sleep(1)


def obter_input(pergunta, resposta_invalida=None):
    while True:
        os.system("cls")
        title = pergunta.capitalize()
        overline(title, "─", 4)
        print(f"{y}Em qualquer momento, digite '0' para sair:{rt}")
        print(f"\n\n{pergunta}")
        underline(title, "─", 4)

        resposta = input(">> ")

        sair(resposta)

        if resposta_invalida and not resposta_invalida(resposta):
            print(resposta_invalida(resposta))
            sleep(1)
            continue

        return resposta


def nome(respostas):
    pergunta = "Digite o nome do aluno"
    resposta = obter_input(pergunta)
    respostas["Nome"] = resposta
    return resposta


def data_nasc(respostas):
    pergunta = "Digite a data de nascimento do aluno (sem /):"
    resposta_invalida = (
        lambda r: f"\n{r}Data de nascimento inválida. Insira 8 dígitos numéricos.{rt}"
        if not r.isdigit() or len(r) != 8
        else None
    )
    resposta = obter_input(pergunta, resposta_invalida)
    respostas["Data_Nascimento"] = resposta
    return resposta


def genero(respostas):
    pergunta = "Digite o número correspondente ao gênero do aluno:"
    resposta_invalida = (
        lambda r: f"{r}Opção inválida. Escolha entre 1, 2 ou 3.{rt}"
        if not r.isdigit() or int(r) not in [1, 2, 3]
        else None
    )
    resposta = obter_input(pergunta, resposta_invalida)
    respostas["Genero"] = (
        "Masculino"
        if resposta == "1"
        else "Feminino"
        if resposta == "2"
        else "Não Binário"
    )
    return resposta


def endereco(respostas):
    pergunta = "Digite o endereço do aluno:"
    resposta = obter_input(pergunta)
    respostas["Endereço"] = resposta
    return resposta


def email(respostas):
    pergunta = "Digite o email do aluno:"
    resposta = obter_input(pergunta)
    respostas["Email"] = resposta
    return resposta


def telefone(respostas):
    pergunta = "Digite o telefone do aluno (sem DDD):"
    resposta_invalida = (
        lambda r: f"\n{r}Telefone inválido. Insira 9 dígitos numéricos.{rt}"
        if not r.isdigit() or len(r) != 9
        else None
    )
    resposta = obter_input(pergunta, resposta_invalida)
    respostas["Telefone"] = resposta
    return resposta


def iniciar():
    while True:
        respostas = {}

        nome(respostas)
        if respostas["Nome"] == "0":
            break

        data_nasc(respostas)
        if respostas["Data_Nascimento"] == "0":
            break

        genero(respostas)
        if respostas["Genero"] == "0":
            break

        endereco(respostas)
        if respostas["Endereço"] == "0":
            break

        email(respostas)
        if respostas["Email"] == "0":
            break

        telefone(respostas)
        if respostas["Telefone"] == "0":
            break

        aluno = Aluno(
            respostas["Nome"],
            respostas["Data_Nascimento"],
            respostas["Genero"],
            respostas["Endereço"],
            respostas["Email"],
            respostas["Telefone"],
        )
        aluno.salvar()


# a = Aluno("Axl", "18/11/2004", "Masculino", "Rua A", "e@mail", "99999999")
# a.salvar()
