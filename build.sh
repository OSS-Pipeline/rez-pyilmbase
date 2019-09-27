#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

BUILD_PATH=$1
PYILMBASE_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "============="
echo -e "=== BUILD ==="
echo -e "============="
echo -e "\n"

echo -e "[BUILD][ARGS] BUILD PATH: ${BUILD_PATH}"
echo -e "[BUILD][ARGS] PYILMBASE VERSION: ${PYILMBASE_VERSION}"

cd ${BUILD_PATH}

# We build PyIlmBase.
echo -e "\n"
echo -e "[BUILD] Building PyIlmBase-${PYILMBASE_VERSION}..."
echo -e "\n"

make -j${REZ_BUILD_THREAD_COUNT}

echo -e "\n"
echo -e "[BUILD] Finished building PyIlmBase-${PYILMBASE_VERSION}!"
echo -e "\n"
