function [ out ] = myHisteq( file )
    image = imread(file);
    if size(image, 3) == 3
        image = rgb2gray(image);
    end
    original_hist = imhist(image);
    original_cumsum = cumsum(original_hist);
    
    figure; 
    subplot(3,1,1);
    imshow(image);
    subplot(3,1,2);
    imhist(image); 
    subplot(3,1,3); 
    plot((original_cumsum/max(original_cumsum))*max(original_hist), 'LineWidth', 2);
    
    
    h = original_hist/numel(image);
    cdf = cumsum(h);
    out = 255*cdf(double(image)+1);
    out = uint8(out);
    
    figure;
    subplot(3,1,1);
    imshow(out);
    subplot(3,1,2);
    imhist(out);
    subplot(3,1,3);
    plot((cumsum(imhist(out))/max(cumsum(imhist(out))))*max(imhist(out)), 'LineWidth', 2);

end
