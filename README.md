<h1 align="center"> DotFiles</h1>
<h3 align="center"><i>almeida's</i>  <b>".config"</b> <i>backup & a noob's work in progress.</i></h3>

_______

Original desing by [PapyElGringo](https://github.com/material-shell/material-awesome), this version is based on [ChrisTitusTech](https://github.com/ChrisTitusTech/titus-awesome)'s fork.

_______

A keyboard centered experience, with good mouse support. 

This fork focus on streamlining the workflow with a hibrid keyboard/mouse usage. The whole system can be controled using only the keyboard, but the [keybinds](https://github.com/PoisonIsBestType/dotfiles#-keybinds-) are setup focused on the left hand, freeing the users right hand by concentrating the controls to the `W/A/S/D` area and using the `Super` key as main modkey.

_______
<h2 align="center"> INDEX </h2>

<details>
<summary><b>
Click here
</b></summary>

- <a href="https://github.com/PoisonIsBestType/dotfiles#-galery-">Galery</a>

- <a href="https://github.com/PoisonIsBestType/dotfiles#-setup-">Setup</a>

- <a href="https://github.com/PoisonIsBestType/dotfiles#program-list">Program List</a>

- <a href="https://github.com/PoisonIsBestType/dotfiles#blacklotus-theme">BlackLotus theme-files</a>

- <a href="https://github.com/PoisonIsBestType/dotfiles#oldbook-theme">OldBook theme-files</a>

- <a href="https://github.com/PoisonIsBestType/dotfiles#dependencies">Dependencies</a>

- <a href="https://github.com/PoisonIsBestType/dotfiles#clone-the-files">Clone</a>

- <a href="https://github.com/PoisonIsBestType/dotfiles#set-the-themes">Set themes</a>

- <a href="https://github.com/PoisonIsBestType/dotfiles#-keybinds-">Keybinds</a>

- <a href="https://github.com/PoisonIsBestType/dotfiles#-documentation-">Documentation</a>



</details>

_______

These dotfiles are meant to be used with both `OpenSuse Tumbleweed` and `Linux Mint` using `awesomewm` as desktop environment, but they could work on any other distro with some tinkering.

Avaliable in two colorschemes: BlackLotus (dark) and OldBook (light).

<h3 align="center">BlackLotus: </h3>

![](./desktop-blacklotus.png)

<h3 align="center">OldBook: </h3>

![](./desktop-oldbook.png)

_______
<h2 align="center"> GALERY </h2>

 <details>
<summary><b>
Click here 
</b></summary>
  
_______
  
<h3 align="center">Top Panel </h3>

  
- Left side (volume, time/calendar/date, wheather, spotify)

<img src="wibar-left.png">

- Center (tag-list)

<img src="tag-list.png">

- Right side (cpu/ram usage, temperature, network, tile-layout)

<img src="wibar-right.png">

_______

<h3 align="center">Modules / Widgets </h3>

  
- Exit-screen (P/R/S/O/L keys and mouse control)

<img src="exit-screen.png">

- Calendar (click time/date to show/hide and scroll to change month)

<img src="calendar.png">

- Lock-screen (i3lock)

<img src="i3lock.png">


_______

<h3 align="center">GTK / Icons </h3>

  
- Nemo

<img src="gtk.png">

_______

<h3 align="center">Applications </h3>
  
- Alacritty (pure Vim showing terminal colors)

<img src="text.png">

- BpyTOP

<img src="bpytop.png">

- Ranger

<img src="ranger.png">

- Rofi (based on [Adamekka](https://github.com/Adamekka/rofi)'s config)

<img src="rofi.png">

_______

<h3 align="center">Screenshots </h3>
  
- BlackLotus

<img src="blacklotus.png">

- OldBook

<img src="oldbook.png">



</details>

_______

<h2 align="center"> SETUP </h2>

### Program list:
<i>(essential for out of the box usage)</i>

| Name | Function | Description |
|-------------------|-----------------------|-------------|
| [awesomewm](https://awesomewm.org/) | Window manager | Main environment |
| [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads) | Font | Applied systemwide | 
| [alacritty](https://github.com/alacritty/alacritty) | Terminal  emulator | Fast and simple |
| [rofi](https://github.com/DaveDavenport/rofi) | App launcher | Functional and very customizable |
| [nemo](https://github.com/linuxmint/nemo) | File-manager | One of the best GUI file managers |
| [picom](https://github.com/yshui/picom) | Compositor | Can be replaced with **compton** editing `apps.lua` |
| [feh](https://github.com/derf/feh) | Background setter | Simple but able to randomize |
| [i3lock-color](https://github.com/Raymo111/i3lock-color) | Lockscreen application | Light and customizeble |
| [gnome-polkit](https://developer-old.gnome.org/platform-overview/unstable/tech-polkit.html.en) | Policy handling | Integrates nicely for elevating programs that need root access |
| [lxappearance](https://sourceforge.net/projects/lxde/files/LXAppearance/) | Icon/GTK/Cursor theme setter | Not necessary but helpful GUI option |
| [xfce4-screenshooter](https://docs.xfce.org/apps/screenshooter/start) | Screenshot app | Full-screen/Area/Delay support with GUI helper |
| [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet) | NM systray display | Integrates nicely with any system |
| [xfce4-power-manager](https://docs.xfce.org/xfce/xfce4-power-manager/start) | Power manager | Excellent for dealing with sleep, monitor timeout, and other power management features |

🌸 BlackLotus theme-files
| Name | Function | Description |
|-------------------|-----------------------|-------------|
| [Numix-BLACK-ice](https://www.gnome-look.org/p/1335655) | GTK theme | Dark grey with light blue accents |
| [BLACK-Pomegranate-Numix](https://www.gnome-look.org/p/1335817) | Icon theme | Purple accent |
| [Sunity-cursors](https://www.gnome-look.org/p/1703043) | Cursor theme | Midway through classic and modern |

📜 OldBook theme-files
| Name | Function | Description |
|-------------------|-----------------------|-------------|
| [Breeze-Solarized-Light](https://www.gnome-look.org/p/1241238) | GTK theme | Beautifully tanned |
| [Adwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/) | Icon theme | A classic |
| [Sunity-cursors](https://www.gnome-look.org/p/1703043) | Cursor theme | Midway through classic and modern |
_______

### Dependencies:
<i>(most are optional, see [Program list](https://github.com/PoisonIsBestType/dotfiles/blob/main/README.md#program-list))</i>

#### - OpenSUSE Tumbleweed:
```
sudo zypper install awesome awesome-extra picom polkit polkit-gnome arandr feh lxappearance opi timeshift alacritty rofi neovim ranger xclip nemo xfce4-power-manager file-roller firefox xfce4-screenshooter neofetch cava gimp udisks2 gparted vlc xed transmission evince git xbacklight flatpak
```
```
opi i3lock-color
```
```
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install spotify vscodium citra
```

#### - Linux Mint:
```
sudo apt install awesome awesome-extra picom policykit-1-gnome arandr feh lxappearance timeshift alacritty rofi neovim ranger xclip nemo xfce4-power-manager file-roller firefox xfce4-screenshooter neofetch cava gimp udisks2 gparted vlc xed transmission evince git xbacklight spotify flatpak
```
```
sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh
```
```
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install vscodium citra
```
_______


### Clone the files

```
git clone --depth=1 --recursive https://github.com/PoisonIsBestType/dotfiles.git
```
Then place the chosen files (BlackLotus or OldBook, Mint or Suse) into their respective folders:
- `~/.themes`, `~/.icons` and `~/.fonts` for `theme-files`
- `~` for `bash`
- `/lib/python3.11/site-packages/ranger/colorschemes` or `/lib/python3/dist-packages/ranger/colorschemes`for `ranger/*.py`
- `~/.config` for the rest

or 
```
git clone --depth=1 --recursive https://github.com/PoisonIsBestType/dotfiles.git
cd dotfiles
cp -r alacritty ~/.config/
cp -r awesome ~/.config/
cp -r bpytop ~/.config/
cp -r cava ~/.config/
cp -r gtk-3.0 ~/.config/
cp -r neofetch ~/.config/
cp -r ranger ~/.config/
cp -r rofi ~/.config/
cp -r theme-files/fonts/ ~/.fonts
cp -r theme-files/icons/ ~/.icons
cp -r theme-files/themes/ ~/.themes
```
Then:
- Move content outside from `awesome-suse`, `awesome-mint`, `blacklotus`, `oldbook` directorys as chosen.
- Delete the unneeded files.
- Move `ranger/*.py` to `/lib/python3.11/site-packages/ranger/colorschemes` or `/lib/python3/dist-packages/ranger/colorschemes`.





_______

### Set the themes

Edit `~/.config/awesome/theme/default-theme.lua`, `~/.config/bpytop/bpytop.conf`, `~/.config/ranger/rc.conf` and `~/.config/rofi/menu.rasi` to set the chosen colorscheme.

Start `lxappearance` to activate the **icon** theme and **GTK** theme.

Place the content from ```gtk-3.0``` in both `~/.config/gtk-3.0/` and `/root/.config/gtk-3.0/` for the change to also show up in applications run as root. Also good idea to edit `~/.icons/default/index.theme` and place the `theme-files` in their respective `/usr/share/` places.



_______

<h2 align="center"> KEYBINDS </h2>

| MOD | KEY | Description |
|-------------------|-----------------------|-------------|
| `Super` | `F1` | Show help |
| `Super` | `F4` | Exit screen |
| `Super` | `F5` | Reload awesome |
| `Super` | `Pause` | Lock screen |
| `Super`+`Ctrl` | `Q` | Quit awesome |
| `Super` | `W/A/S/D/Z/X/C` | View tag 1~7 |
| `Super`+`Ctrl` | `W/A/S/D/Z/X/C` | Move client to tag 1~7 |
| `Super`+`Shift` | `W/A/S/D/Z/X/C` | Toggle tag 1~7 |
| `Super` | `Q` | Close focused client |
| `Super` | `Enter` | Open tag's default application |
| `Super` | `R` | Application launcher (Rofi) |
| `Alt` | `Space` | Rofi run |
| `Super` | `T` | Terminal |
| `Super` | `G` | File manager |
| `Super` | `B` | Browser |
| `Super` | `H` | Ranger |
| `Super` | `M` | BpyTOP |
| `Super` | `Tab` | Last tag |
| `Super` | `=` | Next tag |
| `Super` | `-` | Previous tag |
| `Super` | `Up` | Focus client above |
| `Super` | `Down` | Focus client below |
| `Super` | `Left` | Focus client to the left |
| `Super` | `Right` | Focus client to the right |
| `Super`+`Ctrl` | `Up` | Move focused client up |
| `Super`+`Ctrl` | `Down` | Move focused client down |
| `Super`+`Ctrl` | `Left` | Move focused client left|
| `Super`+`Ctrl` | `Right` | Move focused client right |
| `Super` | `Space` | Toggle client floating |
| `Super` | `F` | Toggle client full-screen |
| `Super`+`Shift` | `Space` | Select next layout |


_______

<h2 align="center"> DOCUMENTATION </h2>

The documentation live within the source code.

The project is split in functional directories and in each of them there is a readme where you can get additional information about the them.

* [Configuration](./awesome/awesome-suse/configuration) is about all the **settings** available
* [Keys](./awesome/awesome-suse/configuration/keys/) is where all the **keybinds** are
* [Layout](./awesome/awesome-suse/layout) hold the **disposition** of all the widgets
* [Module](./awesome/awesome-suse/module) contain all the **features** available
* [Theme](./awesome/awesome-suse/theme) hold all the **aesthetic** aspects
* [Widget](./awesome/awesome-suse/widget) contain all the **widgets** available

_______


This is a noob's repository, don't expect much!

### Have a good one!

_______
