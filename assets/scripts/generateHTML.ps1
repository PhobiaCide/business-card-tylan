# Wrap the contents of Stylesheet.css in <style> tags and save it as Stylesheet.html
$styleContent = Get-Content -Raw ./src/Stylesheet.css
$wrappedStyleContent = "<style>`n$styleContent`n</style>"
$wrappedStyleContent | Out-File ./dist/Stylesheet.html -Encoding UTF8

# Replace the stylesheet link in index.html with the HTMLService.createHtmlOutputFromFile call
(Get-Content "./index.html") | ForEach-Object {
    $_ -replace '<link rel="stylesheet" href="./src/Stylesheet.css" />', '<?!=HtmlService.createHtmlOutputFromFile("Stylesheet").getContent();?>'
} | Set-Content -Path "./dist/index.html" -Encoding UTF8
