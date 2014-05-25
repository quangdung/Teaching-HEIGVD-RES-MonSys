# Answers, Phase 1

Quang Dung, Ngo
Yannick, Widmer

We certify that we have done all the lab tasks and we have a running environment on our machine to prove it. We are ready to demonstrate it at any time and to explain the process we have followed.
# -------------------------------

# -- YOUR ANSWER TO QUESTION 1 --

the output of the command `vagrant up`

```
PS C:\Data\myGithub\Teaching-HEIGVD-RES-MonSys\monsys-web-infra> vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Box 'phusion-open-ubuntu-14.04-amd64' could not be found. Attempting to find and install...
    default: Box Provider: virtualbox
    default: Box Version: >= 0
==> default: Adding box 'phusion-open-ubuntu-14.04-amd64' (v0) for provider: virtualbox
    default: Downloading: https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box
    default: Progress: 100% (Rate: 2817k/s, Estimated time remaining: --:--:--)
==> default: Successfully added box 'phusion-open-ubuntu-14.04-amd64' (v0) for 'virtualbox'!
==> default: Importing base box 'phusion-open-ubuntu-14.04-amd64'...
==> default: Matching MAC address for NAT networking...
==> default: Setting the name of the VM: monsys-web-infra_default_1399534410424_54854
==> default: Clearing any previously set forwarded ports...
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
==> default: Forwarding ports...
    default: 9090 => 8080 (adapter 1)
    default: 22 => 2222 (adapter 1)
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: Warning: Connection timeout. Retrying...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Configuring and enabling network interfaces...
==> default: Mounting shared folders...
    default: /vagrant => C:/Data/myGithub/Teaching-HEIGVD-RES-MonSys/monsys-web-infra
==> default: Running provisioner: shell...
    default: Running: inline script
==> default: stdin: is not a tty
==> default: Cleaning up Docker containers...
==> default: /tmp/vagrant-shell: line 2: docker: command not found
==> default: /tmp/vagrant-shell: line 3: docker: command not found
==> default: /tmp/vagrant-shell: line 4: docker: command not found
==> default: /tmp/vagrant-shell: line 5: docker: command not found
==> default: /tmp/vagrant-shell: line 6: docker: command not found
==> default: /tmp/vagrant-shell: line 7: docker: command not found
==> default: /tmp/vagrant-shell: line 8: docker: command not found
==> default: /tmp/vagrant-shell: line 9: docker: command not found
==> default: Running provisioner: docker...
    default: Installing Docker (latest) onto machine...
    default: Configuring Docker to autostart containers...
==> default: Building Docker images...
==> default: -- Path: /vagrant/docker/rp-nginx
==> default: -- Path: /vagrant/docker/web-apache
==> default: -- Path: /vagrant/docker/app-nodejs
==> default: Starting Docker containers...
==> default: -- Container: rp-node
==> default: -- Container: web-node-1
==> default: -- Container: web-node-2
==> default: -- Container: app-node
```

# -------------------------------
# -- YOUR ANSWER TO QUESTION 2 --

the ouput of the command `vagrant ssh`
```
Welcome to Ubuntu 14.04 LTS (GNU/Linux 3.13.0-24-generic x86_64)  
 * Documentation:  https://help.ubuntu.com/
Last login: Tue Apr 22 19:47:09 2014 from 10.0.2.2
``` 
the ouput of the command `uname -a`
```
Linux ubuntu-14 3.13.0-24-generic #46-Ubuntu SMP Thu Apr 10 19:11:08 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
vagrant@ubuntu-14:~$
```
# -------------------------------
# -- YOUR ANSWER TO QUESTION 3 --

```
vagrant@ubuntu-14:~$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
heig/app-nodejs     latest              0bcb412a75c4        6 days ago          398.9 MB
heig/web-apache     latest              7dd7b9b87665        6 days ago          411.9 MB
heig/rp-nginx       latest              7f4d7b1ffc35        6 days ago          637.9 MB
dockerfile/ubuntu   latest              cbc81be8f75e        2 weeks ago         378.6 MB
```
# -------------------------------
# -- YOUR ANSWER TO QUESTION 4 --

