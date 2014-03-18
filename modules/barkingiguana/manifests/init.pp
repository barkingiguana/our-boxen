class barkingiguana {
  define project(
    $nginx     = undef,
    $ruby      = undef,
    $redis     = undef,
    $mysql     = undef,
    $memcached = undef,
    $dotenv    = undef,
  ) {
    boxen::project { $name:
      nginx      => $nginx,
      ruby       => $ruby,
      redis      => $redis,
      mysql      => $mysql,
      memcached  => $memcached,
      dotenv     => $dotenv,
      source     => $name
    }
  }
}