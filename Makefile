## simple makefile to log workflow
.PHONY: deploy

cv:
	@cp ~/Documents/Admin/CV/cv.pdf misc/
	@cp ~/Documents/Admin/CV/bibliography.bib pubs/

deploy: cv check
	@git add misc/*
	@git add pubs/*
	@git commit -m "refresh pubs or CV" -a
	@git push

check:
	@echo ==== Checking link ====
	@./checker.pl index.html	