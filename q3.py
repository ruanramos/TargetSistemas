import random

def calculate(revenues):
    count, total = 0, 0
    minimum = 2**31
    maximum = 0
    n = len(revenues)
    for i in range(n):
        revenue = revenues[i]
        if revenue == 0:
            continue
        minimum = min(minimum, revenue)
        maximum = max(maximum, revenue)
        total += revenue
        count += 1
    return (minimum, maximum, total / count)


def main():
    revenues = []
    for _ in range(365):
        revenues.append(random.randint(0, 2000))
    print("Generating array: ", revenues)
    print(calculate(revenues))


if __name__ == "__main__":
    main()