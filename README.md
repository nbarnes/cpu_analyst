[![Build Status](https://travis-ci.org/nbarnes/cpu_analyst.png)](https://travis-ci.org/nbarnes/cpu_analyst)[![Code Climate](https://codeclimate.com/github/nbarnes/cpu_analyst.png)](https://codeclimate.com/github/nbarnes/cpu_analyst)[![Security Status](http://rails-brakeman.com/nbarnes/cpu_analyst.png)](http://rails-brakeman.com/nbarnes/cpu_analyst)

ANNOUCEMENT
===========
Due to game system changes in Firefall, detailed at http://www.firefallthegame.com/news/path-to-launch-blog-1-progression-and-itemization and http://www.firefallthegame.com/news/path-to-launch-blog-2-resources-crafting-professions-and-more, the
Firefall CPU_Analyst is obsolete. This project is unlikely to recieve further
updates. The live site remains deployed at Heroku
(http://www.cpu-analyst.heroku.com) for anybody that cares to experience a
little of the old Firefall magic.

CPU_Analyst
===========

CPU_Analyst is a frame constraints analysis and CPU recommendation tool for
Red5's online game, Firefall.  The live deployment the Analyst can be found
at http://cpu-analyst.heroku.com/

Overview
========

In Firefall, the player can customize their powered armor, or 'frame', by
mounting different pieces of equipment.  This customization is limited by the
frame's ability to meet the mass limitations, power needs, and CPU core
requirements of the equipped items.  In particular, CPU cores can be added to
equipment, lowering that item's mass and power costs.  However, each
additional CPU added to an item has a reduced effect, and a frame can only
mount a total of 18 CPUs betweeen all its equipped items, so it is important
to deploy the ability to reduce the costs of an item via CPUs carefully.  This
tool analyzes the frame and offers its analysis of the best way to allocate
the frame's CPU capacity.

Effect of CPU Cores on Equipment
================================

Each CPU core applied to an item reduces the mass and power (or 'constraints')
costs of that item.  Each CPU beyond the 1st will have a reduced effect. A
single CPU core will reduce the constraint costs of the item by -10%. Two CPU
cores will reduce the costs by -19%.  An item may include 0 to 5 cores
reducing constraint values (plus additional cores for ability items).  See
below for the complete list of % effects.

1 core  = -10%; 2 cores = -19%; 3 cores = -27%; 4 cores = -34%; 5 cores = -41%

Core CPUs
=========

Some items have CPU requirements that are separate from the CPU costs of any
constraint-reducing CPUs built into that item.  These 'core' CPUs do not
count against the constraint-reducing-CPU limit of 5.

Frame Levels
============
In Firefall, the player can level their frames, increasing the frame's mass,
power, and CPU capacity.  Modeling this progression is beyond the current
scope of this tool.  All frames will be assumed to be at maximum level.  The
capacity of a max level frame are 2000 mass, 1000 power, and 18 CPU cores.

About Me
========
My name is Nathaniel Barnes, and I am a software developer living in Seattle,
WA with five family members, five horses, five cats, and five chickens.  I
enjoy making software tools, drinking chai, and watching chickens.  I also
like playing Firefall, as this application suggests.  I can be reached at
nbarnes@gmail.com

LICENSE
=======

(The MIT License)

Copyright (c) Nathaniel Barnes

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
