FROM golang:1.23

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

# This builds for Linux, which is fine for most Docker use cases
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

EXPOSE 8000

CMD ["./main"]