# Add files to the below path
~/.config/nvim/init.lua


# Edit this file to reduce Titlebar height of Gnome-Terminal 
### /home/jeong/.config/gtk-3.0


.titlebar {
  min-height: 0px;
  padding: 1px;
}

.titlebar button {
  padding: 1px;
  min-height: 0px;
}

#TerminalWindow .notebook-tab {
    min-height: 10px; /* Adjust the height as needed */
}



# Git commands
### Check remote repository
git remote -v
### Add remote repository
git remote add origin <remote-repository-url>
