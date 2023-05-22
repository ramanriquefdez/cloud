# Imagen de Golang como base
   FROM golang:1.19-alpine
    # Copia los archivos de tu proyecto al contenedor
   # Establecer el directorio de trabajo en el directorio del proyecto
   WORKDIR /go/src/cloud

   # Copiar el contenido del directorio del proyecto al contenedor
   COPY . .

   # Compilar la aplicación
   RUN go build -o cloud_poc .

   # Exponer el puerto 8080
   EXPOSE 8080

   # Ejecutar la aplicación
   CMD ["./cloud_poc"]