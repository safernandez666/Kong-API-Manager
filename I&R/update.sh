#!/bin/bash
apt update && apt upgrade -y
apt install nano python3 -y
apt install python3-pip -y
pip3 install requests
mkdir scripts
cd scripts 
chmod 750 $PWD
# Creo el Disable.py
cat <<EOT >> disable.py
#!/usr/bin/env python3

# POC SOCLESS Santiago Fernandez
import json
import sys
import time
import requests
import os 
import re
url = 'http://kong:8001/services/MyAPI/plugins'

# Function that prints text to standard error
def print_stderr(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

# Funcion Extract IP
def extract_ip():
    # Patron de Direccion IP
    pattern = re.compile(r'(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})')

    with open('log.txt', 'r') as file:
        data = file.read().replace('\n', '')
    string = '"client_ip"'
    ip_add = (data[data.index(string)+9:data.index(string)+32])
    ip = (pattern.search(ip_add)[0])
    return ip

# Count Time
def countdown(t): 
    
    while t: 
        mins, secs = divmod(t, 60) 
        timer = '{:02d}:{:02d}'.format(mins, secs) 
        print(timer, end="\r") 
        time.sleep(1) 
        t -= 1
      
    print('Its time to Allow again') 

# Block IP
def bloqueo(client_ip):
    data = {'name':'ip-restriction',
            'config.deny':client_ip}
    r = requests.post(url, data)
    data = r.json()
    return data

# Delete API Manager Rule
def eliminar(data):
    r = requests.delete(url + '/' + data['id'])
    return r.status_code

# Main Program
if __name__ == "__main__":

    temp = sys.stdout #store original stdout object for later
    sys.stdout = open('log.txt','w') #redirect all prints to this log file
    # Print out all input arguments.
    sys.stdout.write("All Arguments Passed In: " + ' '.join(sys.argv[1:]) + "\n")

    # Turn stdin.readlines() array into a string
    std_in_string = ''.join(sys.stdin.readlines())

    # Load JSON
    event_data = json.loads(std_in_string)

    # Extract some values from the JSON.
    sys.stdout.write("Values from JSON: \n")
    sys.stdout.write("Event Definition ID: " + event_data["event_definition_id"] + "\n")
    sys.stdout.write("Event Definition Title: " + event_data["event_definition_title"] + "\n")
    sys.stdout.write("Event Timestamp: " + event_data["event"]["timestamp"] + "\n")

    # Extract Message Backlog field from JSON.
    sys.stdout.write("\nBacklog:\n")
    for message in event_data["backlog"]:
        for field in message.keys():
            sys.stdout.write("Field: " + field + "\t")
            sys.stdout.write("Value: " + str(message[field]) + "\n")
    sys.stdout.close()
    sys.stdout = temp

    temp = sys.stdout #store original stdout object for later
    sys.stdout = open('ip_block.txt','w') #redirect all prints to this log file

    # IP a Bloquear
    ip = extract_ip()
    sys.stdout.write("Direccion IP: " + ip + "\n")

     # Block IP
    id_block = bloqueo(ip)
    sys.stdout.write("ID del Bloqueo: " + str(id_block['id']) + "/n")
    sys.stdout.close()
    sys.stdout = temp
    # Time Rule Life 1 Minute
    t = 60 # Seconds
    countdown(int(t)) 

    # Delete the Rule
    eliminar(id_block)
    os.remove('ip_block.txt')
    os.remove('log.txt')
    exit(0)
EOT
# Darle permisos a disable.py
chmod +x disable.py