#!/bin/bash
function getdir(){
    for element in `ls $1`
    do  
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then 
            echo $dir_or_file
            getdir $dir_or_file
        else
            echo $dir_or_file
        fi  
    done
}
root_dir="$1"
getdir $root_dir

#if want to add a string at each line head, can use this 
# ./ls_all_dirs_name.sh application | awk '{print "head string" $0 }'

#if want to echo to clipboard
#install a mini tool use "apt-get install xclip"
#./ls_all_dirs_name.sh component | awk '{print "INCLUDES\t+= -I$(MK_ROOT)/" $0 }' | xclip 


    function OnLoad()
    {
        var aDiv = document.getElementById('list_target');
                 
                 //var str = "";

                 var str =  aDiv.innerHTML;

                 for(var i = 0;i<4;i++ )
                 {
                    //str += "<div class='horizontal' id='div_01' style='background-color: bisque; height: 100px;width:100px; border:1px solid #000; background:url(graphics/upload_logo_images/deafult_log.jpg);' >Logo 1</div>";                 
               
                    str += '<div class="horizontal" id="div_'+ i+'" style="background-color: bisque; height: 100px;width:100px; border:1px solid #000; background:url(graphics/upload_logo_images/deafult_log.jpg);" >Logo '+ i+'</div>';

                    // str +=  '<div style = "top:' + i*50 + 'px;left:' +i*50+ 'px;background:' +aColor[i%aColor.length]+ ';"></div>';
                }

                 aDiv.innerHTML = str;

        for(var i=1;i<=32;i++){
           var newOption = document.createElement("option");
           newOption.text="Logo " + i;
           newOption.value=i;
           document.getElementById("logo_index").add(newOption);
         }
    }
	
	
	
	
	
	
                <!-- <img src="graphics/upload_logo_images/logo_01.jpg" id='logo_01' border="0" hspace="20" width="0" height="0" onload="AutoResizeImage(100,100,this)" alt="logo 01" onerror="this.src='graphics/upload_logo_images/deafult_log.jpg';this.onerror=null"/>                 -->
	
	
	<img src="graphics/upload_logo_images/logo_01.jpg" id='logo_01' border="0" hspace="20" width="0" height="0" onload="AutoResizeImage(100,100,this)" alt="logo 01" onerror="this.src='graphics/upload_logo_images/deafult_log.jpg';this.onerror=null"/>
	
	
	
	
    function AutoResizeImage(maxWidth,maxHeight,objImg)
    {
        var img = new Image();
        img.src = objImg.src;
        var hRatio;
        var wRatio;
        var Ratio = 1;
        var w = img.width;
        var h = img.height;
        wRatio = maxWidth / w;
        hRatio = maxHeight / h;
        if (maxWidth ==0 && maxHeight==0)
        {
            Ratio = 1;
        }
        else 
            if (maxWidth==0)
            {//
                if (hRatio<1) Ratio = hRatio;
            }
            else 
                if (maxHeight==0)
                {
                    if (wRatio<1) Ratio = wRatio;
                }
                else 
                    if (wRatio<1 || hRatio<1)
                    {
                        Ratio = (wRatio<=hRatio?wRatio:hRatio);
                    }
            if (Ratio<1)
            {
                w = w * Ratio;
                h = h * Ratio;
            }
        objImg.height = h;
        objImg.width = w;
    }	
	
	
	
        function OnLoad()
        {
            var ImgMaxNumber = 16;

            var aDiv = document.getElementById('list_target');  
            var str="";   
            for(var i = 1;i<=ImgMaxNumber;i++ )
            {
                str += '<div \
                class="horizontal" \
                id="div_'+i+'" \
                    style="height: 100px;width:100px; border:1px solid #000; \
                    background:url(graphics/upload_logo_images/background.jpg);" >\
                Logo '+ i+'\
                <img src="graphics/upload_logo_images/default_logo.jpg" \
                id="logo_'+i+'" \
                style="display:block" \
                border="0" hspace="20" width="0" height="0" onload="AutoResizeImage(100,100,this)" alt="logo 01">\
                </div>';
            }
            str +='<div class="horizontal_select_img">';
            str +='<select  id="logo_index"  style="width:90px;"></select>';
            str +='<div class="picBox"></div>';
            str +='</div>';

            aDiv.innerHTML = str;

            $(".picBox").uploadImg({
                "picNum": 1,    //上传图片张数
                "width": 100,   //图片宽度
                "height": 100   //图片高度  
            });

            for(var i=1;i<=ImgMaxNumber;i++)
            {
                var newOption = document.createElement("option");
                newOption.text="Logo " + i;
                newOption.value=i;
                document.getElementById("logo_index").add(newOption);
            }
        }
	


var html = [
    '<div class="horizontal" id= "div_' + i + '" ',
    'style="height: 100px;width:100px; border:1px solid #000; ">',
    'Logo ' + i,
    '< img src="graphics/upload_logo_images/logo_' + i + '.jpg" id="logo_' + i + '" ',
    'style="display:block" border="0" hspace="10" width="0" height="0" ',
    ' onload="AutoResizeImage(80,80,this)" ',
    'alt="logo ' + i + '" onerror="this.src=\'graphics/upload_logo_images/default_log.jpg\'" ',
    'this.onerror=null />',
    '</div>',
  ];
  str += html.join(' ')

"<div class="horizontal" id="div_1"  style="height: 100px;width:100px; border:1px solid #000; "> Logo 1 < img src="graphics/upload_logo_images/logo_1.jpg" id="logo_1"  style="display:block" border="0" hspace="10" width="0" height="0"   onload="AutoResizeImage(80,80,this)"  alt="logo 1" onerror="this.src='graphics/upload_logo_images/default_log.jpg';this.onerror=null"   /> </div>"




        pid_t fpid, fpid2;
#if 0
        //sleep(10);

        //pid_t fpid, fpid2;

        fpid=fork();
        if (fpid < 0)
            printf("error in fork1!");
        else if (fpid == 0)
        {
            //children 1
            sii9616_main(0);
        }
#else
        sleep(10);

        //pid_t fpid, fpid2;

        fpid2=fork();
        if (fpid2 < 0)
            printf("error in fork2!");
        else if (fpid2 == 0)
        {
            //children 2
            sii9616_main(1);
        }
#endif



















	
	
	
	