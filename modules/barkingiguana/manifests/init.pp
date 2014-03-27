class barkingiguana {
  define project(
    $nginx      = undef,
    $ruby       = undef,
    $redis      = undef,
    $mysql      = undef,
    $memcached  = undef,
    $dotenv     = undef,
    $postgresql = undef,
    $nodejs     = undef,
    $phantomjs  = undef,
    $aliases    = undef,
  ) {
    boxen::project { $name:
      nginx      => $nginx,
      ruby       => $ruby,
      redis      => $redis,
      mysql      => $mysql,
      memcached  => $memcached,
      dotenv     => $dotenv,
      postgresql => $postgresql,
      nodejs     => $nodejs,
      phantomjs  => $phantomjs,
      source     => $name
    }

    if(is_array($aliases)) {
      $host_alias = regsubst($name, '[^a-zA-Z0-9]+', '-', 'G')
      host { "project-${host_alias}-aliases":
	ip => '127.0.0.1',
	host_aliases => $aliases
      }
    }
  }
}
