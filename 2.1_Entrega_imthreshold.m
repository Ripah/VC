function [newImage] = imthreshold( file, alfa )
    image=imread(file);    
    if size(image, 3) == 3
        image = rgb2gray(image);
    end
    Imax = max(max(image));
    Imin = min(min(image));
    level = alfa * (Imax-Imin) + Imin;
    newImage = (image-level)+level;
    imshow(newImage);

end
