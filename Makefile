latest_file=$(shell ls -t *.cpp | grep -v "_out" | head -1)
latest_file_out=$(shell ls -t *_out.cpp | head -1)

run: 
	./Exec.sh ${latest_file}

clear: 
	./Exec.sh clear
	./Exec.sh init

copy:
	mkdir tmp
	cp -r testCase tmp/
	cp  *.cpp tmp

unite: run
	./unite.sh