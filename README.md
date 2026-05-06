# Teochew People (潮汕人) Skill

![Teochew People (潮汕人) Skill 项目预览图](assets/social-preview.png)

让 AI 写潮汕文化时，少一点泛泛而谈，多一点地方感和分寸感。

`teochew-people-skill` 是一个面向 Codex、Claude Code 等 AI agent 的中文 skill。项目对外英文名使用 **Teochew People (潮汕人)**：`Teochew people` 是海外和英文语境里更常见、更有辨识度的潮人/潮汕人说法；`teochew-people-skill` 则作为 npm 包名、skill 目录名和调用名，保持安装与使用一致。

这个 skill 用于围绕粤东潮汕文化圈进行写作、审校、解释、研究和本地化。它帮助模型在写 Teochew people / 潮汕人、潮汕风俗、工夫茶、潮剧、英歌、粿品、潮汕菜、侨批、祠堂、善堂、营老爷、出花园等内容时，避免把潮州单点误写成全部潮汕，也避免把地方文化写成刻板印象或猎奇段子。

这里的“潮汕”按更宽的粤东大潮汕文化圈理解，重点覆盖汕头、潮州、揭阳及海内外潮人社群。潮州是重要组成部分，但不是全部潮汕。

## 名字怎么理解

- **Teochew People (潮汕人)**：面向英文读者、海外潮人社群、GitHub/NPM 项目展示时优先使用。
- **潮汕人**：面向中文读者时使用，强调粤东潮汕文化圈和海内外潮人社群。
- **潮人**：适合侨乡、同乡会、宗亲会、海外社群、文化社团语境。
- **潮州人 / Teochew**：可用于历史潮州府、潮州话、海外 Teochew 社群等语境，但不要把“潮州”机械等同于整个潮汕。
- **teochew-people-skill**：只作为技术名使用，包括 skill 名、包名、安装目录和命令。

## 一个具体案例

比如分析 2026 年 4 月 30 日上映的潮汕方言电影《给阿嬷的情书》时，普通模型很容易只写成“方言亲情片”或“潮汕人很重家庭”。使用这个 skill，agent 会先抓住更有潮汕文化辨识度的线索：

![《给阿嬷的情书》动态分析演示](assets/case-demo.svg)

- 片名里的“阿嬷”不是普通亲昵称呼，而是潮汕家庭代际情感的入口。
- 影片以侨批家书为核心线索，可以连接潮汕侨乡、下南洋、跨海汇款、家书往返和家国记忆。
- 潮汕话不是点缀，而是人物关系、家庭伦理和地方记忆的声音载体。
- 汕头、潮州、揭阳及海外潮人社群共同构成故事背景，不能把它简化成单一“潮州文化”。
- 适合写成“阿嬷、侨批、乡音、远方和家”的分析，不适合写成“潮汕人都恋家”这种标签。

示例提问：

```text
使用 $teochew-people-skill，分析电影《给阿嬷的情书》为什么适合作为 Teochew People (潮汕人) 文化传播案例，重点写侨批、阿嬷、潮汕话和大潮汕文化圈，不要写成泛泛的亲情片影评。
```

示例输出方向：

```text
《给阿嬷的情书》真正动人的地方，不只是祖孙亲情，而是把潮汕人的“家”写成了一条跨海的线。侨批让远方不再抽象：它既是钱，也是信，是下南洋的人寄回故土的牵挂。阿嬷守着的不只是一段往事，也是一个家庭如何在乡音、等待和记忆里延续下来。潮汕话在片中因此不只是方言对白，而是亲人之间最自然、也最难被翻译的情感方式。
```

## 为什么值得用

普通模型写潮汕文化时，常见问题是：

- 把“潮州”等同于“潮汕”。
- 把一个村、一个姓氏、一个家庭的做法写成全体潮汕通用。
- 把工夫茶、英歌、牛肉火锅当成潮汕文化全部。
- 编造“古法”“祖训”“禁忌”“潮汕话读音”。
- 把宗族、信俗、婚嫁、性别议题写得猎奇或武断。

这个 skill 的作用不是替用户写一篇百科，而是给 agent 一套“潮汕文化写作的判断框架”：什么时候用、什么时候不用、该读哪些资料、怎么写得准确、有温度、不过度概括。

## 适合做什么

- 写潮汕文化介绍、展览前言、文旅文案、公众号文章。
- 写短视频脚本、口播稿、标题、菜品介绍、品牌故事。
- 写出花园、节庆、家族纪念、长辈祝福等温和得体的中文。
- 审校已有文案，指出范围错误、刻板印象、伪民俗和没有来源的说法。
- 作为模板，fork 后改造成客家、广府、闽南、吴语、东北民俗等地域文化 skill。

## 不适合做什么

- 不适合替代学术论文、族谱考证、地方志编纂或正式出版物审稿。
- 不适合给出具体祭拜流程、风水择日、宗教仪轨或家族规矩。
- 不适合编造潮汕话读音、古法、祖训、禁忌或“老一辈都这么说”。
- 不适合把潮汕文化包装成单一城市标签、商业成功学或猎奇民俗。

## 快速安装

### Codex

通过 npm 安装：

```bash
npx teochew-people-skill --codex
```

现在也可以直接从 GitHub 安装：

```bash
npx github:oOtiti/teochew-people-skill --codex
```

从本仓库本地安装：

```bash
npm run install:codex
```

默认安装到：

```text
$CODEX_HOME/skills/teochew-people-skill
```

如果没有设置 `CODEX_HOME`，则安装到：

```text
~/.codex/skills/teochew-people-skill
```

### Claude Code

通过 npm 安装：

