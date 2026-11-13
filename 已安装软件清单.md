# 本机已安装软件清单（用于新电脑复现）

- 采集时间：2026-11-13
- 采集方式：只读扫描（`/Applications`、`system_profiler SPApplicationsDataType`、Homebrew、编辑器扩展、全局 npm/pip）
- 本机环境：macOS 27.2.1（26B131），Apple Silicon (arm64)，Homebrew 位于 `/opt/homebrew`
- 配套文件：`Brewfile`（Homebrew 批量安装）、`reinstall.sh`（一键复现脚本）

> 汇总：GUI 应用 32 个（31 个第三方 + Safari 系统自带）｜Homebrew formula 23 个 / cask 14 个 / tap 2 个｜VS Code 扩展 10 个｜全局 npm 4 个｜Python 包 8 个

---

## 一、给新电脑 WorkBuddy 的复用指令（直接复制）

```
请读取我给你的《已安装软件清单.md》、Brewfile 和 reinstall.sh，在这台 Mac 上复现同样的软件环境：
1. 先检查 macOS 架构与 Homebrew 是否可用，不可用则给我安装命令，不要擅自执行联网脚本；
2. 执行 brew bundle --file=Brewfile 安装 Homebrew 部分（包含 tap、命令行工具、图形应用、全局 npm 包）；
3. 对清单中标注「无 cask / 需手动」的应用（如 DSH Desktop），先查官网下载页，下载安装前向我确认；
4. 按清单安装 VS Code 扩展与 Python 包，可优先运行 reinstall.sh 的对应段落；
5. 逐项核对，输出「已安装成功 / 需登录或授权 / 需人工处理」三类结果表格。
约束：全程不要删除或覆盖本机已有软件；遇到需要密码、许可证、Apple ID 登录的步骤先询问我。
```

---

## 二、GUI 应用：由 Homebrew cask 安装（11 个，/Applications 中可见）

| 应用 | 当前版本 | cask token | 备注 |
|---|---|---|---|
| Claude | 5.1231.2 | `claude` | 需登录 |
| DockDoor | 1.41.0 | `dockdoor` | 需辅助功能权限 |
| Google Chrome | 157.0.8103.51 | `google-chrome` | |
| LaunchNext | 2.4.2 | `roversx/tap/launchnext` | 来自第三方 tap |
| Microsoft Edge | 156.0.4314.50 | `microsoft-edge` | |
| Motrix | 2.1.0 | `motrix` | |
| Parallels Client | 19.4.25221 | `parallels-client` | 商业软件，需授权 |
| Skim | 1.7.17 | `skim` | |
| Tencent Lemon（腾讯电脑管家） | 5.3.8 | `tencent-lemon` | |
| Transmit | 5.11.7 | `transmit` | 商业软件，需授权 |
| 微信 | 4.2.0 | `wechat` | 需登录 |

### Homebrew 有安装记录、但 /Applications 中已找不到 .app（3 个）

| 应用 | Brew 记录版本 | cask token | 说明 |
|---|---|---|---|
| Zed | 1.26.2 | `zed` | 仅存于 `/opt/homebrew/Caskroom/zed/`，疑似已从 Applications 移走 |
| PDF Expert | 3.13.4,1177 | `pdf-expert` | 同上，商业软件 |
| Nitro PDF Pro | 26.4 | `nitro-pdf-pro` | 同上，商业软件 |

> 这三项在新电脑如需复现，直接 `brew install --cask zed pdf-expert nitro-pdf-pro` 即可；本机若想恢复，用 `brew reinstall --cask <token>`。

---

## 三、GUI 应用：原机手动安装（20 个）

前 19 个都有官方 Homebrew cask，已写入 `Brewfile`，新电脑可全自动安装（等价于官网 dmg/pkg）。

