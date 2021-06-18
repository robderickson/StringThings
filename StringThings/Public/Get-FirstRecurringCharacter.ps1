using namespace System.Collections.Generic
function Get-FirstRecurringCharacter {
    [CmdletBinding()]
    param(
        [string]$String
    )

    PROCESS {
        $CharArray = $String.ToCharArray()
        
        $CheckedChars = [List[Char]]::new()
        
        foreach ($char in $CharArray) {
            if ($CheckedChars -contains $char) {
                return $char
            } else {
                $CheckedChars.Add($char)
            }
        }
    }
}