```bash
npx teochew-people-skill --claude
```

现在也可以直接从 GitHub 安装：

```bash
npx github:oOtiti/teochew-people-skill --claude
```

从本仓库本地安装：

```bash
npm run install:claude
```

默认安装到：

```text
~/.claude/skills/teochew-people-skill
```

### 自定义目录

```bash
npx teochew-people-skill --dest /path/to/skills
```

目标目录已存在时，安装器会停止并提示；确认覆盖时加：

```bash
npx teochew-people-skill --codex --force
```

## 项目自动化

本仓库已经准备好 GitHub Actions：

- `CI`：每次推送到 `main`、打开 Pull Request 或手动运行时，会在 Node.js 22 和 24 上执行 skill 校验与 npm 打包预检查。
- `Publish npm package`：发布 GitHub Release 或手动运行时，会先校验再发布到 npmjs.com。它按 npm Trusted Publishing 方式设计，不需要把长期 npm token 放进 GitHub Secrets。

更细的说明见 [GitHub Workflows 说明](docs/github-workflows.md)。

## 维护者发布

第一次发布 npm 包时，维护者需要先在本机登录 npm，并确认账号已满足 npm 的发布要求：

```bash
npm login
npm whoami
npm run validate
npm run pack:check
npm publish --access public
```

之后每次更新都要先升级版本号，例如：

```bash
npm version patch
git push origin main --follow-tags
```

然后在 GitHub 创建 Release，触发自动发布。完整步骤见 [npm 发布与更新指南](docs/publishing.md)。

## 使用示例

Codex 中可以这样说：

```text
使用 $teochew-people-skill，帮我写一段 Teochew People (潮汕人) 文化展览前言，重点不要只写潮州。
```

```text
使用 $teochew-people-skill，检查这段潮汕文旅文案有没有刻板印象，并给我一版改写。
```

```text
使用 $teochew-people-skill，给孩子出花园写一段长辈可以念出来的祝福。
```

Claude Code 中可以这样调用：

```text
/teochew-people-skill 写一个 60 秒短视频脚本，解释英歌为什么有感染力，但不要猎奇化。
```

更多 before/after 示例见 [examples/before-after.md](examples/before-after.md)。

## 效果预览

原文：

```text
潮汕文化就是潮州文化，潮汕人都喝功夫茶、看潮剧、拜老爷。
```

使用 skill 后的改写方向：

```text
潮州是潮汕文化的重要源流和重镇，但潮汕文化圈还包括汕头、揭阳及海内外潮人社群。工夫茶、潮剧、英歌、粿品、侨批和各地年俗，共同构成了潮汕人关于家、乡、礼数与远方的记忆。不同地方、不同家庭的做法并不完全一样，真正值得写的，正是这些生活细节里的地方感。
```

再比如英文/双语项目介绍中，skill 会倾向这样处理：

```text
Teochew People (潮汕人) refers here to the wider Chaoshan cultural world: Shantou, Chaozhou, Jieyang, nearby Teochew-speaking communities, and the overseas Teochew diaspora. The point is not to reduce the culture to one city or one stereotype, but to write from living details: gongfu tea, Teochew opera, Yingge dance, rice cakes, qiaopi letters, clan halls, charity halls, family rituals, and the sound of the Teochew language.
```

## 仓库结构

```text
.
├── README.md
├── package.json
├── LICENSE
├── CONTRIBUTING.md
├── examples/
│   └── before-after.md
├── skills/
│   ├── README.md
│   └── teochew-people-skill/
│       ├── SKILL.md
│       ├── agents/
│       │   └── openai.yaml
│       └── references/
│           ├── 00-使用索引.md
│           ├── 01-范围与称谓.md
│           ├── 02-风俗礼仪.md
│           ├── 03-节庆岁时.md
│           ├── 04-饮食与工夫茶.md
│           ├── 05-语言戏曲英歌工艺.md
│           ├── 06-侨乡与社会组织.md
│           ├── 07-写作模板与审校清单.md
│           ├── 08-常用词库.md
│           ├── 09-任务示例.md
│           └── 90-资料来源.md
├── scripts/
│   ├── install-skill.mjs
│   └── validate-skill.ps1
└── .githooks/
    └── pre-commit
```

## 设计原则

- `SKILL.md` 保持轻量，只放触发说明、使用边界、流程和资料导航。
- 详细文化资料放进 `references/`，按主题拆分，让 agent 按需读取。
- 事实性内容尽量附来源；涉及最新认定、活动时间、官方称号时需要实时核对。
- 不把某个地方、家庭或村社的习惯写成整个潮汕通用。
- 不为真实感编造潮汕话读音、祖训、禁忌或古法。
- 英文对外介绍优先使用 `Teochew People (潮汕人)`，但内容解释要覆盖粤东潮汕文化圈，不把 Teochew 简化成单一潮州城市身份。

## 本地验证

```bash
npm run validate
npm run pack:check
```

Windows PowerShell 也可以直接运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate-skill.ps1
```

启用仓库内 hook：

```bash
git config core.hooksPath .githooks
```

提交时 `.githooks/pre-commit` 会自动运行 skill 验证。

## 贡献

欢迎补充可靠资料、地方差异、写作模板和审校案例。请先读 [CONTRIBUTING.md](CONTRIBUTING.md)。

最欢迎的贡献：

- 更具体的汕头、潮州、揭阳、普宁、潮阳、潮南、惠来、揭西等地资料。
- 可靠来源，尤其是方志、博物馆、非遗、政府、学术和深度报道。
- 真实但不泄露隐私的 before/after 审校案例。
- 对刻板印象、范围混淆、伪民俗表达的修正。

## License

MIT
