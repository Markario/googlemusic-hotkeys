-- Open new window to google play music
on openWindow()
  tell application "Google Chrome"
    activate
    set newWin to make new window
    tell active tab of newWin to set URL to "http://play.google.com/music"
  end tell
end openWindow

-- Does action to google play music window.
-- Returns true if google play music window is open, false otherwise
on sendAction(action)
  tell application "Google Chrome"
    -- Pause the track
    repeat with w in (every window)
      repeat with t in (every tab whose URL contains "play.google.com/music") of w
		  
		if action = "prevSong" then
        		tell t to execute javascript "(document.querySelectorAll(\"*[data-id='rewind']\")[0]).click();"
		end if
		
		if action = "playPause" then
        		tell t to execute javascript "(document.querySelectorAll(\"*[data-id='play-pause']\")[0]).click();"
		end if
		
		if action = "nextSong" then
        		tell t to execute javascript "(document.querySelectorAll(\"*[data-id='forward']\")[0]).click();"
		end if
		
		if action = "like" then
        		tell t to execute javascript "document.querySelectorAll(\"*[title='Thumb-up']\")[0].click();"
		end if
		
		if action = "dislike" then
        		tell t to execute javascript "document.querySelectorAll(\"*[title='Thumb-down']\")[0].click();"
		end if
		
        return true
      end repeat
    end repeat
  end tell
  return false
end sendAction

on run
  if sendAction("{query}") is false and "{query}" is "playPause" then
    openWindow()
  end if
end run