```
vagrant@ubuntu-14:~$ docker ps
CONTAINER ID        IMAGE                    COMMAND                CREATED             STATUS              PORTS
           NAMES
446484eb49b3        heig/app-nodejs:latest   node /opt/server.js    41 minutes ago      Up 41 minutes       0.0.0.0:7070
->80/tcp   app-node
cc011aa57e0e        heig/web-apache:latest   /usr/sbin/apache2ctl   41 minutes ago      Up 41 minutes       0.0.0.0:8082
->80/tcp   web-node-2
5d1610abff04        heig/web-apache:latest   /usr/sbin/apache2ctl   41 minutes ago      Up 41 minutes       0.0.0.0:8081
->80/tcp   web-node-1
c8452a5bd854        heig/rp-nginx:latest     /opt/init.sh           41 minutes ago      Up 41 minutes       0.0.0.0:9090
->80/tcp   rp-node
```
# -- YOUR ANSWER TO QUESTION 5 --
```
app-node 172.17.0.5
web-node-2 172.17.0.4
web-node-1 172.17.0.3
rp-node 172.17.0.2
```
# -------------------------------
# -- YOUR ANSWER TO QUESTION 6 --

Host (your laptop):
- IP address: 0.0.0.0

Virtual Machine run by Virtual Box
- IP address: 192.168.33.20
- PAT: packets arriving on 0.0.0.0:9090 are forwarded to 192.168.33.20:8080

Docker Bridge
- IP address: 172.17.42.1
- PAT: packets arriving on 172.17.42.1:9090 are forwarded to 172.17.0.2:80
- PAT: packets arriving on 172.17.42.1:8081 are forwarded to 172.17.0.3:80
- PAT: packets arriving on 172.17.42.1:8082 are forwarded to 172.17.0.4:80
- PAT: packets arriving on 172.17.42.1:7070 are forwarded to 172.17.0.5:80

Docker Container 1
- IP address: 172.17.0.2

Docker Container 2
- IP address: 172.17.0.3

Docker Container 3
- IP address: 172.17.0.4

Docker Container 4
- IP address: 172.17.0.5

# -------------------------------
# -- YOUR ANSWER TO QUESTION 7 --

Which command did you type on the terminal to establish the connection?
`telnet www.monsys.com 9090`

What HTTP request did you type and send?
```
GET / HTTP/1.1
HOST: WWW.MONSYS.COM
```

What HTTP response did you get?
```
HTTP/1.1 200 OK
Server: nginx/1.6.0
Date: Thu, 15 May 2014 12:07:37 GMT
Content-Type: text/html
Content-Length: 1584
Connection: keep-alive
X-Powered-By: PHP/5.5.9-1ubuntu4
Vary: Accept-Encoding
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://Www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Terminal+Dosis' rel='stylesheet' type='text/css'>
<link href='css/main.css' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="script/jquery-1.6.4.js"></script>
<title>Welcome To MonSys Front-End</title>
<script language="JavaScript">
$(document).ready(function () {
refreshNodes();
});
function refreshNodes() {
$.getJSON('/ajax/resources/nodes',
function(data) {
var items = [];
$.each(data,function(key, val) {
items.push('<li>' + val.name + ", " + val.description + ", load: " + val.currentLoadLevel + ' %</li>');
});$('#monitor').html("<ul>" + items.join('') + "</ul>");
});
var t=setTimeout("refreshNodes()", 1000);
}
</script>
</head>
<body>
<h1>Welcome to MonSys</h1>
<h2>You are connected to the front-end system, implemented in PHP</h2>
<b>Note</b>: this page is sending HTTP GET requests to <verbatim
>/ajax/resources/nodes</verbatim> in order to retrieve JSON representations of the resources managed by the back-end.
<p/>
<div id="monitor">
You should monitoring data coming from the back-end here.
</div>
<br/>
Brought to you by the University of Applied Sciences of Western Switzerland
</body>
</html>
```
# -------------------------------
# -- YOUR ANSWER TO QUESTION 8 --

Which command did you type on the terminal to establish the connection?
```
telnet www.monsys.com 9090
```

What HTTP request did you type and send?
```
GET /ajax/resources/nodes HTTP/1.1
Host: www.monsys.com
```

