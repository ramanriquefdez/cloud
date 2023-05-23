   FROM golang:1.19-alpine
   WORKDIR /go/src/cloud

   COPY . .

   RUN go build -o cloud_poc .

   EXPOSE 8080

   CMD ["./cloud_poc"]