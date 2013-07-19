class ruby-install {

  $essentials = ['build-essential', 'bison', 'openssl', 'libreadline6', 'libreadline6-dev',
  'curl', 'git-core', 'zlib1g', 'zlib1g-dev', 'libssl-dev', 'libyaml-dev', 'libsqlite3-dev',
  'sqlite3', 'libxml2-dev', 'libxslt1-dev', 'autoconf', 'libc6-dev', 'libncurses5-dev',
  'automake', 'libtool', 'gcc-snapshot', 'libxslt-dev', 'ncurses-dev', 'nodejs', 'subversion']

  package { $essentials: ensure => "installed" }->

  # Create the source folder
  file { '/root/source':
    ensure => 'directory',
  }->

  # Download Ruby
  exec { 'download_ruby':
    command => 'wget ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz',
    cwd     => '/root/source',
  }->

  exec { 'uncompress_ruby':
    command => 'tar -zxvf /root/source/ruby-2.0.0-p247.tar.gz',
    cwd     => '/root/source',
  }->

  exec { 'configure_ruby':
    command   => '/root/source/ruby-2.0.0-p247/configure',
    cwd       => '/root/source/ruby-2.0.0-p247',
    timeout   => 480,
    logoutput => true,
  }->

  exec { 'make_ruby':
    command   => 'make',
    cwd       => '/root/source/ruby-2.0.0-p247',
    timeout   => 600,
    logoutput => true,
  }->

  exec { 'install_ruby':
    command   => 'make install',
    cwd       => '/root/source/ruby-2.0.0-p247',
    timeout   => 480,
    logoutput => true,
  }

}