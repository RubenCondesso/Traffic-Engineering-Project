function f = containsInArray(array,value)
	f = 0;
    
    size_array=size(array);
    
	for j=1:size_array(1)
		if strcmp(array{j,1},value)
			f=1;
			return
		end
	end
end

