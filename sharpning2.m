function [outimg] = sharpening2(img)
    
    mask = [0 -1  0; -1  5 -1; 0 -1  0];  
    
    filteredImg = filter2(mask, double(img));

    outimg = uint8(filteredImg);

    imshow(outimg);
end


