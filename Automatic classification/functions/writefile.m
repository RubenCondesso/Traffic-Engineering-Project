function writefile(x,f)
	file = fopen(f,'w');

	[rows,cols]=size(x);
	for l=1:rows
		for c=1:cols
			if isnumeric(x{l,c})
				x{l,c} = num2str(x{l,c});
			end
		end
	end

	for i=1:rows
    	fprintf(file,'%s,',x{i,1:end-1})
      	fprintf(file,'%s\n',x{i,end})
	end

	fclose(file);
end
