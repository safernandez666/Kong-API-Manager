FROM python:3.6-slim

RUN python3 -m pip install --upgrade pip

ENV TZ=America/Buenos_Aires

RUN mkdir /code  
WORKDIR /code  
ADD . /code/ 

RUN pip install -r /code/src/requirements.txt  

CMD [ "python", "/code/src/app.py" ]