rm -rf build
mkdir build
cd build

# Download Pillar
sh downloadPillar.sh

# Download Archetype

./pillar archetype welcome

# Build book

make welcome