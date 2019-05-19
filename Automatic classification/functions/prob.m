function res = prob(tables,yes_no,x,bol)
	if strcmp(bol,'p2p'); c = 2;
	else c = 3; end
    
    size_tables=size(tables);
    
	res = 1;
	for i=1: size_tables(2)
		res = res * tables{1,i}{find_line(tables{1,i},1,x{1,i}),c};
    end
    
    size_yes=size(yes_no{1});
    size_no=size(yes_no{2});
    
    size_aux=size(yes_no{c-1});
    
	p =  size_aux(1)/( size_yes(1) + size_no(1));
	res = res * p;
end
