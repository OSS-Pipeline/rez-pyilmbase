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

    ${EXTRACT_PATH}/configure --prefix=${INSTALL_PATH} --with-ilmbase-prefix=${REZ_ILMBASE_ROOT} --with-boost-include-dir=${REZ_BOOST_ROOT}/include --with-boost-lib-dir=${REZ_BOOST_ROOT}/lib --disable-ilmbasetest --disable-boostpythontest
fi

echo -e "\n"
echo -e "[CONFIGURE] Finished configuring PyIlmBase-${PYILMBASE_VERSION}!"
echo -e "\n"
