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
    "boost-1.61",
    "cmake-3+",
    "gcc-6+",
    "ilmbase-{version}".format(version=str(version)),
    "numpy-1.12.1",
    "python-2.7+<3"
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
    env.PYTHONPATH.prepend("{root}/lib/python2.7/site-packages")

    # Helper environment variables.
    env.PYILMBASE_LIBRARY_PATH.set("{root}/lib")
