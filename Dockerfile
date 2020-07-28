FROM golang:alpine AS base

# working directory
WORKDIR /app

# update index of alpine package with no cache 
RUN apk update && apk add --no-cache git

COPY . .

RUN go get -d -v && go mod verify

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o golang-test .

# Extracted layer
FROM scratch

WORKDIR /app

COPY --from=base /app/golang-test .

ENTRYPOINT ["/app/golang-test"]

EXPOSE 8000
