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
}
