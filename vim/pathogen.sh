#!/bin/bash

## This script will clone or update all my vim plugins to their respective directories for use with pathogen
# I prefer this over submodules because it's easier to control and to add and remove plugins from the list

# To add a new plugin just insert it below the column of plugins that are already there. Call the function plugin
# with the name and the URL of its git repository


function errcho () {
	echo $* >&2
}

function quit() {
	cd "$cwd"
	exit $1
}

function setup() {
	cwd="$(pwd)"

	## First make sure the directories exist and pathogen is downloaded
	[ ! -d "$vimdir" ] && mkdir "$vimdir"
	if [ ! -e "$vimdir/autoload/pathogen.vim" ]; then
		mkdir -p "$vimdir/autoload"
		if hash wget 2>/dev/null; then
			wget -q https://tpo.pe/pathogen.vim -P "$vimdir/autoload"
			[ $? = 0 ] || { errcho "Err: Could not download pathogen. Are you connected to the internet?"; exit 3; }
		elif hash curl 2>/dev/null; then
			curl -sL https://tpo.pe/pathogen.vim -o "$vimdir/autoload/pathogen.vim"
			[ $? = 0 ] || { errcho "Err: Could not download pathogen. Are you connected to the internet?"; exit 3; }
		else
			errcho "Err: Could not pathogen. Either wget or curl need to be installed"
		fi
	fi
	[ ! -d "$vimdir/bundle" ] && mkdir "$vimdir/bundle"
}

function plugin (){
	trap "printf '\rAborted\n'; quit" SIGINT SIGTERM
	if ! [ -d "$1" ]; then
		local repo=""
		local opts=""

		# Get the repo URL, which should be the last argument received
		for repo; do true; done

		if ! git ls-remote "$repo" >/dev/null 2>&1; then
			echo "W: Repository $repo not found" 2>&1
			return 1
		fi

		shift
		git clone $*
	else
		if ! [ -d "$1/.git" ]; then
			errcho "Err: Directory for $1 already exists and it's not a git repository" 2>&1
			return 1
		fi

		pushd . >/dev/null
		cd "$1"
		git pull origin master
		popd >/dev/null
	fi
}

if [ $# -gt 0 ]; then
	case "$1" in
		vim) vimdir="$HOME/.vim";;
		nvim|neovim)
			if [ -n "$XDG_CONFIG_HOME" ]; then
				vimdir="$XDG_CONFIG_HOME/nvim"
			else
				vimdir="$HOME/.config/nvim"
			fi;;
		--help)
			echo "Download or update all my vim plugins."
			echo "Usage: $(basename $0) [vim|neovim]"
			echo "(Defaults to vim directory $HOME/.vim)"
			exit 0;;
		*)
			vimdir="$1";;
	esac
else
	vimdir="$HOME/.vim"
fi
setup


#Now download all the plugins
pushd . >/dev/null
cd "$vimdir/bundle"

plugin asyncrun.vim 		https://github.com/skywind3000/asyncrun.vim.git
plugin auto-pairs 			https://github.com/jiangmiao/auto-pairs.git
plugin ctrlp.vim 		    https://github.com/ctrlpvim/ctrlp.vim.git
plugin gundo.vim 			https://github.com/sjl/gundo.vim.git
plugin i3-vim-syntax 		https://github.com/PotatoesMaster/i3-vim-syntax.git
plugin matchit              https://github.com/tmhedberg/matchit.git
plugin neomake 				https://github.com/Neomake/Neomake.git
plugin nerdtree             https://github.com/scrooloose/nerdtree.git
plugin tabular              https://github.com/godlygeek/tabular.git
plugin tagbar 				https://github.com/majutsushi/tagbar.git
plugin typescript-vim 		https://github.com/leafgarland/typescript-vim
plugin vim-colorschemes 	https://github.com/flazz/vim-colorschemes.git
plugin vim-closetag 		https://github.com/alvan/vim-closetag.git
plugin vim-commentary 		https://github.com/tpope/vim-commentary.git
plugin vim-conflicted 		https://github.com/christoomey/vim-conflicted.git
plugin vim-easymotion       https://github.com/easymotion/vim-easymotion.git
plugin vim-editorconfig 	https://github.com/editorconfig/editorconfig-vim
plugin vim-fugitive 		https://github.com/tpope/vim-fugitive.git
plugin vim-repeat           git://github.com/tpope/vim-repeat.git
plugin vim-surround 		git://github.com/tpope/vim-surround.git
plugin vim-textobj-function	https://github.com/kana/vim-textobj-function.git
plugin vim-textobj-entire   https://github.com/kana/vim-textobj-entire.git
plugin vim-textobj-user 	https://github.com/kana/vim-textobj-user.git
plugin vim-tmux-navigator 	https://github.com/christoomey/vim-tmux-navigator.git
plugin vim-tmux-runner 		https://github.com/christoomey/vim-tmux-runner.git


# Plugins with special needs
plugin jedi-vim 			https://github.com/davidhalter/jedi-vim.git
if hash pip 2>/dev/null; then
	sudo pip install jedi
else
	echo "W: Python's jedi is not installed. Expect an error from vim" >&2
fi

# Cleanup some files we don't need
find . -type f \( -name "*.png" -o -name "*.jpg" \) -exec rm -f {} \;

popd >/dev/null
