# CLI Theming
# Opening bracket
PROMPT="%{${fg_bold[white]}%}["
# Username: red if root (%!), green if normal user
PROMPT+="%(!.%{${fg_bold[red]}%}.%{${fg_bold[green]}%})%n"
# Separator colon
PROMPT+="%{${fg_bold[white]}%}:"
# Working directory in blue: if >= 5 segments deep, keep first 2 and last 1 with /.../ in between
PROMPT+="%{${fg_bold[blue]}%}%4(~:%-2~/⋯/%1~:%~)"
# Close directory bracket and open return-code bracket
PROMPT+="%{${fg_bold[white]}%}]["
# Return code: green if 0, red if non-zero
PROMPT+="%(?:%{$fg_bold[green]%}%?:%{$fg_bold[red]%}%?)"
# Close return-code bracket
PROMPT+="%{${fg_bold[white]}%}]"
# Git status (only outputs when inside a git repository)
PROMPT+="\$(git_prompt_info)"
# Newline before the prompt symbol
PROMPT+=$'\n'
# Prompt symbol (>): red if root (%!), green if normal user
PROMPT+="%(!.%{${fg_bold[red]}%}.%{${fg_bold[green]}%})>"
# Trailing space and reset text color for user input
PROMPT+=" %{$reset_color%}"

# Git Theming
# Prefix before branch name: " git:("
ZSH_THEME_GIT_PROMPT_PREFIX=" %{${fg_bold[blue]}%}git:(%{${fg_bold[red]}%}"
# Suffix after branch name: ")"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{${fg_bold[blue]}%})%{$reset_color%}"
