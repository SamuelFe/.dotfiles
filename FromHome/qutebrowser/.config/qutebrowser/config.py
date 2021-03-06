## ----------------------------------------------- ##
##                      MINE                       ##
## ----------------------------------------------- ##

import subprocess
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props
xresources = read_xresources('*')

## GETTING RID OF CERTIFICATE EXPIRED AWAYS ASKED
c.content.tls.certificate_errors = "load-insecurely"

## FONT
c.fonts.default_family = "Hack"

## SETTING DARKMODE
#config.set('colors.webpage.darkmode.enabled', True)

## Main window transparency
# c.window.transparent = True
c.colors.webpage.bg = "#202124"

## AUTOSAVE SESSION
c.auto_save.session = True

# KEY BINDINGS
# vim like online text editing
#config.bind('\\', 'mode-enter normal', mode='insert')
config.bind('$', 'fake-key <End>')
config.bind('0', 'fake-key <Home>')
config.bind('I', 'fake-key <Home>;; mode-enter insert')
config.bind('A', 'fake-key <End>;; mode-enter insert')
config.bind('cw', 'fake-key <Ctrl-Delete>;; mode-enter insert')
config.bind('cc', 'fake-key <Home><Shift-End><Delete>;; mode-enter insert')
config.bind('c$', 'fake-key <Shift-End><Delete>;; mode-enter insert')
# for Google Docs
config.bind('*', 'fake-key <Ctrl-Shift-Right><Ctrl-b>')
config.bind('_', 'fake-key <Ctrl-Shift-Right><Ctrl-i>')

# navigation
config.bind('st', 'config-cycle tabs.show always switching') # switch
config.bind('z', 'mode-enter passthrough') # also enters into Passthrough with 'z'
config.bind(',M', 'hint links userscript.youtube_helper') #bye-bye youtube ads
config.bind(',S', 'hint links spawn streamlink {hint-url} best') #bye-bye youtube ads
config.bind(',y', 'spawn mpv {url}')                         # bye-bye youtube ads
config.bind(',Y', 'hint links spawn mpv {hint-url}') #bye-bye youtube ads
config.bind(',a', 'spawn alacritty -e youtube-dl -f "bestaudio/best" -ciw -o "%(title)s.%(ext)s" -v --extract-audio --audio-quality 0 --audio-format mp3 {url}')

# SWICHING ; AND :
#set ';' for opening command prompt
config.bind(';', 'set-cmd-text :')

# set ':' for those hint default bindings
config.unbind(':')
config.bind(':I', 'hint images tab')
config.bind(':O', 'hint links fill :open -t -r {hint-url}')
config.bind(':R', 'hint --rapid links window')
config.bind(':Y', 'hint links yank-primary')
config.bind(':b', 'hint all tab-bg')
config.bind(':d', 'hint links download')
config.bind(':D', 'hint --rapid images userscript save_image') # added this myself
config.bind(':f', 'hint all tab-fg')
config.bind(':h', 'hint all hover')
config.bind(':i', 'hint images')
config.bind(':di', 'hint --rapid images download')
config.bind(':o', 'hint links fill :open {hint-url}')
config.bind(':r', 'hint --rapid links tab-bg')
config.bind(':t', 'hint inputs')
config.bind(':y', 'hint links yank')

# Swiching J and K for tab navigation
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

