import subprocess
import os

# c.content.headers.user_agent = "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}"

c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
]
c.content.blocking.hosts.lists = [
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
]
c.content.blocking.enabled = True

def read_xresources(prefix):
    """
    read settings from xresources
    """
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props

xresources = read_xresources("*")

# ============================
# Color Scheme
# ============================

# black           = '#282828'
# white           = '#ebdbb2'
# blue            = '#458588'
# lightblue       = '#83a598'
# yellow          = '#d79921'
# lightyellow     = '#fabd2f'
# red             = '#cc241d'
# lightred        = '#fb4934'
# green           = '#689d6a'
# lightgreen      = '#b8bb26'
# magenta         = '#b16286'
# lightmagenta    = '#d3869b'

black           = xresources["*.color0"]
red             = xresources["*.color1"]
green           = xresources["*.color2"]
yellow          = xresources["*.color3"]
blue            = xresources["*.color4"]
magenta         = xresources["*.color5"]
cyan            = xresources["*.color6"]
white           = xresources["*.color7"]
lightblack      = xresources["*.color8"]
lightred        = xresources["*.color9"]
lightgreen      = xresources["*.color10"]
lightyellow     = xresources["*.color11"]
lightblue       = xresources["*.color12"]
lightmagenta    = xresources["*.color13"]
lightcyan       = xresources["*.color14"]
lightwhite      = xresources["*.color15"]
background      = xresources["*.background"]
foreground      = xresources["*.foreground"]

c.colors.completion.category.bg = blue
c.colors.completion.category.border.bottom = blue
c.colors.completion.category.border.top = blue
c.colors.completion.category.fg = foreground
c.colors.completion.even.bg =  black
c.colors.completion.fg = [foreground, yellow, foreground]
c.colors.completion.item.selected.bg = yellow
c.colors.completion.item.selected.border.bottom = yellow
c.colors.completion.item.selected.border.top = yellow
c.colors.completion.item.selected.fg = background
c.colors.completion.item.selected.match.fg = foreground
c.colors.completion.match.fg = yellow
c.colors.completion.odd.bg = black
c.colors.completion.scrollbar.bg = black
c.colors.completion.scrollbar.fg = lightwhite
# c.colors.contextmenu.disabled.bg = None
# c.colors.contextmenu.disabled.fg = None
# c.colors.contextmenu.menu.bg = None
# c.colors.contextmenu.menu.fg = None
# c.colors.contextmenu.selected.bg = None
# c.colors.contextmenu.selected.fg = None
c.colors.downloads.bar.bg = background
c.colors.downloads.error.bg = red
c.colors.downloads.error.fg = background
c.colors.downloads.start.bg = green
c.colors.downloads.start.fg = background
c.colors.downloads.stop.bg = blue
c.colors.downloads.stop.fg = background
c.colors.downloads.system.bg = 'none'
c.colors.downloads.system.fg = 'none'

