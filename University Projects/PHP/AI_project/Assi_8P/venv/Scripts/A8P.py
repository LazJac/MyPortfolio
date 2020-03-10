import pygame
import SlideObject          #Stores 3 var's and 3 functions for each sqr of the playingfield
import random               #used to make random slide position ONLY if file doesn't exist or file is incomplete
import os.path              #used to check if file exists
import csv                  #used to open file
import ThrowMessage         #used for popup dialog


class GameSettings:
    CAPTION = 'Gem Puzzle!'
    SCREEN_WIDTH = 1100
    SCREEN_HEIGHT = 900
    SCREEN_SIZE = (SCREEN_WIDTH,SCREEN_HEIGHT)
    COLOUR_GREY = (235,235,235)                     # Color grey
    COLOUR_BLUE = (0,0,255)
    gameRunning = True
    fps = 60

    ObjList = [0,0,0,0,0,0,0,0,0]                   #A list of 9 SlideObject's for each sqr of the field; This does NOT list each slide one by one by their positions, but lists PIC'S numerically with a ref to the POS the pic is at on the board
    MOVES = 0                                       #Number of moves made in game

    btnBfsRect = None                               #Auto_button rect global var init
    btnDfsRect = None
    list = []


def checkEvents():
    global GameSettings
    if GameSettings.list != []:                                     #If search click
        Swaper(GameSettings.list[0], GameSettings.list[1])          #Move through list; replace parent with child
        GameSettings.list.pop(0)

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            GameSettings.gameRunning = False
        elif event.type == pygame.MOUSEBUTTONUP:

            if GameSettings.btnBfsRect.collidepoint(event.pos):
                GameSettings.list = SlideObject.SearchAlgorithm(GameSettings.ObjList, True)
                GameSettings.list.reverse()

            if GameSettings.btnDfsRect.collidepoint(event.pos):
                GameSettings.list = SlideObject.SearchAlgorithm(GameSettings.ObjList, False)
                GameSettings.list.reverse()

            for i in range(8):
                for j in SlideObject.CheckMoveableSpaces(GameSettings.ObjList[8]):                                      # j's = all the posible sqr positions that can move into pic8 (the empty block) in int format
                    if SlideObject.CheckPos(GameSettings.ObjList[i], event.pos) and GameSettings.ObjList[i].pos == j:       # part 1= GameSettings.ObjList[i] loops until you find the pic over the correct click-area, if you
                                                                                                                            #    find the pic it will have the correct 'size' to it already, why?, because 'ObjList' is listed by
                                                                                                                            #    pic's numericaly not by positions
                                                                                                                            # part 2= NOW check if the pic's pos is one of the moveable positions

                        # ex. pic = 3   &   pic = 8    needs to become     pic = 8  &  pic = 3    and    Items need to be switched in 'ObjList' for draw() & SlideObject.CheckMatch(i) loop
                        #     pos = 5   &   pos = 6                        pos = 5  &  pos = 6           ,also MOVES +1

                        Swaper(i, 8)        #Replace clicked slide with 8 (8 = empty space)
                        return

def Swaper(item, item2):
    temp = GameSettings.ObjList[8].pic  # switch pics + pic 8 is the empty block
    GameSettings.ObjList[8].pic = GameSettings.ObjList[item].pic
    GameSettings.ObjList[item].pic = temp

    temp = GameSettings.ObjList[item]  # switch ObjLists
    GameSettings.ObjList[item] = GameSettings.ObjList[8]
    GameSettings.ObjList[8] = temp

    GameSettings.MOVES += 1


def draw(gameDisplaySurface, spriteManager, smallFont):
    global GameSettings

    def messageToScreen(surface, font, msg, colour, xpos, ypos):
        screenText = font.render(msg, True, colour)
        surface.blit(screenText, [xpos, ypos])

    gameDisplaySurface.fill(GameSettings.COLOUR_GREY)
    messageToScreen(gameDisplaySurface, smallFont, 'Score is: ' + str(GameSettings.MOVES), GameSettings.COLOUR_BLUE, 950, 300)                  #Print score at right panel

    gameDisplaySurface.blit(spriteManager.bfs, (900, 500))          #"Buttons"
    GameSettings.btnBfsRect = pygame.Rect(900, 500, 200, 60)
    gameDisplaySurface.blit(spriteManager.dfs, (900, 600))
    GameSettings.btnDfsRect = pygame.Rect(900, 600, 200, 60)

    gameDisplaySurface.blit(spriteManager.p0, (GameSettings.ObjList[0].size[0][0], GameSettings.ObjList[0].size[0][1]))                     #print the pic at the sqr's SliderObject.pos; the pos determines the location throught SliderObject.size[][]
    gameDisplaySurface.blit(spriteManager.p1, (GameSettings.ObjList[1].size[0][0], GameSettings.ObjList[1].size[0][1]))
    gameDisplaySurface.blit(spriteManager.p2, (GameSettings.ObjList[2].size[0][0], GameSettings.ObjList[2].size[0][1]))
    gameDisplaySurface.blit(spriteManager.p3, (GameSettings.ObjList[3].size[0][0], GameSettings.ObjList[3].size[0][1]))
    gameDisplaySurface.blit(spriteManager.p4, (GameSettings.ObjList[4].size[0][0], GameSettings.ObjList[4].size[0][1]))                     #ex. p4 with pos = 8; p4 will be printed at the right-bottom corner
    gameDisplaySurface.blit(spriteManager.p5, (GameSettings.ObjList[5].size[0][0], GameSettings.ObjList[5].size[0][1]))
    gameDisplaySurface.blit(spriteManager.p6, (GameSettings.ObjList[6].size[0][0], GameSettings.ObjList[6].size[0][1]))
    gameDisplaySurface.blit(spriteManager.p7, (GameSettings.ObjList[7].size[0][0], GameSettings.ObjList[7].size[0][1]))

