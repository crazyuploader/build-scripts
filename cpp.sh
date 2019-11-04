LGR='\033[1;32m'

echo "Compiling with G++"
for f in $(ls *.cpp); do echo "Compiling with g++ $f"; g++ $f; done
for f in $(ls Practical_File/*.cpp); do echo "Compiling with g++ $f"; g++ $f; done
echo ""
echo -e ${LGR} "Build with G++ OK"
echo ""
echo "Compiling with Clang++"
for f in $(ls *.cpp); do echo "Compiling with clang++ $f"; clang++ $f; done
for f in $(ls Practical_File/*.cpp); do echo "Compiling with clang++ $f"; clang++ $f; done
echo ""
echo -e ${LGR} "Build with Clang++ OK"
