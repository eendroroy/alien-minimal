tell application "iTerm"
	create window with default profile
	tell current session of current window
		delay 5
		write text "rm alien-minimal-1.4.0"
		delay 2
		write text "asciinema rec alien-minimal-1.4.0"
		delay 5
		write text "AM_INITIAL_LINE_FEED=1"
		delay 2
		write text ""
		delay 2
		write text "echo non-empty"
		delay 2
		write text "AM_INITIAL_LINE_FEED=2"
		delay 2
		write text ""
		delay 2
		write text "echo non-empty"
		delay 2
		write text "unset AM_INITIAL_LINE_FEED"
		delay 2
		write text ""
		delay 2
		write text "echo non-empty"
		delay 2
		write text "AM_VERSIONS_PROMPT=(RUBY RUBY_S PYTHON JAVA GO NODE PHP ELIXIR)"
		delay 2
		write text "export AM_THEME=mono"
		delay 2
		write text "export AM_THEME=mono_bright"
		delay 2
		write text "export AM_THEME=terminal"
		delay 2
		write text "export AM_THEME=soft"
		delay 2
		write text "export AM_THEME=default"
		delay 2
		write text "unset AM_THEME"
		delay 2
		write text "unset AM_VERSIONS_PROMPT"
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
		write text "source venv/bin/activate"
		delay 2
		write text "sleep 5 &"
		delay 1
		write text "sleep 5 &"
		delay 1
		write text "sleep 5 &"
		delay 10
		write text "export PROMPT_START_TAG='--> '"
		delay 2
		write text "export PROMPT_END_TAG=' $'"
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
		write text "unset PROMPT_START_TAG PROMPT_END_TAG"
		delay 2
		write text "export AM_SHOW_PROCESS_TIME=1"
		delay 2
		write text "sleep 2"
		delay 3
		write text "export AM_SHOW_PROCESS_TIME=2"
		delay 2
		write text "sleep 0"
		delay 2
		write text "sleep 3"
		delay 4
		write text "export AM_SHOW_PROCESS_TIME=0"
		delay 2
		write text "sleep 2"
		delay 4
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
		write text "export AM_THEME=mono"
		delay 2
		write text "export AM_THEME=mono_bright"
		delay 2
		write text "export AM_THEME=terminal"
		delay 2
		write text "export AM_THEME=soft"
		delay 2
		write text "export AM_THEME=default"
		delay 2
		write text "unset AM_THEME"
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
		delay 5
		write text "exit"
	end tell
end tell
