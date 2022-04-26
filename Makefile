SRC_DIR := ./fnl
DIST_DIR := ./lua
SRC_FILES := $(wildcard $(SRC_DIR)/*.fnl)
DIST_FILES := $(patsubst $(SRC_DIR)/%.fnl,$(DIST_DIR)/%.lua,$(SRC_FILES))

.PHONY: all run

all: $(DIST_FILES)

run: all
	lua ./lua/init.lua

$(DIST_DIR)/%.lua: $(SRC_DIR)/%.fnl
	fennel -c $< > $@
