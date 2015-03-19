function [ out ] = match_hist( file, hist )
img=imread(file);    
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
M = zeros(256,1,'uint8');
h1 = imhist(img);
cdf1 = cumsum(h1)/numel(img);
cdf2 = cumsum(hist)/max(cumsum(hist));

for id = 1 : 256
    [~,ind] = min(abs(cdf1(id) - cdf2));
    M(id) = ind-1;
end

out = M(double(img)+1);
figure;
subplot(3,3,1);
imshow(img);
title('Original image');

subplot(3,3,2);
imhist(img);
title('Original image hist');

subplot(3,3,3);
plot(cdf1);
title('Original image cdf');

subplot(3,3,4);
imshow(out);
title('Resulting image');

subplot(3,3,5);
imhist(out);
title('Resulting image hist');

subplot(3,3,6);
plot(cumsum(imhist(out))/max(cumsum(imhist(out))));
title('Resulting image cdf');

subplot(3,3,7);
plot(hist);
title('Objective histogram');

subplot(3,3,8);
plot(M);
title('Mapping function');
end
