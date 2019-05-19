function matrix = filter_by_column(m,c,v)
	matrix = [];
	k=1;
    
    size_m=size(m);
    
	for i=1:size_m(1)
		if strcmp(v,m{i,c})
			for j=1:size_m(2)
				matrix{k,j} = m{i,j};
			end
			k=k+1;
		end
	end
end
