vimrc_path="vim/.vimrc"
plugins_list=$(sed -n '/^[^#].*Plug /s/.*Plug \('\''\)\([^'\''\/]*\/[^'\''\/]*\)\('\''\).*/\2/p' $vimrc_path)
ycm_build_options="--rust-completer --verbose"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

function check_dependencies() {
  forced_commands=(stow vim git python3 curl)
  optional_commands=(vim.nox clangd cmake)
  error=1
  ask=1

  for i in ${forced_commands[@]}; do
    if ! [ -x "$(command -v $i)" ]; then
      echo "$i: not found"
      if [[ "$i" == "stow" ]]; then
        echo -e "${YELLOW}You must not run this script before stow!${NC}"
      fi
      error=0
    fi
  done

  for i in ${optional_commands[@]}; do
    if ! [ -x "$(command -v $i)" ]; then
      echo -ne "$i: not found"
      if [[ "$i" == "vim.nox" && "$(vim --version | grep '+python3')" ]]; then
        echo -ne "- ${GREEN}You don't need to vim.nox because python3 feature "
        echo -e  "included to your vim.\n${NC}"
        ask=1
      else
        echo ""
        ask=0
      fi
    fi
  done

  if [ "$error" = 0 ]; then
    echo -e "\n${RED}Failed.${NC}"
    exit 1;
  fi

  if [ "$ask" = 0 ]; then
    echo -e "\n${YELLOW}Some optional things are not installed. ${NC}"
    while true; do
      read -p "Continue? (y/n) " yn
      case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y or n.";;
      esac
    done
  fi
}

# Print list of plugins and ask from user to install
function ask_user() {
  echo "The list of plugins that will be installed is as follows:"

  for i in $plugins_list; do
    echo -e "  ${BLUE}*${NC} $i"
  done

  echo ""
  echo "The list of plugins that will be built is as follows:"

  echo -e "  ${BLUE}*${NC} ycm-core/YouCompleteMe\
  (build options: $ycm_build_options)\n"

  echo -ne "${YELLOW}Make sure you entered stow commands "
  echo -e "noticed in README.md before.${NC}"

  echo ""

  while true; do
    read -p "Continue? (y/n) " yn
    case $yn in
      [Yy]* ) break;;
      [Nn]* ) exit;;
      * ) echo "Please answer y or n.";;
    esac
  done
}

function install_vim_plugins() {
  echo -e "  ${BLUE}*${NC} Installing Vim plugins..."
  vim -c InstallAllPlugins
}

function ask_ycm_options() {
  prefer=1
  while true; do
    echo ""
    read -p "Do you want to build YCM with your options? (y/n)" yn
    case $yn in
      [Yy]* ) prefer=0; break;;
      [Nn]* ) return;;
      * ) echo "Please answer y or n.";;
    esac
  done

  echo -ne "Enter your YCM options for build: "
  while true; do
    read -p "Enter your YCM options for build: " custom_ycm_options
    case $custom_ycm_options in
      "" ) echo "It's empty!";;
      * ) ycm_build_options=$custom_ycm_options; break;;
    esac
  done
}

function check_user_is_root_ycm() {
  if [ "$(id -u)" == "0" ]; then
    echo ""
    read -p "You are in root user, add --force-sudo to YCM build options? (y/n)" yn
    case $yn in
      [Yy]* ) ycm_build_options+=" --force-sudo"; return;;
      [Nn]* ) return;;
      * ) echo "Please answer y or n.";;
    esac
  fi
}

function build_youcompleteme() {
  echo -e "  ${BLUE}*${NC} Building YouCompleteMe... (options: $ycm_build_options)"
  sh -c "cd $HOME/.vim/plugged/YouCompleteMe/ && git submodule update --init --recursive && python3 install.py $ycm_build_options"
}

check_dependencies
ask_user
install_vim_plugins
ask_ycm_options
check_user_is_root_ycm
build_youcompleteme
