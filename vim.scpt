#osascript ~/.iterm2/scripts/vim.scpt @@\1 @@\2
on run args
  if (count of args) > 0 then
    tell application "System Events"
      set runs to false
      try
        set p to application process "iTerm 2"
        set runs to true
      end try
    end tell
    set newArgs to ""
    repeat with param in args
      if param contains "@@"
        set newArgs to (newArgs & param)
      else
        set newArgs to (newArgs & " "& param)
      end if
    end repeat
    set newArgs to theSplit(newArgs, "@@")
    set newArgs to (rest of newArgs)

    set args to newArgs
    set filename to (first item of args)
    set info to (info for filename)
    set filename to replace_chars(filename, " ", "\\ ")

    if ((count of args) >= 2) then
      set num to (second item of args)
      if (num is equal to "")
        set num to "+0"
      end if
    else
      set num to "+0"
    end if
    tell application "iTerm 2"
      activate
      if (count of window) = 0 then
        create window with default profile
      end if
      tell last window
        select
      end tell
      tell current window
        set oldTab to current tab
        set newTab to (create tab with default profile)
        tell current session
          if (info is not equal to missing value) then
              set info to info's default application
              if (info is not equal to missing value) then
                set info to (info as text)
              end if
            end if
          if (info contains "iTunes.app") then
            write text "open " & filename
          else if (info contains "Player.app") then
            write text "open " & filename
          else
            if (num does not contain "+") then
              set num to ("+" & num)
            end if
            write text "vim " & filename & " " & num
          end if
        end tell
        tell oldTab
          select
        end tell
      end tell
    end tell
  end if
end run

on replace_chars(this_text, search_string, replacement_string)
  set AppleScript's text item delimiters to the search_string
  set the item_list to every text item of this_text
  set AppleScript's text item delimiters to the replacement_string
  set this_text to the item_list as string
  set AppleScript's text item delimiters to ""
  return this_text
end replace_chars

on theSplit(theString, theDelimiter)
  -- save delimiters to restore old settings
  set oldDelimiters to AppleScript's text item delimiters
  -- set delimiters to delimiter to be used
  set AppleScript's text item delimiters to theDelimiter
  -- create the array
  set theArray to every text item of theString
  -- restore the old setting
  set AppleScript's text item delimiters to oldDelimiters
  -- return the result
  return theArray
end theSplit
