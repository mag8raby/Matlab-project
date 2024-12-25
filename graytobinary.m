function [binary] = graytobinary(gray, th)
    % Ensure the input is valid
    if ~isnumeric(gray) || ~ismatrix(gray)
        error('Input must be a numeric 2D grayscale image.');
    end
    
    % Perform thresholding
    binary = gray >= th;

    % Convert the result to logical
    binary = logical(binary);
end
