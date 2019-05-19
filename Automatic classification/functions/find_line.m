function line = find_line(m,c,v)
	line = 0;
    
    size_m=size(m);
    
	for i=1:size_m(1)
		if strcmp(v,m{i,c})
			line = i;
			return
		end
		try
			if v == m{i,c}
				line = i;
				return
			end
		catch
			line = 0;
		end
	end
end
