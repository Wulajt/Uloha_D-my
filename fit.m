%%% Ucelova(fitness) funkcia %%%
%% vstup: matrix - matica ktora predstavuje celu generaciu
%% vystup: score - predstavuje vector hodnot, ktore hodnotia dane 
%%                 chromozony
function [score] = fit(matrix,hlavna_diagonala)

    score = [];
    [numRows,numColums] = size(matrix);
    for i = 1:1:numRows 
        scr = 0;
        row = matrix(i, :);
        %pocita score pre damy ktore sa nachadzaju na rovnakom
        %riadku
        edges = unique(row);
        counts = histc(row(:), edges);
        [numC,~] = size(counts);
        for m = 1:1:numC
            if counts(m) > 1
                scr = scr + factorial(counts(m));
            end
        end
        %pocita score pre damy, ktore sa nachadzaju na rovnakej 
        %diagonale
        for u = 1:numColums
            for y = 1:numColums
                t = u-y;
                r = row(u) - row(y);
                if(abs(t) == abs(r) && u ~= y)
                    scr = scr +1;
                end
            end
        end
        %pocita score pre damy, ktore sa nachadzaju na hlavnej 
        %diagonale
        if hlavna_diagonala == true
            for index_pola = 1:numColums
                if(index_pola == row(index_pola))
                    scr = scr+1;
                end
            end
        end
        %% pridanie score aktualneho chromozonu do vektora 
        %% vsetkych chromozonov
        score = [score scr];
    end
end