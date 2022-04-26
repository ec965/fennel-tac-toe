SRC_DIR := ./fnl
LIB_DIR := ./fnl/ttt
DIST_DIR := ./lua
SRC_FILES := $(wildcard $(SRC_DIR)/*.fnl) $(wildcard $(LIB_DIR)/*.fnl)
DIST_FILES := $(patsubst $(SRC_DIR)/%.fnl,$(DIST_DIR)/%.lua,$(SRC_FILES))

.PHONY: all run clean debug

debug:
	$(info var is $(SRC_FILES))

all: $(DIST_FILES)

run: all
	lua ./lua/init.lua

clean: 
	rm -rf $(DIST_FILES)

$(DIST_DIR)/%.lua: $(SRC_DIR)/%.fnl
	fennel -c $< > $@
