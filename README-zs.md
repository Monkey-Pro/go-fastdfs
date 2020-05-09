

```
#打包
./build.bat

#构建镜像
docker build -t zs/go-fastdfs .

#移除镜像
docker rm -f zs-fastdfs

#启动命令
docker run --network=host --name fastdfs -v /mnt/hgfs/share/usr/local/fastdfs_data:/data -p 8080:8080 -e GO_FASTDFS_DIR=/data zs/go-fastdfs

```

