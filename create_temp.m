list = dir('J:\ankitdata');
row = size(list);

for i = 11:row(1,1)
    name = list(i,1).name;
    
    full_path = strcat('J:\ankitdata\',name);
    
    verify(full_path);
    disp(i)
    disp('created    !!!!!!!')
    disp(' ')
    disp(' ')
end

disp('process completed')