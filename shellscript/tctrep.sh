#!/bin/bash -e


	cp -i ~/dotfiles/templates/TCTtemplate ~/TCTrep_${today}.md

	nvim ~/TCTrep_${today}.md
	# change nvim to your editor or editor App

fi