What HTTP response did you get?
```
HTTP/1.1 200 OK
Server: nginx/1.6.0
Date: Mon, 19 May 2014 12:39:34 GMT
Content-Type: application/json
Transfer-Encoding: chunked
Connection: keep-alive

fb
[{"name":"P-001","description":"Epson Printer","currentLoadLevel":14.26455983892
0832},{"name":"P-002","description":"Canon Printer","currentLoadLevel":97.079196
80513442},{"name":"P-003","description":"HP Printer","currentLoadLevel":41.18168
014101684}]
0
```
# -------------------------------
# -- YOUR ANSWER TO QUESTION 9 --

What procedure did you follow to validate the configuration of 
your new web nodes? 

Créer des nouveaux dossiers et copier des fichiers dans `monsys-web-infra/docker/` :

```
web-clash : 1 fichier
- Dockerfile
web-clash\site-config : 2 fichiers
- dashboard.clashofclasses.ch.conf
- live.clashofclasses.ch.conf
web-clash\site-content
web-clash\site-content\dashboard.clashofclasses.ch
web-clash\site-content\dashboard.clashofclasses.ch\public_html : 2 fichiers
- index.html (renommé de dashboard-index.html)
- kid.jpg
web-clash\site-content\dashboard.clashofclasses.ch\public_html\css : 2 fichiers
- dashboard-bootstrap.css
- sticky-footer.css
web-clash\site-content\live.clashofclasses.ch
web-clash\site-content\live.clashofclasses.ch\public_html : 2 fichiers
- index.html (renommé de live-index.html)
- success.jpg
web-clash\site-content\live.clashofclasses.ch\public_html\css : 2 fichiers
- live-bootstrap.css
- sticky-footer.css
```

Fichier `Dockerfile`
```
#FROM ubuntu:12.04
FROM dockerfile/ubuntu

RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-php5
RUN apt-get install -y curl git htop unzip vim wget telnet net-tools
RUN a2enmod php5

ADD site-content /var/www/
ADD site-config /etc/apache2/sites-enabled

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
```

Fichier `dashboard.clashofclasses.ch.conf`
```
<VirtualHost *:80>
	# The ServerName directive sets the request scheme, hostname and port that
	# the server uses to identify itself. This is used when creating
	# redirection URLs. In the context of virtual hosts, the ServerName
	# specifies what hostname must appear in the request's Host: header to
	# match this virtual host. For the default virtual host (this file) this
	# value is not decisive as it is used as a last resort host regardless.
	# However, you must set it for any further virtual host explicitly.
	ServerName dashboard.clashofclasses.ch

	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/dashboard.clashofclasses.ch/public_html
	DirectoryIndex index.html

	# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
	# error, crit, alert, emerg.
	# It is also possible to configure the loglevel for particular
	# modules, e.g.
	#LogLevel info ssl:warn

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

	# For most configuration files from conf-available/, which are
	# enabled or disabled at a global level, it is possible to
	# include a line for only one particular virtual host. For example the
	# following line enables the CGI configuration for this host only
	# after it has been globally disabled with "a2disconf".
	#Include conf-available/serve-cgi-bin.conf
</VirtualHost>
```

Fichier `live.clashofclasses.ch.conf`
```
<VirtualHost *:80>
	# The ServerName directive sets the request scheme, hostname and port that
	# the server uses to identify itself. This is used when creating
	# redirection URLs. In the context of virtual hosts, the ServerName
	# specifies what hostname must appear in the request's Host: header to
	# match this virtual host. For the default virtual host (this file) this
	# value is not decisive as it is used as a last resort host regardless.
	# However, you must set it for any further virtual host explicitly.
	ServerName live.clashofclasses.ch

	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/live.clashofclasses.ch/public_html
	DirectoryIndex index.html

	# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
	# error, crit, alert, emerg.
	# It is also possible to configure the loglevel for particular
	# modules, e.g.
	#LogLevel info ssl:warn

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

	# For most configuration files from conf-available/, which are
	# enabled or disabled at a global level, it is possible to
	# include a line for only one particular virtual host. For example the
	# following line enables the CGI configuration for this host only
	# after it has been globally disabled with "a2disconf".
	#Include conf-available/serve-cgi-bin.conf
</VirtualHost>
```

