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

bin() {
	collector bin groq
}

zed() {
	collector .config/zed $(ls .config/zed | grep json | xargs)
	collector .config/zed/snippets $(ls .config/zed/snippets | xargs)
}

regolith() {
	collector .config/regolith3 Xresources
	# collector .config/i3lock.sh Xresources
}

fusuma() {
	collector .config/fusuma config.yaml
}

ohmyzh() {
	collector .oh-my-zsh/themes gitster.zsh-theme
}

mpv() {
	collector .config/mpv mpv.conf
}

neovide() {
	collector .config/neovide config.toml
}

nvim() {
	LUAS=$(find ~/.config/nvim -name "*.lua" | sed -E 's/^.*nvim\///g' | xargs)
	LOCKFILE="lazy-lock.json"
	SNIPPETS=$(find ~/.config/nvim -name "*.snippets" | sed -E 's/^.*nvim\///g' | xargs)
	SPELLING=$(find ~/.config/nvim -name "*.add" | sed -E 's/^.*nvim\///g' | xargs)
	SPELLING_SPL=$(find ~/.config/nvim -name "*.add.spl" | sed -E 's/^.*nvim\///g' | xargs)
	FILES=$(echo "$LUAS $LOCKFILE $SNIPPETS $SPELLING $SPELLING_SPL")
	mkdir -p .config/nvim/after/plugin
	mkdir -p .config/nvim/lua/praktiskt
	mkdir -p .config/nvim/snippets .config/nvim/spell
	for FILE in $FILES; do
		if [[ $(echo $FILE | grep 'packer_compiled.lua') ]]; then
			continue
		fi
		collector .config/nvim $FILE
	done
}

aliases() {
	# Add these to your current shell.
	cat <<EOF >aliases
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
	bin
	# alacritty
	regolith
	fusuma
	ohmyzh
	mpv
	aliases
	zed
}

main $@
