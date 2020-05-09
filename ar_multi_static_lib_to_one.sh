#!/bin/bash

#global var
AR=arm-hisiv200-linux-ar
#lib_sequence="libopencv_stitching.a libopencv_superres.a libopencv_videostab.a libopencv_photo.a libopencv_aruco.a libopencv_bgsegm.a libopencv_bioinspired.a libopencv_dnn.a libopencv_dpm.a libopencv_fuzzy.a libopencv_line_descriptor.a libopencv_optflow.a libopencv_plot.a libopencv_reg.a libopencv_saliency.a libopencv_stereo.a libopencv_structured_light.a libopencv_rgbd.a libopencv_surface_matching.a libopencv_tracking.a libopencv_datasets.a libopencv_text.a libopencv_face.a libopencv_xfeatures2d.a libopencv_shape.a libopencv_video.a libopencv_ximgproc.a libopencv_calib3d.a libopencv_features2d.a libopencv_flann.a libopencv_xobjdetect.a libopencv_objdetect.a libopencv_highgui.a libopencv_videoio.a libopencv_imgcodecs.a libopencv_ml.a libopencv_imgproc.a libopencv_core.a libzlib.a liblibjpeg.a liblibwebp.a liblibpng.a liblibjasper.a liblibprotobuf.a"
lib_sequence="libopencv_stitching.a"

object_file_sq
target_combine_lib="libhisi200_opencv_static_combine.a"

#functions
function ar_static_libs_to_one()
{
    cd $work_dir
    for lib_file in $lib_sequence
    do  
        if [ "${lib_file##*.}"x = "a"x ];then # if is a *.a lib file

            # echo -e "\nvvvvvvvvvvvv AR ${lib_file} to .o file vvvvvvvvvvvv" # test print
            echo -e "\nvvvvvvvvvvvv AR ${lib_file} to .o file vvvvvvvvvvvv" >> print.log # test log

            ${AR} -x ${lib_file}

            object_file_sq+=$(${AR} -t ${lib_file})
            object_file_sq+=" "
            # echo $object_file_sq # test print
            echo -e $object_file_sq >> print.log # test log

        fi
    done
	
	echo -e "\nvvvvvvvvvvvv Build combine lib vvvvvvvvvvvv"
    echo $object_file_sq
	# ${AR} -qcs $target_combine_lib $object_file_sq
	${AR} -qcs $target_combine_lib *.o
}

#main
work_dir="$1"

echo "rm all .o files"
rm -rf ./*.o

echo "rm ${target_combine_lib}"
rm -rf ./${target_combine_lib}

ar_static_libs_to_one $work_dir
