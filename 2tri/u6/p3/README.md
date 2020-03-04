# UT6-A3: Contenedores con Docker :sparkles:



## 1. Habilitar el acceso a la red externa a los contenedores



Vamos a "YaST" > "Ajustes de red" > "Encaminamiento" y habilitamos el 
reenvío de Ipv4.



![](img/8.png)



## 2. Instalación y primeras pruebas

### 2.1 Instalación



Abrimos una terminal y lanzamos "zypper in docker".



![](img/2.png)



Ahora iniciamos el servicio y vemos su versión.



![](img/3.png)



## 2. Creación manual

### 2.1 Crear una imagen manualmente



Vemos las imágenes que tenemos. [Todavía no tenemos ninguna.]



![](img/4.png)



Buscamos en los repositorios con la etiqueta "debian".



![](img/9.png)

![](img/10.png)



Nos descargamos la imagen "debian9".



![](img/11.png)



Ahora vemos los contenedores que están en ejecución.



![]()



Creamos un contenedor que se llame con_debian a partir de la imagen que 
acabamos de descargar y ejecutamos /bin/bash.



![](img/12.png)



### 2.2 Personalizar el contenedor



Comprobamos que estamos en debian.



![](img/13.png)



Actualizamos los repositorios.



![](img/14.png)



Instalamos Nginx.



![](img/15.png)



Instalamos el editor nano.



![](img/16.png)



Iniciamos el servicio Nginx.



![](img/17.png)



Lanzamos "ps -ef", vemos que no existe, lo intentamos instalar, pero no 
existe el paquete.



Luego creamos el fichero holamundo.html con nuestro nombre.



![](img/18.png)



Creamos el siguiente script:



![](img/51.png)



### 2.3 Crear una imagen a partir del contenedor

Creamos una nueva imagen, para ello tenemos que saber la ID del 
contenedor que ya tenemos, hacemos lo siguiente:



![](img/31.png)



Ahora paramos el contenedor "con_debian", vemos que se ha parado y lo 
eliminamos.



![](img/34.png)



## 3. Crear contenedor a partir de nuestra imagen

### 3.1 Crear contenedor con Nginx



Ahora creamos el contenedor con Ngnix instalado.



![](img/41.png)



### 3.2 Comprobamos

Vemos todos los contenedores.



![](img/42.png)



Vemos que inicia la máquina



![](img/46.png)



Abrimos un navegador y vemos que funciona la página por defecto de Nginx.



![](img/48.png)



### 3.3 Migrar la imágen a otra máquina

Ahora guardamos la imagen con nuestro nombre y se la pasamos a un 
compañero.



## 4. Dockerfile

### 4.1 Preparar ficheros



Creamos el directorio docker16 en nuestro home con los ficheros 
holamundo.html y server.sh creados anteriormente.



![](img/50.png)



Ahora creamos el fichero Dockerfile con lo siguiente:



![](img/49.png)



### 4.2 Crear imagen a partir del Dockerfile

Comprobamos que está nuestra imagen.

![](img/52.png)





### 4.3 Crear contenedor y comprobar



Ahora crearemos el contenedor con la imagen anterior y abrimos un 
navegador y probamos.

![](img/48.png)



Y comprobamos el fichero holamundo.html.



![](img/52.png)




