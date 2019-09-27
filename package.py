name = "pyilmbase"

version = "2.2.1"

authors = [
    "Industrial Light & Magic"
]

description = \
    """
    Utility libraries from Industrial Light & Magic: Half, Imath, Iex, IlmThread.
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

tools = [
    "pyilmbase"
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

#TODO: Use the SHA1 of the archive instead.
uuid = "pyilmbase-2.2.1"

def commands():
    env.PATH.prepend("{root}/bin")