c.colors.hints.bg = lightyellow
c.colors.hints.fg = background
c.colors.hints.match.fg = foreground
c.colors.keyhint.bg = background
c.colors.keyhint.fg = foreground
c.colors.keyhint.suffix.fg = yellow
c.colors.messages.error.bg = red
c.colors.messages.error.border = red
c.colors.messages.error.fg = foreground
c.colors.messages.info.bg = background
c.colors.messages.info.border = background
c.colors.messages.info.fg = foreground
c.colors.messages.warning.bg = yellow
c.colors.messages.warning.border = yellow
c.colors.messages.warning.fg = foreground
c.colors.prompts.bg = background
c.colors.prompts.border = background
c.colors.prompts.fg = foreground
c.colors.prompts.selected.bg = yellow
c.colors.statusbar.caret.bg = magenta
c.colors.statusbar.caret.fg = foreground
c.colors.statusbar.caret.selection.bg = lightmagenta
c.colors.statusbar.caret.selection.fg = foreground
c.colors.statusbar.command.bg = background
c.colors.statusbar.command.fg = foreground
c.colors.statusbar.command.private.bg = background
c.colors.statusbar.command.private.fg = foreground
c.colors.statusbar.insert.bg = blue
c.colors.statusbar.insert.fg = white
c.colors.statusbar.normal.bg = background
c.colors.statusbar.normal.fg = foreground
c.colors.statusbar.passthrough.bg = green
c.colors.statusbar.passthrough.fg = foreground
c.colors.statusbar.private.bg = background
c.colors.statusbar.private.fg = yellow
c.colors.statusbar.progress.bg = foreground
c.colors.statusbar.url.error.fg = red
c.colors.statusbar.url.fg = white
c.colors.statusbar.url.hover.fg = yellow
c.colors.statusbar.url.success.http.fg = green
c.colors.statusbar.url.success.https.fg = green
c.colors.statusbar.url.warn.fg = yellow
# c.colors.tabs.indicator.system = 'rgb'
c.colors.tabs.indicator.error = red
c.colors.tabs.indicator.start = yellow
c.colors.tabs.indicator.stop = blue
c.colors.tabs.bar.bg = blue
c.colors.tabs.even.bg = background
c.colors.tabs.even.fg = foreground
c.colors.tabs.odd.bg = background
c.colors.tabs.odd.fg = foreground
c.colors.tabs.pinned.even.bg = background
c.colors.tabs.pinned.even.fg = foreground
c.colors.tabs.pinned.odd.bg = background
c.colors.tabs.pinned.odd.fg = foreground
c.colors.tabs.pinned.selected.even.bg = blue
c.colors.tabs.pinned.selected.even.fg = foreground
c.colors.tabs.pinned.selected.odd.bg = blue
c.colors.tabs.pinned.selected.odd.fg = foreground
c.colors.tabs.selected.even.bg = blue
c.colors.tabs.selected.even.fg = foreground
c.colors.tabs.selected.odd.bg = blue
c.colors.tabs.selected.odd.fg = foreground
# c.colors.webpage.bg = white
# c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
# c.colors.webpage.darkmode.contrast = 0.0

c.messages.timeout = 5000
c.prompt.radius = 0
config.load_autoconfig(True)
c.completion.open_categories = ["quickmarks", "bookmarks", "history"]

c.downloads.location.directory = "/home/tony/Downloads/"
# c.downloads.location.suggestion = "/home/tony/Storage/Downloads/"
c.downloads.position = "bottom"
# c.editor.command = ["nvim", "-f", "{file}", "-c", "normal {line}G{column0}l"]
# c.fileselect.handler = "external"
# c.fileselect.multiple_files.command = ["st", "-e", "lf", "--choosefiles={}"]
# c.fileselect.single_file.command = ["st", "-e", "lf", "--choosefile={}"]

c.fonts.default_family = ["Rubik"]
c.fonts.default_size = "10pt"
c.fonts.hints = "bold 16px VictorMono Nerd Font"

c.hints.chars = 'arstneio'

c.keyhint.delay = 500
c.keyhint.radius = 0

c.tabs.title.format = '{audio}{index}: {current_title} {private}'

c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'd': 'https://duckduckgo.com/?q={}',
    'g' : 'https://www.google.com/search?q={}',
    'y' : 'https://yandex.com/search/?msid=1600227532.21776.97936.549811&text={}&suggest_reqid=189617456160022753274905091117279',
    'b' : 'https://www.bing.com/search?q={}',
    'id' : 'https://duckduckgo.com/?q={}&iax=images&ia=images',
    'ig' : 'https://www.google.com/search?q={}&tbm=isch&ved=2ahUKEwjuhfWY3-zrAhUlJHIKHYLiCLAQ2-cCegQIABAA&oq=texx&gs_lcp=CgNpbWcQAzIECAAQQzIECAAQQzIECAAQQzIECAAQQzIECAAQQzIECAAQQzIECAAQQzIECAAQQzIECAAQQzIECAAQQzoCCAA6BQgAELEDUO0nWOEvYMg2aABwAHgAgAGHC4gByRSSAQM3LTKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=2IdhX-65NqXIyAOCxaOACw&safe=strict',
    'ib' : 'https://www.bing.com/images/search?q={}&form=HDRSC2&first=1&scenario=ImageBasicHover',
    'iy' : 'https://yandex.com/images/search?text={}&from=tabbar',
    'yt' : 'https://www.youtube.com/results?search_query={}',
    'tk' : 'https://www.tokopedia.com/search?st=product&q={}&navsource=home',
    'ar' : 'https://archlinux.org/packages/?q={}',
    }

