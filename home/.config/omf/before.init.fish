# ========== fish customization ==========

# Enable vi mode on this bitch
fish_vi_key_bindings

# ========== theme customization ==========

# Enabling awesome fonts
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_aboid_ambigous_glyphs yes

# Git stuff
set -g theme_display_git yes
set -g theme_display_git_untracked yes

# Enabling Vi
set -g theme_display_vi yes

# Fix that shitty date format
set -g theme_display_date yes
set -g theme_date_format "+%A %m/%d/%Y %I:%M %p"

# Hide process
set -g theme_title_display_process no
set -g theme_display_cmd_duration no

# Hide directory
set -g theme_title_display_path no

# Path display
set -g theme_title_use_abbreviated_path no
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 0

# Cursor on new line
set -g theme_newline_cursor no
set -g theme_newline_prompt '﬌ '

# Solarized this bitch
set -g theme_color_scheme solarized
