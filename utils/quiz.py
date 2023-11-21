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
        exit()


def nome(respostas):
    while True:
        os.system("cls")

        title = "Nome"
        overline(title, "─", 4)

        print(
            f"{y}Em qualquer momento, digite '0' para sair:{rt}",
            "\n\nDigite o nome do Paciente",
        )
        underline(title, "─", 4)

        nome = input(">> ")

        sair(nome)
        respostas["Nome"] = nome
        break


def idade(respostas):
    while True:
        os.system("cls")

        title = "Idade"
        overline(title, "─", 4)

        print("Digite a idade do Paciente")

        underline(title, "─", 4)

        idade = input(">> ")

        sair(idade)
        sair(idade)
        respostas["Idade"] = idade
        break


def genero(respostas):
    while True:
        os.system("cls")

        title = "Gênero"
        overline(title, "─", 4)

        print("Digite o número correspondente ao gênero do Paciente:")
        print(f"{y}[1]{rt} - Masculino {y}[2]{rt} - Feminino {y}[3]{rt} - Não Binário")

        underline(title, "─", 4)

        genero = input(">> ")

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
                break
            else:
                print(f"{r}Opção inválida. Escolha entre 1, 2 ou 3.{rt}")
                sleep(1)
                continue
        else:
            print(f"{r}Entrada inválida. Digite um número.{rt}")
            sleep(1)
            continue


def cpf(respostas):
    while True:
        os.system("cls")

        title = "CPF"
        overline(title, "─", 4)

        print("Digite o CPF do Paciente (sem pontos):")
        underline(title, "─", 4)

        cpf = input(">> ")

        if cpf.isdigit() and len(cpf) == 11:
            respostas["CPF"] = cpf
            break
        else:
            print(
                f"\n{r}CPF inválido. Certifique-se de inserir 11 dígitos numéricos.{rt}"
            )
            sleep(1)
            continue


def bairro(respostas):
    while True:
        os.system("cls")

        title = "Bairro"
        overline(title, "─", 4)

        print("Digite o bairro do Paciente:")
        underline(title, "─", 4)

        bairro = input(">> ")

        sair(bairro)
        respostas["Bairro"] = bairro
        break


def sintomas(respostas):
    while True:
        os.system("cls")

        title = "Sintomas"
        overline(title, "─", 4)

        print("Descreva os sintomas do Paciente:")
        underline(title, "─", 4)

        sintomas = input(">> ")

        sair(sintomas)
        respostas["Sintomas"] = sintomas
        break


def classificacao(respostas):
    while True:
        os.system("cls")
        title = "Classificacao"
        overline(title, "─", 4)

        print("Classifique o estado de saúde do Paciente.")
        print(
            f"{y}[1]{rt} - {b}Não Urgente{rt}  {y}[2]{rt} - {g}Pouco Urgente{rt} {y}[3]{rt} - {y}Urgente{rt} {y}[4]{rt} - {m}Muito Urgente{rt}  {y}[5]{rt} - {r}Emergência{rt}"
        )
        underline(title, "─", 4)

        classificacao = int(input("Digite o número correspondente à classificação: "))

        # Transformação da resposta de Classificação

        if classificacao == 1:
            respostas["Classificação"] = "Não Urgente"
            break
        elif classificacao == 2:
            respostas["Classificação"] = "Pouco Urgente"
            break
        elif classificacao == 3:
            respostas["Classificação"] = "Urgente"
            break
        elif classificacao == 4:
            respostas["Classificação"] = "Muito Urgente"
            break
        elif classificacao == 5:
            respostas["Classificação"] = "Emergência"
            break

        else:
            print(f"{r}Opção inválida. Tente novamente.{rt}")
            sleep(1)
            continue


def consultorio(respostas):
    while True:
        os.system("cls")
        title = "Encaminhar para Consultorio"
        overline(title, "─", 4)

        lista = {
            "Cardiologia": 11,
            "Cirurgia": 10,
            "Clinico Geral": 9,
            "Dermatologia": 8,
            "Ginecologia": 7,
            "Neurologia": 6,
            "Oftalmologia": 5,
            "Ortopedia": 4,
            "Pediatria": 3,
            "Raio X": 2,
            "Urologia": 1,
        }

        for i, sala in enumerate(lista, start=1):
            print(f"{y}{i}{rt} - {sala}")

        underline(title, "─", 4)

        consulta = int(input("Digite o número correspondente ao consultorio: "))

        sair(consulta)

        sala_escolhida = list(lista.keys())[consulta - 1]
        local_sala = lista[sala_escolhida]

        respostas["Consultorio"] = sala_escolhida
        respostas["Sala"] = local_sala
        break


def iniciar():
    while True:
        respostas = {}

        nome(respostas)
        idade(respostas)
        genero(respostas)
        cpf(respostas)
        bairro(respostas)
        sintomas(respostas)
        classificacao(respostas)
        consultorio(respostas)

        aluno = Aluno(
            respostas["Nome"],
            respostas["Idade"],
            respostas["Genero"],
            respostas["CPF"],
            respostas["Bairro"],
            respostas["Sintomas"],
            respostas["Classificação"],
            respostas["Consultorio"],
            respostas["Sala"],
        )
        aluno.salvar()


# a = Aluno("Axl", "18/11/2004", "Masculino", "Rua A", "e@mail", "99999999")
# a.salvar()
