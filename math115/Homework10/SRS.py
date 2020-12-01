from random import shuffle


def main():
    data = [86, 63, 81, 55, 72, 72, 65, 66, 75, 59]
    shuffle(data)
    print(data[:4])  # prints out [59, 75, 66, 81] on the first try


if __name__ == "__main__":
    main()
