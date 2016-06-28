class sheepdog::packages {

  $package_list = [ 
    'zookeeper', 
    'zookeeperd', 
    'xfsprogs',
    'gdisk',
    'ntp',
    'sheepdog'
  ]

  package { $package_list: 
      ensure  => installed,
  }

}
