#set up
totalTable = 12     #input 
totalBoard = 24     #input

boardPerRound = int(totalBoard/totalTable)
totalPlayingBoard = totalTable*boardPerRound

boardPlay = []
competition = []
compPerRound = []

#create list for header
for i in range(totalPlayingBoard):
    if i % boardPerRound == 0:
        boardPlay.append([i+1, i+boardPerRound])

#print header
print('\t  ', end='')
for i in range(len(boardPlay)):
     print(boardPlay[i][0], end='-')
     print(boardPlay[i][1], end='\t')
print()
for i in range(len(boardPlay)+1):
     print('--------', end='')
print()

#recursion
def adjust(num): #adjust number between 1 to total table 
    if num < 1:
        return adjust(num + totalTable)
    elif num > totalTable:
        return adjust(num - totalTable)
    else:
        return num

#create list for competition
NSPair = 1
EWPair = 2
for i in range(totalTable):
    compPerRound = []           #empty a list
    
    NSPair -= 1
    EWPair -= 2

    for j in range(totalTable):
        NSPair += 1
        EWPair += 1
        compPerRound.append([adjust(NSPair), adjust(EWPair), boardPlay[j]]) #create an object

    if totalTable % 2 == 0 and i == totalTable / 2: # skip one round if total round is even
        NSPair += 1
        EWPair += 1
        continue
    competition.append(compPerRound) #create a full list

# print competition
for i in range(len(competition)):
    print(i+1, end='\t| ')
    for j in range(len(competition[i])):
        print(competition[i][j][0], end='-')
        print(competition[i][j][1], end='\t')
    print()
print()

# print competition testing
'''
for i in range(len(competition)):
    for j in range(len(competition[i])):
        print(competition[i][j], end=' ')
    print()
print()
'''
