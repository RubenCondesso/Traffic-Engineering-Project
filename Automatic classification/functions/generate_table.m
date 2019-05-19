function t = generate_table(matrix,c,yes,no)
    
	t_values = diferent_values(matrix,c);
    
	t_size = size(t_values);

	t = [];
	for i=1:t_size(1)
		t{i,1} = num2str(t_values{i,1});
        
        size_yes=size(yes);
        size_no=size(no);
        
		t{i,2} = count_in_column(yes,c,t_values(i))/size_yes(1);
		t{i,3} = count_in_column(no,c,t_values(i))/size_no(1);
	end
end
