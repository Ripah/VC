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
end
