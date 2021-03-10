% m_mask - generates a new biometric noise mask pattern from a normalised mask
% which is to be implemented for the calculation of hamming distance
% in order to match the iris patterns of eye

% Usage: 
% m_mask = create_pattern_mask(image)

% Arguments:
%	image  - the noise mask image of normalised iris 

% Output:
%	mask   - the binary noise mask pattern of size [4 * 45]


function m_mask = create_pattern_mask(image)

% mat2cell(x, m, n) divides the two-dimensional matrix x into adjacent submatrices 
% Vectors m and n specify the number of rows and columns to be assigned to the submatrices in c

c1 = mat2cell(image,[16 16 16 16],[16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16]);
 
for i=1:4
    for j=1:45
        
        s=(sum(sum(c1{i,j})))/(16*16);
       
        if (s >0.5)
            m_mask(i,j)=1;
        else
            m_mask(i,j)=0;
        end
    end
end

%figure,imshow(m_mask);

end
 
    
 
    