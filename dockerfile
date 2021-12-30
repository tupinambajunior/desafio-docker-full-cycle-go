FROM golang:1.17 AS builder

WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -o golang-desafio desafio.go    

FROM scratch
COPY --from=builder /go/src/app/golang-desafio .
ENTRYPOINT [ "./golang-desafio" ]
