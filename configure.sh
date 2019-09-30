#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

EXTRACT_PATH=$1
BUILD_PATH=$2
INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
PYILMBASE_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "================="
echo -e "=== CONFIGURE ==="
echo -e "================="
echo -e "\n"

echo -e "[CONFIGURE][ARGS] EXTRACT PATH: ${EXTRACT_PATH}"
echo -e "[CONFIGURE][ARGS] BUILD PATH: ${BUILD_PATH}"
echo -e "[CONFIGURE][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[CONFIGURE][ARGS] PYILMBASE VERSION: ${PYILMBASE_VERSION}"

# We run the configuration script of PyIlmBase.
echo -e "\n"
echo -e "[CONFIGURE] Running the configuration script from PyIlmBase-${PYILMBASE_VERSION}..."
echo -e "\n"

if [ -d ${BUILD_PATH} ]; then
    cd ${BUILD_PATH}
else
    mkdir -p ${BUILD_PATH}
    cd ${BUILD_PATH}

    sed "s|COMPONENTS Python|OPTIONAL_COMPONENTS python python2 python2.7|1" --in-place ${BUILD_PATH}/../CMakeLists.txt

    cmake ${BUILD_PATH}/.. -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH} -DCMAKE_C_FLAGS=-fPIC -DCMAKE_CXX_FLAGS=-fPIC -DILMBASE_PACKAGE_PREFIX=${REZ_ILMBASE_ROOT} -DBOOST_ROOT=${REZ_BOOST_ROOT} -DPYTHON_LIBRARY=${REZ_PYTHON_ROOT}/lib/libpython2.7.a -DPYTHON_INCLUDE_DIR=${REZ_PYTHON_ROOT}/include
fi

echo -e "\n"
echo -e "[CONFIGURE] Finished configuring PyIlmBase-${PYILMBASE_VERSION}!"
echo -e "\n"
