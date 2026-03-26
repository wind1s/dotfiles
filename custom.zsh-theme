# cli theming
PROMPT="%{${fg_bold[grey]}%}[%{${fg_bold[green]}%}%n%{${fg_bold[grey]}%}:%{${fg_bold[blue]}%}%c%{${fg_bold[grey]}%}]\$(git_prompt_info) %{${fg_bold[green]}%}> %{$reset_color%}"

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX=" %{${fg_bold[blue]}%}git:(%{${fg_bold[red]}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{${fg_bold[blue]}%})%{$reset_color%}"
