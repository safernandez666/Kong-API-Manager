import json
import requests
import time, os, sys

url = 'http://localhost:8000/frase/'

if __name__ == '__main__':
    try:
        headers = {'apikey' : 'l3HquZU4uvtY6knMk0WzoWpM6mqX5uB8'} # You must change for the PoC.
        # Range to Iterate
        x = range(18, 200)
        for i in x:
            print("Request Numero %d " % i)
            r = requests.get(url + str(i),headers=headers)
            files = r.json()
            print(files)
            time.sleep(1)
    except KeyboardInterrupt:
        print('Interrupted')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
            
