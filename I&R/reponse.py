import time 
import json
import requests
import argparse


parser = argparse.ArgumentParser(
    description='Programa IR IP Restrinction'
)

parser.add_argument('-i', '--ip', metavar='ip', required=True, help='Direccion IP a Bloquear. Ej: python3 response.py 192.168.0.111')
parser.add_argument('-t', '--time', metavar='time', required=True, help='Tiempo a mantener la Direccion IP a Bloquear. Ej: python3 response.py 192.168.0.111')


args = parser.parse_args()
url = 'http://api.local:8001/services/MyAPI/plugins'

  
# define the countdown func. 
def countdown(t): 
    
    while t: 
        mins, secs = divmod(t, 60) 
        timer = '{:02d}:{:02d}'.format(mins, secs) 
        print(timer, end="\r") 
        time.sleep(1) 
        t -= 1

def bloqueo():
    data = {'name':'ip-restriction',
            'config.deny':args.ip}
    r = requests.post(url, data)
    data = r.json()
    id = data['id']
    print ('Bloqueado: %s' % args.ip)
    return id

def eliminar(id):
    print('El ID del Plugin es: %s' % id)
    r = requests.delete(url + '/' + id)
    print ('Desbloqueo: %s' % args.ip)



# Comienzo
id = bloqueo()
# Timer
countdown(int(args.time))
# Eliminar
eliminar(id)