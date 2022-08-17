
<p align="center">
<img width="200" alt="Raycast Amphetamine Control" src="images/amphetamine.png"/>
</p>

# Dose (Amphetamine) for Raycast

This is a collection of scripts for Raycast to control the Amphetamine macOS app.

It can start an Amphetamine session for:

* 1, 2, 4, 8, 10, or 12 hour(s)
* indefinitely
* for any duration (`x` hours or minutes)
* until 5pm
* until time `<param>`

## Installation

<p align="center">
<img width="200" alt="Raycast Logo" src="images/raycast.png"/>
</p>

More information about installing/enabling [Raycast Script Commands can be found on the official GitHub page](https://github.com/raycast/script-commands).

## Why Separate Scripts?

I wanted to have discrete Raycast commands available for commonly used durations.

## Inspiration

Some inspiaration was taken from the [Alfred Dose extension](https://www.thoughtasylum.com/2021/03/22/alfred-workflow-amphetamine-app/), but this is a much more rudimentary solution.

## Known Issues

* It would make sense to simply call the `dose-amphetamine-for-duration.sh` script from the others, so I may simplify at some point.
* There is a lot of duplication
* Shell scripts are totally linear, no functions used
* Assumes BSD based `date` utility

## Contact

[This project on GitHub](https://github.com/mikeoertli/dose-amphetamine-raycast)
