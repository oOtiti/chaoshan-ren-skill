# 潮汕人 Skill

`chaoshan-ren` 是一个面向中文写作与审校的 Codex skill，用于围绕粤东潮汕文化圈整理和表达潮汕风俗、礼仪、节庆、饮食、语言、戏曲、英歌、侨乡记忆和公共文化说明。

这里的“潮汕”按更宽的粤东大潮汕文化圈理解，重点覆盖汕头、潮州、揭阳及海内外潮人社群。潮州是重要组成部分，但不是全部潮汕。

## 内容

- `chaoshan-ren/SKILL.md` - skill 入口，说明是什么、什么时候使用、什么时候不要使用。
- `chaoshan-ren/references/粤东潮汕文化.md` - 潮汕文化范围、风俗条目、表达注意事项和资料来源。
- `chaoshan-ren/agents/openai.yaml` - skill 列表展示信息。
- `.githooks/pre-commit` - 提交前运行本地验证。
- `scripts/validate-skill.ps1` - 不依赖额外包的仓库验证脚本。

## 本地设置

克隆后启用仓库内 hook：

```powershell
git config core.hooksPath .githooks
```

手动运行验证：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate-skill.ps1
```

## 发布说明

仓库可以作为公开 GitHub 项目发布。当前还没有选择开源许可证；如果希望别人明确知道能否复用、修改或分发，请在发布前补充 `LICENSE`。
