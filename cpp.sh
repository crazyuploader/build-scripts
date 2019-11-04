echo "Compiling with G++"
for f in $(ls *.cpp); do echo "Compiling with g++ $f"; g++ $f; done
for f in $(ls Practical_File/*.cpp); do echo "Compiling with g++ $f"; g++ $f; done
echo "Compiling with Clang++"
for f in $(ls *.cpp); do echo "Compiling with clang++ $f"; clang++ $f; done
for f in $(ls Practical_File/*.cpp); do echo "Compiling with clang++ $f"; clang++ $f; done
