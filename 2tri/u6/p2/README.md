# UT6-A2: Salt-Stack :sparkles:
## 1. Preparativos


## 2. Master: instalar y configurar
Vamos a la máquina 1 y lanzamos "zypper install salt-master" para instalar la herramienta de "servidor".
![image](img/1.png)

Modificamos /etc/salt/master para configurar nuestro Master.
![image](img/2.png)

Ahora activamos el servicio en el arranque del sistema y lo iniciamos.
![image](img/3.png)

Por último comprobamos los "Minions" aceptados, vemos que no tenemos ninguno todavía.
![image](img/4.png)


## 3. Minion
### 3.1 Instalación y configuración

Ahora en la máquina 2 lanzamos "zypper install salt-minion" para instalar la herramienta de "cliente".
![image](img/5.png)

Vamos a /etc/salt/minion y configuramos el Master.
![image](img/6.png)

Ahora activamos el servicio en el arranque y lo activamos como hicimos en el servidor.
![image](img/7.png)

Comprobamos que no tenemos el servicio apache2 instalado.
![image](img/8.png)

### 3.2 Aceptación desde el Master

Volvemos a la máquina 1 y lanzamos "salt-key -L" y vemos que tenemos la petición del Minion.
![image](img/9.png)

Aceptamos la petición y lo comprobamos.
![image](img/10.png)

### Comprobamos conectividad
Ahora desde el master lanzamos los siguientes comandos para las comprobaciones.
![image](img/11.png)

## 4. Salt States
### 4.1 Preparar el directorio para los estados

Creamos los directorios /srv/salt/base y /srv/salt/devel.
![image](img/12.png)

Y creamos el fichero roots.conf en /etc/salt/master.d.
![image](img/13.png)

Reiniciamos el servicio.
![image](img/14.png)

### 4.2 Crear un nuevo estado
Ahora creamos el fichero init.sls en la ruta /srv/salt/base/apache y añadimos lo siguiente.
![image](img/15.png)

### 4.3 Asociar Minions a estados
Creamos el fuchero top.sls en /srv/salt/base y definimos lo siguiente:
![image](img/16.png)

### 4.4 Comprobar estados definidos
Ahora lanzamos lo siguiente para consultar los estados:
![image](img/17.png)

### 4.5 Aplicar nuevo estado
Ahora lanzamos los dos siguientes comandos para ver que no hay errores en las definiciones:

![image](img/18.png)
![image](img/19.png)
## 5. Crear más estados
### 5.1 Crear estado "users"
Creamos el directorio /srv/aslt//base/users y dentro el fichero init.sls y aplicamos el estado.
![image](img/20.png)

### 5.2 Crear estado "directories"

Creamos el directorio /srv/aslt//base/directories y dentro el fichero init.sls y aplicamos el estado.
![image](img/21.png)
