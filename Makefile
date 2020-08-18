# Makefile for
GH_REPO=git@github.com:AndyGlew/Test-GitHub-stuff.git
GH_WIKI_REPO=git@github.com:AndyGlew/Test-GitHub-stuff.wiki.git

# Main purposes

# (1)  hacks and the experiments with  GitHub repo, and, especially, wiki

# (2) Encapsulate knowledge of how to update submodule after git clone
# see make rule git-post-clone

########################################################################################

always: git-post-clone

# encapsulate knowledge of how to update submodule for wiki
# corresponding to repo (since document may be produced from wiki
# files)

# git stuff
# mainly to remind me about git submodule commands
# that I do not know by heart
# (and think are kluges anyway)

git-setup-submodule:
	#  only run once,  when setting up the repo
	#  NOT run on every clone
	git  submodule add ${GH_WIKI_REPO}

# TBD: this is imperfect: clone of a clone does not clone clone's submodule(s)

# run `make git-post-clone' right after git clone of Ri5-stuff
# to update submodules (currently only wiki corresponding to  GitHub repo)
git-post-clone:
	git submodule init
	git submodule update


git-diff:
	git diff --submodule


# echo DEBUG: - I'm not really debugging
# I just want these messages colorized (in emacs)
# and I already have colorization cvode for DEBUG:.*
# whereas my attempt at colorizing INFO:.* failed
# <2020-05-14>
git-status:
	@echo DEBUG: $C;git status
	@(echo DEBUG: $C/$W ;cd $W; git status)
