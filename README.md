# Chrono
#### Module SENSOR 
SENSOR requres optix/7.5.0. To install it download NVIDIA-OptiX-SDK-7.5.0-linux64-x86_64.sh (registration required). Then run the following commands: 

cd $ROOT_DIR && eb OptiX-7.5.0.eb
module load optix/7.5.0

#### Making libraries accessible to group members.

The linker locates libraries in chrono_build/lib through the installer's home directory, which is not accessible to other group users.

Solution:
Create links to the libraries accessible to all group members in the directory chrono_build/lib_shared

for f in ../lib/*.so ; do echo basename $f; ln -s  /project/def-kbubbar/Chrono_test_2023_06_28/chrono_build_debug/lib/`basename $f` `basename $f`; done

Also create a link libIrrlicht.so.1.8 pointing to libIrrlicht.so.1.8.5


