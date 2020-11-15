COMPILER=ocamlopt

MODULES=out/abr.cmx
SOURCES=src/abr.ml

TEST_EXEC=bin/tests
TEST_MODULES=out/tests.cmx
TEST_SOURCES=src/tests.ml

all: bin/ out/ $(MODULES)

$(MODULES): $(SOURCES)
	$(COMPILER) -I out/ -c $^ -o $@

bin/:
	mkdir bin

out/:
	mkdir out

test: all $(TEST_EXEC)

$(TEST_EXEC): $(MODULES) $(TEST_MODULES)
	$(COMPILER) -o $@ $^

$(TEST_MODULES): $(TEST_SOURCES)
	$(COMPILER) -I out/ -c $^ -o $@

clean: 
	rm -rf out/* 
	rm -rf bin/*

.PHONY: all clean test