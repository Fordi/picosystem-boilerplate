cmake_minimum_required(VERSION 3.18)

include(pico-sdk/pico_sdk_init.cmake)

project(game)

pico_sdk_init()

include(picosystem/picosystem-config.cmake)

function(add_asset target)
    foreach(asset IN LISTS ARGN)
        string(REGEX REPLACE "[.]png$" "" ASSET_NAME ${asset})
        string(REGEX REPLACE "[.]png$" ".hpp" ASSET_HPP ${asset})
        execute_process(
            COMMAND echo "Adding ${asset} -> ${ASSET_HPP}"
        )
        add_custom_command(
            OUTPUT ${ASSET_HPP}
            WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
            COMMAND bash "tools/build-spritesheet.sh" "${CMAKE_CURRENT_SOURCE_DIR}/${asset}"
            MAIN_DEPENDENCY ${asset}
        )
        set(spr_target "generate_spritesheet_${ASSET_NAME}")
        set_source_files_properties(${ASSET_HPP} PROPERTIES GENERATED 1)
        add_custom_target(${spr_target} DEPENDS ${ASSET_HPP})
        add_dependencies(${target} ${spr_target})
    endforeach()
endfunction()

add_subdirectory(game)
