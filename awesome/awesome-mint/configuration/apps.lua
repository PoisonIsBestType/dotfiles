local filesystem = require('gears.filesystem')

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    rofi = 'rofi -show drun',
    lock = 'bash -c "(sh ~/.config/awesome/scripts/blacklotus-lock.sh)"',
    screenshot = 'xfce4-screenshooter -f',
    region_screenshot = 'xfce4-screenshooter -r',
    delayed_screenshot = 'xfce4-screenshooter -d 10 -f',
    browser = 'firefox',
    editor = 'flatpak run com.vscodium.codium',
    media = 'firefox --new-window www.youtube.com',
    game = 'flatpak run org.citra_emu.citra',
    files = 'nemo',
    music = 'spotify' 
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    --'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    'nm-applet --indicator', -- wifi
    'numlockx on', -- enable numlock
    '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'xfce4-power-manager', -- Power manager
    'feh --bg-fill ~/.config/awesome/background/blacklotus-mint.png', --'feh --randomize --bg-fill ~/archive/background/'
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn', -- Spawn "dirty" apps that can linger between sessions
    'xrandr --output LVDS-1-1 --off --output HDMI-1-1 --mode 1360x768',
    --'mintupdate-launcher'
  }
}
