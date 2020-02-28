#!/sbin/sh

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
module_path=/sbin/modules

cd $firmware_path

for touch_product_string in $(ls $touch_class_path); do
    touch_path=/sys$(cat $touch_class_path/$touch_product_string/path)
    firmware_file=$(ls *$touch_product_string*)
    echo 1 > $touch_path/forcereflash
    echo $firmware_file > $touch_path/doreflash
done

# Load all needed modules
insmod $module_path/aw8695.ko
insmod $module_path/focaltech_0flash_mmi.ko
insmod $module_path/fpc1020_mmi.ko
insmod $module_path/gpio-tacna.ko
insmod $module_path/himax_v2_mmi_hx83112.ko
insmod $module_path/himax_v2_mmi.ko
insmod $module_path/mmi_sys_temp.ko
insmod $module_path/moto_f_usbnet.ko
insmod $module_path/qpnp-smbcharger-mmi.ko
insmod $module_path/sensors_class.ko
insmod $module_path/stmvl53l0.ko
insmod $module_path/sx933x_sar.ko
insmod $module_path/tps61280.ko
insmod $module_path/watchdog_cpu_ctx.ko

return 0
