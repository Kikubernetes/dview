#!/bin/bash

# Make tiles from mrview screen captured pngs. Minimum 2 series to Maximum 6 series.
# First make screen capture your image with mrview and save as pngs (same number from all images).
# mrviewのScreenCaptureでスライドにしたいpng画像を保存して下さい。
# 一枚のスライドに10枚の画像を並べることができます。
read -p "画像の名前を入力して下さい> " pname
echo "${pname}の画像からタイル画像を作ります"

while true; do

echo "画像の余白を削りますか? (yes/no)"
read answer 
    case $answer in
        [Yy]*)
          echo "余白を削ります."
          for i in $(seq -f %04g 0 9); do 
            convert ${pname}$i.png -shave 125x125 o${pname}$i.png
          done
	      name=o${pname}
          break
          ;;
        [Nn]*)
          echo "そのままの画像を使います"
          name=${pname}
          break
          ;;
        *)
          echo -e "Please type yes or no. \n"
          ;;
    esac
done

pngappend \
 ${name}0009.png + \
 ${name}0008.png + \
 ${name}0007.png + \
 ${name}0006.png + \
 ${name}0005.png - \
 ${name}0004.png + \
 ${name}0003.png + \
 ${name}0002.png + \
 ${name}0001.png + \
 ${name}0000.png \
 tile_$name.png 

exit
