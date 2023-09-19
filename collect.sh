#!/usr/bin/env /bin/bash
set -x
set -e
# Formatting:
# * One function per application
# * The function should copy all relevant files into this repo
# * All files collected shall be placed in a folder identical to the function name

collector() {
    P=$1
    mkdir -p $P
    FILES=(${@:2})
    for FILE in $FILES; do
        cp ~/$P/$FILE $P/$FILE
    done    
}

alacritty() {
    collector .config/alacritty alacritty.yml
}

regolith() {
    collector .config/regolith2 Xresources
}

fusuma() {
    collector .config/fusuma config.yml
}

ohmyzh() {
    collector .oh-my-zsh/themes gitster.zsh-theme
}

nvim() {
    LUAS=`find ~/.config/nvim -name "*.lua" | sed -E 's/^.*nvim\///g' | xargs`
    SNIPPETS=`find ~/.config/nvim -name "*.snippets" | sed -E 's/^.*nvim\///g' | xargs`
    FILES=`echo "$LUAS $SNIPPETS"`
    mkdir -p .config/nvim/after/plugin
    mkdir -p .config/nvim/lua/praktiskt
    mkdir -p .config/nvim/snippets
    for FILE in $FILES; do
        if [[ `echo $FILE | grep 'packer_compiled.lua'` ]]; then
            continue
        fi
        collector .config/nvim $FILE
    done
}

aliases() {
    # Add these to your current shell.
    cat <<EOF > aliases
# Aliases from praktiskt/dotfiles
alias vim="nvim"
alias open="xdg-open"
alias python="python3"
alias copy="xclip -sel clip"
alias translate="docker run soimort/translate-shell"
alias calc="docker run -it praktiskt/insect"
ffsub() {
    fn=\$(uuidgen)
    echo "🌟 Output file will be: \$fn"
    ffmpeg -i $1 -c:v libx264 -preset veryfast -vf subtitles=\$2 \$fn.mp4
    echo "🌟 Created \$(pwd)/\$fn.mp4"
}
alias paste="xclip -selection clipboard -o"
EOF
}

main() {
    nvim
    alacritty
    regolith
    fusuma
    ohmyzh
    aliases
}

main $@