| 应用 | 当前版本 | 可复用的 cask token | 备注 |
|---|---|---|---|
| Adobe Acrobat Reader | 26.001.21662 | `adobe-acrobat-reader` | |
| ChatGPT | 26.1106.51428 | `chatgpt` | Bundle ID 为 `com.openai.codex`；若新机只需 Codex CLI，可改用 `codex` |
| CotEditor | 7.1.3 | `coteditor` | |
| Cyberduck | 9.6.0 | `cyberduck` | 配套 CLI `duck` 已装 |
| DriveDx | 1.12.1 | `drivedx` | 商业软件，需授权 |
| electerm | 5.10.0 | `electerm` | |
| GitHub Desktop | 3.6.10 | `github` | 需登录 |
| iTerm | 3.7.6 | `iterm2` | |
| KeepingYouAwake | 1.6.8 | `keepingyouawake` | |
| magpie | 0.1.3908 | `magpie` | 配套 `~/.local/bin/magpie` |
| Mos | 4.2.1 | `mos` | 需辅助功能权限 |
| Qoder | 0.5.1 | `qoder` | |
| Snipaste | 2.11.3 | `snipaste` | |
| TRAE CN | 3.4.17 | `trae-cn` | |
| Visual Studio Code | 1.146.0 | `visual-studio-code` | 扩展见第五节 |
| 微信开发者工具 | 36.6.0 | `wechatwebdevtools` | 会额外生成 `/usr/local/bin/wechatide`、`wechatidecli` |
| WorkBuddy AI | 5.9.4 | `workbuddy-ai` | |
| WorkBuddy | 5.9.3 | `workbuddy-cn` | |
| 网易有道翻译 | 11.3.24 | `youdaodict` | |
| **DSH Desktop** | 0.13.2 | **无 cask** | 需手动从官网/项目页下载，`io.dsh.desktop` |

- Safari：macOS 系统自带，无需安装。
- 未发现 Mac App Store 应用（所有 `/Applications/*.app` 均无 `_MASReceipt`，本机也未安装 `mas`）；因此 Brewfile 中没有 `mas` 条目。

---

## 四、Homebrew 命令行软件

### Taps（2 个，需先添加）

| Tap | 源 |
|---|---|
| `omlahore/tap` | https://github.com/omlahore/homebrew-tap |
| `roversx/tap` | https://github.com/RoversX/homebrew-tap |

### 顶层 Formula（4 个，需要显式安装）

| Formula | 版本 | 用途 |
|---|---|---|
| `node@24` | 24.22.2 | Node.js 运行时 |
| `python@3.13` | 3.13.18 | Python 运行时 |
| `rtk` | 1.1.0 | 降低 LLM token 消耗的 CLI 代理 |
| `duck` | 9.5.4.45528 | Cyberduck 命令行版 |

### 依赖 Formula（19 个，brew 会自动解析，无需单独安装）

`brotli 1.2.1`、`c-ares 1.34.9`、`ca-certificates 2026-10-20`、`hdrhistogram_c 0.12.1`、`icu4c@79 79.1`、`libnghttp2 1.70.0`、`libnghttp3 1.18.0`、`libngtcp2 1.25.0_1`、`libuv 1.53.0`、`lz4 1.10.0`、`mpdecimal 4.0.1`、`openssl@3 3.5.9`、`openssl@4 4.1.0`、`readline 8.3.6`、`simdjson 5.0.6`、`sqlite 3.54.1`、`uvwasi 0.0.23`、`xz 5.8.4`、`zstd 1.5.7_1`

---

## 五、VS Code 扩展（10 个，VS Code 1.146.0）

```
mhutchie.git-graph
ms-python.debugpy
ms-python.python
ms-python.vscode-pylance
ms-python.vscode-python-envs
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode.makefile-tools
ms-vscode.remote-explorer
tomoki1207.pdf
```

本机版本依次为：`1.30.0 / 2026.6.0 / 2026.10.0 / 2026.4.1 / 1.42.0 / 0.128.0 / 0.87.0 / 0.12.17 / 0.5.0 / 1.2.2`。
新电脑默认装最新版即可；若做内网离线部署，需按上述版本下载 `.vsix` 后 `code --install-extension xxx.vsix`。`~/.trae-cn/extensions` 只有 `extensions.json`，无额外扩展。

---

## 六、全局 npm 包（WorkBuddy 内置 Node 22.22.2-6）

| 包 | 版本 | 说明 |
|---|---|---|
| `@openai/codex` | 0.166.0 | Codex CLI，`codex --version` 可验证 |
| `@tencent/slidep` | 6.6.2 | 幻灯片生成工具 |
| `corepack` | 0.34.6 | Node 自带 |
| `npm` | 10.9.7 | Node 自带 |

> 新电脑的 WorkBuddy 会自带 Node/npm 运行时，只需补装前两个包：`npm i -g @openai/codex @tencent/slidep`。

---

## 七、Python 包（WorkBuddy 内置 Python 3.13.12 环境）

```
baostock==0.9.4
imageio-ffmpeg==0.8.1
numpy==2.5.4
pandas==3.1.1
pillow==13.0.0
python-dateutil==4.0.0
tzdata==2026.6
```

