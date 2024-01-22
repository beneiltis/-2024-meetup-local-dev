# BUILD
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o bin/operator .

# RUN
FROM alpine:latest
RUN apk add --no-cache curl
WORKDIR /app
COPY --from=builder ["/app/bin/operator", "."]
ENTRYPOINT [ "/app/operator" ]