Fichier `Vagrantfile` : ajouter 
```
docker stop clash-node-1 || true
docker stop clash-node-2 || true
docker stop clash-node-3 || true
...
docker rm clash-node-1 || true
docker rm clash-node-2 || true
docker rm clash-node-3 || true
...
d.build_image "/vagrant/docker/web-clash", args: "-t heig/web-clash"
d.run "clash-node-1", image: "heig/web-clash", args: "-p 8881:80"
d.run "clash-node-2", image: "heig/web-clash", args: "-p 8882:80"
d.run "clash-node-3", image: "heig/web-clash", args: "-p 8883:80"
```

Puis, il faut faire `vagrant provision`

Provide details and evidence (command results, etc.) that your 
setup is correct.

`docker ps` indique les nouveaux container
```
vagrant@ubuntu-14:~$ docker ps
CONTAINER ID        IMAGE                    COMMAND                CREATED             STATUS              PORTS
           NAMES
423f050b0d0d        heig/app-nodejs:latest   node /opt/server.js    26 minutes ago      Up 26 minutes       0.0.0.0:7070
->80/tcp   app-node
113d5724b70a        heig/web-clash:latest    /usr/sbin/apache2ctl   26 minutes ago      Up 26 minutes       0.0.0.0:8883
->80/tcp   clash-node-3
26dfe325b262        heig/web-clash:latest    /usr/sbin/apache2ctl   26 minutes ago      Up 26 minutes       0.0.0.0:8882
->80/tcp   clash-node-2
f0647a1bb1f8        heig/web-clash:latest    /usr/sbin/apache2ctl   26 minutes ago      Up 26 minutes       0.0.0.0:8881
->80/tcp   clash-node-1
14c3af8773fa        heig/web-apache:latest   /usr/sbin/apache2ctl   26 minutes ago      Up 26 minutes       0.0.0.0:8082
->80/tcp   web-node-2
307ea6ece06d        heig/web-apache:latest   /usr/sbin/apache2ctl   26 minutes ago      Up 26 minutes       0.0.0.0:8081
->80/tcp   web-node-1
726929d7542b        heig/rp-nginx:latest     /opt/init.sh           26 minutes ago      Up 26 minutes       0.0.0.0:80->
80/tcp     rp-node
```

`docker images` :
```
vagrant@ubuntu-14:~$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
heig/web-clash      latest              fbdeff1ae0d6        27 minutes ago      623.6 MB
heig/rp-nginx       latest              2bc4c2f57a3e        35 minutes ago      957.1 MB
<none>              <none>              efd08e5cf43a        39 minutes ago      623.6 MB
<none>              <none>              8c927e346f9a        53 minutes ago      957.1 MB
<none>              <none>              25a5dd672234        About an hour ago   623.6 MB
heig/app-nodejs     latest              1d2e99c11d54        About an hour ago   609.4 MB
<none>              <none>              d3000393e965        About an hour ago   623.6 MB
heig/web-apache     latest              e4a5422223e9        About an hour ago   623.4 MB
<none>              <none>              b0c3afdf7775        About an hour ago   957.1 MB
dockerfile/ubuntu   latest              1f089cc15e82        6 days ago          584.5 MB
```

