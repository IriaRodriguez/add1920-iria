# Vagrant con VirtualBox

Estilo rúbrica :sparkles:

## Comprobar proyecto 1. :dizzy:

Vamos a crear una MV nueva y la vamos a iniciar usando Vagrant:
* Debemos estar dentro de `vagrantXX-celtics`.
* `vagrant up`, para iniciar una nueva instancia de la máquina.
* `vagrant ssh`: Conectar/entrar en nuestra máquina virtual usando SSH.

![imagen](img/1.png)
![imagen2](img/2.png)
![imagen3](img/3.png)

---

## Comprobar proyecto 2. :dizzy:

Para confirmar que hay un servicio a la escucha en 4567, desde la máquina real
podemos ejecutar los siguientes comandos:
* En el HOST-CON-VAGRANT (Máquina real). Comprobaremos que el puerto 4567 está a la escucha.
    * `vagrant port` para ver la redirección de puertos de la máquina Vagrant.
* En HOST-CON-VAGRANT, abrimos el navegador web con el URL `http://127.0.0.1:4567`. En realidad estamos accediendo al puerto 80 de nuestro sistema virtualizado.

![imagen](img/img4.png)

![imagen](img/img5.png)

![imagen](img/img6.png)

![imagen](img/img7.png)

![imagen](img/img8.png)

---

## Suministro Shell Script. :dizzy:

Ahora vamos a suministrar a la MV un pequeño script para instalar Apache.
* Crear directorio `vagrant16-lakers` para nuestro proyecto.
* Entrar en dicha carpeta.
* Crear fichero `html/index.html` con el siguiente contenido:
```
<h1>Proyecto Lakers</h1>
<p>Curso201920</p>
<p>Nombre-del-alumno</p>
```
![imagen](img/9.png)

![imagen](img/10.png)


* Crear el script `install_apache.sh`, dentro del proyecto con el siguiente
contenido:

```
#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
```

![imagen](img/11.png)

Incluir en el fichero de configuración `Vagrantfile` lo siguiente:
* `config.vm.provision :shell, :path => "install_apache.sh"`, para indicar a Vagrant que debe ejecutar el script `install_apache.sh` dentro del entorno virtual.
* `config.vm.synced_folder "html", "/var/www/html"`, para sincronizar la carpeta exterior `html` con la carpeta interior. De esta forma el fichero "index.html" será visibl dentro de la MV.
* `vagrant up`, para crear la MV.
    * Podremos notar, al iniciar la máquina, que en los mensajes de salida se muestran mensajes que indican cómo se va instalando el paquete de Apache que indicamos.
* Para verificar que efectivamente el servidor Apache ha sido instalado e iniciado, abrimos navegador en la máquina real con URL `http://127.0.0.1:4567`
> NOTA: Podemos usar `vagrant reload`, si la MV está en ejecución, para que coja los cambios de configuración sin necesidad de reiniciar.

![imagen](img/12.png)

![imagen](img/13.png)

![imagen](img/14.png)

![imagen](img/15.png)

---

## Suministro Puppet. :dizzy:

Se pide hacer lo siguiente.
* Crear directorio `vagrant16-raptors` como nuevo proyecto Vagrant.
* Modificar el archivo `Vagrantfile` de la siguiente forma:

```
Vagrant.configure("2") do |config|
  ...
  config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install -y puppet"

  config.vm.provision "puppet" do |puppet|
    puppet.manifest_file = "iria.pp"
  end
 end
```

> Cuando usamos `config.vm.provision "shell", inline: '"echo "Hola"'`, se ejecuta directamente el comando especificado en la MV. Es lo que llamaremos provisión inline.

* Ahora hay que crear el fichero `manifests/iria.pp`, con las órdenes/instrucciones Puppet para instalar el programa `PACKAGENAME`. Ejemplo:

```
package { 'PACKAGENAME':
  ensure => 'present',
}
```
![imagen](img/16.png)

![imagen](img/17.png)

![imagen](img/18.png)

---

## Crear Box Vagrant. :dizzy:

Una vez hemos preparado la máquina virtual ya podemos crear el box.

* Vamos a crear una nueva carpeta `vagrant16-bulls`, para este nuevo proyecto vagrant.
* `VBoxManage list vms`, comando de VirtualBox que muestra los nombres de nuestras MVs. Elegiar una de las máquinas (VMNAME).
* Nos aseguramos que la MV de VirtualBox VMNAME está apagada.
* `vagrant package --base VMNAME package.box`, parar crear nuestra propia caja.
* Comprobamos que se ha creado el fichero `package.box` en el directorio donde hemos ejecutado el comando.
* `vagrant box add nombre-alumno/bulls package.box`, añadimos la nueva caja creada por nosotros, al repositorio local de cajas vagrant de nuestra máquina.
* `vagrant box list`, consultar ahora la lista de cajas Vagrant disponibles.

![imagen](img/19.png)

![imagen](img/20.png)

![imagen](img/21.png)

![imagen](img/22.png)
