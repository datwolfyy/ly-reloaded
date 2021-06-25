# Ly - a TUI display manager
![Ly screenshot](https://user-images.githubusercontent.com/5473047/88958888-65efbf80-d2a1-11ea-8ae5-3f263bce9cce.png "Ly screenshot")

Ly is a lightweight TUI (ncurses-like) display manager for Linux and BSD.

We have patched Ly with several bug fixes to make Ly adapt to more machines and have it set environment variables correctly (for example XDG_SESSION_TYPE which a few apps require to make them work).

## Download
A package is availabie in the AUR as ``ly-plank-patched``. However, to make it work, you'll need to enable the ``ly`` systemd service after installing ly.

If you're using any other distro you can always use the pre-built packages in the releases.

## Dependencies
 - a C99 compiler (tested with tcc and gcc)
 - a C standard library
 - GNU make
 - pam
 - xcb
 - xorg
 - xorg-xauth
 - mcookie
 - tput
 - shutdown

On Debian-based distros running `apt install build-essential libpam0g-dev libxcb-xkb-dev` as root should install all the dependencies for you.

On Arch-based distros installing the AUR package (which is listed in the **Download** section) will install all the dependencies for you.

## Support
The following desktop environments were tested with success
 - budgie
 - cinnamon
 - deepin
 - enlightenment
 - gnome
 - i3
 - kde
 - lxde
 - lxqt
 - mate
 - sway
 - xfce
 - pantheon
 - maxx
 - windowmaker

Ly should work with any X desktop environment, and provides
basic Wayland support (sway works very well, for example).

## systemd?
Unlike what you may have heard, Ly does not require `systemd`,
and was even specifically designed not to depend on `logind`.
You should be able to make it work easily with a better init,
changing the source code won't be necessary :)

## Cloning and Compiling
Clone the repository
```
git clone https://github.com/nullgemm/ly
```

Go to its directory
```
cd ly
```

Fetch submodules
```
make github
```

Compile
```
make
```

Install Ly and the provided systemd service file
```
sudo make install
```

Enable the service
```
sudo systemctl enable ly.service
```

Test in the configured tty (tty2 by default)
or a terminal emulator (but desktop environments won't start)
```
sudo make run
```

If you need to switch between ttys after Ly's start you also have to
disable getty on Ly's tty to prevent "login" from spawning on top of it
```
sudo systemctl disable getty@tty2.service
```

## Configuration
You can find all the configuration in `/etc/ly/config.ini`.
The file is commented, and includes the default values.

## Controls
Use the up and down arrow keys to change the current field, and the
left and right arrow keys to change the target desktop environment
while on the desktop field (above the login field).

## .xinitrc
If your .xinitrc doesn't work make sure it is executable and includes a shebang.
This file is supposed to be a shell script! Quoting from xinit's man page:
```
If no specific client program is given on the command line, xinit will look for
a file in the user's home directory called .xinitrc to run as a shell script to
start up client programs.
```
On ArchLinux, the example .xinitrc (/etc/X11/xinit/xinitrc) starts like this:
```
#!/bin/sh
```

## Tips
The numlock and capslock state is printed in the top-right corner.
Use the F1 and F2 keys to respectively shutdown and reboot.
Take a look at your .xsession if X doesn't start, as it can interfere
(this file is launched with X to configure the display properly).

## PSX DOOM fire animation
To enable the famous PSX DOOM fire described by [Fabien Sanglard](http://fabiensanglard.net/doom_fire_psx/index.html),
just uncomment `animate = true` in `/etc/ly/config.ini`. You may also
disable the main box borders with `hide_borders = true`.

## Additional Information
The name "Ly" is a tribute to the fairy from the game Rayman.
Ly was tested by oxodao, who is some seriously awesome dude.
