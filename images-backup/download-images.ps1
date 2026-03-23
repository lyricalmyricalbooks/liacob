# Download all Luciano Iacobelli site images from the Shopify CDN
# Run this script once from the images-backup folder to create a local archive.
# Usage: Right-click > Run with PowerShell  (or: pwsh download-images.ps1)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$baseUrl = "https://www.lucianoiacobelli.com/cdn/shop"

function Download-Image {
    param([string]$url, [string]$subfolder)
    $dir = Join-Path $scriptDir $subfolder
    if (!(Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }
    # Extract clean filename (strip query string)
    $filename = ($url -split '[?/]') | Select-Object -Last 2 | Select-Object -First 1
    $dest = Join-Path $dir $filename
    if (!(Test-Path $dest)) {
        try {
            Invoke-WebRequest -Uri $url -OutFile $dest -ErrorAction Stop
            Write-Host "  OK  $filename"
        } catch {
            Write-Host "  FAIL $url"
        }
    } else {
        Write-Host "  SKIP $filename (already exists)"
    }
}

# ── HOMEPAGE / PORTRAIT ──────────────────────────────────────────────────────
Write-Host "`nHomepage / Portrait"
@(
    "$baseUrl/files/maxresdefault_1.jpg?v=1674159942&width=2400",
    "$baseUrl/files/Luciano-Iacobelli-Painter-76ouz8awnrflq4lgupxju6zga0aogvom1m6blwcnq6o.jpg?v=1674159401&width=2000",
    "$baseUrl/files/maxresdefault.jpg?v=1674159942&width=1800"
) | ForEach-Object { Download-Image $_ "homepage" }

# ── LARGE ARTWORK ────────────────────────────────────────────────────────────
Write-Host "`nLarge Artwork"
@(
    "P31_a82d05a1-8e10-4d5c-a017-487ddf197330.jpg?v=1704128916","P32a.jpg?v=1704128916","P38a.jpg?v=1704128915",
    "P20.jpg?v=1704128916","P36a.jpg?v=1704128915","P13.jpg?v=1704128916","P24a.jpg?v=1704128916",
    "P29a.jpg?v=1704128917","P2.jpg?v=1704128916","P25.jpg?v=1681794261","P12.jpg?v=1681794261",
    "P18.jpg?v=1681794262","P26a.jpg?v=1681794262","P7.jpg?v=1681794261","P57.jpg?v=1681794261",
    "P19.jpg?v=1681794261","P43a.jpg?v=1681794261","P51a.jpg?v=1681794262","P34.jpg?v=1681794261",
    "P35.jpg?v=1681794261","P40.jpg?v=1681794261","P44a.jpg?v=1681794261","P39a.jpg?v=1681794260",
    "P42.jpg?v=1681794261","P37.jpg?v=1681794262","P41a.jpg?v=1681794261","P1.jpg?v=1681794261",
    "P3.jpg?v=1681794261","P4.jpg?v=1681794261","P5.jpg?v=1681794261","P9.jpg?v=1681794261",
    "P10.jpg?v=1681794261","P11.jpg?v=1681794261","P14.jpg?v=1681794261","P15.jpg?v=1681794261",
    "P17.jpg?v=1681794261","P21.jpg?v=1681794261","P22.jpg?v=1681794261","P28a.jpg?v=1681794261",
    "P33.jpg?v=1681794261"
) | ForEach-Object { Download-Image "$baseUrl/products/$_" "large" }
@("P23_2d2e544c-c35a-4e8b-9d62-509699401626.jpg?v=1681794261",
  "P30a_233e0bc6-ce53-43c3-85a3-f0ab0b23580f.jpg?v=1681794261",
  "P27a_37c469e7-333d-4361-8073-3c1ec3d3097d.jpg?v=1681794261",
  "P50_de5010f9-a4ef-4186-a5c1-d0ea6b8307e1.jpg?v=1704128915",
  "P43a_1f34c812-5736-4e4d-a5dc-83b30bc7cb4a.jpg?v=1681794260",
  "Pic5.png?v=1680289304"
) | ForEach-Object { Download-Image "$baseUrl/products/$_" "large" }

# ── MEDIUM ARTWORK ───────────────────────────────────────────────────────────
Write-Host "`nMedium Artwork"
@(
    "DSC0486.jpg?v=1709313034","DSC0484.jpg?v=1709313033","DSC0483.jpg?v=1709313034",
    "P45.jpg?v=1704128915","P46.jpg?v=1704128915","P47.jpg?v=1704128915",
    "DSC0474.jpg?v=1711991476","DSC0476.jpg?v=1711991476","DSC0477.jpg?v=1711991476",
    "DSC0478.jpg?v=1711991476","DSC0480.jpg?v=1711991476","DSC0481.jpg?v=1711991476",
    "DSC0482.jpg?v=1709313035","DSC0516.jpg?v=1709313032","P60.jpg?v=1704128915",
    "P68.jpg?v=1704128914","P59.jpg?v=1704128915","P65.jpg?v=1704128914","P67.jpg?v=1704128915",
    "DSC0708.jpg?v=1706807421","P48.jpg?v=1704128915","P8.jpg?v=1681794261",
    "P6.jpg?v=1681794261","P52a.jpg?v=1704128915","DSC0495.jpg?v=1709313034",
    "custom_resized_e7980dbf-95c6-4aee-94cc-1ba5c2ba071c.jpg?v=1711991477",
    "custom_resized_7eae195e-86c5-446b-b5d7-32b88c854acc.jpg?v=1711991476",
    "custom_resized_d1f02e8d-73ee-4bfe-a540-f9d7b84f1fb0.jpg?v=1711991476",
    "custom_resized_47b59f2e-4e80-4d17-aae5-48d15442b361.jpg?v=1711991475",
    "CopyofArt-LucianoIacobelliforLorenzo_4.jpg?v=1711991475"
) | ForEach-Object { Download-Image "$baseUrl/products/$_" "medium" }
@(
    "P180.jpg?v=1696180335","P181.jpg?v=1696180330","P182.jpg?v=1696180330",
    "P183.jpg?v=1696180330","P184.jpg?v=1696180330","P185.jpg?v=1696180335",
    "P186.jpg?v=1696180329","P187.jpg?v=1696180330","P188.jpg?v=1696180330",
    "P189.jpg?v=1696180330","P190.jpg?v=1696180335","P191.jpg?v=1696180329",
    "P193.jpg?v=1696180330","P194.jpg?v=1696180330","P195a.jpg?v=1696180330",
    "P196.jpg?v=1696180334","P197.jpg?v=1696180329","P198.jpg?v=1696180329",
    "P199.jpg?v=1696180329","P200.jpg?v=1696180329","P201.jpg?v=1696180334",
    "P202.jpg?v=1696180329","P203.jpg?v=1696180329","P204.jpg?v=1696180329",
    "P205.jpg?v=1696180329","P205_9ab4e42a-4c86-44f9-9c28-14ccb3a3d6d3.jpg?v=1696180329",
    "P207a.jpg?v=1696180334","P208.jpg?v=1696180329","P209.jpg?v=1696180329",
    "P210.jpg?v=1696180329","P211.jpg?v=1696180329","P212.jpg?v=1696180328",
    "P213.jpg?v=1696180329","P214.jpg?v=1696180329"
) | ForEach-Object { Download-Image "$baseUrl/files/$_" "medium" }

# ── SMALL ARTWORK (H-series prints) ─────────────────────────────────────────
Write-Host "`nSmall Artwork — H-series prints (H1–H234)"
# Preset version timestamps per batch
$hVersions = @{}
1..59    | ForEach-Object { $hVersions[$_] = "1682917134" }
60..119  | ForEach-Object { $hVersions[$_] = "1690909622" }
120..134 | ForEach-Object { $hVersions[$_] = "1690909622" }
135..154 | ForEach-Object { $hVersions[$_] = "1688231423" }
155..234 | ForEach-Object { $hVersions[$_] = "1685639224" }
# Override known different versions
@{60=1690909622;61=1690909622;62=1690909623;63=1690909623;64=1690909623;65=1690909623;
  66=1690909623;67=1690909623;68=1690909623;69=1690909623;70=1690909623;71=1690909623;
  72=1690909623;73=1690909623;74=1690909623;75=1690909623;76=1690909623;77=1690909623;
  78=1690909622;79=1690909622;80=1690909622;81=1690909622;82=1690909622;83=1690909622;
  84=1690909622;85=1690909622;86=1690909622;87=1690909622;88=1690909622;89=1690909622;
  90=1690909622;91=1690909622;92=1690909622;93=1690909622;94=1690909622;95=1690909622;
  96=1690909622;97=1690909622;98=1690909622;99=1690909622}.GetEnumerator() |
  ForEach-Object { $hVersions[$_.Key] = $_.Value }

$skip = @(13,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170)
1..234 | Where-Object { $_ -notin $skip } | ForEach-Object {
    $n = $_; $v = $hVersions[$n]
    Download-Image "$baseUrl/files/H$n.jpg?v=$v&width=1800" "small"
}
# Named small pieces
@("P61.jpg?v=1704128916","P62.jpg?v=1704128915","P63.jpg?v=1704128915","P64.jpg?v=1704128914",
  "P53a.jpg?v=1704128915","P54.jpg?v=1704128915","P55.jpg?v=1704128915","P56.jpg?v=1704128915",
  "DSC0707.jpg?v=1706807420","DSC0709.jpg?v=1706807421","DSC0710.jpg?v=1706807420",
  "DSC0712.jpg?v=1706807418","DSC0714.jpg?v=1706807420","DSC0716.jpg?v=1706807418",
  "DSC0717.jpg?v=1706807420","DSC0718.jpg?v=1706807419","DSC0719.jpg?v=1706807419",
  "DSC0722.jpg?v=1706807419","DSC0723.jpg?v=1706807417","DSC0496.jpg?v=1709313033",
  "DSC0689.jpg?v=1706807419","DSC0692.jpg?v=1706807423","DSC0694.jpg?v=1706807422",
  "DSC0696.jpg?v=1706807419","DSC0697.jpg?v=1706807420"
) | ForEach-Object { Download-Image "$baseUrl/products/$_" "small" }
@("P111.jpg?v=1696180334","P112.jpg?v=1696180328","P113.jpg?v=1696180328"
) | ForEach-Object { Download-Image "$baseUrl/files/$_" "small" }

# ── ASSEMBLAGES ──────────────────────────────────────────────────────────────
Write-Host "`nAssemblages"
@(
    "P75.jpg?v=1709313031","P92.jpg?v=1709313031","P76.jpg?v=1706807421","P77.jpg?v=1706807419",
    "P78.jpg?v=1706807419","P79.jpg?v=1706807420","P80a.jpg?v=1706807419","P81.jpg?v=1706807421",
    "P82.jpg?v=1706807420","P83.jpg?v=1706807420","P84.jpg?v=1706807419","P85.jpg?v=1706807419",
    "P86.jpg?v=1706807419","P87.jpg?v=1706807419","P88.jpg?v=1706807420","P89.jpg?v=1706807419",
    "P90.jpg?v=1706807419","P91.jpg?v=1706807417","P93.jpg?v=1706807418","P94.jpg?v=1706807418",
    "P95.jpg?v=1706807418","P96.jpg?v=1706807417","P97.jpg?v=1706807417","P98.jpg?v=1706807418",
    "P99.jpg?v=1706807417","P100.jpg?v=1706807418","P58a.jpg?v=1704128915","P14.jpg?v=1681794261"
) | ForEach-Object { Download-Image "$baseUrl/products/$_" "assemblage" }
@(
    "P101.jpg?v=1696180328","P102.jpg?v=1696180328","P103.jpg?v=1696180333",
    "P105.jpg?v=1696180328","P106.jpg?v=1696180328","P107.jpg?v=1693588047",
    "P115.jpg?v=1696180328","P116.jpg?v=1696180328","P117.jpg?v=1696180333",
    "P118.jpg?v=1693588048"
) | ForEach-Object { Download-Image "$baseUrl/files/$_" "assemblage" }

# ── DIGITAL ART ──────────────────────────────────────────────────────────────
Write-Host "`nDigital Art"
@(
    "jokers.jpg?v=1693588046","aceofspades.jpg?v=1693588047","anotherluckylady.jpg?v=1693588047",
    "corradotwo.png?v=1693588048","dancingJoker.jpg?v=1693588047","dicefever.jpg?v=1693588047",
    "diceman.png?v=1693588046","DINGINSICH.jpg?v=1693588047","epilogue1.png?v=1693588046",
    "epilogue2.png?v=1693588046","epilogue3.png?v=1693588046","epilogue4.png?v=1693588046",
    "epilogue5.png?v=1693588047","epilogue6.png?v=1693588046","experiment.jpg?v=1693588046",
    "fortuna6.png?v=1693588046","horsefever.jpg?v=1693588046","horserace.jpg?v=1693588047",
    "InkedNighttouch_LI.jpg?v=1693588046","jokerandladyluck.jpg?v=1693588046","joker3.jpg?v=1693588046",
    "Lebanesedishwasher.jpg?v=1693588045","seven_2.jpg?v=1693588045","man.png?v=1693588046",
    "Duo2.jpg?v=1693588047","nght1.png?v=1693588045","NIGHT2.png?v=1693588046",
    "NIGHT3.png?v=1693588045","NIGHT4.png?v=1693588045","overblown.jpg?v=1693588045",
    "Paintingsketch.jpg?v=1693588045","Plato.jpg?v=1693588045","plato2.jpg?v=1693588045",
    "plato3.jpg?v=1693588045","pythagoras.jpg?v=1693588045","remissionconclusion.png?v=1693588045",
    "report.png?v=1693588045","Robinternational.jpg?v=1693588045","rob_sass.jpg?v=1693588045",
    "Duo1.jpg?v=1693588047","Untitled66.png?v=1693588045","Untitled.png?v=1693588045"
) | ForEach-Object { Download-Image "$baseUrl/files/$_" "digital" }
@(
    "angelagain.jpg?v=1709313034","anunciation.jpg?v=1709313034","augustine.jpg?v=1709313033",
    "deathmask2.jpg?v=1709313032","crop18.jpg?v=1709313033","Socates4.jpg?v=1709313033"
) | ForEach-Object { Download-Image "$baseUrl/products/$_" "digital" }

Write-Host "`nDone! Check the subfolders for your downloaded images."
