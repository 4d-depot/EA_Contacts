var $txt : Text

$txt:=File:C1566("/RESOURCES/theme/theme.json").getText()
$txt:=Replace string:C233($txt; "xxx"; Form:C1466.colTheme.currentValue)

File:C1566("/LOGS/theme/theme.json").setText($txt)

CANCEL:C270