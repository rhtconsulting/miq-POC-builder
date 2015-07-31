#!/bin/sh
PROJECTS=( \
"miq-BASE" \
"miq-F5" \
"miq-BlueCat" \
"miq-InfoBlox" \
"miq-Amazon" \
"miq-BMC" \
"miq-Chef" \
"miq-Citrix" \
"miq-HP-OperationsManager" \
"miq-HP-ServerAutomation" \
"miq-LDAP" \
"miq-MenAndMice" \
"miq-Networking" \
"miq-Oracle" \
"miq-VMware" \
"miq-NetApp" \
"miq-ServiceNow" \
"miq-RedHat-Satellite5" \
"miq-RedHat-Satellite6" \
"miq-RedHat-CloudForms" \
"miq-RedHat-OpenStack" \
"miq-RedHat-RHEV" \
)

install_rake_helper() {
cd /tmp

if [ -d cfme-rhconsulting-scripts-master ] ; then
    rm -fR /tmp/cfme-rhconsulting-scripts-master
fi

wget -O cfme-rhconsulting-scripts.zip https://github.com/rhtconsulting/cfme-rhconsulting-scripts/archive/master.zip
unzip cfme-rhconsulting-scripts.zip
cd cfme-rhconsulting-scripts-master
make install
}

load_projects() {
PROJECT_NAME="${1}"
PROJECT_ZIP="https://github.com/rhtconsulting/${1}/archive/master.zip"
cd /tmp
wget -O ${PROJECT_NAME}.zip ${PROJECT_ZIP}
unzip ${PROJECT_NAME}.zip
cd ${PROJECT_NAME}-master
sh install.sh
}



install_rake_helper
for NAME in ${PROJECTS[@]} ; do
    load_projects ${NAME}
done
