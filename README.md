![version](https://img.shields.io/badge/version-21.3%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_4DWP_ImageInAbsolutePosition

Positioning a picture at an absolute location inside a **4D Write Pro** area -- anchor layout (behind/in front of text), anchor origin (paper/header/footer box), horizontal/vertical alignment, and pixel offsets, with the image draggable live in the document. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v16 R6**; converted from the binary `.4DB` to the `.4DProject` architecture so it runs on current 4D releases.

- **Blog post:** [Images in absolute position in 4D Write Pro](https://blog.4d.com/images-in-absolute-position-in-4d-write-pro/)

## What it demonstrates

- Importing a `.4wp` sample document into a 4D Write Pro area with `WP Import document`, and inserting a new picture at the current selection with `WP Add picture`.
- Reading an image's anchor attributes with `WP Get attributes` -- anchor layout, anchor origin, horizontal align, vertical align, horizontal offset, vertical offset -- and reflecting them onto a set of dropdown controls.
- Writing those same attributes back onto the selected image with `WP SET ATTRIBUTES` whenever a dropdown or offset field changes.
- Detecting whether the current 4D Write Pro selection is an image (`wk type image`) on `On Selection Change`, and tracking a picture being dragged live via `On Mouse Move`.
- Re-selecting a range with `WP SELECT` and restoring focus with `GOTO OBJECT` after a programmatic attribute change, so the image stays visible and selected.
- Reordering image layering with the standard actions `moveToBack` / `moveToFront`.
- Exporting the edited document with `WP EXPORT DOCUMENT`.

## Key commands

| Command | Used for |
|---|---|
| `WP Import document` / `WP EXPORT DOCUMENT` | Loading and saving the 4D Write Pro document shown in the demo |
| `WP Add picture` | Inserting a picture into the 4D Write Pro area at the current selection |
| `WP Selection range` | Getting the current text/image range selected in the 4D Write Pro area |
| `WP Get attributes` / `WP SET ATTRIBUTES` | Reading and writing an image's anchor layout, origin, alignment, and offset attributes |
| `WP SELECT` | Re-selecting a range so the image stays selected after a programmatic change |
| `GOTO OBJECT` | Restoring focus/scroll position in the 4D Write Pro area |

## How it works

`00_Start` opens the `HDI` splash window; its `BtnDemo` button opens `HDI2`, the demo form. On `On Load`, `HDI2/method.4dm` calls `initHDI` (loads the `[Samples]` table's `Title`/`Text` fields into the `TabControl` / `TextTabControl` arrays that label and describe each tab), imports a sample `.4wp` document into the `vDoc` 4D Write Pro area, and hides the picture-editing controls until a page past the introduction is shown. `On Page Change` swaps the visible description text and repositions the `WriteProArea` object depending on which page is active.

`WriteProArea`'s own object method reacts to `On Selection Change` to detect whether the current selection is an image, and to `On Mouse Move` to keep the offset fields live while a picture is being dragged. When an image is selected, `SetAttribute` (a project method, called as a subroutine) reads its four anchor attributes and drives four dropdown lists to match: `listLayer2` (behind/in front of text), `listOrigin2` (paper/header/footer box), `listHor2` / `listVert2` (left/center/right, top/center/bottom). Changing any of those dropdowns writes the corresponding attribute back with `WP SET ATTRIBUTES`; changing `varHorizontalOffset` / `varVerticalOffset` writes the offset and then calls `WP SELECT` + `GOTO OBJECT` to keep the image in view. `ButtonAddPicture` inserts a new picture at the current selection; `ButtonDocument` exports the current document; the `3D Button` / `3D Button1` pair reorders layering via the standard `moveToBack` / `moveToFront` actions.

## Points of interest

- The four anchor attributes are two independent axes that combine: an image anchored to the "header box" can still be aligned left/center/right independently of whether it's laid out behind or in front of text.
- `On Mouse Move` is used alongside `On Selection Change` so the offset fields track a picture being dragged live, not just after the drag completes.
- The picture-editing controls are deliberately hidden until page 2+, since page 1 is an introduction page with no 4D Write Pro area to manipulate.
- `SetAttribute` is a plain project method (not an object method), called only as a subroutine from `WriteProArea`'s object method and marked `invisible` so it doesn't clutter the Run Method dialog.

## Modernisation notes

Converted from the original binary `.4DB` to a 4D project, then modernised end-to-end with GitHub Copilot.

| Branch | Description | Guidance |
|--------|-------------|----------|
| [`miyako-create-worktree`](../../tree/miyako-create-worktree) | Full modernisation on top of `main`: method visibility, XLIFF localisation, `var`/`#DECLARE` syntax, standard menu actions, a rebuilt startup dialog (window reuse, `CALL WORKER`, `BtnDemo` object method), dark mode/Liquid Glass CSS, and a listbox-defaults audit (none present). Along the way, fixed two pre-existing bugs: a duplicate process-variable redeclaration and a `TabControl` array/scalar name collision. | [`4dmethods`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dmethods), [`4dlocalise`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dlocalise), [`4dmodernise`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dmodernise), [`4dproject`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dproject), [`4dstartup`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dstartup), [hdi.startup.instructions.md](.github/instructions/hdi.startup.instructions.md), [`4dcss`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dcss), [`4dform`](https://github.com/miyako/skills/tree/main/4d-skills/skills/4dform) |

## References

- [4D blog: Images in absolute position in 4D Write Pro](https://blog.4d.com/images-in-absolute-position-in-4d-write-pro/)
- [4D documentation: WP Get attributes](https://developer.4d.com/docs/WritePro/commands/wp-get-attributes) / [WP SET ATTRIBUTES](https://developer.4d.com/docs/WritePro/commands/wp-set-attributes)
- [4D documentation: WP Add picture](https://developer.4d.com/docs/WritePro/commands/wp-add-picture)
- [4D documentation: WP Selection range](https://developer.4d.com/docs/WritePro/commands/wp-selection-range) / [WP SELECT](https://developer.4d.com/docs/WritePro/commands/wp-select)
- [4D documentation: WP Import document](https://developer.4d.com/docs/WritePro/commands/wp-import-document) / [WP EXPORT DOCUMENT](https://developer.4d.com/docs/WritePro/commands/wp-export-document)
- Original download: [HDI_4DWP_ImageInAbsolutePosition.zip](https://download.4d.com/Demos/4D_v16_R6/HDI_4DWP_ImageInAbsolutePosition.zip)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)
