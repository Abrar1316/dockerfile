FROM golang:1.17-alpine3.15

ENV CGO_ENABLED=0

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .
# WORKDIR /app/services/server

# RUN go build -o server .

RUN cd services/server && go build -o server .

EXPOSE 8070

CMD ["/app/services/server/server"]

