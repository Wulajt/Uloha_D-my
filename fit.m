function [score] = fit(matrix)
%FIT Summary of this function goes here
%   Detailed explanation goes here
    score = [];
    [numRows,numColums] = size(matrix);
    
    for i = 1:1:numRows
        scr = 0;
        row = matrix(i, :);
        edges = unique(row);
        counts = histc(row(:), edges);
        [numC,~] = size(counts);
       
        %pocita vertikalne alebo horizontalne
        for m = 1:1:numC
            if counts(m) > 1
                scr = scr + factorial(counts(m));
            end
        end
        
        %pocita diagonalne 
        for u = 1:numColums
            
            for y = 1:numColums
                
                t = u-y;
                r = row(u) - row(y);
                if(abs(t) == abs(r) && u ~= y)
                    scr = scr +1;
                    %u , y;
                end
            end
        end
        
        %pocita po hlavnej diagonale
        for index_pola = 1:numColums
            temp = 8 - index_pola;
            if(index_pola == row(index_pola))
                %index_pola , row(index_pola)
                scr = scr+1;
            end
            
        end
               
        score = [score scr];
    end
end

