from flask import Flask, render_template
import mysql.connector
from dotenv import load_dotenv
import os

load_dotenv()

app = Flask(__name__)

db=mysql.connector.connect(
    host=os.getenv('DB_HOST'),
    user=os.getenv('DB_ROOT'),
    password=os.getenv('DB_PASSWORD'),
    database=os.getenv('DB_NAME'),
)

@app.route('/')
def home():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM lands")
    lands = cursor.fetchall()
    return render_template('index.html', lands=lands)

if __name__ == '__main__':
    app.run(debug=True)