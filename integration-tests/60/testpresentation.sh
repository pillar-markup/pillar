rm -rf build
mkdir build
cd build

# Download Pillar
sh downloadPillar.sh

# Download Archetype

./pillar archetype presentation

# Build book

make presentation