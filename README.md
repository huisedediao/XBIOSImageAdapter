# XBIOSImageAdapter
根据大图，自动生成@2x和@3x的图片

<br>
### 使用：
</br>
<pre>
    
    NSString *directory = @"/Users/xxb/Desktop/anxinFile/切图 2/xxxhdpi";
    
    //参数1：原图片文件夹
    //参数2：图片的倍数，比如标注是44 * 44 ，单位是pt，切图的像素是176 * 176 ，那么这里填4
    
    [self handleImagesAtDirectory:directory imageMultiple:4];
    
    //对了，顶部的宏里面的桌面路径，改成自己电脑的桌面路径

</pre>
