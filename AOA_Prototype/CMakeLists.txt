cmake_minimum_required(VERSION 3.16)

project(AOA_Prototype VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)


find_package(Qt6 REQUIRED COMPONENTS Quick QuickTest QuickControls2)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appAOA_Prototype
    main.cpp
)

qt_add_qml_module(appAOA_Prototype
    URI AOA_Prototype
    VERSION 1.0
    QML_FILES
        Main.qml
        Theme.qml
        RESOURCES font/Free-Solid-900.otf
        FirstPage.qml
        components/CustomButton.qml
        components/CustomButtonStartStop.qml
        components/CustomImage.qml
        components/CustomLable.qml
        components/CustomLableButtonsGroup.qml
        qmlTests/tst_custoButton.qml
    SOURCES
        src/backend.h src/backend.cpp
        QML_FILES
)

# Include directories
target_include_directories(appAOA_Prototype PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    # ${CMAKE_CURRENT_SOURCE_DIR}/tests
    # ${CMAKE_CURRENT_SOURCE_DIR}/components
    # ${CMAKE_CURRENT_SOURCE_DIR}/qml_tests
)
# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appAOA_Prototype PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appAOA_Prototype
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appAOA_Prototype
    PRIVATE Qt6::Quick Qt6::QuickControls2 Qt6::QuickTest
)
target_link_libraries(appAOA_Prototype PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS appAOA_Prototype
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# # ------------------ QML Unit Tests ------------------
add_executable(qml_tests
    tests/qml_tst_runner.cpp
    qmlTests/tst_custoButton.qml
)

target_link_libraries(qml_tests
    PRIVATE
        Qt6::Core
        Qt6::Qml
        Qt6::Quick
        Qt6::QuickControls2
        Qt6::QuickTest
)


# Tell CMake where QML modules live
set(QML_IMPORT_PATH
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/components
    ${CMAKE_CURRENT_SOURCE_DIR}/qmlTests
)
set_target_properties(qml_tests PROPERTIES
    QT_QML_IMPORT_PATH "${QML_IMPORT_PATH}"
)

# Copy QML folders to build dir
file(COPY ${CMAKE_SOURCE_DIR}/qmlTests DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_SOURCE_DIR}/components DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_SOURCE_DIR}/Theme.qml DESTINATION ${CMAKE_BINARY_DIR})

enable_testing()
add_test(NAME QMLTests COMMAND qml_tests)
