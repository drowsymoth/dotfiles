set -gx PATH $HOME/.cargo/bin $PATH
set -g fish_greeting

# General
set -g fish_color_normal B4BDC3
set -g fish_color_command 61ABDA
set -g fish_color_keyword CF86C1

# Arguments and options
set -g fish_color_param B4BDC3
set -g fish_color_option 8BAE68

# Strings
set -g fish_color_quote 8BAE68
set -g fish_color_escape 65B8C1

# Operators and redirections
set -g fish_color_operator 65B8C1
set -g fish_color_redirection 61ABDA
set -g fish_color_end B279A7

# Comments and errors
set -g fish_color_comment 403833
set -g fish_color_error DE6E7C

# Paths
set -g fish_color_valid_path --underline B4BDC3

# Suggestions
set -g fish_color_autosuggestion 403833

# Selection
set -g fish_color_selection --background=3D4042

# Matching brackets
set -g fish_color_match --background=3D4042

# Search
set -g fish_color_search_match --background=3D4042

# History pager
set -g fish_pager_color_prefix 61ABDA
set -g fish_pager_color_completion B4BDC3
set -g fish_pager_color_description 888F94
set -g fish_pager_color_progress 65B8C1
