#!/bin/sh

#global var
AR=arm-hisiv200-linux-ar
# lib_sequence="libopencv_stitching.a libopencv_superres.a libopencv_videostab.a libopencv_photo.a libopencv_aruco.a libopencv_bgsegm.a libopencv_bioinspired.a libopencv_dnn.a libopencv_dpm.a libopencv_fuzzy.a libopencv_line_descriptor.a libopencv_optflow.a libopencv_plot.a libopencv_reg.a libopencv_saliency.a libopencv_stereo.a libopencv_structured_light.a libopencv_rgbd.a libopencv_surface_matching.a libopencv_tracking.a libopencv_datasets.a libopencv_text.a libopencv_face.a libopencv_xfeatures2d.a libopencv_shape.a libopencv_video.a libopencv_ximgproc.a libopencv_calib3d.a libopencv_features2d.a libopencv_flann.a libopencv_xobjdetect.a libopencv_objdetect.a libopencv_highgui.a libopencv_videoio.a libopencv_imgcodecs.a libopencv_ml.a libopencv_imgproc.a libopencv_core.a libzlib.a liblibjpeg.a liblibwebp.a liblibpng.a liblibjasper.a liblibprotobuf.a"
# lib_sequence="libopencv_superres.a libopencv_videostab.a libopencv_photo.a libopencv_aruco.a libopencv_bgsegm.a libopencv_bioinspired.a libopencv_dnn.a libopencv_dpm.a libopencv_fuzzy.a libopencv_line_descriptor.a libopencv_optflow.a libopencv_plot.a libopencv_reg.a libopencv_saliency.a libopencv_stereo.a libopencv_structured_light.a libopencv_rgbd.a libopencv_surface_matching.a libopencv_tracking.a libopencv_datasets.a libopencv_text.a libopencv_face.a libopencv_xfeatures2d.a libopencv_shape.a libopencv_video.a libopencv_ximgproc.a libopencv_calib3d.a libopencv_features2d.a libopencv_flann.a libopencv_xobjdetect.a libopencv_objdetect.a libopencv_highgui.a libopencv_videoio.a libopencv_imgcodecs.a libopencv_ml.a libopencv_imgproc.a libopencv_core.a libzlib.a liblibjpeg.a liblibwebp.a liblibpng.a liblibjasper.a liblibprotobuf.a"
lib_sequence="libopencv_superres.a libopencv_videostab.a"
# lib_sequence="libopencv_superres.a"

object_file_sq="warpers_cuda.cpp.o exposure_compensate.cpp.o camera.cpp.o timelapsers.cpp.o motion_estimators.cpp.o seam_finders.cpp.o stitcher.cpp.o util.cpp.o warpers.cpp.o blenders.cpp.o matchers.cpp.o autocalib.cpp.o opencl_kernels_stitching.cpp.o"
one_lib_object_files=""

#functions
function ar_static_libs_and_compare_object_file_name()
{
    # test
    # if echo $lib_sequence | grep "libopencv_superres.a" > /dev/null 2>&1
    # then
    #     echo "success"
    # else
    #     echo "fail"
    # fi

    clear
    echo -e "\n--------------------------Compare Start --------------------------"

    cd $work_dir
    for lib_file in $lib_sequence
    do  
        if [ "${lib_file##*.}"x = "a"x ];then # if is a *.a lib file

            echo -e "\n================================================================================"
            echo $object_file_sq

            one_lib_object_files=$(${AR} -t ${lib_file})
            for object_file in $one_lib_object_files
            do
                if echo $object_file_sq | grep $object_file > /dev/null 2>&1
                then
                    echo "match: [ $object_file ] in [ $lib_file ] in past libs "
                    echo -e "\n--------------------------Compare Break --------------------------"
                    break
                else
                    echo "unmatch: [ $object_file ] in [ $lib_file ] in past libs "
                fi
            done

            object_file_sq+=" "
            object_file_sq+=$one_lib_object_files

            # object_file_sq+=$(${AR} -t ${lib_file})
            # object_file_sq+=" "
            # # echo $object_file_sq # test print
            # echo -e $object_file_sq >> print.log # test log

        fi
    done
    echo -e "\n--------------------------Compare Finish --------------------------"
}

#main
work_dir="$1"

ar_static_libs_and_compare_object_file_name $work_dir
