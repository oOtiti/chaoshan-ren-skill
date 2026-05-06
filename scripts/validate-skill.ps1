$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$skillDir = Join-Path $root "skills/teochew-people-skill"
$skillFile = Join-Path $skillDir "SKILL.md"
$agentFile = Join-Path $skillDir "agents/openai.yaml"
$referencesDir = Join-Path $skillDir "references"
$packageFile = Join-Path $root "package.json"
$installScript = Join-Path $root "scripts/install-skill.mjs"
$readmeFile = Join-Path $root "README.md"
$licenseFile = Join-Path $root "LICENSE"
$contributingFile = Join-Path $root "CONTRIBUTING.md"
$exampleFile = Join-Path $root "examples/before-after.md"
$caseDemoFile = Join-Path $root "assets/case-demo.svg"
$requiredReferenceFiles = @(
    "00-使用索引.md",
    "01-范围与称谓.md",
    "02-风俗礼仪.md",
    "03-节庆岁时.md",
    "04-饮食与工夫茶.md",
    "05-语言戏曲英歌工艺.md",
    "06-侨乡与社会组织.md",
    "07-写作模板与审校清单.md",
    "08-常用词库.md",
    "09-任务示例.md",
    "90-资料来源.md"
)

function Fail($message) {
    Write-Error $message
    exit 1
}

if (-not (Test-Path -LiteralPath $skillFile)) {
    Fail "缺少 skills/teochew-people-skill/SKILL.md"
}

$skill = Get-Content -LiteralPath $skillFile -Raw
if ($skill -notmatch '(?s)^---\s*\r?\nname:\s*teochew-people-skill\s*\r?\ndescription:\s*(.+?)\r?\n---') {
    Fail "SKILL.md 必须包含 name: teochew-people-skill 和 description"
}

$description = $Matches[1].Trim()
if ($description.Length -lt 120) {
    Fail "SKILL.md 的 description 太短，触发信息不足"
}

if ($skill -match '\[TODO|TODO:|Replace with|Structuring This Skill') {
    Fail "SKILL.md 仍包含模板 TODO 文本"
}

foreach ($term in @("Teochew People", "潮汕人", "是什么", "什么时候使用", "什么时候不要使用", "粤东", "汕头", "揭阳", "潮州")) {
    if ($skill -notmatch [regex]::Escape($term)) {
        Fail "SKILL.md 应包含 '$term'"
    }
}

foreach ($path in @($agentFile, $referencesDir)) {
    if (-not (Test-Path -LiteralPath $path)) {
        Fail "缺少必要文件: $($path.Substring($root.Length + 1))"
    }
}

foreach ($path in @($packageFile, $installScript, $readmeFile, $licenseFile, $contributingFile, $exampleFile, $caseDemoFile)) {
    if (-not (Test-Path -LiteralPath $path)) {
        Fail "缺少公开发布文件: $($path.Substring($root.Length + 1))"
    }
}

foreach ($file in $requiredReferenceFiles) {
    $path = Join-Path $referencesDir $file
    if (-not (Test-Path -LiteralPath $path)) {
        Fail "缺少参考资料: skills/teochew-people-skill/references/$file"
    }
}

$agent = Get-Content -LiteralPath $agentFile -Raw
if ($agent -notmatch '\$teochew-people-skill') {
    Fail "agents/openai.yaml 的 default_prompt 必须包含 `$teochew-people-skill"
}

$reference = foreach ($file in $requiredReferenceFiles) {
    Get-Content -LiteralPath (Join-Path $referencesDir $file) -Raw
}
$referenceText = $reference -join "`n"

foreach ($term in @("Teochew people", "Teochew People", "粤东", "汕头", "揭阳", "潮州", "工夫茶", "潮剧", "英歌", "出花园", "七样羹", "营老爷", "侨批", "善堂", "常用词库", "任务示例", "资料来源")) {
    if ($referenceText -notmatch [regex]::Escape($term)) {
        Fail "参考资料应包含 '$term'"
    }
}

if ($referenceText -match '\[TODO|TODO:') {
    Fail "参考资料仍包含 TODO 文本"
}

$package = Get-Content -LiteralPath $packageFile -Raw | ConvertFrom-Json
if ($package.name -ne "teochew-people-skill") {
    Fail "package.json 的 name 应为 teochew-people-skill"
}

if (-not $package.bin.'teochew-people-skill') {
    Fail "package.json 应提供 teochew-people-skill 命令"
}

$installer = Get-Content -LiteralPath $installScript -Raw
foreach ($term in @("--codex", "--claude", "--dest", "--force", "skills", "teochew-people-skill")) {
    if ($installer -notmatch [regex]::Escape($term)) {
        Fail "安装脚本应包含 '$term'"
    }
}

$readme = Get-Content -LiteralPath $readmeFile -Raw
foreach ($term in @("Teochew People (潮汕人) Skill", "assets/case-demo.svg", "名字怎么理解", "一个具体案例", "给阿嬷的情书", "为什么值得用", "快速安装", "使用示例", "效果预览", "npx teochew-people-skill --codex", "npx teochew-people-skill --claude")) {
    if ($readme -notmatch [regex]::Escape($term)) {
        Fail "README 应包含 '$term'"
    }
}

foreach ($term in @("Anthropic Skills", "mattpocock/skills", "secondsky/claude-skills", "参考的公开 skill 仓库")) {
    if ($readme -match [regex]::Escape($term)) {
        Fail "README 不应展示公开 skill 仓库参考痕迹: $term"
    }
}

if (Test-Path -LiteralPath (Join-Path $root "teochew-people-skill/SKILL.md")) {
    Fail "旧的根目录 teochew-people-skill/SKILL.md 仍存在，应只保留 skills/teochew-people-skill"
}

Write-Host "Skill 验证通过: teochew-people-skill"
