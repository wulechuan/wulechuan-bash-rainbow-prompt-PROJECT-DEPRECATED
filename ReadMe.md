<link rel="stylesheet" href="./docs/styles/markdown-preview-in-ms-vscode.css">

# 概述

令 Bash 类环境拥有彩虹般美丽的命令提示符。

![An example of mine in 256 colors](./docs/illustrates/bash-rainbow-prompt-example-wulechuan-256-colors.png)  \
An example of mine in 256 colors

![An example of mine in 16 colors](./docs/illustrates/bash-rainbow-prompt-example-wulechuan-16-colors.png)  \
An example of mine in 16 colors (Color palette has been customized)

作者：[wulechuan@live.com](mailto:wulechuan@live.com)


# 安装

1.  将整个文件夹，即 `bash-rainbow-prompt` 存放于 `~` 文件夹下。

2.  如果 `~` 文件夹下不存在 `.bash_profile` 则创建之。
    > 注意文件名要以英文句点 `.` 开头。

3. 编辑 `~/.bash_profile` 文件，在其中加入以下语句：

    ```sh
    source ~/bash-rainbow-prompt/entry.sh
    ```

    保存该文件。

4.  令上述配置生效，有两种方法：

    1.  上述配置在任何新打开的 Bash 窗口均会自动生效。

    2.  对于已经打开的 Bash 窗口，可在其中执行：

        ```sh
        exec bash -l
        ```


# 参见

- https://github.com/wulechuan/bash-colorful-strings


# 附录

本工具附带了一套自定义【色值表】。诸君如不嫌弃，不妨一试。此表存于该文件中：
```sh
<本代码仓库>/.mintty/themes/bash16-wulechuan.minttyrc
```

## 色值表的用法

在 `16 色模式`的终端下，或者在 `256 色模式`的终端下仅打算利用标准的 16
色表的情况下，你或许须修订系统默认的色值表，形成自己喜爱的配色主题，使最终效果更美观。

在 `256 色模式`终端下，如果采用了 256 色的【命令提示符】，则不必修订色值表。因为
256 色模式的色值表是固定不变的，无从修改。

16 色色值表的使用因环境而异。有些环境直接采用 `.mintty` 文件；另有一些环境，例如
Windows Console，无法直接应用该类文件，而必须手工将文件中个颜色值逐一取出，填入配置对话框中。

### 在【Cygwin for Windows】中的用法

1.  将本代码库中的 `.mintty` 文件夹完整复制到 `~` 文件夹内。
    > 注：Cygwin 一般将 `%UserProfile%` 文件夹视为 `~` 文件夹。

2.  运行 Cygwin。

3.  鼠标右键点击 Cygwin 窗口的标题栏，点选【Options...】。这将打开 mintty
    的【Options】对话框。

4.  在对话框左侧的导航栏找到第一项【Looks】，点选之。

5.  在名为【Theme】的下拉列表框中选用 `base16-wulechuan.minttyrc`。

6.  点击对话框中的【Save】按钮或【Apply】按钮。



### 在【Windows 控制台】中的用法

该法将同时影响 CMD 和 PowerShell。

1.  运行 CMD 或 PowerShell，以打开一个【Windows 控制台】窗口。

2.  鼠标【右键】点击【Windows 控制台】窗口的标题栏，点选【默认值】。这将打开【控制台窗口 属性】对话框。

3.  进入第四个标签，即【颜色】标签，将 `.mintty/themes/base16-wulechuan.minttyrc`
    中的色值逐一配置到【控制台窗口 属性】对话框中。
    > 注：`base16-wulechuan.minttyrc` 文件中的色值【自上而下】的顺序恰好与
    > Windows 控制台中各色块【自左至右】的顺序吻合。

4.  点击【确定】按钮，以保持色彩配置。随即可见 Windows 控制台中，各内容的颜色变更。
