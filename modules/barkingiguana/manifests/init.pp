class barkingiguana {
  define project(
    $nginx = undef,
    $ruby  = undef
  ) {
    boxen::project { $name:
      nginx  => $nginx,
      ruby   => $ruby,
      source => $name
    }
  }
}
