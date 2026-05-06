$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$skillDir = Join-Path $root "chaoshan-ren"
$skillFile = Join-Path $skillDir "SKILL.md"
$referenceFile = Join-Path $skillDir "references/粤东潮汕文化.md"
$agentFile = Join-Path $skillDir "agents/openai.yaml"

function Fail($message) {
    Write-Error $message
    exit 1
}

if (-not (Test-Path -LiteralPath $skillFile)) {
    Fail "缺少 chaoshan-ren/SKILL.md"
}

$skill = Get-Content -LiteralPath $skillFile -Raw
if ($skill -notmatch '(?s)^---\s*\r?\nname:\s*chaoshan-ren\s*\r?\ndescription:\s*(.+?)\r?\n---') {
    Fail "SKILL.md 必须包含 name: chaoshan-ren 和 description"
}

$description = $Matches[1].Trim()
if ($description.Length -lt 120) {
    Fail "SKILL.md 的 description 太短，触发信息不足"
}

if ($skill -match '\[TODO|TODO:|Replace with|Structuring This Skill') {
    Fail "SKILL.md 仍包含模板 TODO 文本"
}

foreach ($term in @("是什么", "什么时候使用", "什么时候不要使用", "粤东", "汕头", "揭阳", "潮州")) {
    if ($skill -notmatch [regex]::Escape($term)) {
        Fail "SKILL.md 应包含 '$term'"
    }
}

foreach ($path in @($referenceFile, $agentFile)) {
    if (-not (Test-Path -LiteralPath $path)) {
        Fail "缺少必要文件: $($path.Substring($root.Length + 1))"
    }
}

$agent = Get-Content -LiteralPath $agentFile -Raw
if ($agent -notmatch '\$chaoshan-ren') {
    Fail "agents/openai.yaml 的 default_prompt 必须包含 `$chaoshan-ren"
}

$reference = Get-Content -LiteralPath $referenceFile -Raw
foreach ($term in @("粤东", "汕头", "揭阳", "潮州", "工夫茶", "潮剧", "英歌", "出花园", "七样羹", "营老爷", "侨批", "资料来源")) {
    if ($reference -notmatch [regex]::Escape($term)) {
        Fail "参考资料应包含 '$term'"
    }
}

if ($reference -match '\[TODO|TODO:') {
    Fail "参考资料仍包含 TODO 文本"
}

Write-Host "Skill 验证通过: chaoshan-ren"
