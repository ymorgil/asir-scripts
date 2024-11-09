  function Prompt {
    Write-Host ("$(whoami | Split-Path -Leaf)") -nonewline -foregroundcolor Green 
    Write-Host (" $PWD") -nonewline -foregroundcolor Cyan 
    Write-Host (" # ") -nonewline -foregroundcolor Yellow
    return " "
  }