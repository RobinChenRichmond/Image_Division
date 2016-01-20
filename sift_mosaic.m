function sift_mosaic(im1, im2)


global x y;
global im1 im2 f1 f2 d1 d2 jj;
global final;



[matches, scores] = matchFeatures(d1,d2{jj}) ;
numMatch = length(matches);

if numMatch > x
    final = im2{jj};
    x = numMatch;
end

fprintf('match finished... ');


if nargout == 0, clear mosaic ; end

end