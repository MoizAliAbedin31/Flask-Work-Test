from flask import Flask,render_template,request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
import json

with open('config.json','r')as c:
    parameters=json.load(c)['parameters']

local_server=True
app=Flask(__name__)

app.config.update(
    MAIL_SERVER ='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=parameters['gmail_user'],
    MAIL_PASSWORD=parameters['gmail_password']
)

mail=Mail(app)

if(local_server):

    app.config['SQLALCHEMY_DATABASE_URI'] = parameters['local_uri']
else:

    app.config['SQLALCHEMY_DATABASE_URI'] = parameters['production_uri']

db=SQLAlchemy(app)

class Home(db.Model):
    Sno = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(20), nullable=False)
    No_of_per=db.Column(db.Integer, nullable=False)
    Date_of_per=db.Column(db.DateTime,nullable=False)
    Msg = db.Column(db.String(100), nullable=False)

    def __init__(self,Name,No_of_per,Date_of_per,Msg):
        self.Name=Name
        self.No_of_per=No_of_per
        self.Date_of_per=Date_of_per
        self.Msg=Msg

@app.route('/',methods=['GET',"POST"])
def home():
    if (request.method == 'POST'):
        '''Add entry to the database'''
        name = request.form.get('Name')
        no_of_per = request.form.get('People')
        date_of_per = request.form.get('date')
        message = request.form.get('Message')

        entry = Home(Name = name, No_of_per = no_of_per, Date_of_per = date_of_per, Msg = message)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from' + ' ' + name,
                          sender=name,
                          recipients=[parameters['gmail_user']],
                          body='No. of People :' + ' ' + no_of_per + "\n" +
                               'Date :' + ' ' + date_of_per + "\n" +
                               'Message :' + ' ' + message
                          )

    return render_template('index.html',parameters=parameters)

if __name__ == '__main__':
    app.run(debug=True)
