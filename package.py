name = "pyilmbase"

version = "2.2.1"

authors = [
    "Industrial Light & Magic"
]

description = \
    """
    Python bindings for IlmBase.
    """

requires = [
    "gcc-6",
    "cmake-3",
    "ilmbase-2.2.1",
    "boost-1.61.0",
    "numpy-1.12.1"
]

variants = [
    ["platform-linux"]
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

#TODO: Use the SHA1 of the archive instead.
uuid = "pyilmbase-2.2.1"

def commands():
    env.LD_LIBRARY_PATH.prepend("{root}/lib")
    env.PYTHONPATH.prepend("{root}/lib64/python2.7/site-packages")
