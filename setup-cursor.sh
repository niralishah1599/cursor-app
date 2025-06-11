#!/bin/bash

APPIMAGE="$HOME/cursor-app/Cursor-0.50.5-x86_64.AppImage" #Add your cursor app image link
LAUNCHER_SCRIPT="$HOME/.local/bin/run-cursor.sh"
DESKTOP_FILE="$HOME/.local/share/applications/cursor.desktop"
ICON_SRC="$HOME/cursor-app/cursor-icon.png"
ICON_DEST="/usr/share/icons/hicolor/48x48/apps/cursor-icon.png"

# Step 1: Make AppImage executable
chmod +x "$APPIMAGE"

# Step 2: Create launcher script
mkdir -p "$HOME/.local/bin"
cat > "$LAUNCHER_SCRIPT" <<EOL
#!/bin/bash
"$APPIMAGE" --no-sandbox
EOL
chmod +x "$LAUNCHER_SCRIPT"

# Step 3: Copy icon to system icon folder (requires sudo)
sudo cp "$ICON_SRC" "$ICON_DEST"

# Step 4: Update icon cache (requires sudo)
sudo gtk-update-icon-cache /usr/share/icons/hicolor/ -f -t

# Step 5: Create .desktop file
mkdir -p "$(dirname "$DESKTOP_FILE")"
cat > "$DESKTOP_FILE" <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=Cursor
Exec=$LAUNCHER_SCRIPT
Icon=cursor-icon
Terminal=false
Categories=Development;
EOL
chmod +x "$DESKTOP_FILE"

# Step 6: Update desktop database
update-desktop-database ~/.local/share/applications/

echo "Setup complete! Please log out and log back in, or reboot your PC."

