&& echo 'config vscode-server' \
&& mkdir -p ~/.vscode-server/ \
&& mkdir -p ~/.vscode-server/bin/ \
### vscode-server服务端拷贝 todo: vscode-server commit-id需要自适应
&& tar -xvf ${DockerContextTarget}/vscode-server.tar.gz -C ~/ \
&& echo 'config vscode-server done' \