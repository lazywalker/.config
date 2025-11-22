# Zsh 配置说明

此目录包含用于配置 Zsh 的文件与插件（例如 `.zshrc`、`.zshenv` 和第三方插件目录）。目标是让你的终端在 macOS 上表现一致，并且便于在新机上快速还原环境。

## 快速安装

1. 备份现有 Zsh 配置（非常重要）：

```bash
mv ~/.zshrc ~/.zshrc.backup 2>/dev/null || true
mv ~/.zshenv ~/.zshenv.backup 2>/dev/null || true
```

2. 为当前用户建立符号链接（将仓库中的配置生效）：

```bash
ln -s ~/.config/zsh/.zshrc ~/.zshrc
ln -s ~/.config/zsh/.zshenv ~/.zshenv  # 如果你使用 .zshenv
```

3. 安装推荐的依赖（示例，按需执行）:

```bash
# Homebrew（如未安装）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 常用工具
brew install eza starship coreutils gnu-sed gnu-getopt
```

4. 安装 Zsh 插件（仓库内已包含 `zsh-syntax-highlighting`）：

```bash
# 如果仓库中已包含插件目录，确保 source 路径正确；
# 或使用插件管理器（例如 zinit、oh-my-zsh、antigen 等）按需安装。
```

## 主要配置说明

- `.zshrc`
  - 包含别名、PATH 扩展、历史记录设置、命令提示（使用 `starship`）、以及插件 `zsh-syntax-highlighting` 的 source。
  - 我对 `ls` 别名进行了可移植性处理：优先使用 `eza`（若安装），否则根据系统选择合适的颜色标志（GNU `--color=auto` 或 macOS `-G`）。
  - 推荐不要盲目将 `python`/`pip` 别名写死到绝对路径，优先使用 `pyenv` 或调整 `PATH`。

- 历史与行为
  - 历史文件位于 `~/.config/zsh/.zsh_history`，并启用追加与共享历史以便多个会话同步历史记录。

- 终端标题
  - 对 `alacritty` 做了终端标题设置（可选）。

## 调试与验证

- 语法检查（不执行）：

```bash
/bin/zsh -n ~/.config/zsh/.zshrc
```

- 在隔离的 shell 中尝试 source（会加载配置但不修改当前 shell 环境）：

```bash
/bin/zsh -ic 'source ~/.config/zsh/.zshrc && echo SOURCED_OK || echo SOURCED_FAIL'
```

如果看到 `SOURCED_OK`，表示没有遇到明显的运行时错误。

## 常见问题与解决

- 插件文件未找到：确认 `source` 的路径正确，或使用插件管理器来管理插件。
- 某些命令在 macOS 和 Linux 上行为不同：例如 `ls` 的 `--color` 标志。配置中已尝试自动检测并兼容两种实现。

## 贡献 & 自定义

- 建议先在本地备份你的原始文件，再替换或建立符号链接。
- 欢迎提交改进建议或 PR（请保证变更具可移植性并附带说明）。

## 示例命令汇总

```bash
# 语法检查
/bin/zsh -n ~/.config/zsh/.zshrc

# 尝试加载配置
/bin/zsh -ic 'source ~/.config/zsh/.zshrc && echo SOURCED_OK || echo SOURCED_FAIL'

# 创建符号链接（示例）
ln -s ~/.config/zsh/.zshrc ~/.zshrc
```
