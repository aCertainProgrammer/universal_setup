
# Administration
alias s="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && flatpak update -y"

# Git
alias com="git add . && git commit && git push"
alias pub="git checkout main && git merge dev && git push && git checkout dev"
alias pub2="git checkout gh-pages && git merge main && git push && git checkout main"

# Utils
alias ls="eza -l"
alias c="clear"

# Navigation shortcuts
alias rc="nvim ~/.bashrc"
alias cfg="cd ~/.config/nvim/"

# Project commands
alias dev="npm run dev"
alias check="npm run check"
alias build="npm run build"
alias up="docker compose up"
alias down="docker compose down"

export PATH=$PATH:/usr/local/go/bin:~/go/bin/
