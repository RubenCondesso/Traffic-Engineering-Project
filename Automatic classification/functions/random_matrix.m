function m = random_matrix(matrix)
    
    size_matrix=size(matrix);
    aux=0;

	num_lines = size_matrix(1);
	num_cols = size_matrix(2);
	lines = [];

	indexes = [1:num_lines];

	m = [];
	for i = 1:num_lines
		aux = ceil(rand*size(indexes));
        n=aux(2);
        
		index = indexes(n);
		indexes(indexes == index) = [];


		for c = 1:num_cols
			m{i,c} = matrix{index,c};
		end
	end
end
