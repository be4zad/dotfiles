set -U fish_user_paths /usr/local/bin $fish_user_paths
set -gx GPG_TTY (tty)

# Sets window title
function fish_title
    set -q argv[1]; or set argv fish
    set user (id -un)
    echo $user@(prompt_hostname) - $argv[1]
end
