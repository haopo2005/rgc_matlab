function A = symmatrix(name,m,n)
% 
% 
A = sym([]);
for row = 1:m
  for col = 1:n
    A(row,col) = sym([name '_' num2str(row) '_' num2str(col)]);
  end
end
