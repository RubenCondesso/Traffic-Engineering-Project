function array = diferent_values(m,c)
	n = 1;
	array = [];
    
    size_m=size(m);
    
	for i=1: size_m(1)
		v = m{i,c};
		if containsInArray(array,v) == 0
			array{n,1} = v;
			n=n+1;
		end
	end
end


