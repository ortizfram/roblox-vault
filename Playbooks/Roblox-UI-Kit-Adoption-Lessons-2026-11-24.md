---
title: "Roblox UI: adopting a third-party UI kit safely (Stud UI Clean case)"
updated: 2026-11-24
status: active_guidance
tags: [roblox, ui, ui-kit, assets, verification, method]
---

# Adopting a third-party UI kit safely — lessons from STOMPIES (2026-11-24)

1. **Clone to an isolated folder and audit before installing as a skill**: license, file types, network / purchase /
   DataStore / loadstring calls in the Luau, and that the instructions only talk about the task.
2. **Verify every asset id inside the target experience** with `ContentProvider:PreloadAsync` and its
   `AssetFetchStatus` callback (images and sounds). In STOMPIES 51 of 55 loaded; the 4 failures were the author's own
   uploads, including the stud tile texture that defines the style. Icons hosted on Roblox by others can also disappear.
3. **Replace what does not load with native Instances** (Frames + UICorner for studs) instead of uploading look-alikes;
   override the kit's builder functions in a small theme module, keep the kit files unmodified.
4. **Skin over an existing HUD without fighting its scripts**: park each old control inside a hidden Frame in its own
   ScreenGui (it keeps its Visible logic and screen position, is not drawn, takes no clicks) and show the new control
   exactly while the old one would be. Fire the old button's real action through a tiny client bus the old script
   registers on, instead of duplicating logic. `CanvasGroup` transparency does NOT hide children in ScreenGuis that use
   Global ZIndexBehavior.
5. **Prototype behind `RunService:IsStudio()`** with a key to flip old/new; real before/after captures come for free.
6. Kit windows that hide every other ScreenGui will be undone by any script that re-enables its own gui: only set
   `Enabled` from the toggle, never from a refresh function.
