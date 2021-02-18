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

#   mapRoles: |
#     - groups:
#       - system:bootstrappers
#       - system:nodes
#       rolearn: arn:aws:iam::195992782325:role/eksctl-simple-jwt-api-nodegroup-n-NodeInstanceRole-12G0U5N13NWE6
#       username: system:node:{{EC2PrivateDNSName}}
# - rolearn: arn:aws:iam::195992782325:role/UdacityFlaskDeployCBKubectlRole
#   username: build
#   groups:
#   - system:masters
# export URL="a950b02b9a39c402f9db8732f9fd45c0-61976539.us-east-1.elb.amazonaws.com"
# export TOKEN=`curl -d '{"email":"wolf@thedoor.com","password":"huff-puff"}' -H "Content-Type: application/json" -X POST $URL/auth  | jq -r '.token'`
# curl --request GET $URL:80/contents -H "Authorization: Bearer ${TOKEN}" | jq