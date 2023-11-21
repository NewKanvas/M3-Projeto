from time import sleep
import os
from utils.aluno import *
from utils.cores import *
from utils.lines import *


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

        for i, op in enumerate(lista):
            print(f"{i+1} - {op}")

        underline(title, "─", 4)
        print("\n0 - Voltar")

        x = int(input(f"{y}>> {rt}")) - 1

        if x == -1:
            break


menu()
