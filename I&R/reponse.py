import time 
import json
import requests
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
            'config.deny':"192.168.0.118"}
    r = requests.post(url, data)
    data = r.json()
    id = data['id']
    print ('Bloqueado')
    return id

def eliminar(id):
    print('El ID es: %s' % id)
    r = requests.delete(url + '/' + id)
    print ('Desbloqueado')

# Tiempo Bloqueado
t = 10

# Comienzo
id = bloqueo()
# Timer
countdown(t)
# Eliminar
eliminar(id)