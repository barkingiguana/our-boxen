# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.6.2", :repo => "barkingiguana/puppet-boxen"

# Support for default hiera data in modules

github "module-data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "1.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.0.100"
github "git",         "2.3.1"
github "go",          "2.0.1"
github "homebrew",    "1.9.2"
github "hub",         "1.3.0"
github "inifile",     "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.3"
github "nodejs",      "3.7.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.1"
github "stdlib",      "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "spotify",     "1.0.1"
github "skype",       "1.0.8"
github "vagrant",     "3.0.5"
github "virtualbox",  "1.0.10"
github "mysql",       "1.2.0"
github "postgresql",  "3.0.0"
github "sysctl",      "1.0.1"
github "redis",       "2.1.0"
github "memcached",   "2.0.0"
github "imagemagick", "1.2.0"
github "java",        "1.5.0"
github "jmeter",      "0.1.3"
github "icu4c",       "1.0.1"
github "r",           "0.0.1", :repo => "barkingiguana/puppet-r"
github "elasticsearch", "2.3.0"
github "maven",       "1.0.7", :repo => "steinim/puppet-maven"
github "wget",        "1.0.1"
github 'gpg',         '0.0.4', :repo => 'steinim/puppet-gpg'
github 'signing-party', '0.0.10', :repo => 'barkingiguana/puppet-signing-party'
