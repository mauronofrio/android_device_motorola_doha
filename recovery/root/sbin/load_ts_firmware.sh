#!/sbin/sh

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware

cd $firmware_path

for touch_product_string in $(ls $touch_class_path); do
    touch_path=/sys$(cat $touch_class_path/$touch_product_string/path)
    firmware_file=$(ls *$touch_product_string*)
    echo 1 > $touch_path/forcereflash
    echo $firmware_file > $touch_path/doreflash
done

return 0
