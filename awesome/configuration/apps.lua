local filesystem = require('gears.filesystem')

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    rofi = 'rofi -show combi',
    lock = 'cinnamon-screensaver-command --lock',
    screenshot = 'gnome-screenshot',
    region_screenshot = 'gnome-screenshot -a',
    delayed_screenshot = 'gnome-screenshot -d 10',
    browser = 'firefox',
    editor = 'flatpak run com.vscodium.codium',
    media = 'firefox --new-window www.youtube.com',
    game = 'flatpak run org.citra_emu.citra',
    files = 'nemo',
    music = 'spotify' 
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'nm-applet --indicator', -- wifi
    'pnmixer', -- shows an audiocontrol applet in systray when installed.
    --'blueman-tray', -- Bluetooth tray icon
    'numlockx on', -- enable numlock
    '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'xfce4-power-manager', -- Power manager
    'feh --bg-fill ~/.config/awesome/blacklotus1.png', --'feh --randomize --bg-fill ~/archive/background/'
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn', -- Spawn "dirty" apps that can linger between sessions
    'xrandr --output LVDS-1-1 --off --output VGA-1-1 --off --output HDMI-1-1 --mode 1360x768 --pos 0x0 --rotate normal --output DP-1-1 --off',
    --'mintupdate-launcher'
  }
}
