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

  boxen::osx_defaults { 'set Terminal startup theme':
    ensure => present,
    domain => 'com.apple.Terminal',
    key => 'Startup Window Settings',
    type => 'string',
    value => 'Homebrew',
    user => $::boxen_user
  }

  boxen::osx_defaults { 'set Terminal default theme':
    ensure => present,
    domain => 'com.apple.Terminal',
    key => 'Default Window Settings',
    type => 'string',
    value => 'Homebrew',
    user => $::boxen_user
  }

  exec { 'set Terminal exit action':
    command => '/usr/libexec/PlistBuddy -c "Set \"Window Settings\":Homebrew:shellExitAction 0" ~/Library/Preferences/com.apple.Terminal.plist',
    unless => '/usr/libexec/PlistBuddy -c "Print \"Window Settings\":Homebrew:shellExitAction" ~/Library/Preferences/com.apple.Terminal.plist |/usr/bin/grep 0'
  }

  include spotify
  include skype
}
