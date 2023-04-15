from tkinter import *
from PIL import Image, ImageTk
import pygame

pygame.mixer.init()
pygame.mixer.music.load("cancion_mario.mp3")
pygame.mixer.music.play(-1)

ventana = Tk()
ventana.geometry("580x330")
ventana.title("Super Mario Bros")

canvas = Canvas(ventana, width=580, height=330)
canvas.pack()

img_fondo = ImageTk.PhotoImage(Image.open("fondo_mario.png"))
canvas.create_image(0, 0, anchor=NW, image=img_fondo)

posicion_x = 50
posicion_y = 228
img_mario = ImageTk.PhotoImage(Image.open("mario.png"))
mario = canvas.create_image(posicion_x, posicion_y, anchor=NW, image=img_mario)

def mover_a_la_izquierda(event):
    canvas.move(mario, -10, 0)

def mover_a_la_derecha(event): 
    movimiento_x = 10
    movimiento_y = 0
    canvas.move(mario, movimiento_x, movimiento_y)

ventana.bind("<Left>", mover_a_la_izquierda) 
ventana.bind("<Right>", mover_a_la_derecha) 

ventana.mainloop()
