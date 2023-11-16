import csv
from datetime import datetime
from time import sleep
import os
from utils.cores import *
from utils.quiz import *


class Paciente:
    def __init__(
        self, nome, idade, genero, cpf, bairro, sintomas, classificação, consulta, sala
    ):
        self.nome = str(nome)
        self.idade = int(idade)
        self.genero = str(genero)
        self.cpf = str(cpf)
        self.bairro = str(bairro)
        self.sintomas = str(sintomas)
        self.classificação = str(classificação)
        self.consulta = str(consulta)
        self.sala = str(sala)

    def salvar(self):
        dirname = os.path.dirname(os.path.abspath(__file__))
        csvfilename = os.path.join(dirname, "respostas.csv")

        with open(csvfilename, mode="a", newline="", encoding="utf-8") as file:
            # Cabeçalho
            fieldnames = [
                "Nome",
                "Idade",
                "Genero",
                "CPF",
                "Bairro",
                "Sintomas",
                "Classificação",
                "Consulta",
                "Sala",
                "Data",
            ]
            writer = csv.DictWriter(file, fieldnames=fieldnames)

            # Se o arquivo não existir,
            if file.tell() == 0:
                # Escreva a linha de separação "sep=,"
                file.write("sep=,\n")
                # Em seguida, escreva o cabeçalho
                writer.writeheader()

            now = datetime.now()
            date = now.strftime("%d-%m-%Y %H:%M:%S")

            writer.writerow(
                {
                    "Nome": self.nome,
                    "Idade": self.idade,
                    "Genero": self.genero,
                    "CPF": self.cpf,
                    "Bairro": self.bairro,
                    "Sintomas": self.sintomas,
                    "Classificação": self.classificação,
                    "Consulta": self.consulta,
                    "Sala": self.sala,
                    "Data": date,
                }
            )
        # Resposta de Salvamento
        print(
            f"{g}Respostas foram salvas no arquivo {y}'respostas.csv'{g}, carregando próximo conjunto de perguntas.{rt}"
        )

        sleep(2)

        # Pergunta da Idade


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

        p = Paciente(
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
        p.salvar()


iniciar()
