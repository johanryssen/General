## List_Docker_Container_Details.sh 
#!/bin/bash
docker inspect --format "{{ .Name }} # {{ .NetworkSettings.IPAddress }} # {{ .NetworkSettings.Ports }}" $(docker ps -q) | tr -s '#' '\t'