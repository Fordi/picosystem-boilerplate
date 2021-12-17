cmake_minimum_required(VERSION 3.18)

project(game)

# Define the entry point
picosystem_executable(
  game
  main.cpp
)

# Include assets
add_subdirectory(assets)

# Comment the next line to use the PicoSystem's full 240x240 resolution
pixel_double(game)

# Uncomment to disable the PicoSystem logo at startup
# disable_startup_logo(game)

# Uncomment the next line to disable the default spritesheet
no_spritesheet(game)
