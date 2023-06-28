module purge
module load StdEnv/2020 gcc/9.3.0 openmpi/4.0.3 cuda/11.4 cmake 
module load eigen/3.4.0 boost/1.80.0 glm/0.9.9.8 glfw/3.3.8 glew/2.1.0 
module load flatbuffers/22.9.24 python/3.10.2 swig/4.0.2 optix/7.5.0

ROOT_DIR=$HOME/projects/def-svassili/Chrono
SOURCE_DIR=$ROOT_DIR/chrono
BUILD_DIR=$ROOT_DIR/chrono_build
#mkdir -p $BUILD_DIR

#cd $ROOT_DIR
#wget https://downloads.sourceforge.net/irrlicht/irrlicht-1.8.5.zip
#git clone https://github.com/projectchrono/chrono.git

#wget https://bitbucket.org/blaze-lib/blaze/downloads/blaze-3.8.2.tar.gz
#tar -xf blaze-3.8.2.tar.gz
# cd blaze-3.8.2 && cmake -DCMAKE_INSTALL_PREFIX=$ROOT_DIR/blaze . && make install

#unzip irrlicht-1.8.5.zip && cd irrlicht-1.8.5/source/Irrlicht && make sharedlib -j8
#cd ../chrono && git submodule init && git submodule update
#cd ../blaze 

#Fix missing FindGLFW3.cmake
#cd $SOURCE_DIR/cmake
#wget https://github.com/JoeyDeVries/LearnOpenGL/raw/master/cmake/modules/FindGLFW3.cmake


# VSG requires Vulkan SDK and VulkanScenegraph  
# MUMPS requires mumps

# SENSOR requires optix/7.5 only
# Install OptiX/7.5.0
# eb OptiX-7.5.0.eb
# module load optix/7.5.0

cmake \
   -S$SOURCE_DIR \
   -B$BUILD_DIR \
   -DENABLE_MODULE_IRRLICHT=ON \
   -DIRRLICHT_INSTALL_DIR=$ROOT_DIR/irrlicht-1.8.5 \
   -DIRRLICHT_LIBRARY=$ROOT_DIR/irrlicht-1.8.5/lib/Linux/libIrrlicht.so.1.8.5 \
   -DENABLE_MODULE_VEHICLE=ON \
   -DENABLE_MODULE_OPENGL=ON \
   -DENABLE_MODULE_FSI=ON \
   -DENABLE_MODULE_GPU=ON \
   -DENABLE_MODULE_PARDISO_MKL=ON \
   -DENABLE_MODULE_POSTPROCESS=ON \
   -DENABLE_MODULE_SYNCHRONO=ON \
   -DENABLE_MODULE_DISTRIBUTED=ON \
   -DENABLE_MODULE_PYTHON=ON \
   -DENABLE_MODULE_SENSOR=ON \
   -DENABLE_MODULE_MULTICORE=ON \
   -DBLAZE_INSTALL_DIR=$ROOT_DIR/blaze/include

 cd $BUILD_DIR && make -j8