`docker inspect clash-node-1` indique l'adresse IP `172.17.0.5`
```
[{
    "ID": "f0647a1bb1f8d74178f1fda2c09210ae1591b90f71de9a70afffd8dba2e6168a",
    "Created": "2014-05-25T22:00:41.596788296Z",
    "Path": "/usr/sbin/apache2ctl",
    "Args": [
        "-D",
        "FOREGROUND"
    ],
    "Config": {
        "Hostname": "f0647a1bb1f8",
        "Domainname": "",
        "User": "",
        "Memory": 0,
        "MemorySwap": 0,
        "CpuShares": 0,
        "AttachStdin": false,
        "AttachStdout": false,
        "AttachStderr": false,
        "PortSpecs": null,
        "ExposedPorts": {
            "80/tcp": {}
        },
        "Tty": false,
        "OpenStdin": false,
        "StdinOnce": false,
        "Env": [
            "HOME=/root",
            "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "APACHE_RUN_USER=www-data",
            "APACHE_RUN_GROUP=www-data",
            "APACHE_LOG_DIR=/var/log/apache2"
        ],
        "Cmd": [
            "-D",
            "FOREGROUND"
        ],
        "Image": "heig/web-clash",
        "Volumes": null,
        "WorkingDir": "/root",
        "Entrypoint": [
            "/usr/sbin/apache2ctl"
        ],
        "NetworkDisabled": false,
        "OnBuild": null
    },
    "State": {
        "Running": true,
        "Pid": 14418,
        "ExitCode": 0,
        "StartedAt": "2014-05-25T22:00:41.736414767Z",
        "FinishedAt": "0001-01-01T00:00:00Z"
    },
    "Image": "fbdeff1ae0d6eadfa31af03e0897524b2527e49eaa4935876ff504deb0199072",
    "NetworkSettings": {
        "IPAddress": "172.17.0.5",
        "IPPrefixLen": 16,
        "Gateway": "172.17.42.1",
        "Bridge": "docker0",
        "PortMapping": null,
        "Ports": {
            "80/tcp": [
                {
                    "HostIp": "0.0.0.0",
                    "HostPort": "8881"
                }
            ]
        }
    },
    "ResolvConfPath": "/etc/resolv.conf",
    "HostnamePath": "/var/lib/docker/containers/f0647a1bb1f8d74178f1fda2c09210ae1591b90f71de9a70afffd8dba2e6168a/hostnam
e",
    "HostsPath": "/var/lib/docker/containers/f0647a1bb1f8d74178f1fda2c09210ae1591b90f71de9a70afffd8dba2e6168a/hosts",
    "Name": "/clash-node-1",
    "Driver": "aufs",
    "ExecDriver": "native-0.2",
    "MountLabel": "",
    "ProcessLabel": "",
    "Volumes": {},
    "VolumesRW": {},
    "HostConfig": {
        "Binds": null,
        "ContainerIDFile": "/var/lib/vagrant/cids/0f3ab08f14ba52c518d66319a25bcb6acf9b2401",
        "LxcConf": [],
        "Privileged": false,
        "PortBindings": {
            "80/tcp": [
                {
                    "HostIp": "0.0.0.0",
                    "HostPort": "8881"
                }
            ]
        },
        "Links": null,
        "PublishAllPorts": false,
        "Dns": null,
        "DnsSearch": null,
        "VolumesFrom": null,
        "NetworkMode": "bridge"
    }
}]
```

`docker inspect clash-node-2` indique l'adresse IP `172.17.0.6`
```
[{
    "ID": "26dfe325b2620c46e25aeafac8f9b882c36341e46c4dab19428d7acb86b6dd3d",
    "Created": "2014-05-25T22:00:42.633359448Z",
    "Path": "/usr/sbin/apache2ctl",
    "Args": [
        "-D",
        "FOREGROUND"
    ],
    "Config": {
        "Hostname": "26dfe325b262",
        "Domainname": "",
        "User": "",
        "Memory": 0,
        "MemorySwap": 0,
        "CpuShares": 0,
        "AttachStdin": false,
        "AttachStdout": false,
        "AttachStderr": false,
        "PortSpecs": null,
        "ExposedPorts": {
            "80/tcp": {}
        },
        "Tty": false,
        "OpenStdin": false,
        "StdinOnce": false,
        "Env": [
            "HOME=/root",
            "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "APACHE_RUN_USER=www-data",
            "APACHE_RUN_GROUP=www-data",
            "APACHE_LOG_DIR=/var/log/apache2"
        ],
        "Cmd": [
            "-D",
            "FOREGROUND"
        ],
        "Image": "heig/web-clash",
        "Volumes": null,
        "WorkingDir": "/root",
        "Entrypoint": [
            "/usr/sbin/apache2ctl"
        ],
        "NetworkDisabled": false,
        "OnBuild": null
    },
    "State": {
        "Running": true,
        "Pid": 14482,
        "ExitCode": 0,
        "StartedAt": "2014-05-25T22:00:42.815736843Z",
        "FinishedAt": "0001-01-01T00:00:00Z"
    },
    "Image": "fbdeff1ae0d6eadfa31af03e0897524b2527e49eaa4935876ff504deb0199072",
    "NetworkSettings": {
        "IPAddress": "172.17.0.6",
        "IPPrefixLen": 16,
        "Gateway": "172.17.42.1",
        "Bridge": "docker0",
        "PortMapping": null,
        "Ports": {
            "80/tcp": [
                {
                    "HostIp": "0.0.0.0",
                    "HostPort": "8882"
                }
            ]
        }
    },
    "ResolvConfPath": "/etc/resolv.conf",
    "HostnamePath": "/var/lib/docker/containers/26dfe325b2620c46e25aeafac8f9b882c36341e46c4dab19428d7acb86b6dd3d/hostnam
e",
    "HostsPath": "/var/lib/docker/containers/26dfe325b2620c46e25aeafac8f9b882c36341e46c4dab19428d7acb86b6dd3d/hosts",
    "Name": "/clash-node-2",
    "Driver": "aufs",
    "ExecDriver": "native-0.2",
    "MountLabel": "",
    "ProcessLabel": "",
    "Volumes": {},
    "VolumesRW": {},
    "HostConfig": {
        "Binds": null,
        "ContainerIDFile": "/var/lib/vagrant/cids/1ba5c30c27faf0b844e46c04be54fa136ddca868",
        "LxcConf": [],
        "Privileged": false,
        "PortBindings": {
            "80/tcp": [
                {
                    "HostIp": "0.0.0.0",
                    "HostPort": "8882"
                }
            ]
        },
        "Links": null,
        "PublishAllPorts": false,
        "Dns": null,
        "DnsSearch": null,
        "VolumesFrom": null,
        "NetworkMode": "bridge"
    }
}]
```

