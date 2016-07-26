# iterm2-vim
use iterm2 semantic history open file in new tab by vim when ⌘ -Click

usage:

at first:
  run `curl -fsSL https://raw.githubusercontent.com/kaidiren/iterm2-vim/master/install.sh | sh`

then:

  open itrm2 -> Preference -> Profiles -> default -> Advanced -> Semantic History

and then:

  select Run coprocess and paste `osascript ~/.iterm2/scripts/vim.scpt @@\1 @@\2`
