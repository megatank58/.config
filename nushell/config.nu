# config.nu
#
# Installed by:
# version = "0.105.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
alias ghci = ghci-9.6.7
alias ghc = ghc-9.6.7
$env.PATH ++= ['~/.calcagebra/bin', '~/.ghcup/bin', '~/.cabal/bin', '~/.local/share/gem/ruby/3.4.0/bin', '~/.local/bin']
$env.EDITOR = 'hx'
$env.QTSCRCPY_KEYMAP_PATH = '/home/megatank58'
source ~/.zoxide.nu
source ./theme.nu
$env.config.show_banner = false
