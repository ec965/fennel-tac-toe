SRC_DIR := ./fnl
LIB_DIR := ./fnl/lib
LIB_DIST_DIR := ./lua/lib
DIST_DIR := ./lua

SRC_FILES := $(wildcard $(SRC_DIR)/*.fnl) $(wildcard $(LIB_DIR)/*.fnl)
DIST_FILES := $(patsubst $(SRC_DIR)/%.fnl,$(DIST_DIR)/%.lua,$(SRC_FILES))

.PHONY: all run clean test

all: $(LIB_DIST_DIR) $(DIST_FILES)

run: all
	cd ./lua && lua init.lua

test: all
	cd ./lua && lua test.lua

clean: 
	rm -rf $(DIST_FILES)

$(LIB_DIST_DIR):
	mkdir -p $(LIB_DIST_DIR)

$(DIST_DIR)/%.lua: $(SRC_DIR)/%.fnl
	fennel -c $< > $@
