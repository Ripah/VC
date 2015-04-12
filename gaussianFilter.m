function [ out ] = gaussianFilter( sigma_x, sigma_y, size_x, size_y, rotation)
    % Calcular posiciones
    X = 0:size_x-1;
    Y = 0:size_y-1;
    
    % Rotar las posiciones
    
    
    % Calcular la gaussiana en 1D para los dos vectores
    X = (1 / (sigma_x * sqrt(2 * pi))) * exp(- power(X - ((size_x-1)/2), 2) / (2 * power(sigma_x, 2)));
    Y = (1 / (sigma_y * sqrt(2 * pi))) * exp(- power(Y - ((size_y-1)/2), 2) / (2 * power(sigma_y, 2)));
    
    % Normalizar los vectores
    X = X / sum(X);
    Y = Y / sum(Y);
    
    % Calcular la matriz
    M = Y.' * X;
    
    out = M;
end
