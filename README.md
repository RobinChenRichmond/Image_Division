# Image_Division

This is a preprocessing algorithm work in matlab environment.
As prerequisite, the iatRoot tool need to be installed(in iatRoot directory and excute ‘iat_setup’).

The first step is to run set_background to use SURF algorithm to extract and save features for all the images in the background folder.

Then run activate_the_mosaic and the algorithm will get result images and save them into the given path.

Notice: in different situation, there are several parameters in both set_background and activate_the_mosaic files needed to be changed, and most of the parameters are path. However, the two files sift_mosaic and ransac are just helper methods for the file activate_the_mosaic, which means users do not need to make any modification on them.
