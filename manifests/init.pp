class ruby-install {

  # Create the source folder
  file { '~/source':
    ensure => 'directory',
  }->

  # Download Ruby
  exec { 'download_ruby':
    command => 'wget ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz',
    cwd     => '~/source',
  }->

  exec { 'uncompress_ruby':
    command => 'tar -zxvf ~/source/ruby-2.0.0-p247.tar.gz',
    cwd     => '~/source',
  }->

  exec { 'configure_ruby':
    command => 'configure',
    cwd     => '~/source/ruby-2.0.0-p247',
  }->

  exec { 'make_ruby':
    command => 'make',
    cwd     => '~/source/ruby-2.0.0-p247',
  }->

  exec { 'install_ruby':
    command => 'make install',
    cwd     => '~/source/ruby-2.0.0-p247',
  }

}