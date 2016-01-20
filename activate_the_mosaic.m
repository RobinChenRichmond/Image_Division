function activate = activate_the_mosaic()

%This function use SURF method and RANSAC to find the matches between two
%images and then find the best background for each image

global x y;
x = 0;
y = 1;

global im1 f1 d1 im2 jj k;

global final;


imagefiles = dir('/home/gc7xv/Desktop/training_2014_06_17/CarolinaWren/*.jpg');
nfiles = length(imagefiles);

for ii = 1:nfiles
    currentfilename = imagefiles(ii).name;
    im1 = imread(fullfile('/home/gc7xv/Desktop/training_2014_06_17/', 'CarolinaWren', currentfilename)) ;
    im1 = im2single(im1);
    if size(im1,3) > 1, im1g = rgb2gray(im1) ; else im1g = im1 ; end
    
    %SURF METHOD
    points = detectSURFFeatures(im1g);
    [d1,f1] = extractFeatures(im1g,points);

    for jj = 1: k
        fprintf('now begin SURF of image %d and background %d \n',...
            ii,...
            jj);
        sift_mosaic(im1, im2{jj});
        
        if x > 3000
            break
        end    
    end
    
    newBG = ransac(im1, final);
    
    mosaic = (im1 ./ newBG) ;
    
    mosaic = im2uint8(mosaic);
    
    
    [P,Q,R] = size(mosaic);
    
    %improvement work
    for a = 1:P
        for b = 1:Q
            delete = true;
            if mosaic (a,b,1) > 200
                delete = false;
            end
            
            if mosaic(a,b,2) < 210
                delete = false;
            end
            
            if mosaic(a,b,3) < 210
                delete = false;
            end
            
            if delete
                mosaic(a,b,:) = 255;
            end
            
        end
    end
    
    
    fprintf('mosaic finished ... \n');
    
    figure; clf ;
    imagesc(mosaic) ; axis image off ;
    
    filepath = '/home/gc7xv/Desktop/Result/CarolinaWren';
    saveas(gca,fullfile(filepath,num2str(y)),'jpg');
    

    
    
    
    fprintf('numMatch of image %d was improved to %d  \n \n', ...
            y, ...
            x);
    
    x = 0;
    y = y + 1;
end


end