`pip==26.0` 为环境自带。其中 `baostock / pandas / numpy` 与 xquant 量化数据相关，换机后建议优先恢复。系统另带 Xcode Command Line Tools 内的 Python 3.9.6（Apple 自带，不需要安装）。

---

## 八、其他命令行工具 / 用户脚本（需手动拷贝，不属于可自动安装包）

| 位置 | 内容 |
|---|---|
| `/opt/homebrew/bin` | `duck`、`dsh`、`rtk`、`zed`、`skimnotes`、`skimpdf` 等（随 Homebrew 软件自动生成） |
| `/usr/local/bin` | `wechatide`、`wechatidecli`（微信开发者工具注入） |
| `~/bin` | `hf-fetch.py`、`mlx-serve.py`、`mlx-up`、`README.md` |
| `~/.local/bin` | `mlx_lm*`、`bili`、`bili-proxy`、`magpie`、`omp`、`removemacai`、`numpy-config`、`f2py`、`python`、`python3` |
| 应用内自动更新组件 | Claude Code 版本缓存 2.1.309 / 2.1.317 / 2.1.321（位于 `~/Library/Application Support/Claude*`）、GitHub Copilot Computer Use、Google Updater、Adobe NativeMessagingHost — 均随主程序自动安装，不需迁移 |

> `~/Downloads/Qoder Installer.app` 是下载的安装器，不是已安装软件，无需迁移。

---

## 九、需要人工处理的迁移项（清单之外）

1. **许可证 / 登录**：Parallels Client、Transmit、DriveDx、PDF Expert、Nitro PDF Pro、GitHub Desktop、Claude、ChatGPT、微信、微信开发者工具。
2. **系统权限**：DockDoor、Mos、Snipaste、KeepingYouAwake 需要辅助功能/屏幕录制/后台权限，需在新机手动授权。
3. **WorkBuddy 自身配置**：`~/.workbuddy/mcp.json` 中自定义 MCP 服务 `magpie-memory`；`~/.workbuddy/plugins/cache` 下有 `workbuddy-builtin`、`workbuddy-connector-plugins-official`、`workbuddy-wecom-unified` 三个插件族。这些属于配置/插件，不在软件安装清单内，建议单独备份迁移。
4. **各应用偏好设置**：Chrome/Edge 书签与扩展、iTerm 配置、VS Code `settings.json`/`keybindings.json`、SSH 配置等，需单独同步。

---

## 十、统计口径说明

- 只统计用户可安装的软件；`/System/Applications`、`/Library/Apple`、`/Library/Developer/CommandLineTools` 等系统自带组件不计入（共 300+ 条系统应用已过滤）。
- 共扫描到 356 个应用条目，其中非系统条目 52 个；剔除系统组件、模板、辅助进程和下载器后，得到 `/Applications` 中 32 个 GUI 应用。
- 所有操作均为只读扫描，未安装、卸载或移动任何软件。

---

## 十一、复现文件说明与已验证事项

| 文件 | 内容 | 用法 |
|---|---|---|
| `已安装软件清单.md` | 全量清单 + 给 WorkBuddy 的复用指令 | 在新电脑连同一并交给 WorkBuddy |
| `Brewfile` | 33 条 cask（14 条原机 brew 安装 + 19 条原机手动安装改用 cask 复现）、4 条顶层 formula、2 个 tap、2 个 npm 包 | `brew bundle --file=Brewfile` |
| `reinstall.sh` | 依次执行 brew bundle、VS Code 扩展、npm 兜底、Python 包，并打印人工处理清单 | `bash reinstall.sh`（已加可执行权限，可重复运行） |

已完成的校验：

- `bash -n reinstall.sh` 语法通过。
- `brew bundle check --file=Brewfile` 能正常解析全部条目；报告的「需安装/需更新」项属于预期：原机 19 个应用是手动安装的（brew 记录里没有），且部分 cask 已有新版本。
- Brewfile 中 32 个官方 cask token 均在本机 Homebrew cask 名录中有效；`roversx/tap/launchnext` 来自第三方 tap，已确认 `RoversX/homebrew-tap/Casks/launchnext.rb` 存在。

**版本策略**：Brewfile 不锁版本，新电脑会装各软件当前最新版。若必须复现清单中的精确版本（例如内网离线环境），需要单独下载对应版本的 dmg/pkg 或 `.vsix` 离线安装；Python 包与 npm 包在 `reinstall.sh` / 清单中已给出精确版本号。
