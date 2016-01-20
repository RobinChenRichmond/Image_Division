function normal = ransac(tmp, img)
    
[d1, l1] = iat_surf(img);
[d2, l2] = iat_surf(tmp);

[map, matches, imgInd, tmpInd] = iat_match_features_mex(d1, d2, 1);
X1 = l1(imgInd, 1:2);
X2 = l2(tmpInd, 1:2);

iat_plot_correspondences(img, tmp, X1', X2');

X1h = iat_homogeneous_coords (X1');
X2h = iat_homogeneous_coords (X2');
[inliers, ransacWarp]=iat_ransac( X2h, X1h,'affine','tol',.05, 'maxInvalidCount', 10);

iat_plot_correspondences(img,tmp,X1(inliers,:)',X2(inliers,:)');

[M,N,P] = size(tmp);
[wimage, support] = iat_inverse_warping(img, ransacWarp, 'affine', 1:N, 1:M);

normal = wimage;

end