config.bind(';z', 'hint images download')
config.bind('<Ctrl-Shift-h>', 'tab-move -')
config.bind('<Ctrl-Shift-l>', 'tab-move +')
config.bind('<Ctrl-Shift-n>', 'tab-move -')
config.bind('<Ctrl-Shift-o>', 'tab-move +')
config.bind('j', 'scroll-px 0 75')
config.bind('k', 'scroll-px 0 -75')
config.bind('h', 'scroll-px -75 0')
config.bind('l', 'scroll-px 75 0')
config.bind('<Ctrl-R>', ':config-source')
config.bind('<Ctrl-U>', 'undo')
config.unbind('D')
config.bind('<Ctrl-Shift-q>', 'tab-close -o')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('d', 'scroll-page 0 0.5')
config.bind('<Ctrl-q>', 'tab-close')
config.bind('<Ctrl-j>', 'back')
config.bind('<Ctrl-k>', 'forward')
config.bind('<Ctrl-h>', 'tab-prev')
config.bind('<Ctrl-l>', 'tab-next')
# config.bind('<Ctrl-Shift-O>', 'set-cmd-text -s :open -b')

config.bind('<Ctrl-e>', 'back')
config.bind('<Ctrl-i>', 'forward')
config.bind('<Ctrl-n>', 'tab-prev')
config.bind('<Ctrl-o>', 'tab-next')

config.bind('<Ctrl-k>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-h>', 'completion-item-focus --history prev', mode='command')
config.bind('<Ctrl-l>', 'completion-item-focus --history next', mode='command')

config.bind('<Ctrl-Escape>', 'mode-leave', mode='passthrough')

config.bind(";V", "spawn mpv {url}")
config.bind(";v", "hint links spawn mpv {hint-url}")
config.bind(";a", "hint links spawn st -e mpv {hint-url} --no-video")
config.bind(
    "ed",
    "hint links spawn st -e aria2c --dir=/home/tony/Storage/Downloads '{hint-url}'",
)
config.bind(
    "et",
    "hint links spawn st -e aria2c --dir=/home/tony/Storage/Downloads/Torrents --seed-time=0 '{hint-url}'",
)
# config.bind('ev', 'hint links spawn st -e youtube-dl --config-location ~/.config/youtube-dl/config \'{hint-url}\'')
config.bind("ev", "hint links userscript download_youtube_video")
config.bind("ea", "hint links userscript download_youtube_audio")
config.bind("eV", "hint links userscript download_youtube_video_playlist")
config.bind("eA", "hint links userscript download_youtube_audio_playlist")

config.bind("<Ctrl-h>", "fake-key <BackSpace>", "insert")
config.bind("<Ctrl-a>", "fake-key <Home>", "insert")
config.bind("<Ctrl-e>", "fake-key <End>", "insert")
config.bind("<Ctrl-b>", "fake-key <Left>", "insert")
config.bind("<Mod1-b>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Ctrl-f>", "fake-key <Right>", "insert")
config.bind("<Mod1-f>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Ctrl-k>", "fake-key <Up>", "insert")
config.bind("<Ctrl-j>", "fake-key <Down>", "insert")
config.bind("<Mod1-d>", "fake-key <Ctrl-Delete>", "insert")
config.bind("<Ctrl-d>", "fake-key <Delete>", "insert")
config.bind("<Ctrl-w>", "fake-key <Ctrl-Backspace>", "insert")
config.bind("<Ctrl-u>", "fake-key <Shift-Home><Delete>", "insert")
config.bind("<Ctrl-l>", "fake-key <Shift-End><Delete>", "insert")

config.bind("er", "config-source")

config.unbind("wl")
config.bind("wlj", "devtools bottom")
config.bind("wll", "devtools right")
config.bind("wlw", "devtools window")

c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save'}
#

# c.tabs.show="switching"
# c.statusbar.show="in-mode"
