# This is install script

if ! command -v stow &> /dev/null
then
    echo "Stow is required to install dotfiles, but not found."
    exit 1
fi

# install options
INSTALL_ZSHRC=true
INSTALL_YABAIRC=false
INSTALL_VIMRC=true
INSTALL_SKHDRC=false
INSTALL_IDEAVIMRC=true
INSTALL_I3CONFIG=false
INSTALL_KITTYCONFIG=true
INSTALL_NVIMCONFIG=true
INSTALL_PICOMCONFIG=false
INSTALL_POLYBARCONFIG=false

# disable to not auto determine which options to install
auto_options=true


if [[ "$auto_options" == true ]]; then
    osname=$(uname)

    if [[ $osname == "Darwin" ]]; then
        INSTALL_YABAIRC=true
        INSTALL_SKHDRC=true
    elif [[ $osname == "Linux" ]]; then
        INSTALL_I3CONFIG=true
        INSTALL_PICOMCONFIG=true
        INSTALL_POLYBARCONFIG=true
    else
        echo "auto_options is set to true, but osname is unknown"
        exit 1
    fi
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

OPTIONS=""
IGNORE=()

echo "Install configuration:"

printf ".zshrc "
if [[ $INSTALL_ZSHRC == false ]]; then
    IGNORE+=("(.zshrc)")
    printf "(✗)\n"
else
    printf "(✓)\n"
fi

printf ".yabarc "
if [[ $INSTALL_YABAIRC == false ]]; then
    IGNORE+=("(.yabairc)")
    printf "(✗)\n"
else
    printf "(✓)\n"
fi

printf ".vimrc "
if [[ $INSTALL_VIMRC == false ]]; then
    IGNORE+=("(.vimrc)")
    printf "(✗)\n"
else
    printf "(✓)\n"
fi

printf ".skhdrc "
if [[ $INSTALL_SKHDRC == false ]]; then
    IGNORE+=("(.skhdrc)")
    printf "(✗)\n"
else
    printf "(✓)\n"
fi

printf ".ideavimrc "
if [[ $INSTALL_IDEAVIMRC == false ]]; then
    IGNORE+=("(.ideavimrc)")
    printf "(✗)\n"
else
    printf "(✓)\n"
fi

printf ".config/i3 "
if [[ $INSTALL_I3CONFIG == false ]]; then
    IGNORE+=("(.config/i3)")
    printf "(✗)\n"
else
    printf "(✓)\n"
fi

printf ".config/kitty "
if [[ $INSTALL_KITTYCONFIG == false ]]; then
    IGNORE+=("(.config/kitty)")
    printf "(✗)\n"
else
    printf "(✓)\n"
fi

printf ".config/nvim "
if [[ $INSTALL_NVIMCONFIG == false ]]; then
    IGNORE+=("(.config/nvim)")
    printf "(✗)\n"
else
    printf "(✓)\n"
fi

printf ".config/picom "
if [[ $INSTALL_PICOMCONFIG == false ]]; then
    IGNORE+=("(.config/picom)")
    printf "(✗)\n"
else
    printf "(✓)\n"
fi

printf ".config/polybar "
if [[ $INSTALL_POLYBARCONFIG == false ]]; then
    IGNORE+=("(.config/polybar)")
    printf "(✗)\n"
else
    printf "(✓)\n"
fi

LEN="${#IGNORE[@]}"
for ((i=0; i < $LEN; i++)); do
    if [[ i -eq 0 ]]; then
        OPTIONS+="--ignore="
    fi
    OPTIONS+="${IGNORE[i]}"
    if [[ i -ne $(($LEN-1)) ]]; then
        OPTIONS+="|"
    fi
done
OPTIONS+=" --dir=$SCRIPT_DIR --target=$HOME ."

# echo "stow $OPTIONS"
stow $OPTIONS
