# Triangle Companion

A small Windows app that lets Triangle on your phone use this PC: shared folders, and, if you switch them on, screenshots, mouse and keyboard, the clipboard and PowerShell. It's an MCP server, so Triangle connects through its existing **MCP & Skills** settings.

## How it connects

You choose one of two modes at the top of the window.

### Home Wi-Fi (nothing extra to install)

```
Phone: Triangle ──plain http on your Wi-Fi──▶ companion on 0.0.0.0:8765  /mcp
                  http://192.168.x.x:8765/mcp/<token>
```

- This mode only works when the phone is on the same Wi-Fi as the PC. Triangle allows plain `http://` only for home-network addresses (192.168.x, 10.x, 172.16–31.x), so it can't work from outside your home.
- The companion only answers requests from those home-network addresses, and every request still needs the token.
- The traffic isn't encrypted. Someone on the same Wi-Fi who watches the traffic could see the token and your files, so use this mode only on your own network.
- Windows Firewall may block the phone. Click **Allow** next to Windows Firewall, which needs admin rights, and make sure your Wi-Fi is set to **Private** in Windows.

### Tailscale (from anywhere, encrypted)

```
Phone: Triangle ──HTTPS over Tailscale──▶ tailscale serve (https://<pc>.<tailnet>.ts.net)
                                              │
                                              ▼
                                  companion on 127.0.0.1:8765  /mcp
```

- The companion only listens on `127.0.0.1`. Nothing on your Wi-Fi or the internet can reach it.
- `tailscale serve` gives it an HTTPS address with a real certificate, and only devices on your tailnet can reach that address. (Triangle refuses plain `http://` to Tailscale's 100.x addresses, which is why it needs HTTPS.)
- Every request needs the secret token, either in the address (`/mcp/<token>`) or as `Authorization: Bearer <token>`.
- You can also make it answer only requests that Tailscale says come from your own login.

## Setup with home Wi-Fi

1. Run Triangle Companion and pick **Home Wi-Fi** at the top.
2. If Windows asks whether to allow network access, allow it on **private** networks. If you missed that prompt, click **Allow** next to Windows Firewall.
3. Share folders and pair the same way as in step 4 and 5 below. The address looks like `http://192.168.1.20:8765/mcp/<token>`.

## Setup with Tailscale

1. Install Tailscale on the PC and the phone, and sign in to the same account on both.
2. In the Tailscale admin console, go to **DNS**. Make sure **MagicDNS** is on, then turn on **HTTPS Certificates**.
3. Run Triangle Companion. It publishes itself with `tailscale serve` (or click **Publish**).
4. Under **Shared folders**, click **Add** and choose the folders the phone may see. Turn on **Can change** for any folder it may also edit.
5. In Triangle, go to **Settings → MCP & Skills → MCP servers → Add by address**. Name it `pc` and paste the address. To copy the address on the phone, scan the QR code with your camera or Google Lens.

Closing the window keeps the companion running in the system tray. To stop it completely, right-click the tray icon and choose **Quit**.

## Live screen in Triangle

Open the drawer in Triangle and choose **PC screen**, or open the companion's server in **MCP & Skills** and tap **Open PC screen**.

- The view streams the screen as JPEG frames over a WebSocket (`/live`), not over MCP. The PC sends a new frame only after the phone has shown the last one (at most two in flight), so it never builds a backlog. A screen that hasn't changed isn't sent again.
- Frames are captured and scaled by Windows and encoded by GDI+ in a background thread. On this PC that takes about 30 ms for a 1280-wide frame, so up to ~30 fps, at about 85 KB per frame. Choose Fast, Balanced or Sharp in the top bar.
- Touch controls:
  - **Tap:** click. Two quick taps: double-click.
  - **Long-press:** right-click. Long-press and then move: drag.
  - **One finger:** scroll.
  - **Two fingers:** zoom and pan.
- The keyboard button types on the PC as you type, and has a row of keys such as Esc, Tab, arrows, Win, Alt+Tab, Copy, Paste and Alt+F4.
- Watching needs **See the screen**, and using the mouse and keyboard needs **Control mouse & keyboard**. The live view is you, not the assistant, so it doesn't ask on the PC. While someone is watching, the PC shows "Triangle is watching live" and the Connection tab has **End live view**.

## Tools

| Group | Tools | Needs |
|---|---|---|
| Read | `pc_info`, `list_folder`, `search_files`, `read_file`, `file_info`, `share_file` | a shared folder (`pc_info` is always available) |
| Modify | `write_file`, `make_folder`, `move`, `copy`, `download_to_pc` | a folder with **Can change** on |
| Destructive | `delete` (moves to the Recycle Bin) | a folder with **Can change** on |
| Read | `screenshot` | **See the screen** |
| Modify | `mouse_click`, `mouse_move`, `mouse_path` (continuous movement through up to 1000 points in one call, optionally holding a button), `mouse_drag`, `scroll`, `type_text`, `press_keys`, `open` | **Control mouse & keyboard** |
| Read / Modify | `read_clipboard` / `write_clipboard` | **Clipboard** |
| Destructive / Read | `run_command` / `command_status` | **Run commands** |
| Read | `read_window` (a window's buttons, fields and links as numbered elements) | **See the screen** |
| Modify | `click_element`, `type_into`, `do_actions` (up to 200 steps in one call, optionally with a screenshot at the end) | **Control mouse & keyboard** |
| Read | `list_windows`, `system_status`, `list_processes` | **Apps & system** |
| Modify | `window` (focus, minimize, maximize, restore, move, close), `media_control`, `lock_pc` | **Apps & system** |
| Destructive | `kill_process`, `power` (sleep, restart, shut down, sign out, cancel) | **Apps & system** |

Triangle only sees the tools whose switches are on. With **Ask on this PC before changes** on (the default), every Modify or Destructive call shows Allow or Deny on the PC. If nobody answers in 25 seconds, the call is denied. (Triangle gives each call 45 seconds in total.)

Big files and screenshots aren't sent inside tool answers. Instead, the tool returns a private link that expires after a few minutes (`/files/<random id>/name`). Triangle's `download_file` tool can fetch the link, and its `view_image` tool can open a screenshot link.

`screenshot` can capture one monitor or one window. `read_window` with `click_element` is usually faster and more exact than working from screenshots, because the assistant gets the real buttons and fields with their names.

The window has three tabs: **Connection** (who's connected, the network mode, pairing), **Access** (shared folders and switches) and **Activity**. The top bar shows whether Triangle is connected, and so does the tray icon's tooltip.

Every call is shown under **Activity** and written to `activity.log` in `%APPDATA%\com.triangle\triangle_companion\`.

## Develop

```bash
flutter test
flutter run -d windows
flutter build windows --release   # build\windows\x64\runner\Release\triangle_companion.exe
```

`omni_test/` runs the server against `omni_ai`'s MCP client, which is the client Triangle uses. It is its own package because `omni_ai` brings in Triangle's audio plugins, which the companion's Windows build should not compile. Run `flutter test` inside that folder.
