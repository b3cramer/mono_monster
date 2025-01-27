#!/usr/bin/env bash

get_shell_rc () {
    shell_name=$(basename "$SHELL")

    case "$shell_name" in
        bash) echo "$HOME/.bashrc" ;;
        zsh) echo "$HOME/.zshrc" ;;
        sh) echo "$HOME/.shrc" ;;
        csh) echo "$HOME/.cshrc" ;;
        ksh) echo "$HOME/.kshrc" ;;
        fish) echo "$HOME/.config/fish/config.fish" ;;  # Fish uses a different path
        *)
            echo "Unknown shell: $SHELL"
            exit 1
            ;;
    esac
}

git_branch_update () {
    current=$(git rev-parse --abbrev-ref HEAD)
    echo "Current branch is: $current"
    main=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
    echo "Main branch is: $main"
    git checkout $main && git pull && git checkout $current && git merge $main
}

# Alias for git_branch_update
gu () {
    git_branch_update_test
}

# Alias for git status
gs () {
    git status
}

# Setup the aliases in the shell config file
cat <<EOF >> "$(get_shell_rc)"

####################################################
#### Installed by Workstation Automation Script ####
####################################################

## Func to update the current branch with the repo main branch ##
$(declare -f git_branch_update)

## Alias for the function ##
$(declare -f gu)

## Alias for git status ##
$(declare -f gs)

#unset the default alias for ll before setting the way I like it :)
unalias ll
alias ll="ls -laF"

##############################################
#### End of Workstation Automation Script ####
##############################################
EOF

echo "Aliases and functions added to $(get_shell_rc)"
echo "Please restart your shell to see the changes"