class SpriteManager:
    def __init__(self):
        try:
            self.p0 = pygame.image.load("p0.png").convert_alpha()
            self.p1 = pygame.image.load("p1.png").convert_alpha()
            self.p2 = pygame.image.load("p2.png").convert_alpha()
            self.p3 = pygame.image.load("p3.png").convert_alpha()
            self.p4 = pygame.image.load("p4.png").convert_alpha()
            self.p5 = pygame.image.load("p5.png").convert_alpha()
            self.p6 = pygame.image.load("p6.png").convert_alpha()
            self.p7 = pygame.image.load("p7.png").convert_alpha()
            self.bfs = pygame.image.load("btnBFS.png").convert_alpha()
            self.dfs = pygame.image.load("btnDFS.png").convert_alpha()
        except:
            ThrowMessage.mg("Could not load all of the images, image my be missing; in A8P","ERROR")


pygame.init()
gameDisplaySurface = pygame.display.set_mode(GameSettings.SCREEN_SIZE)
pygame.display.set_caption(GameSettings.CAPTION)
spriteManager = SpriteManager()
smallFont = pygame.font.SysFont(None,25)
clock = pygame.time.Clock()


NrList = [0,1,2,3,4,5,6,7,8]                #This list determines the layout of the pic's

doRandom = False
if os.path.isfile('LOADOUT.csv'):                               #Check if file exists
    layout =[]
    with open('LOADOUT.csv') as file:
        reader = csv.reader(file,delimiter=',')
        for line in reader:                                     #Can be printed in any way
            layout += line
    if len(layout) == 9:                                        #if a complete layout is given, 9 numbers
        for k in range(9):
            try:
                NrList[k] = int(layout[k]) -1                       #-1 to make it easy to type in .csv file, write 1-9 instede of 0-8
            except ValueError:
                ThrowMessage.mg("Layout position is not a number, can't convert; in A8P","ERROR")
    else:
        doRandom = True
else:
    doRandom = True

if doRandom is False:                               #Check if .csv has duplicates
    temp = []
    for i in NrList:
        for j in temp:
            if j == i:
                ThrowMessage.mg("There is a duplicate number in LOADOUT.csv, " + str(i + 1) + " is one of the duplicates; in A8P","ERROR")          # + 1 for .csv ease of use
        temp.append(i)



if doRandom:                                        #If doRandom = True : File was not read and random postions should be make; Stayed False : Keep layout from .csv
    for i in range(15):                             #Shuffle numbers 15 times by switching 2 numbers in the list each time
        nr = random.randint(0,8)
        temp = NrList[0]
        NrList[0] = NrList[nr]
        NrList[nr] = temp

for i in range(9):
    picPos = -1
    for j in NrList:
        if j < 0 or j > 8:
            ThrowMessage.mg("LOADOUT.csv have a number that is not between 1 to 9; in A8P","ERROR")
        else:
            if NrList[j] is i:
                picPos = j                                  #Save the first index in the 'NrList' that has the same number as i
                break

    GameSettings.ObjList[i] = SlideObject.SlideObject(i, picPos)                            #added to list of SliderObjects numerically [i] => (pic number numerically[i], index give from 'NrList' where position = i)


while GameSettings.gameRunning:
    checkEvents()
    draw(gameDisplaySurface, spriteManager, smallFont)                  #Needs to draw first before checking if game is done

    allTrue = False
    for i in GameSettings.ObjList:                                      #Check if every pic is on the correct position
        if SlideObject.CheckMatch(i) is False:                              #if even 1 pic doesn't match the correct tile, don't end the game
            allTrue = True
            break
    if allTrue is False:
        GameSettings.gameRunning = False                                    #End game

    pygame.display.update()
    clock.tick(GameSettings.fps)

ThrowMessage.mg("Scores is: " + str(GameSettings.MOVES), "Game ended")          #Popup message at end of game; Shows moves

pygame.quit()














