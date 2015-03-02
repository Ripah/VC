function [width, height] = resol()
    info = imfinfo('moon.tif');
    img  = imread('moon.tif');
    % 1 inch = 2.54 cm
    ar = info.Width / info.Height;
    width = 5 * get(0,'ScreenPixelsPerInch') / 2.54;
    height = width / ar;
    imshow(img(1:info.Height/height:end, 1:info.Width/width:end))
