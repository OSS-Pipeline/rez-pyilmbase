#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

BUILD_PATH=$1
PYILMBASE_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${BUILD_PATH}"
echo -e "[INSTALL][ARGS] PYILMBASE VERSION: ${PYILMBASE_VERSION}"

cd ${BUILD_PATH}

# We install PyIlmBase.
echo -e "\n"
echo -e "[INSTALL] Installing PyIlmBase-${PYILMBASE_VERSION}..."
echo -e "\n"

make -j${REZ_BUILD_THREAD_COUNT} install

echo -e "\n"
echo -e "[INSTALL] Finished installing PyIlmBase-${PYILMBASE_VERSION}!"
echo -e "\n"
