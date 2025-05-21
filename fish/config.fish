if status is-interactive
    # ~/.config/fish/config.fish
    set -U fish_greeting "May the flames of ambition guide you, Nev."
    set -Ux EDITOR nvim
    set -Ux fish_user_paths $fish_user_paths $HOME/go/bin

    starship init fish | source
end
