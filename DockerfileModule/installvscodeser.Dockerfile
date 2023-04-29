&& echo 'config vscode-server' \
&& mkdir -p ~/.vscode-server/ \
&& mkdir -p ~/.vscode-server/bin/ \
### vscode-server服务端拷贝 todo: vscode-server commit-id需要自适应
&& if [ ! -n ${DockerContextTarget}/vscode-server.tar.gz ]; then tar -xvf ${DockerContextTarget}/vscode-server.tar.gz -C ~/; else echo "vscode-server pack does not exist"; fi \
&& echo 'config vscode-server done' \
