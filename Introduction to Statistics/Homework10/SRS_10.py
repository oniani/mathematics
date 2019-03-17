from random import shuffle
from statistics import mean


def main():
    data = [86, 63, 81, 55, 72, 72, 65, 66, 75, 59]
    avgs = []

    for i in range(10):
        shuffle(data)
        avgs.append(mean(data[:4]))
    
    print(avgs)


if __name__ == '__main__':
    main()
