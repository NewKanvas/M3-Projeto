from time import sleep
import os
from utils.cores import *
from utils.lines import *
from utils.quiz import iniciar


def menu():
    lista = {
        "Cadastrar Aluno": iniciar,
        "Evasão Aluno": "aluno",
        "Cadastrar Curso": "aluno",
        "Deletar Curso": "aluno",
        "Cadastrar Facilitador": "aluno",
        "Evadir Facilitador": "aluno",
    }
    while True:
        title = "Menu"

        os.system("cls")
        overline(title, "─", 4)

        for i, op in enumerate(lista, start=1):
            print(f"{i} - {op}")

        underline(title, "─", 4)
        print("\n0 - Voltar")

        x = int(input(f"{y}>> {rt}"))

        if x == 0:
            break

        if 0 < x <= len(lista):
            os.system("cls")
            lista[list(lista.keys())[x - 1]]()


menu()
