# Makefile for New Year Countdown (Elixir)

.DEFAULT_GOAL := help

.PHONY: help compile run test format clean

help: # Show available make commands
	@echo "Usage: make \033[1;34m<target>\033[0m"
	@echo
	@echo "Available targets:"
	@awk -F ': # ' '/^[a-zA-Z_-]+: # / { \
		printf "  \033[1;34m%-12s\033[0m %s\n", $$1, $$2 \
	}' $(MAKEFILE_LIST)

compile: # Compile the Elixir project
	mix compile

run: # Run the countdown app
	mix run

test: # Run the test suite
	mix test

format: # Format all source files
	mix format

clean: # Remove compiled files
	mix clean
