function setbackground = set_background()

%This function read all the images in the background dataset


global im2 f2 d2 k;

%directory of the dataset
backgroundfiles = dir('/home/gc7xv/Desktop/training_2014_06_17/EmptyFeeder/*.jpg');
nbackgrounds = length(backgroundfiles);

for k = 1 : nbackgrounds
    currentbackgroundname = backgroundfiles(k).name;
    im2{k} = imread(fullfile('/home/gc7xv/Desktop/training_2014_06_17/', 'EmptyFeeder', currentbackgroundname)) ;
    im2{k} = im2single(im2{k});
    if size(im2{k},3) > 1, im2g{k} = rgb2gray(im2{k}) ; else im2g{k} = im2{k} ; end
    
    
    %SURF METHOD
    points = detectSURFFeatures(im2g{k});
    [d2{k},f2{k}] = extractFeatures(im2g{k},points);
    
    fprintf('background %d finished ' ,...
        k);
    
    fprintf('length features %d and descriptors %d \n',...
        length(f2{k}),...
        length(d2{k}));
end

fprintf('All background prepared! \n');

end