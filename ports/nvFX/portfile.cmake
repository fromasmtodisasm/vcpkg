include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO fromasmtodisasm/nvfx
    REF 16866af0afb5d425e3c2db1a4829a79a9ee353bf
    SHA512 97da13c1740a3adb8cb385b5897b8d1dc2fd0f240ee24a31c2b63a00f8e0c6df649b1582f3959c71b9a3b7e4b33458addab4b1bc1cfde0cff6b8b5a29aaf42eb
    HEAD_REF master
    PATCHES
      glew2glad-and-remove-path-shader.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS ${FEATURE_OPTIONS}
	    -DUSE_SVCUI=OFF
	    -DBUILD_SAMPLES=OFF
)
vcpkg_install_cmake()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")


file(READ ${CMAKE_SOURCE_DIR}/README.md _readme)
string(REGEX MATCH "````(.*)````"  _copyright ${_readme})
file(WRITE ${SOURCE_PATH}/license.txt ${_copyright})
file(INSTALL ${SOURCE_PATH}/license.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
