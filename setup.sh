#!/bin/bash
cd ~/Desktop/project-main && rm -rf -- !(setup.sh|.git)
git submodule add https://github.com/MohdFaisalAliKhan/submoduleA.git
git submodule add https://github.com/MohdFaisalAliKhan/submoduleB.git
docker build /home/opstree/Desktop/project-main/submoduleA/ -t submodule_a_nginx:1
docker build /home/opstree/Desktop/project-main/submoduleB/ -t submodule_b_nginx:2
docker run -d -p 8000:80 --name container1 -v ~/Desktop/project-main/submoduleA/page:/usr/share/nginx/html submodule_a_nginx:1
docker run -d -p 8001:80 --name container2 -v ~/Desktop/project-main/submoduleB/page:/usr/share/nginx/html submodule_a_nginx:2
