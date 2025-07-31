FROM golang:1.24-alpine AS builder

WORKDIR /app
COPY . .

RUN go build -o main main.go
FROM alpine:latest

WORKDIR /app
RUN apk add --no-cache curl
COPY --from=builder /app/main .

EXPOSE 8001
CMD ["./main"]