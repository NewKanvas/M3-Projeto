import csv
from datetime import datetime
from time import sleep
import os
from utils.cores import *
from utils.quiz import *


class Aluno:
    count = 0  # Certifique-se de ajustar o incremento conforme necessário

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

        # Verificar o número da última linha no arquivo
        try:
            with open(csvfilename, mode="r", encoding="utf-8") as file:
                reader = csv.reader(file)
                last_line = list(reader)[-1]
                last_id = int(last_line[0]) if last_line else 0
        except FileNotFoundError:
            last_id = 0

        # Gerar o próximo ID
        next_id = last_id + 1

        with open(csvfilename, mode="a", newline="", encoding="utf-8") as file:
            # Cabeçalho
            fieldnames = [
                "id_aluno",
                "Nome",
                "Matricula",
                "Data_Nascimento",
                "Status",
                "Genero",
                "Endereço",
                "Email",
                "Telefone",
            ]
            writer = csv.DictWriter(file, fieldnames=fieldnames)

            # Se o arquivo não existir,
            if file.tell() == 0:
                # Escreva a linha de separação "sep=,"
                file.write("sep=,\n")
                # Em seguida, escreva o cabeçalho
                writer.writeheader()

            now = datetime.now()
            date = now.strftime("%Y%m")

            writer.writerow(
                {
                    "id_aluno": next_id,  # Aumentar conforme a posição na tabela
                    "Nome": self.nome,
                    "Matricula": date
                    + str(next_id).zfill(4),  # Pegar "Ano" "Mês" "id_aluno"
                    "Data_Nascimento": self.data_nascimento,
                    "Status": self.status,  # Vir padrao "Ativo"
                    "Genero": self.genero,
                    "Endereço": self.endereco,
                    "Email": self.email,
                    "Telefone": self.telefone,
                }
            )

        # Resposta de Salvamento
        print(
            f"{g}Respostas foram salvas no arquivo {y}'alunos.csv'{g}, carregando próximo conjunto de perguntas.{rt}"
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

        p = Aluno(
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


# a = Aluno("Axl", "18/11/2004", "Masculino", "Rua A", "e@mail", "99999999")
# a.salvar()
