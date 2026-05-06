# GitHub Workflows 说明

本仓库使用 GitHub Actions 做两类自动化：检查质量，以及发布 npm 包。

## 什么是 workflow

Workflow 是 GitHub Actions 里的“自动化流程”。它写在 `.github/workflows/*.yml` 文件里，由事件触发，例如：

- 有人向 `main` 推送代码。
- 有人打开或更新 Pull Request。
- 维护者发布 GitHub Release。
- 维护者在 GitHub 页面手动点击运行。

每个 workflow 由一个或多个 job 组成。job 会在 GitHub 提供的云端机器上运行命令，比如安装 Node.js、运行校验脚本、打包检查、发布 npm 包。

## 本仓库有哪些 workflow

### `CI`

文件：`.github/workflows/ci.yml`

触发时机：

- 推送到 `main`。
- 打开或更新 Pull Request。
- 手动运行。

它会做这些事：

- 在 Node.js 22 和 Node.js 24 上检查仓库。
- 运行 `npm run validate`，确认 skill 文件、参考资料、README、许可证和安装脚本齐全。
- 运行 `npm run pack:check`，确认 npm 包里会带上需要发布的文件。

### `Publish npm package`

文件：`.github/workflows/publish-npm.yml`

触发时机：

- 发布 GitHub Release。
- 手动运行。

它会做这些事：

- 拉取当前代码。
- 使用 Node.js 24。
- 先跑完整校验和打包预检查。
- 通过 npm Trusted Publishing 发布到 npmjs.com。

这个 workflow 不把 npm 密钥写进仓库。它依赖 npm 和 GitHub Actions 之间的 OIDC 信任关系，发布时由 GitHub 临时证明“这次发布来自这个公开仓库的这个 workflow”。

## 为什么没有加 GitHub Packages 发布

GitHub 侧边栏推荐的 “Publish Node.js Package to GitHub Packages” 是发布到 GitHub Packages，不是发布到 npmjs.com。

这个项目现在的包名是 `teochew-people-skill`，更适合公开搜索和直接 `npx teochew-people-skill --codex` 使用。GitHub Packages 的 npm 包通常需要 scoped 包名，例如 `@oOtiti/teochew-people-skill`，安装时还要配置 GitHub npm registry，对普通使用者不如 npmjs.com 直观。

所以本仓库优先发布到 npmjs.com；GitHub Packages 以后如果需要企业内部分发，再单独加。
