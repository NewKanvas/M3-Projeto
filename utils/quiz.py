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

        title = "Nome"
        overline(title, "─", 4)

        print(
            f"{y}Em qualquer momento, digite '0' para sair:{rt}",
            "\n\nDigite o nome do aluno",
        )
        underline(title, "─", 4)

        getinput()

        respostas["Nome"] = nome
        return nome


def data_nasc(respostas):
    while True:
        os.system("cls")

        title = "Data_Nascimento"
        overline(title, "─", 4)

        print("Digite a data de nascimento do aluno (sem /):")
        underline(title, "─", 4)

        data = input(">> ")
        sair(data)

        if data.isdigit() and len(data) == 8:
            respostas["Data_Nascimento"] = data
            return nome
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

        genero = input(">> ")

        sair(genero)

        if genero.isdigit():
            genero = int(genero)

            if genero in [1, 2, 3]:
                respostas["Genero"] = (
                    "Masculino"
                    if genero == 1
                    else "Feminino"
                    if genero == 2
                    else "Não Binário"
                )
                return genero
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

        local = input(">> ")

        sair(local)
        respostas["Endereço"] = local
        return local


def email(respostas):
    while True:
        os.system("cls")

        title = "Email"
        overline(title, "─", 4)

        print("Digite o email do aluno:")
        underline(title, "─", 4)

        mail = input(">> ")

        sair(mail)
        respostas["Email"] = mail
        return mail


def telefone(respostas):
    while True:
        os.system("cls")

        title = "Telefone"
        overline(title, "─", 4)

        print("Digite o telefone do aluno (sem DDD):")
        underline(title, "─", 4)

        n = input(">> ")

        sair(n)

        if n.isdigit() and len(n) == 9:
            respostas["Telefone"] = n
            return n
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
