rm -rf build
mkdir build
cd build

# Download Pillar
sh downloadPillar.sh

# Download Archetype

./pillar archetype basic-latex

# Build book

make all