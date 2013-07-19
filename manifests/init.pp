class ruby-install {

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
    timeout   => 480,
    logoutput => true,
  }->

  exec { 'install_ruby':
    command   => 'make install',
    cwd       => '/root/source/ruby-2.0.0-p247',
    timeout   => 480,
    logoutput => true,
  }

}