# StringThings
A PowerShell module for doing fun things with strings.


## Get-FirstRecurringCharacter
### SYNOPSIS
Get the first recurring character in a string of characters.

### DESCRIPTION
Given an arbitrary string, Get-FirstRecurringCharacter will return the first character that appears more than once in a string. If a string contains only unique characters, no characters are returned. Instead, depending on the defined WarningAction, you will see a warning that the string contained no recurring characters.

### PARAMETER String
A string to check for recurring characters.

### EXAMPLE 1
This command takes the string "Hello World" and returns the letter 'l':  
```PowerShell
Get-FirstRecurringCharacter -String 'Hello World'

l
```

### EXAMPLE 2
This command takes the string "Hello World" and returns the letter 'l':  
```PowerShell
Get-FirstRecurringCharacter -String 'Hello World'
l
```

### EXAMPLE 3
This command takes the string "Hello World" from the pipeline and returns the letter 'm':  
```PowerShell
'Lorem lipsum' | Get-FirstRecurringCharacter
m
```

### EXAMPLE 4
This example create a custom object with Name and String properties, and pipes them to Get-FirstRecurringCharacter. It returns a space character, because that is the first recurring character in the String property. Checking the count of the returned characters confirms a character was returned:  
```PowerShell
$Example = [PSCustomObject]@{
    Name = 'Sample Text'
    String = 'The quick brown fox jumps over the lazy dog.'
}
$Example | Get-FirstRecurringCharacter
 
($Example | Get-FirstRecurringCharacter).Count
1
```

### EXAMPLE 5
This example results in a warning because the string does not contain any recurring characters:  
```PowerShell
Get-FirstRecurringCharacter -String 'Algeria' -WarningAction Continue
WARNING: The provided string does not contain recurring characters.
```
### NOTES
This function is case sensitive. The characters 'A' and 'a' are considered unique.