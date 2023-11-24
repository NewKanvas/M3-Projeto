import csv
from datetime import datetime
from time import sleep
import os
from utils.cores import *
from utils.lines import *


class Aluno:
    count = 0

    def __init__(self, nome, data_nascimento, genero, endereco, email, telefone):
        Aluno.count += 1

        now = datetime.now()
        ano_mes_id = now.strftime("%Y%m") + str(Aluno.count).zfill(4)

        self.id_aluno = Aluno.count
        self.nome = str(nome)
        self.data_nascimento = str(data_nascimento)
        self.status = "Ativo"
        self.genero = str(genero)
        self.endereco = str(endereco)
        self.email = str(email)
        self.telefone = str(telefone)

    def salvar(self):
        dirname = os.path.dirname(os.path.abspath(__file__))
        csvfilename = os.path.join(dirname, "alunos.csv")

        try:
            with open(csvfilename, mode="r", encoding="utf-8") as file:
                reader = csv.reader(file)
                last_line = list(reader)[-1]
                last_id = int(last_line[0]) if last_line else 0
        except FileNotFoundError:
            last_id = 0

        next_id = last_id + 1

        with open(csvfilename, mode="a", newline="", encoding="utf-8") as file:
            fieldnames = [
                "id_aluno",
                "nome",
                "matricula",
                "data_nascimento",
                "status",
                "genero",
                "endereço",
                "email",
                "telefone",
            ]
            writer = csv.DictWriter(file, fieldnames=fieldnames)

            if file.tell() == 0:
                writer.writeheader()
                next_id = 1

            now = datetime.now()
            matricula_date = now.strftime("%Y%m")
            matricula = matricula_date + str(next_id).zfill(4)

            writer.writerow(
                {
                    "id_aluno": next_id,
                    "nome": self.nome,
                    "matricula": matricula,
                    "data_nascimento": self.data_nascimento,
                    "status": self.status,
                    "genero": self.genero,
                    "endereço": self.endereco,
                    "email": self.email,
                    "telefone": self.telefone,
                }
            )

        print(
            f"{g}Respostas foram salvas no arquivo {y}'alunos.csv'{g}, carregando próximo conjunto de perguntas.{rt}"
        )

        sleep(2)
