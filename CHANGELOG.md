# Changelog

This file documents all the notable changes for each version of Jekyll Patternbot.
Jekyll Patternbot adheres to [Semantic Versioning](http://semver.org/).

---

## [0.21.0] — 2019-01-16

### Fixed

- Fixed the heading colours for patterns when their first pattern had a background.

---

## [0.20.0] — 2019-01-16

### Fixed

- Fix a bug in the grid display: it wasn’t putting the proper width fractions.

---

## [0.19.0] — 2019-01-16

### Fixed

- The “Utilities” section was showing when there was no theme file.

---

## [0.18.0] — 2019-01-16

### Changed

- Fonts now display default weights and styles, for situations where they are default system fonts.

### Fixed

- Fixed the font caching to only cache when downloading remote fonts, and only cache the weight information.
- Fixed the brand pattern display to hide & show “Colors” and “Typefaces” more reliably.
- Fixed the italic pattern to properly show the typeface’s italic style.

---

## [0.17.0] — 2019-01-16

### Fixed

- Added more checking for missing fonts and colours inside `theme.css`

---

## [0.16.0] — 2019-01-16

### Added

- Added the ability to output the `main.js` file to the bottom of all user patterns in the library.

### Fixed

- Prevented erroneous requests for the `theme.css` when it doesn’t exist.

---

## [0.15.0] — 2019-01-16

### Fixed

- Hide a few patterns that shouldn’t be shown in brand when the `theme.css` file is missing specific features.

---

## [0.14.0] — 2019-01-15

### Fixed

- Added the missing `vendor` libraries from within the `assets/_patternbot` folder that were accidentally ignored.

---

## [0.13.0] — 2019-01-15

### Fixed

- Fixed a bug with remotely installed Gems—it couldn’t find the version file.

---

## [0.12.0] — 2019-01-15

### Changed

- Transitioned from nested Gems to a single Gem that includes the theme & plugins.

### Fixed

- Fixed a bunch of bugs when different pattern library elements were missing.

---

## [0.11.0] — 2019-01-15

### Added

- Added support for pretty permalinks.
- Added internal pattern post processors to remove patterns when they aren’t included in the user’s code.
- Messages are displayed in console related to remote font URLs: whether a cached or remotely downloaded version was used.

### Changed

- Changed the default folder location for sample pages to have a hyphen instead of underscore.
- Patterns aren’t required to be listed in `config.patterns` any more, having just the `.html` file is enough.
- Renamed `FileHelpers` & `JekyllHelpers` to be not plural for consistency.
- Changed all my very un-Ruby `if not` statements into `unless` statements.

### Fixed

- Errors are now thrown, coloured, when Patternbot can’t find specific files.
- Fixed some errors when running `jekyll serve`

---

## [0.10.0] — 2019-01-12

### Added

- Added a whole bunch of error checking.
- Added cache busting to all the assets.
- Allow pattern field descriptions to show a list of classes.
- Allow pattern field descriptions to present a datasource for loading a Jekyll object.
- Added the ability to document utility classes inside `theme.css`
- Added back the type samples and cleaned up the typography pattern.
- Added the ability to configure icon colour variables within the SVG spritesheet.

### Changed

- Change all file & folder spelling to American for consistency.
- Allow the `main.css` `config.yml` filenames to be configurable.
- Changed “Page” to “Sample Page” for a little more clarity.
- Rewrote all the colour adjustment code to be much simpler.
- Now allows the placeholder graphics to be configured.

---

## [0.9.0] — 2019-01-10

### Added

- Initial public release: feature parity with Patternbot.app
