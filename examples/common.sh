#!/bin/bash
# this runs as root

set -x
set -e

function check_apt() {
  LASTUPDATED=`stat /var/lib/apt/periodic/update-success-stamp | grep Access | tail -n 1 | awk '{print $2}'`
  TODAY=`date  +%Y-%m-%d`
  test $LASTUPDATED = $TODAY && echo "APT was updated today .. skipping." || apt-get update
}

check_apt
test -h /etc/puppet/modules/sheepdog || ln -s /vagrant /etc/puppet/modules/sheepdog
test -h /etc/puppet/manifests/site.pp || ln -s /vagrant/examples/site.pp /etc/puppet/manifests/
puppet apply --verbose /vagrant/examples/site.pp --modulepath /etc/puppet/modules/
