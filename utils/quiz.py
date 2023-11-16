from cores import *


def sair(x):
    x = str(x)
    if x == "0":
        print(f"{g}\nObrigado por usar nosso Quiz.{rt}")
        print(f"{g}Respostas foram salvas no arquivo {y}'respostas.csv'.{rt}")
        exit()


def titulo(title):
    header = " " * 4 + f"{title}" + " " * 4
    overline = "‾" * len(header)

    print(header, f"\n{overline}")


def barra(title):
    header = " " * 4 + f"{title}" + " " * 4
    overline = "‾" * len(header)

    print(f"\n{overline}")


def nome(respostas):
    while True:
        os.system("cls")

        title = "Nome"
        titulo(title)

        print(
            f"{y}Em qualquer momento, digite '0' para sair:{rt}",
            "\n\nDigite o nome do Paciente",
        )
        barra(title)

        nome = input(">> ")

        sair(nome)
        respostas["Nome"] = nome
        break


def idade(respostas):
    while True:
        os.system("cls")

        title = "Idade"
        titulo(title)

        print("Digite a idade do Paciente")

        barra(title)

        idade = input(">> ")

        try:
            idade = int(idade)
            if idade > 0:
                respostas["Idade"] = idade
                break
            else:
                print(f"{r}Valor inválido. A idade deve ser maior que zero.{rt}")
                sleep(1)
                continue
        except ValueError:
            print(f"{r}Entrada inválida. Digite um valor numérico.{rt}")
            sleep(1)
            continue


def genero(respostas):
    while True:
        os.system("cls")

        title = "Gênero"
        titulo(title)

        print("Digite o número correspondente ao gênero do Paciente:")
        print(f"{y}[1]{rt} - Masculino {y}[2]{rt} - Feminino {y}[3]{rt} - Não Binário")

        barra(title)

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
        titulo(title)

        print("Digite o CPF do Paciente (sem pontos):")
        barra(title)

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
        titulo(title)

        print("Digite o bairro do Paciente:")
        barra(title)

        bairro = input(">> ")

        sair(bairro)
        respostas["Bairro"] = bairro
        break


def sintomas(respostas):
    while True:
        os.system("cls")

        title = "Sintomas"
        titulo(title)

        print("Descreva os sintomas do Paciente:")
        barra(title)

        sintomas = input(">> ")

        sair(sintomas)
        respostas["Sintomas"] = sintomas
        break


def classificacao(respostas):
    while True:
        os.system("cls")
        title = "Classificacao"
        titulo(title)

        print("Classifique o estado de saúde do Paciente.")
        print(
            f"{y}[1]{rt} - {b}Não Urgente{rt}  {y}[2]{rt} - {g}Pouco Urgente{rt} {y}[3]{rt} - {y}Urgente{rt} {y}[4]{rt} - {m}Muito Urgente{rt}  {y}[5]{rt} - {r}Emergência{rt}"
        )
        barra(title)

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
        titulo(title)

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

        barra(title)

        consulta = int(input("Digite o número correspondente ao consultorio: "))

        sair(consulta)

        sala_escolhida = list(lista.keys())[consulta - 1]
        local_sala = lista[sala_escolhida]

        respostas["Consultorio"] = sala_escolhida
        respostas["Sala"] = local_sala
        break
