# redox run img nightly

运行最新的RedoxOS官方镜像

## 运行方法：

*不支持Windows！*

```bash
git clone 
cd redox_run_img_nightly/
chmod a+x redox_run.sh
./redox_run.sh
```

## 注

(1) 官方镜像地址：[https://static.redox-os.org/img/](https://static.redox-os.org/img/)
(2) bootstrap.sh：根据官方的`bootstrap.sh`修改而来，修改的地方标注为`... by thiswind`;官方文件：[https://gitlab.redox-os.org/redox-os/redox/blob/master/bootstrap.sh](https://gitlab.redox-os.org/redox-os/redox/blob/master/bootstrap.sh), 其中只在macbook pro测试过MoJave，其余环境没有测试过，如果运行失败，请自己改一下脚本，或者发issue
