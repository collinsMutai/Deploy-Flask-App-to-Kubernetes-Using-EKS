FROM python:stretch


COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install flask
COPY requirements.txt /
RUN pip install -r /requirements.txt



ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]

# docker build -t "jwt-api-test" .
# docker image ls
# docker image rm -f 
# docker run --env-file=.env_file -p 8080:8080 jwt-api-test
# docker container ls
# export TOKEN=`curl -d '{"email":"wolf@thedoor.com","password":"huff-puff"}' -H "Content-Type: application/json" -X POST localhost:8080/auth  | jq -r '.token'`
# curl --request GET 'http://127.0.0.1:80/contents' -H "Authorization: Bearer ${TOKEN}" | jq .

# eksctl create cluster --name simple-jwt-api
# kubectl get nodes
# eksctl delete cluster simple-jwt-api