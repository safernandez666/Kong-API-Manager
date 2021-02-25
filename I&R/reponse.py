import time 
import json
import requests
import argparse


parser = argparse.ArgumentParser(
    description='Programa I&R IP Restrinction sobre Kong Server'
)

parser.add_argument('-i', '--ip', metavar='ip', required=True, help='Direccion IP a Bloquear. Ej: python3 response.py 192.168.0.111')
parser.add_argument('-t', '--time', metavar='time', required=True, help='Tiempo a mantener la Direccion IP a Bloquear. Ej: python3 response.py 192.168.0.111')
args = parser.parse_args()
url = 'http://api.local:8001/services/MyAPI/plugins'

  
# Contador  
def countdown(t): 
    while t: 
        mins, secs = divmod(t, 60) 
        timer = '{:02d}:{:02d}'.format(mins, secs) 
        print(timer, end="\r") 
        time.sleep(1) 
        t -= 1
# Bloqueo de Direccion TCP IP
def bloqueo():
    data = {'name':'ip-restriction',
            'config.deny':args.ip}
    r = requests.post(url, data)
    data = r.json()
    print ('Bloqueado: %s' % data['config']['deny'])
    return data
# Eliminamos la regla, con ID de Plugin. 
def eliminar(data):
    print('El ID del Plugin es: %s' % data['id'])
    print ('Desbloqueo: %s' % data['config']['deny'])
    r = requests.delete(url + '/' + data['id'])
    return r.status_code


id = bloqueo()
countdown(int(args.time))
if (eliminar(id) == 204):
    print ('Procedimiento de Bloqueo Exitoso')
else:
    print ('Problemas en el Procedimiento de Bloqueo')