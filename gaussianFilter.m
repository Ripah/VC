function [ out ] = gaussianFilter( sigma_x, sigma_y, size_x, size_y, rotation)

    [X,Y] = meshgrid(0:size_x-1, 0:size_y-1);
    x0 = (size_x-1)/2;
    y0 = (size_y-1)/2;
    % Rotar las posiciones
    theta = degtorad(rotation);
    
    a = cos(theta)^2/2/sigma_x^2 + sin(theta)^2/2/sigma_y^2;
    b = -sin(2*theta)/4/sigma_x^2 + sin(2*theta)/4/sigma_y^2 ;
    c = sin(theta)^2/2/sigma_x^2 + cos(theta)^2/2/sigma_y^2;
    
    G = exp( - (a*(X-x0).^2 + 2*b*(X-x0).*(Y-y0) + c*(Y-y0).^2)) ;
    
    
    % Normalizar la gaussiana
    G = G / sum(sum(G));
    
    %surf(X,Y,G);shading interp;view(-36,36)
    out = G;
end
