########################## Year Gen. ##########################
# Sets the var Year to the given parameter where available.
# If not provided, it's set to the current year + 1.
YEAR ?= $(shell date +%Y)
YEAR := $(shell echo $$(($(YEAR) + 1)))

########################## new-comp-season ##########################
# Usage: `make new-comp-season [YEAR=2022]`
#
# 1. Creates a new "2-competition/{YEAR}" directory, pre-populated
#	 with files for the 12 monthly competitions (in draft format).
# 2. Creates a new "4-club/5-committee/{YEAR}.md" file, pre-populated
# 	with fields for the committee positions to be filled out.
#
# NOTE: YEAR is an optional parameter. If not provided it's set to
#	the current year + 1, to simplify the creation of a new season
#	at the end of September.
################################################
.PHONY: new-comp-season
new-comp-season:
	@echo "Creating new competition entries for the season ending in '$(YEAR)'"
	hugo new 2-competition/$(YEAR) --kind comp-season
	$(MAKE) new-committee-board


########################## new-committee-board ##########################
# Usage: `make new-committee-board [YEAR=2022]`
#
# 1. Creates a new "4-club/5-committee/{YEAR}.md" file, pre-populated
# 	with fields ready for the committee positions to be filled out.
#
# NOTE: YEAR is an optional parameter. If not provided it's set to
#	the current year + 1, to simplify the creation of a new season
#	at the end of September.
################################################
.PHONY: new-committee-board
new-committee-board:
	@echo "Creating new committee file for the season ending in '$(YEAR)'"
	hugo new 4-club/5-committee/$(YEAR).md --kind committee-board

