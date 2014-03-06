class people::craigw {
  include projects::all

  # Muscle memory makes me type ~/code
  file { "/Users/${::luser}/code":
    ensure => link,
    target => $boxen::config::srcdir
  }

  repository {
    "${boxen::config::srcdir}/craigw/dotfiles":
      source => "${::github_login}/dotfiles",
      require => File[$boxen::config::srcdir],
  }

  define dotfile {
    file { "/Users/${::luser}/.${name}":
      ensure => link,
      target => "${boxen::config::srcdir}/craigw/dotfiles/$name",
      force => true
    }
  }

  dotfile {
    [
      'gitignore-global', 'gitconfig', 'aliases', 'ssh',
      'vim', 'vimrc', 'bashrc', 'bash_profile'
    ]:;
  }

  package {
    'bash-completion':;
  }

  exec { 'set Terminal startup theme':
    command => '/usr/bin/defaults write com.apple.Terminal "Startup Window Settings" -string "Homebrew"',
    unless => '/usr/bin/defaults read com.apple.Terminal "Startup Window Settings" |/usr/bin/grep Homebrew'
  }

  exec { 'set Terminal default theme':
    command => '/usr/bin/defaults write com.apple.Terminal "Default Window Settings" -string "Homebrew"',
    unless => '/usr/bin/defaults read com.apple.Terminal "Default Window Settings" |/usr/bin/grep Homebrew'
  }

  exec { 'set Terminal exit action':
    command => '/usr/libexec/PlistBuddy -c "Set \"Window Settings\":Homebrew:shellExitAction 0" ~/Library/Preferences/com.apple.Terminal.plist',
    unless => '/usr/libexec/PlistBuddy -c "Print \"Window Settings\":Homebrew:shellExitAction" ~/Library/Preferences/com.apple.Terminal.plist |/usr/bin/grep 0'
  }
}
