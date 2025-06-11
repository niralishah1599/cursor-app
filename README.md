# 🧠 Cursor AI Native App Setup on Ubuntu

This guide helps you turn the Cursor AI `.AppImage` into a fully integrated native-like app on Ubuntu (GNOME-based distros). No Docker or terminal launch required after setup.

---

## 📦 Requirements

* Ubuntu 20.04 or later (GNOME desktop)
* Cursor AppImage file (download manually)

---

## 🔽 0. Download the Cursor AppImage

The Cursor AppImage is too large to be hosted on GitHub. Please download it manually from this official link:

👉 [Download Cursor AppImage](https://www.cursor.com/downloads)

Once downloaded, move it to a folder such as:

```bash
~/cursor-app/
```

---

## 🚀 Setup Steps

### 1. 📁 Place Files

Put the Cursor AppImage (e.g. `Cursor-0.50.5-x86_64.AppImage`) and this `set-up.sh` script into a folder like:

```bash
~/cursor-app/
```

### 2. 🧰 Run Setup Script

Make the setup script executable and run it:

```bash
chmod +x ~/cursor-app/set-up.sh
~/cursor-app/set-up.sh
```

### 3. ✅ What It Does

The script:

* Makes the AppImage executable
* Creates a launcher script with `--no-sandbox`
* Creates a `.desktop` entry to appear in the GNOME app grid
* Assigns a custom icon if available (`cursor-icon.png`)
* Refreshes the desktop application cache

### 4. 🖼 Icon (Optional)

Add a PNG icon at:

```
~/.local/share/icons/cursor-icon.png
```

Use this path in the script or `.desktop` file to change the launcher icon.

### 5. 📂 File Paths Used

* AppImage: `~/cursor-app/Cursor-0.50.5-x86_64.AppImage` #Add your downloaded file.
* Launcher Script: `~/.local/bin/run-cursor.sh`
* Desktop Entry: `~/.local/share/applications/cursor.desktop`

---

## 🧪 Test It

After setup:

* Search for "Cursor" in the launcher
* Click it — it should open like a native app
* Optionally: Right-click > "Add to Favorites"

---

## 🧼 Uninstall

Delete these files:

```bash
rm ~/.local/bin/run-cursor.sh
rm ~/.local/share/applications/cursor.desktop
```

---

## 🙌 Credits

Inspired by the need to make Cursor AI feel like a real Linux app. Clean, launchable, and native.

Feel free to fork or contribute!
