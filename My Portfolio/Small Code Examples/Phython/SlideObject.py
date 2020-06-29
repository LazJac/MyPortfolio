import ThrowMessage

def setSize(pos):
    try:
        nr = pos
    except ValueError:
        ThrowMessage.mg("Position is not a number, can't convert; in SlideObject","ERROR")
    if nr is 0:
        return ((0,0),(300,300))                       #((x1,y1),(x2,y2))
    elif nr is 1:                                           #Blocks are 300x300
        return ((300,0),(600,300))
    elif nr is 2:
        return ((600,0),(900,300))                     #(x1,y1)--300-----.
    elif nr is 3:                                      #  |              |
        return ((0,300),(300,600))                     # 300            300
    elif nr is 4:                                      #  |              |
        return ((300,300),(600,600))                   #  .------300--(x2,y2)
    elif nr is 5:
        return ((600,300),(900,600))
    elif nr is 6:
        return ((0,600),(300,900))
    elif nr is 7:
        return ((300,600),(600,900))
    elif nr is 8:
        return ((600,600),(900,900))
    else:
        return -1

class SlideObject():

    def __init__(self, pic_nr, pos_nr):
        self.pic = pic_nr
        self.pos = pos_nr
        self.size = setSize(self.pos)               #Set vector positions for every position

        if (self.size == -1):
            ThrowMessage.mg("Position is not between 0 to 8; in SlideObject","ERROR")



def CheckMoveableSpaces(SlideObjOrPos):  #Give all the blocks numbers that can move into position x (the empty sqr)

    if isinstance(SlideObjOrPos, SlideObject):      #If SlideObject, use its pos var, else use given int
        nr = SlideObjOrPos.pos
    else:
        nr = SlideObjOrPos


    if nr is 0:                                             # x 1 ~
        return [1, 3]                                       # 3 ~ ~
                                                            # ~ ~ ~

    if nr is 1:                                             # 0 x 2
        return [0, 2, 4]									# ~ 4 ~
                                                            # ~ ~ ~

    if nr is 2:                                             # ~ 1 x
        return [1, 5]                                       # ~ ~ 5
                                                            # ~ ~ ~

    if nr is 3:                                             # 0 ~ ~
        return [0, 4, 6]                                    # x 4 ~
                                                            # 6 ~ ~

    if nr is 4:                                             # ~ 1 ~
        return [1, 3, 5, 7]                                 # 3 x 5
                                                            # ~ 7 ~

    if nr is 5:                                             # ~ ~ 2
        return [2, 4, 8]									# ~ 4 x
                                                            # ~ ~ 8

    if nr is 6:                                             # ~ ~ ~
        return [3, 7]										# 3 ~ ~
                                                            # x 7 ~

    if nr is 7:                                             # ~ ~ ~
        return [4, 6, 8]                                    # ~ 4 ~
                                                            # 6 x 8

    if nr is 8:                                             # ~ ~ ~
        return [5, 7]										# ~ ~ 5
                                                            # ~ 7 x

def CheckPos(SlideObj, ClickPosition):      #Check if the postion you clicked is INSIDE of given SlideObject's 'size'
    cp = ClickPosition
    if cp != None:
        position = SlideObj.size
        if cp[0] >= position[0][0] and cp[0] <= position[1][0]:         #if cp's x >= x1 AND cp's x <= x2
            if cp[1] >= position[0][1] and cp[1] <= position[1][1]:     #if cp's y >= y1 AND cp's y <= y2
                return True
    return False

def CheckMatch(SlideObj):     #Check if slide is on the correct position
    return SlideObj.pic == SlideObj.pos

#=================================================NewStuff==============================================================

class Node():
    def __init__(self,key_, parent_, parentPos_, array_, pos_):
        self.key = key_                                             #Make you able to find obj in closeList after solution
        self.parent = parent_                                       #Ref the parent for after solution
        self.parentPos = parentPos_                                 #Old parent pos, so slide can't move back to its old position
        self.array = array_                                         #Array = Node
        self.pos = pos_                                             #Current position

def CreateChildren(nodeParent):
    tel = 0
    for i in nodeParent.array:      #look for empty space
        if i == 8:
            break
        tel += 1

    childList = []
    for pos in CheckMoveableSpaces(tel):            #Check moveable spaces
        if pos != nodeParent.parentPos:             #Old parent pos, so slide can't move back to its old position
            childArr = nodeParent.array.copy()

            temp = childArr[pos]
            childArr[pos] = childArr[tel]
            childArr[tel] = temp

            childList.append(Node(None, nodeParent.key, nodeParent.pos,childArr, pos))  #name keys later

    return childList


def SearchAlgorithm(SlideOdj_ARR, isBFS):
    NrList = [0, 1, 2, 3, 4, 5, 6, 7, 8]

    firstPos = 0
    for i in range(9):
        NrList[SlideOdj_ARR[i].pos] = i
        if i == 8:                                      #Adds very fisrt pos for solution
            firstPos = SlideOdj_ARR[i].pos

    keyInc = 0
    startNode = Node(keyInc, None, None,NrList, firstPos)
    openList = [startNode]
    closedList = []
    currentList = []

    goal = [0, 1, 2, 3, 4, 5, 6, 7, 8]

    while openList != []:
        currentList.append(openList.pop(0))

        if currentList[0].array == goal:
            posList = []
            child = currentList[0]
            findRoot = currentList[0].key
            while findRoot != 0:                    #Find the root node, add parents pos along the way
                posList.append(child.pos)
                for parent in closedList:
                    if parent.key == child.parent:      #Find ref in closedList
                        child = parent
                        break
                findRoot = child.key

            posList.append(child.pos)
            return posList
        else:
            children = CreateChildren(currentList[0])
            if not isBFS:
                children.reverse()                  #reverse so to make openList.insert(0, child) insert the node numerically

            closedList.append(currentList.pop())

            for child in children:
                keyInc += 1
                child.key = keyInc                  #Children gets keys here
                if isBFS:
                    openList.append(child)
                else:
                    openList.insert(0, child)
    ThrowMessage.mg("Could not complete!","ERROR")          #Failed


















