# class
class Board:
    def __init__(self, table, round, scoreNS, scoreEW, MPNS, MPEW):
        self.table = table
        self.round = round
        self.scoreNS = scoreNS
        self.scoreEW = scoreEW
        self.MPNS = MPNS
        self.MPEW = MPEW

    def getTable(self):
        return self.table
    
    def getRound(self):
        return self.round
    
    def getScoreNS(self):
        return self.scoreNS

    def getScoreEW(self):
        return self.scoreEW

    def getMPNS(self):
        return self.MPNS

    def getMPEW(self):
        return self.MPEW

    def setTable(self, table):
        self.table = table
    
    def setRound(self, round):
        self.round = round
    
    def setScoreNS(self, scoreNS):
        self.scoreNS = scoreNS

    def setScoreEW(self, scoreEW):
        self.scoreEW = scoreEW

    def setMPNS(self, MPNS):
        self.MPNS = MPNS

    def setMPEW(self, MPEW):
        self.MPEW = MPEW

#setup
b = []
tableMPNSList = []
tableMPEWList = []

b.append(Board(1, 1, 430, 0, 0, 0))
b.append(Board(2, 5, 180, 0, 0, 0))
b.append(Board(3, 4, 0, 100, 0, 0))
b.append(Board(4, 3, 0, 50, 0, 0))
b.append(Board(5, 2, 0, 50, 0, 0))

totalRound = len(b)

# create list for sort
for i in range(totalRound):
    tableMPNSList.append([b[i].getScoreNS()-b[i].getScoreEW(), b[i].getRound()])
    tableMPEWList.append([b[i].getScoreEW()-b[i].getScoreNS(), b[i].getRound()])

tableMPNSList.sort(reverse=True) #sorting
tableMPEWList.sort(reverse=True) #sorting

# insert MP into an object
    # insert MP into list
for i in range(totalRound):
    MPScore = totalRound - 1 - i
    tableMPNSList[i].append(MPScore)
    tableMPEWList[i].append(MPScore)

    # adjust MP for NS
tableMPNSCounter = []
for i in range(len(tableMPNSList)):
    scores = tableMPNSList[i][0]
    matchPoint = tableMPNSList[i][2]
    if tableMPNSCounter == []:
        tableMPNSCounter.append([scores, matchPoint, 1])
    else:
        for j in range(len(tableMPNSCounter)):
            if tableMPNSCounter[j][0] == scores:
                tableMPNSCounter[j][1] += matchPoint
                tableMPNSCounter[j][2] += 1
            elif j == len(tableMPNSCounter) - 1:
                tableMPNSCounter.append([scores, matchPoint, 1])

    # adjust MP for EW
tableMPEWCounter = []
for i in range(len(tableMPEWList)):
    scores = tableMPEWList[i][0]
    matchPoint = tableMPEWList[i][2]
    if tableMPEWCounter == []:
        tableMPEWCounter.append([scores, matchPoint, 1])
    else:
        for j in range(len(tableMPEWCounter)):
            if tableMPEWCounter[j][0] == scores:
                tableMPEWCounter[j][1] += matchPoint
                tableMPEWCounter[j][2] += 1
            elif j == len(tableMPEWCounter) - 1:
                tableMPEWCounter.append([scores, matchPoint, 1])

    # set MP for NS in object
for i in range(len(tableMPNSList)):
    scores = tableMPNSList[i][0]
    rounds = tableMPNSList[i][1]
    for j in range(len(tableMPNSCounter)):
        if tableMPNSCounter[j][0] == scores:
            matchPoint = tableMPNSCounter[j][1]/tableMPNSCounter[j][2]
            break
    for k in range(totalRound):
        if b[k].getRound() == rounds:
            b[k].setMPNS(matchPoint)
            break

    # set MP for EW in object
for i in range(len(tableMPEWList)):
    scores = tableMPEWList[i][0]
    rounds = tableMPEWList[i][1]
    for j in range(len(tableMPEWCounter)):
        if tableMPEWCounter[j][0] == scores:
            matchPoint = tableMPEWCounter[j][1]/tableMPEWCounter[j][2]
            break
    for k in range(totalRound):
        if b[k].getRound() == rounds:
            b[k].setMPEW(matchPoint)
            break

# print to table
print()
print('Table\tRound\tScoreNS\tScoreEW\tMPNS\tMPEW')
print('----------------------------------------------')
for i in range(totalRound):
    print(b[i].getTable(),end='\t')
    print(b[i].getRound(),end='\t')

    if b[i].getScoreNS() != 0:
        print(b[i].getScoreNS(),end='')
    print(end='\t')

    if b[i].getScoreEW() != 0:
        print(b[i].getScoreEW(),end='')
    print(end='\t')

    if b[i].getMPNS() % 1 == 0.0:
        print(int(b[i].getMPNS()),end='\t')
    else:
        print(b[i].getMPNS(),end='\t')

    if b[i].getMPEW() % 1 == 0.0:
        print(int(b[i].getMPEW()),end='\n')
    else:
        print(b[i].getMPEW(),end='\n')


 