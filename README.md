
<p align="center">
<img width="200" alt="Raycast Amphetamine Control" src="images/amphetamine.png"/>
</p>

# Dose (Amphetamine) for Raycast

This is a collection of scripts for [Raycast](https://www.raycast.com) to control the [Amphetamine macOS app](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12).

It can start an Amphetamine session for:

* 1, 2, 4, 8, or 12 hour(s)
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

Some inspiaration was taken from the [Alfred Dose extension](https://www.thoughtasylum.com/2021/03/22/alfred-workflow-amphetamine-app/).

## Known Issues

* It would make sense to simply call the `dose-amphetamine-for-duration.sh` script from the others, so I may simplify at some point.
* There is a lot of duplication
* Shell scripts are totally linear, no functions used
* Assumes BSD based `date` utility

## Disclaimer

This project is not in any way affiliated with Raycast or Amphetamine.

Raycast branding and logo are property of [Raycast](https://www.raycast.com).

Amphetamine branding and logo are property of [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12).

## Contact

[This project on GitHub](https://github.com/mikeoertli/dose-amphetamine-raycast)
