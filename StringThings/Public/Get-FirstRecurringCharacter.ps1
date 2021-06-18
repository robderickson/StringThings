using namespace System.Collections.Generic
function Get-FirstRecurringCharacter {
    [CmdletBinding()]
    param(
        [string]$String
    )

    PROCESS {
        # Convert the string into a character array
        $CharArray = $String.ToCharArray()
        # Create an empty List to keep the characters already checked
        $CheckedChars = [List[Char]]::new()
        
        # For each character in the character array, check if the character already appears in checked characters
        foreach ($char in $CharArray) {
            if ($CheckedChars -contains $char) {
                # If character already in the list checked characters, exit the loop and return the character.
                return $char
            } else {
                # If character is not in the list of checked characters, add it to the list and continue the loop.
                $CheckedChars.Add($char)
            }
        }
    }
}