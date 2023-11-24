import os
from time import sleep
from utils.cores import *
from utils.lines import *
from utils.aluno import Aluno


def getinput():
    x = input(">> ")

    if x == "0":
        print(f"{g}\nObrigado por usar nosso Quiz.{rt}")
        print(f"{g}Respostas foram salvas no arquivo {y}'alunos.csv'.{rt}")
        sleep(1)

    return x


def nome(respostas):
    while True:
        os.system("cls")

        title = "nome"
        overline(title, "─", 4)

        print(
            f"{y}Em qualquer momento, digite '0' para sair:{rt}",
            "\n\nDigite o nome do aluno",
        )
        underline(title, "─", 4)

        resposta = getinput()

        respostas["nome"] = resposta
        return resposta


def data_nasc(respostas):
    while True:
        os.system("cls")

        title = "data_nascimento"
        overline(title, "─", 4)

        print("Digite a data de nascimento do aluno (sem /):")
        underline(title, "─", 4)

        resposta = getinput()

        if resposta == "0":
            respostas["data_nascimento"] = resposta
            return resposta

        if resposta.isdigit() and len(resposta) == 8:
            respostas["data_nascimento"] = resposta
            return resposta
        else:
            print(
                f"\n{r}Data de nascimento inválida. Certifique-se de inserir 8 dígitos numéricos.{rt}"
            )
            sleep(1)
            continue


def genero(respostas):
    while True:
        os.system("cls")

        title = "Gênero"
        overline(title, "─", 4)

        print("Digite o número correspondente ao gênero do aluno:")
        print(f"{y}[1]{rt} - Masculino {y}[2]{rt} - Feminino {y}[3]{rt} - Não Binário")

        underline(title, "─", 4)

        resposta = getinput()

        if resposta == "0":
            respostas["genero"] = resposta
            return resposta

        if resposta.isdigit():
            resposta = int(resposta)

            if resposta in [1, 2, 3]:
                respostas["genero"] = (
                    "Masculino"
                    if resposta == 1
                    else "Feminino"
                    if resposta == 2
                    else "Não Binário"
                )
                return resposta
            else:
                print(f"{r}Opção inválida. Escolha entre 1, 2 ou 3.{rt}")
                sleep(1)
                continue
        else:
            print(f"{r}Entrada inválida. Digite um número.{rt}")
            sleep(1)
            continue


def endereco(respostas):
    while True:
        os.system("cls")

        title = "endereco"
        overline(title, "─", 4)

        print("Digite o endereco do aluno:")
        underline(title, "─", 4)

        resposta = getinput()

        respostas["endereço"] = resposta
        return resposta


def email(respostas):
    while True:
        os.system("cls")

        title = "email"
        overline(title, "─", 4)

        print("Digite o email do aluno:")
        underline(title, "─", 4)

        resposta = getinput()

        respostas["email"] = resposta
        return resposta


def telefone(respostas):
    while True:
        os.system("cls")

        title = "telefone"
        overline(title, "─", 4)

        print("Digite o telefone do aluno (sem DDD):")
        underline(title, "─", 4)

        resposta = getinput()

        if resposta == "0":
            respostas["telefone"] = resposta
            return resposta

        if resposta.isdigit() and len(resposta) == 9:
            respostas["telefone"] = resposta
            return resposta
        else:
            print(
                f"\n{r}Telefone inválido. Certifique-se de inserir 9 dígitos numéricos.{rt}"
            )
            sleep(1)
            continue


def iniciar():
    while True:
        respostas = {}

        nome(respostas)
        if respostas["nome"] == "0":
            break

        data_nasc(respostas)
        if respostas["data_nascimento"] == "0":
            break

        genero(respostas)
        if respostas["genero"] == "0":
            break

        endereco(respostas)
        if respostas["endereço"] == "0":
            break

        email(respostas)
        if respostas["email"] == "0":
            break

        telefone(respostas)
        if respostas["telefone"] == "0":
            break

        aluno = Aluno(
            respostas["nome"],
            respostas["data_nascimento"],
            respostas["genero"],
            respostas["endereço"],
            respostas["email"],
            respostas["telefone"],
        )
        aluno.salvar()


if __name__ == "__main__":
    iniciar()
