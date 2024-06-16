FROM golang:1.19-alpine as build

WORKDIR /app    

COPY . .

RUN go build -o go-docker

FROM golang:1.19-alpine

WORKDIR /app
 
COPY --from=build /app .

EXPOSE 5000

CMD ["./go-docker"]
