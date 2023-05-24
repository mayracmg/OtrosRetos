import mouse
from tkinter import *

ventana = Tk()
ventana.geometry("500x200")
ventana.title("Mantener activa la sesión")

segundos = 0
esta_activo = False

def segundos_a_formato_horas(segundos):
    horas = int(segundos / 60 / 60)
    segundos -= horas * 60 * 60
    minutos = int(segundos / 60)
    segundos -= minutos * 60
    return f"{horas:02d}:{minutos:02d}:{segundos:02d}"

def contar():
    global segundos
    segundos += 1

    if not esta_activo:
        return
    
    if segundos % 10 == 0:
        mouse.click()
    ventana.after(1000, contar)
    tiempo_cronometro = segundos_a_formato_horas(segundos - 1)
    label_cronometro.configure(text=tiempo_cronometro)

def start():
    global esta_activo, segundos
    esta_activo = True
    segundos = 0
    contar()

def stop():
    global esta_activo
    esta_activo = False

Button(ventana, width=15, text="Activar Mouse", command=start, bg = 'lawn green').place(x=120, y=10)
Button(ventana, width=15, text="Detener", command=stop, bg = 'IndianRed1').place(x=250, y=10)

Label(ventana, font =('Helvetica bold', 22), text = 'Tiempo de ausencia: ').place(x=100, y=50)

label_cronometro = Label(ventana, text = "00:00:00", width = 15, font = 'Helvetica 14')
label_cronometro.pack()
label_cronometro.place(x=150, y=100)

ventana.mainloop()
