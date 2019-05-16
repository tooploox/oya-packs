FROM golang

COPY . /go/src/app
WORKDIR /go/src/app

RUN go get
RUN go build -o app

CMD [ "app" ]