`docker inspect clash-node-3` indique l'adresse IP `172.17.0.7`

```
[{
    "ID": "113d5724b70ae676bf5c7375853660f7022562df096ab8bcf8457cad46c6be64",
    "Created": "2014-05-25T22:00:43.543296472Z",
    "Path": "/usr/sbin/apache2ctl",
    "Args": [
        "-D",
        "FOREGROUND"
    ],
    "Config": {
        "Hostname": "113d5724b70a",
        "Domainname": "",
        "User": "",
        "Memory": 0,
        "MemorySwap": 0,
        "CpuShares": 0,
        "AttachStdin": false,
        "AttachStdout": false,
        "AttachStderr": false,
        "PortSpecs": null,
        "ExposedPorts": {
            "80/tcp": {}
        },
        "Tty": false,
        "OpenStdin": false,
        "StdinOnce": false,
        "Env": [
            "HOME=/root",
            "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "APACHE_RUN_USER=www-data",
            "APACHE_RUN_GROUP=www-data",
            "APACHE_LOG_DIR=/var/log/apache2"
        ],
        "Cmd": [
            "-D",
            "FOREGROUND"
        ],
        "Image": "heig/web-clash",
        "Volumes": null,
        "WorkingDir": "/root",
        "Entrypoint": [
            "/usr/sbin/apache2ctl"
        ],
        "NetworkDisabled": false,
        "OnBuild": null
    },
    "State": {
        "Running": true,
        "Pid": 14547,
        "ExitCode": 0,
        "StartedAt": "2014-05-25T22:00:43.67236051Z",
        "FinishedAt": "0001-01-01T00:00:00Z"
    },
    "Image": "fbdeff1ae0d6eadfa31af03e0897524b2527e49eaa4935876ff504deb0199072",
    "NetworkSettings": {
        "IPAddress": "172.17.0.7",
        "IPPrefixLen": 16,
        "Gateway": "172.17.42.1",
        "Bridge": "docker0",
        "PortMapping": null,
        "Ports": {
            "80/tcp": [
                {
                    "HostIp": "0.0.0.0",
                    "HostPort": "8883"
                }
            ]
        }
    },
    "ResolvConfPath": "/etc/resolv.conf",
    "HostnamePath": "/var/lib/docker/containers/113d5724b70ae676bf5c7375853660f7022562df096ab8bcf8457cad46c6be64/hostnam
e",
    "HostsPath": "/var/lib/docker/containers/113d5724b70ae676bf5c7375853660f7022562df096ab8bcf8457cad46c6be64/hosts",
    "Name": "/clash-node-3",
    "Driver": "aufs",
    "ExecDriver": "native-0.2",
    "MountLabel": "",
    "ProcessLabel": "",
    "Volumes": {},
    "VolumesRW": {},
    "HostConfig": {
        "Binds": null,
        "ContainerIDFile": "/var/lib/vagrant/cids/dcdc9f98538a08250131b81f1bcb080f12092b67",
        "LxcConf": [],
        "Privileged": false,
        "PortBindings": {
            "80/tcp": [
                {
                    "HostIp": "0.0.0.0",
                    "HostPort": "8883"
                }
            ]
        },
        "Links": null,
        "PublishAllPorts": false,
        "Dns": null,
        "DnsSearch": null,
        "VolumesFrom": null,
        "NetworkMode": "bridge"
    }
}]
```

