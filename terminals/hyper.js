// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
   // fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    // fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    fontFamily: '"Operator Mono Book", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

    // default font weight: 'normal' or 'bold'
    fontWeight: 'normal',

    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: 'bold',

    // line height as a relative unit
    lineHeight: 1,

    // letter spacing as a relative unit
    letterSpacing: 0,

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(248,28,229,0.8)',

    // terminal text color under BLOCK cursor
    cursorAccentColor: '#000',

    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    // opacity is only supported on macOS
    backgroundColor: '#000',

    // terminal selection color
    selectionColor: 'rgba(248,28,229,0.3)',

    // border color (window, tabs)
    borderColor: '#333',

    // custom CSS to embed in the main window
    css: '',

    // custom CSS to embed in the terminal window
    termCSS: '',

    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: '',

    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: '',

    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '0 0',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: [],

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to `false` for no bell
    bell: 'SOUND',

    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: true,

    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    // quickEdit: true,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',
    monokaiTheme: { cursorColor: '#FD971F' },
    paneNavigation: {
     hotkeys: {
        navigation: {
          up: 'shift+alt+up',
          down: 'shift+alt+down',
          left: 'shift+alt+left',
          right: 'shift+alt+right'
        },
        jump_prefix: 'alt', // completed with 1-9 digits
        permutation_modifier: 'shift', // Added to jump and navigation hotkeys for pane permutation
        maximize: 'shift+alt+enter'
      },
indicatorStyle: {
 position: 'absolute',
        top: 0,
        left: 0,
        fontSize: '10px',
color: '#7EBF00'
}
    },
    // for advanced config flags please refer to https://hyper.is/#cfg
    hypercwd: {
      initialWorkingDirectory: '~/Projects'
    },
    activeTab: {
      symbol: '⚡',
      color: 'yellow'
    },
    tabIcons: {
      mapIcons: {
        vim: ['vim', 'vi', 'nvim'],
        ruby: ['irb', 'rails', 'ruby', 'bundle'],
        git: [
          'git-remote-ftp',
          'git-remote-ftps',
          'git-remote-http',
          'git-remote-https',
          'hub'
        ],
      },
      mapColors: {
        bash: '#7EBF00',
        shell: '#7EBF00',
        vim: '#7EBF00',
        nvim: '#7EBF00',
        vi: '#7EBF00',
        irb: '#CC0000',
        tail: '#7EBF00',
        psql: '#316192',
        bundle: '#CC0000',
        git: '#E64C33',
        hub: '#E64C33'
      }
    }
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  // "hyper-mono-material",
  // "hyper-statusline"
  plugins: [
    "hyper-samewd",
     //"hyper-search",
    "hyper-tab-icons",
    "hyper-pane",
    "hyper-monokai-theme"
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};
