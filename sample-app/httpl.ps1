if (!$env:PORT ) { $env:PORT = "8080" }
 
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://*:$env:PORT/")
$listener.Start()

Write-Host "Listening at $($listener.Prefixes[0]) ..."

while ($listener.IsListening)
{
    $context = $listener.GetContext()
    $requestUrl = $context.Request.Url
    $response = $context.Response

    Write-Output "> $requestUrl"

    $localPath = $requestUrl.LocalPath

    $buffer = [System.Text.Encoding]::UTF8.GetBytes(((gci -path env:*) | Out-String))
    $response.ContentLength64 = $buffer.Length
    $response.OutputStream.Write($buffer, 0, $buffer.Length)

    Write-Output "< $($response.StatusCode)"
    $response.Dispose()
}
