# All
## CommonConfig与Dockerfiles配合构建镜像
### 用法
* 查看help
  ```bash
  CommonConfig/linux/generate_docker_image.sh --help
  ```
* 重点
  * 再Docker BuildContext所在目录运行生成脚本
* 实例
  * DockerContext文件夹位于运行目录下
  ```bash
  bash CommonConfig/linux/generate_docker_image.sh --image-prefix=cjh --image-name=detection_deploy --docker-root=ProjectManager/All/Dockerfiles --target-stage=base-ops-torch-yolo5-clean --use-git --stage-keep-in-version-filter=clean
  ```
## 核心特性
* python环境位于/root/miniconda/envs/MyEnv/bin/python
* 启动服务
  ```bash
  ***** -d [image_name]:[image_tag] bash -c "cd [project_root] && /root/miniconda/envs/MyEnv/bin/python [target_py]"
  ```
## 主要镜像
### dev:基础开发镜像
* base
* ops
* torch
* dev
* cudadev
* horovod
* clean
### detection_dev:目标检测类开发
#### 子项
* base
* ops
* dev
* torch
* yolo5
* clean
### detection_deploy:目标检测类发布
#### 子项
* base
* ops
* torch
* yolo5
* clean