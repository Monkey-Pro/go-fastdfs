

```
#打包
./build.bat

#构建镜像
docker build -t zs/go-fastdfs .

#移除镜像
docker rm -f zs-fastdfs

#启动命令
docker run --network=host --name fastdfs -v /mnt/hgfs/share/usr/local/fastdfs_data:/data -p 8080:8080 -e GO_FASTDFS_DIR=/data zs/go-fastdfs
docker run --network=host --name fastdfs -v /mnt/hgfs/share/usr/local/fastdfs_data:/data -p 8196:8196 -e GO_FASTDFS_DIR=/data zs/go-fastdfs

```



```
docker rm -f zs-fastdfs
docker build -t zs/go-fastdfs .
docker run --restart=always --network=host --name zs-fastdfs -v /zstack_back/opt/data/docker/zs_fastdfs_data:/data -p 8190:8190 -e GO_FASTDFS_DIR=/data zs/go-fastdfs
```
