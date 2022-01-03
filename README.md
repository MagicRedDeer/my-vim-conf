my-vim-conf
===========

I have moved on to using Neovim with Lua, given the plethora of next-gen tools
and improved integration with LSPs. Lua is a sweet language to work with, and
I have thoroughly enjoyed working with it.

This repository contains my current vim configuration as I find it helpful 

I concentrate on using vim for my text editing tasks and also for programming
in C/C++, Python, and Web development


Requirements Outlined for Vim config
====================================

- Package Manager
    Packer is fast and has all the required features.
- Tag Explorer
    TODO: Look for some other plugins or some adaptation of Telescope finder.
- Version Control System
    + Git
        `Fugitive` and other small plugins
    + others
        TODO: Be prepared for any other VCS integration
- Completer
    `nvim-cmp` works great with LSP, also provides some other perks.
- Commenting
    `Comment.vim` does a great job.
- File Explorer
    `NERDTree` is okay for me for now. `Nvim-Tree` is a faster
    alternative, but we need to give it time to develop further.
- Folding
    Treesitter handles it better.
- Languages
    LSP Clients are easy to install using LSP Installer.
- Platforms
    - Maya
        Vimya has some quirks but is very useful
    - Unreal
        TODO: Find out seemless way of working with unreal C++ and Python code
        and set maps etc.
    - Unity
        TODO: Find good way of working with Unity.
    - Wordpress
        TODO: Find a great way to work with wordpress. Does not have to be vim
        based solution only.
    - Django
        TODO: This should not be very difficult to get completion for code.
    - React:
        TODO: Probably there is a LSP Client out there. Need to learn the tech
        first.
- Startup and Session Management
    - Startup
        `Alpha.nvim` is a great platform, can definitely work with this.
    - Sessions
        `xolox/Session.vim` is pretty good for me, but needs some
        modernization. 
        TODO: Maybe I should adopt its development and integrate it
        with an alpha theme.
- Status Line
    `Lualine` is fast, so let us leave it at that!
- Undo Management
    TODO: Find a nice, modern solution possibly shinier than Gundo
- Linting and Correction
    LSP and Null-ls with Linters should do the job.
    TODO: keep on searching for the best configuration for each language /
    scenario
- Which Key
    What can I say Which-Key works great
    TODO: Find a way of keeping it quiet in insert mode.
- Colorscheme
    Got a couple good options. this will keep on evolving I guess.
- Fuzzy finder
    Nothing better than `Telescope` these days. Bye bye `Denite`!
- Terminal Handling
    `ToggleTerm` is great!
- Organizing
    - Spreadsheets
        TODO: 
    - Todo list
        TODO: Rediscover ways to work with TODO lists
    - Date and time
        TODO: find good solutions for Date and Time
- Literacy
    - Latex
        TODO: Next time find a good way to work with Latex
    - Markdown:
        TODO: Find a good LSP client and setup preview maps
    - RST and Sphinx:
        TODO: Find some tools to get a good workflow with previews and linting
    - Organizing
        Org mode is amazing
        TODO: find out alternative or way to work without it ... or just shift
        to emacs
- Keymaps
    TODO: Rethink your Keymaps, change them soon. Look for ideas from spacevim
    and LunarVim. Use WhichKey.
