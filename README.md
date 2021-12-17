# PicoSystem C++ Boilerplate

This is a quick and dirty boilerplate repo to get you started quickly developing games for the PicoSystem.

## Getting Started

1. Install the tool chain.
```
bash boostrap.sh
```

2. Do an initial build of the game

```
$ mkdir build
$ cd build
$ cmake ..
$ make -j8
```

After making you'll be able to drag the `build/game/game.uf2` into the PicoSystem when it's booted into [DFU mode](https://github.com/pimoroni/picosystem#booting-picosystem-into-dfu-mode).  At this point, nothing much is going on.


3. Write your game!

Skeletal sources are in `./game`.  You can add sprite sheets to `./game/assets`
(and add them to `CMakeLists.txt` by adding the following line):

```
add_asset(game my_sprites.png)
```

You can swap to that spritesheet in your code by:

```
#include "assets/my_sprites.hpp"
/*...*/
use_my_sprites();
```
