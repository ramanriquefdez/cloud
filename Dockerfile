# Imagen de Golang como base
   FROM golang:latest
    # Copia los archivos de tu proyecto al contenedor
   COPY . /go/src/app
   WORKDIR /go/src/app
    # Descarga e instala las dependencias necesarias
   RUN go get -d -v ./...
   RUN go install -v ./...
    # Expone el puerto 8080
   EXPOSE 8080
    # Arranca el servidor
   CMD ["cloud"]