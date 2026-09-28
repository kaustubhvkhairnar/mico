# Mico Architecture

## Goal

Mico maps a calibrated 2D workspace around a MacBook to user-defined zones. Each zone owns a trigger configuration and an action.

## Layers

```text
SwiftUI App
├── Workspace UI
│   ├── Desk canvas
│   ├── Zone editor
│   ├── Action picker
│   └── Profile manager
│
├── Domain
│   ├── Workspace
│   ├── Zone
│   ├── Trigger
│   ├── Action
│   └── Profile
│
├── Services
│   ├── ActionExecutor
│   ├── ProfileStore
│   ├── PermissionManager
│   └── CalibrationService
│
└── Spatial layer
    ├── Screen/workspace coordinate mapping
    ├── Camera input (future)
    └── MacBook/desk detection (future)
```

## Domain model

### Zone

A zone contains:

- stable identifier
- name
- normalized rectangle in workspace coordinates
- trigger type
- action identifier
- action configuration
- enabled state

Normalized coordinates keep saved layouts independent of window size.

### Action

Actions should be represented as data, not hard-coded into the UI. Initial action families:

- Open application
- Open URL
- Open file/folder
- Keyboard shortcut
- Run Shortcut
- Run shell command
- Copy text
- Speak text
- Play/pause media
- Screenshot
- Capture selection
- Visual indicator

## Safety model

Shell commands and automation actions are powerful. Mico should show the exact command/action configuration before enabling it and avoid silently executing untrusted content.

## Spatial strategy

The first MVP should work without computer vision: users can manually calibrate the MacBook rectangle and create zones in the workspace canvas. A later spatial prototype can use camera input to estimate the MacBook/desk geometry and update the coordinate transform.

This keeps the product useful while the harder vision problem is developed independently.
