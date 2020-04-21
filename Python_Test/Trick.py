import math

trump = [9, 5, 1]
# trump = [7, 7, 4]

print('\tNT\tMJ\tMN')
print("--------------------------------")
for i in range(7):
    level = i + 1
    print(level, end='   |\t')
    for j in range(len(trump)):
        weight = int(
            # math.pow(2, level) - level + trump[j]
            math.pow(2, level) - level + trump[j]
        )
        print(weight, end='\t')
    print()