Envoyer des requêtes HTTP aux nouveaux site web depuis la VM

live.clashofclasses.ch

```
vagrant@ubuntu-14:~$ telnet 0.0.0.0 8881
Trying 0.0.0.0...
Connected to 0.0.0.0.
Escape character is '^]'.
GET / HTTP/1.1
Host: live.clashofclasses.ch

HTTP/1.1 200 OK
Date: Sun, 25 May 2014 22:33:43 GMT
Server: Apache/2.4.7 (Ubuntu)
Last-Modified: Thu, 15 May 2014 06:42:08 GMT
ETag: "80a-4f96a988bf000"
Accept-Ranges: bytes
Content-Length: 2058
Vary: Accept-Encoding
Content-Type: text/html

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <title>Sticky Footer Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="./css/live-bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./css/sticky-footer.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
        <h1>Welcome To Clash of Classes!</h1>
      </div>
      <p class="lead">This is the Welcome Page for the <b>live</b> section of the website, which is accessible at this U
RL <a href="http://live.clashofclasses.ch">http://live.clashofclasses.ch</a>.</p>
      <p class="lead">You can jump to the <b>dashboard</b> section of the website <a href="http://dashboard.clashofclass
es.ch">here</a>.</p>

        <p></p>
                <img src="success.jpg" width="300">
        <p></p>


    </div>


    <div id="footer">
      <div class="container">
        <p class="text-muted">We <i class="fa fa-heart"></i> Application Level Protocols</p>
      </div>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
Connection closed by foreign host.
```

dashboard.clashofclasses.ch
```
vagrant@ubuntu-14:~$ telnet 0.0.0.0 8881
Trying 0.0.0.0...
Connected to 0.0.0.0.
Escape character is '^]'.
GET / HTTP/1.1
Host: dashboard.clashofclasses.ch

HTTP/1.1 200 OK
Date: Sun, 25 May 2014 22:34:26 GMT
Server: Apache/2.4.7 (Ubuntu)
Last-Modified: Thu, 15 May 2014 06:42:08 GMT
ETag: "809-4f96a988bf000"
Accept-Ranges: bytes
Content-Length: 2057
Vary: Accept-Encoding
Content-Type: text/html

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <title>Sticky Footer Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="./css/dashboard-bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./css/sticky-footer.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
        <h1>Clash of Classes Dashboard</h1>
      </div>
      <p class="lead">This is the Welcome Page for the <b>dashboard</b> section of the service, which is accessible at t
his URL <a href="http://dashboard.clashofclasses.ch">http://dashboard.clashofclasses.ch</a></p>
      <p class="lead">You can go back to the <b>live</b> section <a href="http://live.clashofclasses.ch">here</a>.</p>

<p></p>
        <img src="kid.jpg" width="300">
<p></p>



    </div>

    <div id="footer">
      <div class="container">
        <p class="text-muted">We <i class="fa fa-heart"></i> Application Level Protocols Teachers</p>
      </div>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
Connection closed by foreign host.
```


# -------------------------------
```

```
# -- YOUR ANSWER TO QUESTION 10 --

What procedure did you follow to validate the configuration of 
your complete infrastructure?

Dans `rp-nginx` : ajouter 

