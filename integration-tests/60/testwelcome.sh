# Set magic variables for current file & dir
export __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"


rm -rf build
mkdir build
cd build

# Download Pillar
sh ${__dir}/downloadPillar.sh

# Download Archetype

./pillar archetype welcome

# Build book

make welcome