# Changelog

This file documents all the notable changes for each version of Jekyll Patternbot.
Jekyll Patternbot adheres to [Semantic Versioning](http://semver.org/).

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
