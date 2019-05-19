addpath('./functions');

matrix_learn = parse('p2pdata/1-labeled.dat',6);

yes = filter_by_column(matrix_learn,6,'p2p');
no = filter_by_column(matrix_learn,6,'not p2p');

c1 = generate_table(matrix_learn,1,yes,no);
c2 = generate_table(matrix_learn,2,yes,no);
c3 = generate_table(matrix_learn,3,yes,no);
c4 = generate_table(matrix_learn,4,yes,no);
c5 = generate_table(matrix_learn,5,yes,no);
tables = {c1,c2,c3,c4,c5};
yes_no = {yes,no};

matrix_run = parse('p2pdata/1-unlabeled.dat',5);

created = [];

size_matrizRun=size(matrix_run);

for l=1:size_matrizRun(1)
	x = [];
	for c=1:size_matrizRun(2)
		created{l,c} = matrix_run{l,c};
		x{c} = matrix_run{l,c};
	end
	if(prob(tables,yes_no,x,'p2p')>prob(tables,yes_no,x,'not p2p'))
		created{l,c+1} = 'p2p';
	else
		created{l,c+1} = 'not p2p';
	end
end

writefile(created,'results/1-labeled.dat');
