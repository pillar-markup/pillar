rm -rf build
mkdir build
cd build

# Download Pillar
wget https://raw.githubusercontent.com/pillar-markup/pillar/master/download.sh
chmod +x download.sh
./download.sh

# Download Archetype

./pillar archetype welcome

# Build book

make welcome