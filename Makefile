COMPILER=ocamlopt

MODULES=out/abr.cmx
SOURCES=src/abr.ml

TEST_EXEC=bin/tests
TEST_MODULES=out/tests.cmx
TEST_SOURCES=src/tests.ml

all: $(MODULES)

test: all $(TEST_EXEC)

$(MODULES): $(SOURCES)
	$(COMPILER) -I out/ -c $^ -o $@

$(TEST_EXEC): $(MODULES) $(TEST_MODULES)
	$(COMPILER) -o $@ $^

$(TEST_MODULES): $(TEST_SOURCES)
	$(COMPILER) -I out/ -c $^ -o $@

clean: 
	rm -rf out/* 
	rm -rf bin/*

.PHONY: all clean test