FROM ubuntu:20.04



LABEL Name="test-flask-app" \
    Version="red"



#Proxy

#ENV http_proxy=http://8*******

#ENV https_proxy=http://98*******



RUN apt-get update -y && \
    apt-get install -y python3-pip python-dev net-tools wget curl


WORKDIR /app

COPY ./app-requirements.txt /app/requirements.txt



#WORKDIR /app



RUN pip3 install -r requirements.txt



COPY ./app /app



ENTRYPOINT [ "python3" ]



CMD [ "app.py" ]