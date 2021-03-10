function [thresh,id] = matchPattern(template)
    
    X=template;
    list = dir('F:\code_done\template mask');
    row = size(list);
    
    for k = 3:row(1,1)
        name = list(k,1).name;
        if strcmp(name(10:17),'template')
            full_path = strcat('F:\code_done\template mask\',name);
            B = imread(full_path);
            
            A=im2bw(X);
            B=im2bw(B);
            c=0;
            for i=1:4
                for j=1:45
                    if( A(i,j)==B(i,j))
                        c=c+1;
                    end
                end
            end
            
            thresh_array(1,k) = c;
            
            thresh = max(thresh_array);
            
            row = size(thresh_array);
                        
        end
    end
    if thresh > 110
        for l = 1:row(1,2)
                if thresh == thresh_array(1,l)
                    image = strcat('F:\code_done\template mask\',list(l+2).name);
                    [path,name,ext] = fileparts(image);
                    id = name(1:4);
                    break;
                else
                    id = 0;
                end
                
        end
    else
            thresh = 0;
            id = 0;
    end
end
