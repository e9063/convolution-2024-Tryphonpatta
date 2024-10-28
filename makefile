# Compiler and flags
CC = gcc-14
CFLAGS = -fopenmp
SEQ_EXE = sequential.exe
PAR_EXE = parallel.exe

# Directory containing test files
TEST_DIR = .
INPUT_FILES = $(wildcard $(TEST_DIR)/input_*.txt)
OUTPUT_FOLDER = $(TEST_DIR)/output
OUTPUT_FILES = $(INPUT_FILES:$(TEST_DIR)/input_%.txt=$(OUTPUT_FOLDER)/output_%.txt)

# Targets
.PHONY: all clean run_sequential run_parallel

all: $(SEQ_EXE) $(PAR_EXE)

$(SEQ_EXE): sequential.c
	$(CC) $(CFLAGS) $< -o $@

$(PAR_EXE): parallel.c
	$(CC) $(CFLAGS) $< -o $@

# Create output directory if it doesn't exist
$(OUTPUT_FOLDER):
	mkdir -p $(OUTPUT_FOLDER)

sequential :
	gcc conv_sequential.c -o sequential.exe

parallel :
	gcc-14 conv_parallel.c -o parallel.exe -fopenmp



