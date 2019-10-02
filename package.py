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
    "gcc-6+",
    "cmake-3+",
    "boost-1.61",
    "numpy-1.12.1",
    "ilmbase-{version}".format(version=str(version))
]

variants = [
    ["platform-linux"]
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

uuid = "pyilmbase-{version}".format(version=str(version))

def commands():
    env.LD_LIBRARY_PATH.prepend("{root}/lib")
    env.PYTHONPATH.prepend("{root}/lib64/python2.7/site-packages")

    # Helper environment variables.
    env.PYILMBASE_INCLUDE_PATH.set("{root}/include")
    env.PYILMBASE_LIBRARY_PATH.set("{root}/lib")
