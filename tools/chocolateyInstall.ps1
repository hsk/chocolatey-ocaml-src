
$package = "ocaml"
  $url = 'http://caml.inria.fr/pub/distrib/ocaml-4.02/ocaml-4.02.0.tar.gz'

  $binRoot = Get-BinRoot
  Write-Debug "Bin Root is $binRoot"

  $installDir = Join-Path "$binRoot" 'MinGW'

  if (![System.IO.Directory]::Exists($installDir)) {
    [System.IO.Directory]::CreateDirectory($installDir)
  }

  $tempDir = "$env:TEMP\chocolatey\$($package)"

 if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

    $filePath = Join-Path $tempDir "ocaml.tar.gz"
    Get-ChocolateyWebFile "$package" "$filePath" "$url"

    Start-Process "7za" -ArgumentList "x -y `"$filePath`" -o`"$installDir\temp`"" -NoNewWindow -Wait -PassThru
    Start-Process "7za" -ArgumentList "x -ttar -y `"$installDir\temp`" -o`"$installDir`"" -Wait -NoNewWindow -PassThru

