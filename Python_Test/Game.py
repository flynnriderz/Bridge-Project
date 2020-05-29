trump = [7, 6, 4]

print('\tNT\tMJ\tMN')
print("--------------------------------")
for i in range(7):
    level = i + 1
    print(level, end='   |\t')
    for j in range(len(trump)):
        weight = int(

            2*level + trump[j]
        )
        print(weight, end='\t')
    print()
