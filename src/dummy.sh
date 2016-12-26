#!/bin/bash

LOG="/syncLog"
VMORIG="/media/SSDData/VirtualBox"
PROJORIG="/media/Data/Projects"
SETUPORIG="/home/wright/Documents/LaTeX/linuxSetup"
DESTSETUP="/home/wright/Dropbox/linuxSetup"
DESTROOT="/media/ExtData/Backups"
LOGVM=${DESTROOT}"/VirtualBox"${LOG}
LOGPROJ=${DESTROOT}"/Projects"${LOG}
ALLORIG="/"
DESTALL=${DESTROOT}"/All"
LOGALL=${DESTROOT}"/All"${LOG}
LOGSETUP=${DESTSETUP}${LOG}

echo "STARTED" > ${LOGPROJ}
echo "PARAMETERS: $1 $2 $3" >> ${LOGPROJ}
date +%d.%m.%Y/%H:%M:%S >> ${LOGPROJ}
rsync -arpEogvvx --progress --no-whole-file ${PROJORIG} ${DESTROOT} >> ${LOGPROJ}
echo "FINISHED" >> ${LOGPROJ}
date +%d.%m.%Y/%H:%M:%S >> ${LOGPROJ}

echo "STARTED" > ${LOGVM}
echo "PARAMETERS: $1 $2 $3" >> ${LOGVM}
date +%d.%m.%Y/%H:%M:%S >> ${LOGVM}
rsync -arpEogvvx --progress --no-whole-file  ${VMORIG} ${DESTROOT} >> ${LOGVM}
echo "FINISHED" >> ${LOGVM}
date +%d.%m.%Y/%H:%M:%S >> ${LOGVM}

echo "STARTED" > ${LOGALL}
echo "PARAMETERS: $1 $2 $3" >> ${LOGALL}
date +%d.%m.%Y/%H:%M:%S >> ${LOGALL}
mv ${DESTALL}/backup_old.tar.gz ${DESTALL}/backup_older.tar.gz >> ${LOGALL}
mv ${DESTALL}/backup.tar.gz ${DESTALL}/backup_old.tar.gz >> ${LOGALL}
tar -cvpzf ${DESTALL}/backup.tar.gz --exclude=/indel/* --exclude=/media/* --exclude=/proc/* --exclude=/mnt/* --exclude=/tmp/* --exclude=/dev/* --exclude=/sys/* --exclude=/lost+found/* --exclude=/run/* --exclude=/var/run/* --exclude=/var/tmp/* ${ALLORIG}  >> ${LOGALL}
rm ${DESTALL}/backup_older.tar.gz  >> ${LOGALL}
echo "FINISHED" >> ${LOGALL}
date +%d.%m.%Y/%H:%M:%S >> ${LOGALL}

## sync linux setup document to Dropbox
echo "STARTED" > ${LOGSETUP}
echo "PARAMETERS: $1 $2 $3" >> ${LOGSETUP}
date +%d.%m.%Y/%H:%M:%S >> ${LOGSETUP}
# delete all files in destination except the log file
shopt -s extglob
cd ${DESTSETUP}
rm -rf !(./${LOG})
# remove .pdf in order to guarantee that project is compiled
rm ${SETUPORIG}/linuxSetup.pdf
# compile project in origin 
make -C ${SETUPORIG} >> ${LOGSETUP}
# copy files to destination
cp -rp ${SETUPORIG} /home/wright/Dropbox
echo "FINISHED" >> ${LOGSETUP}
date +%d.%m.%Y/%H:%M:%S >> ${LOGSETUP}

