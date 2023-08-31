# 卫星定位接收机HAL驱动

适用于Android9 - 13.

对于Android4, Android5, Android6, 请使用项目[android_hal_gpsbds](https://github.com/zxcwhale/android_hal_gpsbds).

对于Android7, Android8, 请使用项目[android7_gnss_hal_driver](https://github.com/zxcwhale/android7_gnss_hal_driver).

对于Android12,13, 请使用项目[aosp13_gnsshal](https://github.com/zxcwhale/aosp13_gnss_hal), 获得更好的支持.

## 配置编译环境

cd到Android工程目录, 然后运行以下命令(请根据实际平台, 替换hikey960-userdebug):

```
source build/envsetup.sh
lunch hikey960-userdebug
```


## 源代码修改

1. 把hal工程拷贝到hardware目录
2. 修改gnsshal/gps_zkw.c文件中的`GPS_CHANNEL_NAME`为接收机的TTY号.
3. 修改gnsshal/gps_zkw.c文件中的`TTY_BAUD`为接收机实际的波特率, 默认为`B9600`.

## 生成HAL层库

运行以下命令(请根据实际情况, 修改路径):

```bash
mmm hardware/android9_gnss_hal_driver/gnsshal
```

该步骤将生成gps.xxxx.so

## 将HAL层库Push到设备

运行以下命令, 并根据平台实际情况, 修改push的目录(替换hikey960)

```bash
adb root
adb shell mount -o remount,rw /vendor
adb push out/target/product/hikey960/obj/SHARED_LIBRARIES/gps.hikey960_intermediates/gps.hikey960.so /vendor/lib64/hw/
adb reboot
```

## 可能的问题

1. 如果编译出现找不到`ALOGD`, `ALOGE`的报错, 可以尝试将`ALOGD`改为`LOGD`, `ALOGE`改为`LOGE`.

2. 驱动能正常工作, 除了/vendor/lib64/hw/gps.hikey960.so文件,  还需要以下几个文件

   ```
   /vendor/lib64/android.hardware.gnss@1.0.so
   /vendor/lib64/android.hardware.gnss@1.0-adapter-helper.so
   /vendor/lib64/hw/android.hardware.gnss@1.0-impl.so
   ```

   系统自带这几个文件，一般在/system/lib64目录下.

