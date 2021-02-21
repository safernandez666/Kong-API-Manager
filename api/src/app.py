from flask import Flask, jsonify
from flaskext.mysql import MySQL
import sys, os

app = Flask(__name__)
mysql = MySQL()

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'secret'
app.config['MYSQL_DATABASE_DB'] = 'maradona'
app.config['MYSQL_DATABASE_HOST'] = os.getenv("DATABASE")
#app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_CHARSET'] = 'utf8'

mysql.init_app(app)

@app.route('/', methods=['GET'])
def home():
    return "<h1>La API Funciona</h1><p>Bienvenidos</p>"

@app.route('/frases')
def get_all():
    cur = mysql.connect().cursor()
    cur.execute('''select * from maradona.frases''')
    r = [dict((cur.description[i][0], value)
                for i, value in enumerate(row)) for row in cur.fetchall()]
    return jsonify({'frases' : r})

@app.route('/frase/<int:id>')
def get_one(id):
    cur = mysql.connect().cursor()
    cur.execute('''select * from maradona.frases where id = %d''' % id)
    r = [dict((cur.description[i][0], value)
                for i, value in enumerate(row)) for row in cur.fetchall()]
    return jsonify({'frases' : r})

@app.route('/cantidad')
def get_last():
    cur = mysql.connect().cursor()
    cur.execute('''SELECT COUNT(*) FROM maradona.frases;''')
    r = [dict((cur.description[i][0], value)
                for i, value in enumerate(row)) for row in cur.fetchall()]
    #return jsonify({"count": len(r)})
    return jsonify({'filas' : r})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
