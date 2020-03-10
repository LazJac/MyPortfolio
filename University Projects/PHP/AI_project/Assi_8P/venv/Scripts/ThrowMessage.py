import ctypes               #used for popup dialog

class mg():
    def __init__(self, message, title):
        ctypes.windll.User32.MessageBoxW(0, message, title, 0)
        quit()