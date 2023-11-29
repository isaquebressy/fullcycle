FROM golang:1.21.4 AS builder
WORKDIR /go/src
COPY main.go .
RUN go build -o app main.go

FROM scratch
COPY --from=builder /go/src/app .
ENTRYPOINT [ "./app" ]