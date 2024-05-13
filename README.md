For camera monitoring with Raspberry Pi.
When powered on, Raspberry Pi starts the camera and streams it over Internet.

## My use case

I monitor my 3D Printer remotely. I have a Raspberry Pi 2 with a wifi dongle, a USB Camera and Raspberry Pi OS Lite 32 bit Bookworm (no desktop). In order to start it, I just need to connect it to power, point the camera to the 3D Printer and that's all.

## Installation

1. Update the system: `sudo apt update && sudo apt full-upgrade -y` and install git: `sudo apt install git -y`
1. Clone this repository to the target machine (eg: Raspberry Pi): `git clone https://github.com/mirontoli/motion-ngrok.git`
1. Get your `authtoken` and your domain name from ngrok website
1. Run `sudo ./install.sh <your_authtoken> <your_domain> <basic_authentication>`, replace `<your_authtoken>` and `<you_domain>` with the token and domain you've obtained before from ngrok website. Replace `<basic_authentication>` with username:password of your choice.
1. You're good to go!

## Acknowledgements

Ngrok Service Setup was developed by [Vincent Hsu](https://github.com/vincenthsu)

Ngrok architecture auto detection was contributed by [David Eleazar](https://github.com/elzdave).
