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

run_sequential :	
	@mkdir -p output; \
	for file in $(INPUT_FILES); do \
		real_output=output_`echo $$file | sed -E 's|\.\/input_(.*)|\1|' | sed 's|_| |g' | sed 's| |_|g'`; \
		output_file=output/parallel_`basename $$file`; \
		./$(SEQ_EXE) < $$file > $$output_file; \
		sed '$$d' $$output_file > $$output_file.tmp; \
		cat $$real_output > $$real_output.tmp; \
		diff_output=$$(diff $$output_file.tmp $$real_output.tmp); \
		echo "$$diff_output"; \
		if [ -z "$$diff_output" ]; then \
			echo "\033[32mTest $$file passed\033[0m"; \
		else \
			echo "\033[31mTest $$file failed\033[0m"; \
		fi; \
		rm $$output_file.tmp $$real_output.tmp; \
		tail -1 $$output_file; \
	done

run_parallel :
	$(CC) $(CFLAGS) conv_parallel.c -o $(PAR_EXE)	
	@mkdir -p output; \
	for file in $(INPUT_FILES); do \
		real_output=output_`echo $$file | sed -E 's|\.\/input_(.*)|\1|' | sed 's|_| |g' | sed 's| |_|g'`; \
		output_file=output/parallel_`basename $$file`; \
		./$(PAR_EXE) < $$file > $$output_file; \
		sed '$$d' $$output_file > $$output_file.tmp; \
		cat $$real_output > $$real_output.tmp; \
		diff_output=$$(diff $$output_file.tmp $$real_output.tmp); \
		echo "$$diff_output"; \
		if [ -z "$$diff_output" ]; then \
			echo "\033[32mTest $$file passed\033[0m"; \
		else \
			echo "\033[31mTest $$file failed\033[0m"; \
		fi; \
		rm $$output_file.tmp $$real_output.tmp; \
		tail -1 $$output_file; \
	done



