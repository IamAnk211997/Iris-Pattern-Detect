% m_temp - generates a new biometric template pattern from a normalised template 
% which is to be implemented for the calculation of hamming distance
% in order to match the iris patterns of eye

% Usage: 
% m_temp = create_pattern_temp(image)

% Arguments:
%	image  - the template image of normalised iris 

% Output:
%	temp   - the binary template pattern of size [4 * 45]


function m_temp = create_pattern_temp(image)

% mat2cell(x, m, n) divides the two-dimensional matrix x into adjacent submatrices 
% Vectors m and n specify the number of rows and columns to be assigned to the submatrices in c.

c2 = mat2cell(image,[16 16 16 16],[16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16]);
 
for i=1:4
    for j=1:45
        
        s=(sum(sum(c2{i,j})))/(16*16);
        
        if (s >0.5)
            m_temp(i,j)=1;
        else
            m_temp(i,j)=0;
        end
    end
end

%figure,imshow(m_temp);
end
 