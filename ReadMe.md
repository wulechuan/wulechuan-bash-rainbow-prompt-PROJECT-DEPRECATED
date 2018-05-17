<link rel="stylesheet" href="./docs/styles/markdown-preview-in-ms-vscode.css">

# 概述

令 Bash 类环境拥有彩虹般美丽的命令提示符。

![An example of mine](./docs/illustrates/bash-rainbow-prompt-example-wulechuan.png)

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