def adjustBoard (board):
    if board > 16:
        return adjustBoard(board - 16)
    else:
        return board

def adjustRotation (rotate):
    if rotate >= 4:
        return adjustBoard(rotate - 4)
    else:
        return rotate

board = 14 # input
declarer = 'N'

if declarer == 'N' or declarer == 'S':
    vulIndex = 0
elif declarer == 'E' or declarer == 'W':
    vulIndex = 1

vulSide = [['No', 'No'], ['Yes', 'No'], ['No', 'Yes'], ['Yes', 'Yes']]

rollboard = adjustBoard(board)-1
fn = adjustRotation(int(rollboard/4) + int(rollboard%4))

print('board: %d' % board)
print('declarer: %s' % declarer)
print('Vulnerable: %s' % vulSide[fn][vulIndex])