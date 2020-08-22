A: A.cpp
	./Exec.sh A.cpp

B: B.cpp
	./Exec.sh B.cpp

C: C.cpp
	./Exec.sh C.cpp

D: D.cpp
	./Exec.sh D.cpp

E: E.cpp
	./Exec.sh E.cpp

F: F.cpp
	./Exec.sh F.cpp

clear: 
	./Exec.sh clear
	./Exec.sh init

copy:
	mkdir tmp
	cp -r testCase tmp/
	cp  *.cpp tmp
