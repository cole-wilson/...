# add chezmoi

# Paths
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
fish_add_path ~/bin
fish_add_path ~/.gem/ruby/3.0.0/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin
fish_add_path /System/Volumes/Data/Users/cole/Library/Android/sdk/emulator/
# set -U fish_user_paths ~/miniforge3/bin $fish_user_paths
set -gx SDKROOT (xcrun --show-sdk-path)

export LIBRARY_PATH="/opt/homebrew/lib/"
export CPATH="/opt/homebrew/include/"
export BAT_PAGER="less -R --"
export DISPLAY=":0"

# Aliases
alias lg="lazygit"
alias _ssh="ssh"
alias _cat="/bin/cat"
alias ip='python3 -c "import socket as s;o=s.socket(s.AF_INET,s.SOCK_DGRAM);o.connect((\'8.8.8.8\', 80));print(o.getsockname()[0]);o.close()"'
alias chmox="chmod +x"
alias cat="bat"
alias icat="kitty +kitten icat"
alias sl="sl -F"
alias fit="fgh"
alias fishc="nvim ~/.config/fish/config.fish"
alias nvimc="nvim ~/.config/nvim/init.vim"
alias nvimplug="nvim ~/.config/nvim/plugins.vim"
alias kittyc="nvim ~/.config/kitty/kitty.conf"
alias tree="tree -C"
alias clean="source ~/.config/clean.fish"
alias server="python3 -m http.server"
alias :q="exit"
alias :wq="exit"
alias md="python3 -m rich.markdown"
alias :quit="exit"
alias quit="exit"
alias fastkitty="for i in (seq 600);printf 'yes cat must run fast!! &';end | ."
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"
alias ...="cd ~/..."
alias notes="$EDITOR ~/notes"
alias theme="kitty +kitten themes"
# Abbreviations
abbr -a -- - 'cd -'

# Functions
function m
	if [ -e main.py ]
		python3 main.py $argv
	else if [ -e app.py ]
		python3 app.py $argv
	else
		python3 . $argv
	end
end
function c
	curl cheat.sh/$argv[1]/(string join + $argv[2..])
end
function note
	if set -q argv[1]
		echo ===================== (date) ============================================================= >> ~/notes
		echo $argv >> ~/notes
	else
		set tempfile (mktemp)
		$EDITOR $tempfile
		echo ===================== (date) ============================================================= >> ~/notes
		cat $tempfile >> ~/notes
		rm $tempfile
	end
end
function s 
	tput smcup
	if set -q argv[1]
		/bin/cat > $argv[1]
	else
		/bin/cat > /dev/null
	end
	tput rmcup
end
function uhoh
	for i in (pgrep $argv[1])
		sudo kill -9 $i
	end
end
function fish_greeting
	# set_color cyan;
	# echo "welcome to the shell!"
	neofetch
end
function fish_command_not_found
	echo whoops, the command "$argv[1]" was not found by fish.
end
function ssh
	clear
	kitty +kitten ssh $argv
end
function video_to_object
	if set -q argv[1]
		set tempdir (mktemp -d)
		ffmpeg -i $argv[1] $tempdir/%04d.jpg -hide_banner
		set_color cyan
		echo frames are in $tempdir
		echo if you wish, edit them, and then hit enter below:
		read -P "continue>"
		set_color reset
		mkdir $argv[1].output
		objc $tempdir $argv[1].output
		echo results in $argv[1].output/
		rm -rf $tempdir
	else
		echo please provide a video as an argument
		return 1
	end
end
function sayer
	while true
    	printf ">"
    	read output
    	say $output $argv
	end
end
function mk
	mkdir $argv
	cd $argv
end
function fcd --wraps "fgh ls"
  if [ -d ~/projects/cole-wilson/$argv[1] ]
	  cd ~/projects/cole-wilson/$argv[1]
  else if ! cd (fgh ls $argv) > /dev/null
    echo "Failed to find repository"; return 1
  end
end
function new
	switch $argv[1]
		case ""
			read name_of_project -P "name of project > "
		case "*"
			set name_of_project $argv[1]
	end
	mkdir -p ~/projects/cole-wilson/$name_of_project
	cd ~/projects/cole-wilson/$name_of_project
	nvim
end
function ytmusic
	set tempdir (mktemp -d)
	cd $tempdir
	yt -aAt 5 $argv
	cp *.mp3 "/Users/cole/Music/Music/Media.localized/Automatically Add to Music.localized"
	cd -
	rm -rf $tempdir
end
function g
	set querystring (python3 -c "import urllib.parse,sys;print(urllib.parse.urlencode({'q':' '.join(sys.argv[1:])}), end='')" $argv)
	open "https://google.com/search?$querystring"
end

# starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
status is-interactive && eval /Users/cole/miniforge3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

fish_add_path /opt/homebrew/opt/node@14/bin


set HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
if test -f $HB_CNF_HANDLER
   source $HB_CNF_HANDLER
end
