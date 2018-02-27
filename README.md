# Life-Sim-Genetic-Algorithm
Life simulation using genetic algorithm. Processing/Java

There are bots object which are placed on the two dimensional array - environment. 
Each cell of the environmental grid has its type. Currently, there are next types:
1. TBot
2. TResource
3. TEmpty

Bots when placed in the environment, can execute certain actions:
1. Stay,            where energy each game move: -0.05 
2. Move,            where energy each game move: -1
3. Eat Resources,   where energy each move: +1
4. Eat another bot, where energy each move: +1
5. Pass resource,
6. Reproduce

All the actions has direction. Bots, on each move will get the environment copy of the area 3x3 with the bot itself in the middle.
Action direction is a number from 0 to 7 starting from top left cell and going clockwise by side cells, skipping the mible bot's cell.
