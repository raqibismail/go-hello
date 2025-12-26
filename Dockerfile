# Build stage
FROM golang:1.25-alpine AS builder

LABEL maintainer="raqibismail.work@gmail.com"
LABEL version="0.1"

WORKDIR /app
COPY go.mod .
RUN go mod download

COPY . .
RUN go build -o app

# Run stage
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/app .

CMD ["./app"]
