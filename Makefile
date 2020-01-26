all: help

# build | Generate the site
build: clean
		@jekyll build

# clean | Clean up an existing build
clean:
		@rm -rf _site/*

# help | Display this help message
help:
		@echo "Usage: make TARGET\n"
		@echo "Targets:"
		@egrep "^# " Makefile | sed -e 's/#/ /' | column -s"|" -t

# new [TITLE=title] | Create a new post
new:
		@echo "Creating post: $(TITLE)"
		@echo "---" >> $(FILE)
		@echo "published: false" >> $(FILE)
		@echo "title: $(TITLE)" >> $(FILE)
		@echo "layout: post" >> $(FILE)
		@echo "---" >> $(FILE)
		@open $(FILE)

# start | Start the local server
start: clean
		@jekyll serve

## Default title for new posts.
TITLE ?= "New Article"

## Default format for new posts.
FORMAT ?= "md"

## File name for new posts.
##
## Post file names are of the form year-month-day-title.format.
## The title portion of the file name is created by:
##
##   1. Converting the title given by TITLE to lowercase.
##   2. Replacing any space characters with dashes.
##   3. Removing any non-alphanumeric characters such as punctuation.
##   4. Collapsing any consecutive dashes into a single dash.
##
FILE = "./_posts/"$(shell date "+%Y-%m-%d-$(TITLE)" \
			| awk '{print tolower($0)}' \
			| sed -e 'y/ /-/' \
			| sed -e 's/[^-_a-z0-9]//g' \
			| sed -e 's/\-\{2,\}/-/g' \
		)"."$(FORMAT)
