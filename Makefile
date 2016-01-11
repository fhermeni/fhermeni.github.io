## simple makefile to log workflow
.PHONY: deploy

deploy: check
	git push

check:
	@echo ==== Checking link ====
	@./checker.pl index.html	