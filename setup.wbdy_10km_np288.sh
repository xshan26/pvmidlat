#!/bin/bash
#Created Time : 2026/02/15

#-------------------------------------------------------------------------------
export PATH=/opt/intel2020/compilers_and_libraries/linux/mpi/intel64/bin:$PATH
#source /home/app_path/intel2017.sh

DIR=/home/shanxuan

# the model path
#-------------------------------------------------------------------------------
SRC=${DIR}/MITgcm_c65l

# some pathes
#-------------------------------------------------------------------------------
BIN=${DIR}/MOC/binary
MODS=${DIR}/MOC/mods
CODE=${DIR}/MOC/code
CODE2=${DIR}/MOC/codemom
#BUILD=${DIR}/build
#RUN=${DIR}/run

# mods the temp path for overriding source code
#-------------------------------------------------------------------------------
rm -r ${MODS}
mkdir ${MODS}
cp ${CODE}/* ${MODS}/.
cp ${CODE2}/* ${MODS}/.

# the optfile path
#-------------------------------------------------------------------------------
OPTS=${DIR}/newsetup/build_options.sh

# copy the SIZE.h file to the model code path
#-------------------------------------------------------------------------------
cp ${CODE}/SIZE.h ${SRC}/model/inc/
cp ${CODE}/CPP_OPTIONS.h ${SRC}/model/inc/
#cp ${CODE}/CPP_EEOPTIONS.h ${SRC}/eesupp/inc/

# compile in the build path
#-------------------------------------------------------------------------------
cd ${SRC}/bin
${SRC}/tools/genmake2 -of=${OPTS} -mpi -mods=${DIR}/MOC/mods -rootdir=${SRC} #-ieee

# make
#-------------------------------------------------------------------------------
make Clean
make depend
make

# copy file
#-------------------------------------------------------------------------------
cp ${SRC}/bin/mitgcmuv ${BIN}/VEC360x360x60np288
