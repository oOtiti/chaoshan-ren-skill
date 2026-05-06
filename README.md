# 潮汕人 Skill

![潮汕人 Skill 项目预览图](assets/social-preview.png)

让 AI 写潮汕文化时，少一点泛泛而谈，多一点地方感和分寸感。

`chaoshan-ren` 是一个面向 Codex、Claude Code 等 AI agent 的中文 skill，用于围绕粤东潮汕文化圈进行写作、审校、解释、研究和本地化。它帮助模型在写潮汕人、潮汕风俗、工夫茶、潮剧、英歌、粿品、潮汕菜、侨批、祠堂、善堂、营老爷、出花园等内容时，避免把潮州单点误写成全部潮汕，也避免把地方文化写成刻板印象或猎奇段子。

这里的“潮汕”按更宽的粤东大潮汕文化圈理解，重点覆盖汕头、潮州、揭阳及海内外潮人社群。潮州是重要组成部分，但不是全部潮汕。

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

## 快速安装

### Codex

发布到 npm 后可以这样安装：

```bash
npx chaoshan-ren-skill --codex
```

当前从本仓库本地安装：

```bash
npm run install:codex
```

默认安装到：

```text
$CODEX_HOME/skills/chaoshan-ren
```

如果没有设置 `CODEX_HOME`，则安装到：

```text
~/.codex/skills/chaoshan-ren
```

### Claude Code

发布到 npm 后可以这样安装：

```bash
npx chaoshan-ren-skill --claude
```

当前从本仓库本地安装：

```bash
npm run install:claude
```

默认安装到：

```text
~/.claude/skills/chaoshan-ren
```

### 自定义目录

```bash
npx chaoshan-ren-skill --dest /path/to/skills
```

目标目录已存在时，安装器会停止并提示；确认覆盖时加：

```bash
npx chaoshan-ren-skill --codex --force
```

## 使用示例

Codex 中可以这样说：

```text
使用 $chaoshan-ren，帮我写一段潮汕文化展览前言，重点不要只写潮州。
```

```text
使用 $chaoshan-ren，检查这段潮汕文旅文案有没有刻板印象，并给我一版改写。
```

```text
使用 $chaoshan-ren，给孩子出花园写一段长辈可以念出来的祝福。
```

Claude Code 中可以这样调用：

```text
/chaoshan-ren 写一个 60 秒短视频脚本，解释英歌为什么有感染力，但不要猎奇化。
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
│   └── chaoshan-ren/
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

## 参考的公开 skill 仓库

- [Anthropic Skills](https://github.com/anthropics/skills)：参考其 skill 自包含和 supporting files 按需加载的组织方式。
- [Claude Code Skills 文档](https://docs.claude.com/en/docs/claude-code/skills)：参考其对 `SKILL.md`、metadata 和附加资源的说明。
- [mattpocock/skills](https://github.com/mattpocock/skills)：参考其公开 skill 仓库的 README 展示方式。
- [secondsky/claude-skills](https://github.com/secondsky/claude-skills)：参考其 `skills/` 目录、脚本和验证说明的组织方式。

## License

MIT
