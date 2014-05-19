# Answers, Phase 1

Quang Dung, Ngo
Yannick, Widmer

We certify that we have done all the lab tasks and we have a running environment on our machine to prove it. We are ready to demonstrate it at any time and to explain the process we have followed.
# -------------------------------

# -- YOUR ANSWER TO QUESTION 1 --

# -------------------------------

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


# -- YOUR ANSWER TO QUESTION 2 --

# -------------------------------
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

# -- YOUR ANSWER TO QUESTION 3 --

# -------------------------------
```
vagrant@ubuntu-14:~$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
heig/app-nodejs     latest              0bcb412a75c4        6 days ago          398.9 MB
heig/web-apache     latest              7dd7b9b87665        6 days ago          411.9 MB
heig/rp-nginx       latest              7f4d7b1ffc35        6 days ago          637.9 MB
dockerfile/ubuntu   latest              cbc81be8f75e        2 weeks ago         378.6 MB
```
# -- YOUR ANSWER TO QUESTION 4 --

# -------------------------------
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

# -------------------------------
```
app-node 172.17.0.5
web-node-2 172.17.0.4
web-node-1 172.17.0.3
rp-node 172.17.0.2
```
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
```

```
# -- YOUR ANSWER TO QUESTION 7 --
# -------------------------------

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
```

```
# -- YOUR ANSWER TO QUESTION 9 --

What procedure did you follow to validate the configuration of 
your new web nodes? 

Provide details and evidence (command results, etc.) that your 
setup is correct.
# -------------------------------
```

```
# -- YOUR ANSWER TO QUESTION 10 --

What procedure did you follow to validate the configuration of 
your complete infrastructure?

Provide details and evidence (command results, etc.) that your 
setup is correct.

# -------------------------------
```


