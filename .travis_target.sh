#!/bin/bash
set -ev

if [ ${TRAVIS_TARGET} == RELEASE ]; then
  cmake .
  make cpplint
  make cppcheck
else
  cmake -DCMAKE_BUILD_TYPE=Debug -DCOVERALLS=ON .
fi

make
make test ARGS=-V

# Enable coveralls for public repos
#if [ ${TRAVIS_TARGET} == DEBUG ]; then coveralls --gcov-options '\-lp' -r .. >/dev/null; fi

