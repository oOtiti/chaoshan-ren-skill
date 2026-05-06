#!/usr/bin/env node

import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const root = path.resolve(__dirname, "..");
const source = path.join(root, "skills", "chaoshan-ren");

const args = process.argv.slice(2);

function has(flag) {
  return args.includes(flag);
}

function valueAfter(flag) {
  const index = args.indexOf(flag);
  if (index === -1) return undefined;
  return args[index + 1];
}

function usage() {
  console.log(`潮汕人 skill 安装器

用法:
  npx teochew-people-skill --codex
  npx teochew-people-skill --claude
  npx teochew-people-skill --dest <skills目录>

选项:
  --codex       安装到 Codex 个人 skills 目录，默认使用 CODEX_HOME/skills 或 ~/.codex/skills
  --claude      安装到 Claude Code 个人 skills 目录 ~/.claude/skills
  --dest <dir>  安装到自定义 skills 父目录
  --force       目标已存在时覆盖
  --dry-run     只显示将要复制的位置
  --help        显示帮助
`);
}

if (has("--help") || has("-h")) {
  usage();
  process.exit(0);
}

if (!fs.existsSync(path.join(source, "SKILL.md"))) {
  console.error(`找不到 skill 源目录: ${source}`);
  process.exit(1);
}

const customDest = valueAfter("--dest");
const parentDir = customDest
  ? path.resolve(customDest)
  : has("--claude")
    ? path.join(os.homedir(), ".claude", "skills")
    : path.join(process.env.CODEX_HOME || path.join(os.homedir(), ".codex"), "skills");

const target = path.join(parentDir, "chaoshan-ren");

if (has("--dry-run")) {
  console.log(`将复制: ${source}`);
  console.log(`到: ${target}`);
  process.exit(0);
}

if (fs.existsSync(target)) {
  if (!has("--force")) {
    console.error(`目标已存在: ${target}`);
    console.error("如需覆盖，请加 --force。");
    process.exit(1);
  }
  fs.rmSync(target, { recursive: true, force: true });
}

fs.mkdirSync(parentDir, { recursive: true });
fs.cpSync(source, target, { recursive: true });

console.log(`已安装 chaoshan-ren skill 到: ${target}`);
console.log("Codex 中可用 $chaoshan-ren 调用；Claude Code 中可用 /chaoshan-ren 调用。");
