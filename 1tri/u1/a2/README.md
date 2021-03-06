# A2 : ACCESO REMOTO CON SSH
>Estilo rúbrica. :octocat:

Teniendo en cuenta :

Función : **Un servidor SSH**   
Sistema Operativo : GNU/Linux OpenSUSE (Sin entorno gráfico)  
IP : *172.19.16.31*  
Nombre: ***ssh-server16g***

Función : **Un cliente SSH**  
Sistema Operativo :	GNU/Linux OpenSUSE31  
IP : *172.19.16.32*  
Nombre: ***ssh-client16g***

Función : **Un servidor SSH**  
Sistema Operativo : Windows Server
IP : *172.19.16.11*  
Nombre: ***ssh-server16s***

Función : **Un cliente SSH**  
Sistema Operativo :	 	Windows7
IP : *172.19.16.12*  
Nombre: ***ssh-client16w***

## (2.2) Primera conexión SSH GNU/Linux :sparkles:
- Vamos al cliente `ssh-client16g`.
- Comprobamos la conectividad con el servidor : `ping ssh-server16g`.

![conexión vía ssh](img/2.2.0.png)

-  Comprobamos los puertos abiertos en el servidor (SSH debe estar **open**): `nmap -Pn ssh-server16g` (debe mostrarnos que el puerto **22** está abierto).

![conexión vía ssh](img/2.2.1.png)

- Vamos a comprobar el funcionamiento de la **conexión SSH** desde cada cliente usando el usuario `rodriguez1`.
- Desde el **cliente** GNU/Linux nos conectamos mediante ssh `rodriguez1@ssh-server16g`.

![conexión vía ssh](img/2.2.2.png)

![conexión vía ssh](img/2.2.3.png)

- Comprobamos el contenido del fichero `$HOME/.ssh/known_hosts` en el equipo **ssh-client1**

![conexión vía ssh](img/2.2.4.png)

![conexión vía ssh](img/2.2.5.png)

## (3.2) Comprobamos :sparkles:
- Comprobamos qué sucede al volver a conectarnos desde los dos clientes, usando los usuarios rodriguez2 y rodriguez1.

![conexión vía ssh](img/3.2.0.png)

![conexión vía ssh](img/3.2.1.png)

## (5) Autenticación mediante clave pública :sparkles:

- Vamos a la `máquina ssh-client16g`.
- Iniciamos sesión con nuestro el usuario nombre-alumno de la máquina `ssh-client16g`.

- `ssh-keygen -t rsa` para generar un nuevo par de claves para el usuario en:

    ***/home/iria/.ssh/id_rsa
    /home/iria/.ssh/id_rsa.pub***

- Ahora vamos a copiar la clave pública (`id_rsa.pub`), al fichero "authorized_keys" del usuario remoto **rodriguez4** que está definido en el servidor.

- Comprobar que ahora al acceder remotamente vía SSH

### Desde ssh-client16g, NO se pide password.

![conexión vía ssh](img/5.1.png)

### Desde ssh-client16w, SI se pide el password.

![conexión vía ssh](img/5.0.png)

## (6) Uso de SSH como túnel para X :sparkles:

![conexión vía ssh](img/6.0.png)

![conexión vía ssh](img/6.1.png)

![conexión vía ssh](img/6.3.png)

![conexión vía ssh](img/6.4.png)