# Swiching page styles
config.bind(',dr', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/stylesheets/darculized/darculized-all-sites.css')
#c.content.user_stylesheets = '~/.config/qutebrowser/stylesheets-css/css/darculized/darculized-all-sites.css'

# ALIASES
# c.aliases = {
#         "key": "value",
#         "key": "value",
# }

## STARTING PAGE

# Defaut Page
# c.url.default_page = "https://www.google.com"
c.url.default_page = "/home/samuel/.config/qutebrowser/startpages/cards/index.html"
# Start Pages
# c.url.start_pages = ["https://www.google.com"]
c.url.start_pages = ["/home/samuel/.config/qutebrowser/startpages/cards/index.html"]
# Search Engines
c.url.searchengines["DEFAULT"] = "https://www.google.com.ar/search?q={}"
c.url.searchengines["y"] = "https://www.youtube.com/results?search_query={}"
c.url.searchengines["g"] = "https://www.google.com.ar/search?q={}"

c.url.open_base_url = True

## AUTO MODES
c.input.insert_mode.auto_load = True
c.tabs.mode_on_change = "restore"

## DOWNLOADS
c.downloads.position = "bottom"
c.downloads.remove_finished = 10000

## SPECIFIC URL PATTERNS SETTINGS

# with config.pattern('*://example.com/') as p:
#     p.content.images = False
# (which is the same as below)
# config.set('content.images', False, '*://example.com/')
# Obs.: it seems like it can't behave like I want for now
# I would like to have Notion always loads in passthrough-mode

# PREVENT YOUTUBE VIDEOS FROM AUTOSTART
c.content.autoplay = False

# NOTIFICATIONS
c.content.notifications.enabled = False

## COLORS

## STATUS BAR

c.statusbar.padding = {'bottom': 0, 'left': 0, 'right': 0, 'top': 0}

# insert_mode_selected_color = ""
# normal_mode_selected_color = ""
c.colors.statusbar.command.fg = 'lightgrey'
c.colors.statusbar.command.bg = '#232730' # same as statusbar.normal.bg completion.scrollbar.bg completion.odd.bg
#c.colors.statusbar.command.bg = xresources['*background']

# c.colors.statusbar.insert.bg = "#E0C097"
# c.colors.statusbar.insert.fg = "#082032"
c.colors.statusbar.insert.bg = "#42d462"
c.colors.statusbar.insert.fg = "#44475a"

# c.colors.statusbar.normal.bg = "#232730"
# c.colors.statusbar.normal.fg = "#FFFFFF"
c.colors.statusbar.normal.bg = "#44475a"
c.colors.statusbar.normal.fg = "#6897bb"

# c.colors.statusbar.passthrough.bg = "#2F3437"
# c.colors.statusbar.passthrough.fg = "white"
c.colors.statusbar.passthrough.bg = "#44475a"
c.colors.statusbar.passthrough.fg = "#bd93f9"

c.statusbar.widgets = ["keypress", "history"]

# Completion
c.completion.height = '25%'
c.colors.completion.category.bg = "#485164"
c.colors.completion.category.border.bottom = "#EDEDED"
c.colors.completion.category.border.top = "#082032"
c.colors.completion.category.fg = "#DDDDDD"
c.colors.completion.even.bg = "#232730"
# c.colors.completion.fg = ""
c.colors.completion.item.selected.bg = "#d61c4b"
c.colors.completion.item.selected.border.bottom = "#F5ABC9"
c.colors.completion.item.selected.border.top = "#F5ABC9"
c.colors.completion.item.selected.fg = "#DDDDDD"
c.colors.completion.item.selected.match.fg = "#5E81AC"
c.colors.completion.match.fg = "#A3BE8C"
c.colors.completion.odd.bg = "#393E46"
c.colors.completion.scrollbar.bg = "#232730"
c.colors.completion.scrollbar.fg = "#787A91"

## TABS
c.tabs.show = 'multiple'
# c.tabs.show = 'switching'

unselected_tab_color = "#485164"
selected_tab_color = "#282A36"

# Open new tabs in the background.
c.tabs.background = False

# Show favicons in the tab bar.
c.tabs.favicons.show = "always"
c.tabs.favicons.scale = 1.3

# Position of new tabs opened from another tab.
c.tabs.new_position.related = 'last'

# Padding (in pixels) around text for tabs.
c.tabs.padding = {'bottom': 4, 'left': 5, 'right': 5, 'top': 4}

# Position of the tab bar.
c.tabs.position = 'top'

# Alignment of the text inside of tabs.
c.tabs.title.alignment = 'center'

# Format to use for the tab title
c.tabs.title.format = '{private}{audio}{current_title}'

# Width of tab indicators.
c.tabs.indicator.width = 3

# Padding (in pixels) for tab indicators.
c.tabs.indicator.padding = {'bottom': 0, 'left': 0, 'right': 5, 'top': 0}

# Background color of the tab bar.
c.colors.tabs.bar.bg = '#555555'

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = '#15d415'

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = "#202124"

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = 'red'

# Color gradient interpolation system for the tab indicator.
c.colors.tabs.indicator.system = 'rgb'

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = '#e8e8e8'

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = unselected_tab_color

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = '#e8e8e8'

# Background color of unselected even tabs.
c.colors.tabs.even.bg = unselected_tab_color

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = '#FFFFFF'

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = selected_tab_color

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = '#FFFFFF'

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = selected_tab_color

## HINTS
c.colors.hints.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(98,116,103,1), stop:1 rgba(111,140,111,1))' # #637567 - #6f8c6f
c.hints.border = '1px solid #637567'

## SCROLL BAR
c.scrolling.smooth = True
c.scrolling.bar = "always"

## ----------------------------------------------- ##
##                WAS ALREADY THERE                ##
## ----------------------------------------------- ##


# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped # from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, '*://askubuntu.com/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# When to show the statusbar.
# Type: String
# Valid values:
#   - always: Always show the statusbar.
#   - never: Always hide the statusbar.
#   - in-mode: Show the statusbar when in modes other than normal mode.
c.statusbar.show = 'always'

config.source('qutewal.py')
