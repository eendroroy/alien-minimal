tell application "iTerm"
	create window with default profile
	tell current session of current window
		delay 2
		write text "rm alien-minimal-1.4.1"
		delay 2
		write text "asciinema rec alien-minimal-1.4.1"
		delay 5
		write text "AM_VERSIONS_PROMPT=(RUBY RUBY_S PYTHON JAVA GO NODE PHP ELIXIR)"
		delay 2
		write text ""
		delay 2
		write text ""
		delay 2
		write text "AM_VERSIONS_PROMPT=(RUBY_S JAVA NODE ELIXIR)"
		delay 2
		write text "cd /tmp/am-demo"
		delay 2
		write text "touch stash && git add stash"
		delay 2
		write text "git stash push -m stash stash"
		delay 2
		write text "false"
		delay 2
		write text "true"
		delay 2
		write text "unset AM_VERSIONS_PROMPT"
		delay 2
		write text "source venv/bin/activate"
		delay 2
		write text "export AM_PROMPT_START_TAG='--> '"
		delay 2
		write text "export AM_PROMPT_END_TAG=' $'"
		delay 2
		write text "false"
		delay 2
		write text "true"
		delay 2
		write text "export AM_ERROR_ON_START_TAG=1"
		delay 2
		write text "false"
		delay 2
		write text "true"
		delay 2
		write text "unset AM_PROMPT_START_TAG AM_PROMPT_END_TAG"
		delay 2
		write text "export AM_SHOW_FULL_DIR=1"
		delay 2
		write text "export AM_SHOW_FULL_DIR=0"
		delay 2
		write text "false"
		delay 2
		write text "true"
		delay 2
		write text "export AM_HIDE_EXIT_CODE=1"
		delay 2
		write text "false"
		delay 2
		write text "true"
		delay 2
		write text "deactivate"
		delay 2
		write text "touch stash && git add stash"
		delay 2
		write text "git stash push -m stash2 stash"
		delay 2
		write text "git stash pop"
		delay 2
		write text "git rm stash && rm stash"
		delay 2
		write text "git stash pop"
		delay 2
		write text "git rm stash && rm stash"
		delay 2
		write text "exit"
		delay 2
		write text "exit"
	end tell
end tell
