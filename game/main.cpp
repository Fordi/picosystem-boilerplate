#include "picosystem.hpp"
using namespace picosystem;
#include "./assets/spritesheet.hpp"


void init() {
    use_spritesheet();
}

void update(uint32_t tick) {
}

void draw(uint32_t tick) {
  pen(0, 0, 0);
  clear();

  std::string battery_level = std::to_string(battery());

  pen(255, 255, 255);
  text("Hello, World!", 10, 10);
  text("Battery: " + battery_level, 10, 20);
}