```
upstream clash-nodes  {
	  ip_hash;
      server 172.17.0.5:80;
	  server 172.17.0.6:80;
	  server 172.17.0.7:80;
}
...
server {
	listen 80;

	server_name dashboard.clashofclasses.ch;

	location / {
    	proxy_pass  http://clash-nodes;
     	proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
		proxy_redirect off;
     	proxy_buffering off;
     	proxy_set_header        Host            $host;
     	proxy_set_header        X-Real-IP       $remote_addr;
     	proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
	}

}

server {
	listen 80;

	server_name live.clashofclasses.ch;

	location / {
		proxy_pass	http://clash-nodes;
     	proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
		proxy_redirect off;
     	proxy_buffering off;
     	proxy_set_header        Host            $host;
     	proxy_set_header        X-Real-IP       $remote_addr;
     	proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
	}
	
}
```

Dans `Vagrantfile` : changer

```
d.run "rp-node", image: "heig/rp-nginx", args: "-p 80:80"
```

Dans le fichier `hosts` de Windows : ajouter

```
192.168.33.20   dashboard.clashofclasses.ch
192.168.33.20   live.clashofclasses.ch
```

Faire `vagrant provision`

Provide details and evidence (command results, etc.) that your 
setup is correct.

Envoyer des requêtes HTTP avec les lignes de commandes de Windows

```
C:\>telnet 192.168.33.20 80
Trying 192.168.33.20...
Connected to 192.168.33.20.
Escape character is '^]'.
GET / HTTP/1.1
Host: live.clashofclasses.ch

HTTP/1.1 200 OK
Server: nginx/1.6.0
Date: Sun, 25 May 2014 22:55:39 GMT
Content-Type: text/html
Content-Length: 2058
Connection: keep-alive
Last-Modified: Thu, 15 May 2014 06:42:08 GMT
ETag: "80a-4f96a988bf000"
Accept-Ranges: bytes
Vary: Accept-Encoding

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-a
wesome.css" rel="stylesheet">
    <title>Sticky Footer Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="./css/live-bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./css/sticky-footer.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js
"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queri
es -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></s
cript>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js">
</script>
    <![endif]-->
  </head>

  <body>

    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
        <h1>Welcome To Clash of Classes!</h1>
      </div>
      <p class="lead">This is the Welcome Page for the <b>live</b> section of th
e website, which is accessible at this URL <a href="http://live.clashofclasses.c
h">http://live.clashofclasses.ch</a>.</p>
      <p class="lead">You can jump to the <b>dashboard</b> section of the websit
e <a href="http://dashboard.clashofclasses.ch">here</a>.</p>

        <p></p>
                <img src="success.jpg" width="300">
        <p></p>


    </div>


    <div id="footer">
      <div class="container">
        <p class="text-muted">We <i class="fa fa-heart"></i> Application Level P
rotocols</p>
      </div>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
```

```
C:\>telnet 192.168.33.20 80
Trying 192.168.33.20...
Connected to 192.168.33.20.
Escape character is '^]'.
GET / HTTP/1.1
Host: dashboard.clashofclasses.ch

HTTP/1.1 200 OK
Server: nginx/1.6.0
Date: Sun, 25 May 2014 22:56:50 GMT
Content-Type: text/html
Content-Length: 2057
Connection: keep-alive
Last-Modified: Thu, 15 May 2014 06:42:08 GMT
ETag: "809-4f96a988bf000"
Accept-Ranges: bytes
Vary: Accept-Encoding

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-a
wesome.css" rel="stylesheet">
    <title>Sticky Footer Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="./css/dashboard-bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./css/sticky-footer.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js
"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queri
es -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></s
cript>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js">
</script>
    <![endif]-->
  </head>

  <body>

    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
        <h1>Clash of Classes Dashboard</h1>
      </div>
      <p class="lead">This is the Welcome Page for the <b>dashboard</b> section
of the service, which is accessible at this URL <a href="http://dashboard.clasho
fclasses.ch">http://dashboard.clashofclasses.ch</a></p>
      <p class="lead">You can go back to the <b>live</b> section <a href="http:/
/live.clashofclasses.ch">here</a>.</p>

<p></p>
        <img src="kid.jpg" width="300">
<p></p>



    </div>

    <div id="footer">
      <div class="container">
        <p class="text-muted">We <i class="fa fa-heart"></i> Application Level P
rotocols Teachers</p>
      </div>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
```

# -------------------------------