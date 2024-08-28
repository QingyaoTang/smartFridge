#!/usr/bin/python3
# -*- coding: utf-8 -*-
import os
import tkinter as tk

import os


# GPIO.setmode(GPIO.BOARD)
# GPIO.setwarnings(False)
# pin = 36
# GPIO.setup(pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)

def function1():
    os.system("sudo python detect_code.py")

def function6():
    windows.destroy()


if __name__ == '__main__':
    windows = tk.Tk()  # 创建windows的窗口
    windows.title('Raspberry Pi snack recording system')  # 窗口名称


    windows.geometry('400x200+300+400')  # 窗口大小（注：x是小写字母x，不能写乘号）
    button = tk.Button(windows, text="press the button to start system", command=function1)
    button.pack()
    #if GPIO.input(pin) == 0:
    windows.mainloop()
