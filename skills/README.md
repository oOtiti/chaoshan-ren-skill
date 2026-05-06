# Skills

这个目录用于存放可安装的 skill。每个子目录都是一个自包含 skill，包含入口文件、展示信息和按需读取的参考资料。

## 当前包含

- `teochew-people-skill`：Teochew People (潮汕人) 写作与审校 skill，用于粤东潮汕文化圈、海外潮人社群、潮汕方言文化、风俗礼仪、饮食、戏曲、英歌、侨批和当代文化案例。

## 组织约定

- 每个 skill 使用小写英文和连字符命名，方便工具识别。
- `SKILL.md` 只放入口说明、触发边界、流程和导航。
- 详细知识放进 `references/`，并按主题拆分。
- 写作模板、常用词和任务示例也放进 `references/`，让 skill 使用者按需读取。
- 面向 UI 的展示信息放进 `agents/openai.yaml`。
- 不在 skill 目录里放无关说明文档；仓库级说明放在根目录。

## 命名约定

- 机器名使用 `teochew-people-skill`，保持 npm、Codex、Claude Code 路径稳定。
- 对外英文名使用 `Teochew People (潮汕人)`。
- 中文语境可以直接写“Teochew People (潮汕人) skill”或“潮汕文化写作 skill”。
- 不把 `Teochew` 简化成今天的潮州市；涉及文化范围时仍按粤东潮汕文化圈解释。
