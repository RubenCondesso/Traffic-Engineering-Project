function n = count_in_column(m,c,v)
	n=0;
    
    size_m=size(m);
    
	for i=1:size_m(1)
		if strcmp(v,m{i,c})
			n=n+1;
		end
	end
end
