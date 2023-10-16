FROM python:3.9.6-slim

WORKDIR /python-docker

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY ./src .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=8089"]
