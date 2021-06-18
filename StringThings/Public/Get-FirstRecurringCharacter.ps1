using namespace System.Collections.Generic
<#
.SYNOPSIS
Get the first recurring character in a string of characters.

.DESCRIPTION
Given an arbitrary string, Get-FirstRecurringCharacter will return the first character that appears more than once in a string. If a string contains only unique characters, no characters are returned. Instead, depending on the defined WarningAction, you will see a warning that the string contained no recurring characters.

.PARAMETER String
A string to check for recurring characters.

.EXAMPLE
This command takes the string "Hello World" and returns the letter 'l':

Get-FirstRecurringCharacter -String 'Hello World'

l

.EXAMPLE
This command takes the string "Hello World" and returns the letter 'l':

Get-FirstRecurringCharacter -String 'Hello World'
l

.EXAMPLE
This command takes the string "Hello World" from the pipeline and returns the letter 'm':

'Lorem lipsum' | Get-FirstRecurringCharacter
m

.EXAMPLE
This example create a custom object with Name and String properties, and pipes them to Get-FirstRecurringCharacter. It returns a space character, because that is the first recurring character in the String property. Checking the count of the returned characters confirms a character was returned:

$Example = [PSCustomObject]@{
    Name = 'Sample Text'
    String = 'The quick brown fox jumps over the lazy dog.'
}
$Example | Get-FirstRecurringCharacter
 
($Example | Get-FirstRecurringCharacter).Count
1

.EXAMPLE
This example results in a warning because the string does not contain any recurring characters:

Get-FirstRecurringCharacter -String 'Algeria' -WarningAction Continue
WARNING: The provided string does not contain recurring characters.

.NOTES
This function is case sensitive. The characters 'A' and 'a' are considered unique.
#>
function Get-FirstRecurringCharacter {
    [CmdletBinding()]
    param(
        [Parameter(
            Mandatory=$true,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true,
            ValueFromRemainingArguments=$true,
            HelpMessage='Provide a string to find the first recurring character')]
        [string]$String
    )

    PROCESS {
        # Convert the string into a character array
        $CharArray = $String.ToCharArray()
        # Create an empty List to keep the characters already checked
        $CheckedChars = [List[Char]]::new()
        
        # For each character in the character array, check if the character already appears in checked characters
        foreach ($char in $CharArray) {
            if ($CheckedChars -ccontains $char) {
                # If character already in the list checked characters, exit the loop and return the character.
                return $char
            } else {
                # If character is not in the list of checked characters, add it to the list and continue the loop.
                $CheckedChars.Add($char)
            }
        }

        # If the loop completes without returning, let the user know
        Write-Warning -Message 'The provided string does not contain recurring characters.'
    }
}