<link rel="stylesheet" href="./docs/styles/markdown-preview-in-ms-vscode.css">

# Introduction

Bring rainbows into your bash compatible environments.

![An example of mine in 256 colors](./docs/illustrates/bash-rainbow-prompt-example-wulechuan-256-colors.png)  \
An example of mine in 256 colors

![An example of mine in 16 colors](./docs/illustrates/bash-rainbow-prompt-example-wulechuan-16-colors.png)  \
An example of mine in 16 colors (Color palette has been customized)

Author: 吴乐川 (Wu Lechuan) [wulechuan@live.com](mailto:wulechuan@live.com)

------

This is a tool for building a colorful `prompt` in
a command line interface (CLI) environment.

It obeys the Bash syntax, thus applies to any Linux Terminal,
Apple macOSX terminal,
the Microsoft Windows Subsystem for Linux (WSL) environment,
as well as all kinds of Linux Terminal Simulators like GitBash and Cygwin.

It does **NOT** apply to Microsoft Windows CMD,
or Microsoft Windows PowerShell,
or Microsoft PowerShell for Linux.
Because the syntax of either CMD or PowerShell is completely
different from that of a Bash compatible environment.




# Chinese version of this Document

中文文档[在此](./ReadMe.zh-CN.md)。





# Features

1.  The chief part of the prompt string happens to be an SSH connection string.
2.  The prefixed Date and timestamp is helpful
    on tracing back our command history.
1.  The distinct rainbow strips, naturally form visual blocks, helping
    human beings to distinguish scopes from command record to record. 
3.  Beautiful (but your might NOT agree with that).


# Installation

1.  Copy the entire `bash-rainbow-prompt` folder to your bash
    `~` folder (or "directory" if you prefer).

1.  If your bash `~` folder doesn't contain a file named
    `.bash_profile` yet, create one text file with that name by executing:
    ```sh
    touch ~/.bash_profile
    ```

    > Note that there is a dot(`.`) sign at the beginning of the file name.

3.  Edit your `~/.bash_profile` file, inserting (appending is just fine) a line
    as shown below:

    ```sh
    source ~/bash-rainbow-prompt/load.sh
    ```

    Save your modifications.


1.  Make things happen. There're 2 senarios which ends up 2 different ways.

    1.  上述配置在任何**新打开**的 Bash 窗口均会**自动生效**。

    2.  对于**已经打开**的 Bash 窗口，可在其中执行：

        ```sh
        exec bash -l
        ```

# About `git-prompt.sh`

When you are working in your Bash environment,
this tool of mine optionally allows you to see some nice details
of a git branch status right beneath the chief prompt string,
as long as you are working on a folder that is configured
as a part of a git repository.

This nice optional feature needs a well known utility named
`git-prompt.sh`, which is licensed by GNU GPL 2.0.

While I'm not going to license my tool
under any licensing system (but this means it happens to match a
license called WTFPL, cool), I cannot provide the `git-prompt.sh`
tool right inside my repository.

If you need the feature,
you have to download the `git-prompt.sh` (yes, it's a single file)
yourself and put it inside this folder:
```sh
~/bash-rainbow-prompt/GNU-tools
```

which means the file will be:
```sh
~/bash-rainbow-prompt/GNU-tools/git-prompt.sh
```

> See https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

Besides, although the `git-prompt.sh` is really powerful at
providing details of a git branch, it **CAN** be very slow in situations.
**So use it at your own consideration**.




# Configuration

The only configuration file of this tool locates:
```sh
<This Repository>/~/bash-rainbow-prompt/config.sh
```

There is only one configurable item at present:

-  `shouldUseDetailedButSlowBranchInfoQueryInPrompt`

    This variable controls whether or not we shall use the `git-prompt.sh`.

    Possible values: "`yes`" or any "non `yes`" value.
    It is allowed to be even omitted at all, which means "non `yes`".




# See Also

-   The source code of the `git-prompt.sh`:
    https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
-   Another bash tool written by me, the `bash-colorful-strings`:
    https://github.com/wulechuan/bash-colorful-strings





# Appendix

## Color Palette

This tool also comes with a customized color palette, which
is meant to used in an 8-colored (but provides 16 colors in fact)
environment. It provides some vivid colors and is hopefully
to make your console colors more attractive.

It's here:
```sh
<This Repository>/~/.mintty/themes/bash16-wulechuan.minttyrc
```

Try it at your own interests.

For the 256-colored bash environments, the color palette is useless.
Because the built-in color table is not adjustable there.



### How to use (apply) a color palette

The way to apply a color palette file varies according to the target environments.
Some can utilize the provided `.mintty` file directly without any pain.
Others not, so you have to apply color values one by one manually.

#### Use the color palette file in Cygwin for Windows

1.  Copy the **entire `~/.mintty` folder** to
    inside of your own `~` folder.

    > Note1: Make sure you copy the entire folder
    > instead of copying only the color-palette file.

    > Note2：The Cygwin treats the `%UserProfile%` to be your `~` folder.

1.  Run Cygwin.

1.  Mouse-right-click the title bar of your Cygwin window,
    chose `Options...`. This opens the `Options` dialog
    of the mintty program.

1.  Click the first tab on the leftside, aka the `Looks`.

1.  Find the dropdown list named `Theme`,
    chose `base16-wulechuan.minttyrc` there.

6.  Press either the `Save` button or the `Apply` button.
    Immediately you see changes in colors.



#### Use the color palette in Windows Console

Althought my `bash-rainbow-prompt` tool does **NOT** apply
to Microsoft Windows CMD or PowerShell, the color palette
is somehow applicable. All is that, the application takes
some manual work.

And if applied, both the CMD and the PowerShell are effected.

1.  Run a CMD or PowerShell, so that you open up a Windows Console window.
2.  Mouse-right-click the title bar of the Console window, the chose `default`.
    This opens the `Console Properties` dialog.
3.  Enter the 4th tab, aka the `colors` tab.
4.  Manually copy color values inside
    the `.mintty/themes/base16-wulechuan.minttyrc` file I provide,
    one by one, into the `Console Properties` dialog.
    > Note that the order the colors are in,
    > inside the `base16-wulechuan.minttyrc` file,
    > matches the order of the color slots inside
    > the `Console Properties` dialog.
5.  Press `OK` button to save your modifications.
    Immediately you see changes in colors.
