# npm 发布与更新指南

这份文档给维护者使用，说明如何第一次发布、如何更新版本，以及 GitHub Actions 自动发布怎么配置。

## 第一次发布

第一次发布建议先在本机完成，因为 npm 需要确认你的账号具备发布权限。

1. 登录 npm：

```bash
npm login
```

2. 确认当前账号：

```bash
npm whoami
```

3. 运行本地检查：

```bash
npm run validate
npm run pack:check
```

4. 发布公开包：

```bash
npm publish --access public
```

如果 npm 提示需要 OTP，输入 npm 双重验证里的 6 位动态码。这个码通常来自你设置 npm 2FA 时绑定的 Authenticator 应用或安全密钥，不是 GitHub 的验证码，也不是普通邮箱登录验证码。

## 配置 Trusted Publishing

第一次包发布成功后，建议在 npmjs.com 为包配置 Trusted Publishing。这样以后可以通过 GitHub Release 自动发布，不需要在 GitHub Secrets 里保存长期 npm token。

在 npmjs.com 进入包设置后，找到 Trusted Publisher，选择 GitHub Actions，并填写：

- Organization or user: `oOtiti`
- Repository: `teochew-people-skill`
- Workflow filename: `publish-npm.yml`
- Environment name: 留空

保存后，GitHub 的 `.github/workflows/publish-npm.yml` 就可以通过 OIDC 发布这个包。

## 更新 npm 包

npm 的同一个版本号只能发布一次。每次要更新公开包，都要先升级 `package.json` 里的版本号。

常用版本号规则：

- 修正文案、补资料、改 README：`npm version patch`
- 增加新能力、补充新的参考资料结构：`npm version minor`
- 做不兼容的大调整：`npm version major`

例如从 `0.1.0` 更新到 `0.1.1`：

```bash
npm version patch
git push origin main --follow-tags
```

然后在 GitHub 页面创建一个 Release，选择刚刚推送的 tag。Release 发布后，`Publish npm package` workflow 会自动运行。

如果暂时不使用 GitHub Release，也可以本地手动发布：

```bash
npm run validate
npm run pack:check
npm publish --access public
```

## 发布后检查

发布完成后，检查 npm 当前版本：

```bash
npm view teochew-people-skill version
```

用户即可安装：

```bash
npx teochew-people-skill --codex
npx teochew-people-skill --claude
```

## 注意事项

- 不要把 npm token、恢复码、邮箱验证码或 `.env` 文件提交到仓库。
- 发布前先看 `npm run pack:check` 输出，确认包里没有本地缓存、临时文件或私密资料。
- 已发布到 npm 的版本号不能覆盖；发现小错误时发布下一个 patch 版本。
- 如果 GitHub Actions 发布失败，优先检查 npm Trusted Publisher 里的 workflow 文件名是否精确等于 `publish-npm.yml`。
