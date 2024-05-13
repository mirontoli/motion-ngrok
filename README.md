For camera monitoring with Raspberry Pi.
When powered on, Raspberry Pi starts the camera and streams it over Internet.

## Installation

1. Update the system: `sudo apt update && sudo apt full-upgrade -y` and install git: `sudo apt install git -y`
1. Clone this repository to the target machine (eg: Raspberry Pi): `git clone https://github.com/mirontoli/motion-ngrok.git`
1. Get your `authtoken` and your domain name from ngrok website
1. Run `sudo ./install.sh <your_authtoken> <your_domain> <basic_authentication>`, replace `<your_authtoken>` and `<you_domain>` with the token and domain you've obtained before from ngrok website. Replace `<basic_authentication>` with username:password of your choice.
1. You're good to go!

## Acknowledgements

Ngrok architecture auto detection was contributed by [David Eleazar](https://github.com/elzdave).
