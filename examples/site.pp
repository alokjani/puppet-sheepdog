node /^sheep-\d+/ {
  include sheepdog::packages

  host { 'sheep-1':      ip => '192.168.20.21' }
  host { 'sheep-2':      ip => '192.168.20.22' }
  host { 'sheep-3':      ip => '192.168.20.23' }
}

