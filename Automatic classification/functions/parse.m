function matrix = parse(path,num)
	fid = fopen(path);
	matrix = [];

	i = 1;
	tline = fgetl(fid);
	while ischar(tline)
		line = strsplit(tline,',');


		for c=1:num
			matrix{i,c} = line{1,c};
		end

		tline = fgetl(fid);
		i=i+1;
	end
	fclose(fid);
end
