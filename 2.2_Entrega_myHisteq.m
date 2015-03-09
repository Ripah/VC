function [  ] = myHisteq( file )
    image = imread(file);
    if size(image, 3) == 3
        image = rgb2gray(image);
    end
    original_hist = imhist(image);
    original_cumsum = cumsum(original_hist);
    
    figure; plot((original_cumsum/max(original_cumsum))*max(original_hist), 'LineWidth', 2); hold on; bar(original_hist, 'r');
    
    


end
