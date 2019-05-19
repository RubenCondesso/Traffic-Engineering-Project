function f = errorRate()

addpath('./functions');


m = parse('p2pdata/4-labeled.dat',6);

m = random_matrix(m);

matrix_learn = [];
matrix_run = [];

size_m = size(m);
for l = 1:ceil(size_m(1)/2)
	for c = 1:size_m(2)
		matrix_learn{l,c} = m{l,c};
	end
end
i = 1;
for l = ceil(size_m(1)/2)+1:size_m(1)
	for c = 1:size_m(2)
		matrix_run{i,c} = m{l,c};
	end
	i=i+1;
end

yes = filter_by_column(matrix_learn,6,'p2p');
no = filter_by_column(matrix_learn,6,'not p2p');

c1 = generate_table(matrix_learn,1,yes,no);
c2 = generate_table(matrix_learn,2,yes,no);
c3 = generate_table(matrix_learn,3,yes,no);
c4 = generate_table(matrix_learn,4,yes,no);
c5 = generate_table(matrix_learn,5,yes,no);

tables = {c1,c2,c3,c4,c5};

yes_no = {yes,no};

created = [];
err = 0;
sucess = 0;
false_p = 0;
false_n = 0;

size_matrixRun = size(matrix_run);
for l=1:size_matrixRun(1)
	x = [];
	for c=1:size_matrixRun(2)-1
		created{l,c} = matrix_run{l,c};
		x{c} = matrix_run{l,c};
	end
	created{l,c+1} = matrix_run{l,c+1};
	if( prob(tables,yes_no,x,'p2p') > prob(tables,yes_no,x,'not p2p'))
		created{l,c+2} = 'p2p';
	else
		created{l,c+2} = 'not p2p';
	end
	if strcmp(created{l,6},created{l,7}) 
		sucess=sucess+1;
    else
        if (strcmp(created{l,6},'p2p'))
		 	if (strcmp(created{l,7},'not p2p'))
				false_p=false_p+1;
				err=err+1;
			end
        else
         
			if (strcmp(created{l,6},'not p2p'))
				if (strcmp(created{l,7}, 'p2p'))
					false_n=false_n+1;
					err=err+1;
				end
			end
        end
	end
end

array_final=[];

false_negative = false_n/l;
false_positive = false_p/l;
error_rate = err/l;
sucess_rate = sucess/l;

array_final = [error_rate, false_negative, false_positive, sucess_rate];

f=array_final;

end