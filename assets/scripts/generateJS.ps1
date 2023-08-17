$jsContent = Get-Content -Path "./src/JavaScript.js" -Raw
$wrappedJs = "<script>`n$jsContent`n</script>"
$wrappedJs | Out-File -FilePath "./dist/JavaScript.html" -Force

(Get-Content "./index.html") | ForEach-Object {
    $_ -replace '<script src="./src/JavaScript.js"></script>', '<?!=HtmlService.createHtmlOutputFromFile("JavaScript").getContent();?>'
} | Set-Content -Path "./dist/index.html"
