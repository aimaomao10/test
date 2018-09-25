my_test: unit_test_case.c code_to_be_tested.c Gtest_main.c libgtest.a
	g++ -isystem ${GTEST_DIR}/include -pthread unit_test_case.c code_to_be_tested.c Gtest_main.c libgtest.a -o my_test

libgtest.a: gtest-all.o
	g++ -isystem ${GTEST_DIR}/include -I${GTEST_DIR} -pthread -c ${GTEST_DIR}/src/gtest-all.cc
	ar -rv libgtest.a gtest-all.o
	
normal_run: code_to_be_tested.c main.c
	g++ -isystem ${GTEST_DIR}/include -pthread code_to_be_tested.c main.c -o normal_run
	
clean:
	rm -f *.o