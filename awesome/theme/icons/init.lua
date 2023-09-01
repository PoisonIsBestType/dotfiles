local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons'

return {
  --tags
  task = dir .. '/tag-list/task.png',
  files = dir .. '/tag-list/files.png',
  browser = dir .. '/tag-list/browser.png',
  terminal = dir .. '/tag-list/terminal.png',
  media = dir .. '/tag-list/media.png',
  editor = dir .. '/tag-list/editor.png',
  game = dir .. '/tag-list/game.png',
  --others
  close = dir .. '/close.svg',
  logout = dir .. '/logout.png',
  sleep = dir .. '/power-sleep.png',
  power = dir .. '/power.png',
  lock = dir .. '/lock.png',
  restart = dir .. '/restart.png',
}
