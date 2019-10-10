﻿$pkgDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$infListPath = Join-Path $pkgDir inflist.txt
Invoke-Expression "$(Join-Path $pkgDir 'blnsvr.exe') -u"
Get-Content $infListPath | % { pnputil /delete-driver $_ }
dir Cert:\LocalMachine\TrustedPublisher | ? subject -match 'Red Hat' | Remove-Item
