FROM golang:1.21.4 AS builder
WORKDIR /go/src
COPY main.go .
RUN go build -o app main.go

FROM alpine:3.6.5 
COPY --from=builder /go/src/app .
ENTRYPOINT [ "./app" ]