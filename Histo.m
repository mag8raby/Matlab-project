function [] = Histo(I)
% Summary of this function goes here
%   Detailed explanation goes here
Histo_array = zeros(256,1);
[h , w]=size(I);

for i=1:h
    for j=1:w
        Histo_array(I(i,j)+1)=Histo_array(I(i,j)+1)+1;
        %Histo_array(I(i,j)+1) cuz if we got 0 we have no zero so add 1
        %=Histo_array(I(i,j)+1)+1 to increase the counter of the same index
    end
end
bar(Histo_array);


end

