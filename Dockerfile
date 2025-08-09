FROM golang:1.22-alpine

WORKDIR /app
COPY albums.go main.go ./
COPY go.mod go.sum ./
RUN go mod download
RUN go build -o main

EXPOSE 8080
CMD ["./main"]
