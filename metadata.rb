name             "laravel"
maintainer       "Scott Weldon"
maintainer_email "open-source@scott-weldon.com"
license          "MIT license"
description      "Installs and configures Laravel and additional modules"

version          "1.0.0"

supports 'ubuntu'
supports 'debian'

depends "php", "1.5.0"
depends "php-mcrypt"
depends "apt"
depends "apache2"
depends "mysql", "4.1.2"
depends "composer"

recipe 'laravel', 'Installs and configures Laravel and additional modules.'
recipe 'laravel::admin', "Installs and configures FrozenNode's Admin module."

attribute "laravel/db/host",
  :display_name => "Laravel MySQL host",
  :description => "Host for the Laravel MySQL database.",
  :default => "localhost"

attribute "laravel/db/user",
  :display_name => "Laravel MySQL user",
  :description => "Laravel will connect to MySQL using this user.",
  :default => "root"

attribute "laravel/db/pass",
  :display_name => "Laravel MySQL password",
  :description => "Password for the Laravel MySQL user.",
  :default => "MySQL::server_root_password"

attribute "laravel/db/name",
  :display_name => "Laravel MySQL database",
  :description => "Laravel will connect to this MySQL database.",
  :default => "laraveldb"

attribute "laravel/project_root",
  :display_name => "Laravel project root directory",
  :description => "Laravel project root directory.",
  :default => "/srv"

attribute "laravel/project_name",
  :display_name => "Laravel project name",
  :description => "Laravel project name.",
  :default => "user defined requirement"
