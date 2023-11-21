from time import sleep
import os


def overline(title, symbol, size):
    header = " " * size + f"{title}" + " " * size
    overline = symbol * len(header)

    print(header, f"\n{overline}")


def underline(title, symbol, size):
    header = " " * size + f"{title}" + " " * size
    overline = symbol * len(header)

    print(f"{overline}")


def invalid():
    print(f"{r}Invalid Option{rt}")
    sleep(1)
    os.system("cls")
