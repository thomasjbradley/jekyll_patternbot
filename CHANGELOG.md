# Changelog

This file documents all the notable changes for each version of Jekyll Patternbot.
Jekyll Patternbot adheres to [Semantic Versioning](http://semver.org/).

---

##[1.4.2] — 2019-02-11

### Fixed

- Reverted a bad change in the code when fixing the UTF-8 problem.

---

## [1.4.1] — 2019-02-11

### Fixed

- Fixed a very unusual bug when creating slugs: it wasn’t interpreting them as UTF-8.

---

## [1.4.0] — 2019-02-08

### Added

- The sidebar/navigation colour can now be customized separately from the main background colour.
- Add the ability to categorize `@utility` & `@var` in CSS comments using the plus syntax: `+category`

### Fixed

- Fixed a bug where non-standard font-weights weren’t showing properly in the typeface list.
- Fixed a bug where non-string type values in examples were getting quoted in the include, causing them to not be passed as the correct data type.

---

## [1.3.0] — 2019-01-29

### Added

- Added a quaternary level of colours, per user suggestion, for helping with colour-matched groupings.

---

## [1.2.0] — 2019-01-28

### Added

- Added a comment denoting where user’s pattern code start & ends.
- Add the ability to label a tertiary colour & typeface.

### Changed

- Removed some CSS injection via JavaScript and just wrote it right into the layouts.
- The pattern `width` property is now a `max-width` inside the pattern itself: makes for better media query testing.
- Cleaned up the whitespace in pattern output files.
- Patterns & sample pages are now listed in alphabetical order in the navigation.

### Fixed

- Fixed a bug where list bullets were being displayed because of user CSS.
- Fixed a bug where internal patterns relied on specific Modulifier features, but user modules didn’t include the feature.
- Made the filename output more reliable with different permalink settings.

### Removed

- Removed the “Show all” button. It was useful previously but I found lots of students don’t really use it properly and it’s a poor user experience.

---

## [1.1.2] — 2019-01-28

### Fixed

- User JS files were included using a `<link>` tag instead of a script tag.

---

## [1.1.1] — 2019-01-28

### Fixed

- The `font_url` was not being loaded into user patterns.

---

## [1.1.0] — 2019-01-26

### Added

- Added class lists for all the Web Dev Tool systems: Gridifier, Typografier & Modulifier.
- Added icons sizes lists for the icons & a code sample of using icons.
- Added the ability specify a code sample form within `config.yml` instead of outputting the pattern include.

### Fixed

- Fix the class names for some of the vertical spacing classes: they didn’t match real Typografier class names.
- Fixed a bug when `<h2>` tags were targetted, the font family in the font display changed incorrectly.
- A pluralization typo in the ModulesProcessor caused a few modules to not display.
- Bold fonts weren’t showing the the typefaces section when there was no `font_url` or it was a browser-safe font.
- Added missing space above `<hr>` that separates the different typefaces.
- Added a cleaner error message when `theme: jekyll_patternbot` wasn’t specified inside the user’s `_config.yml` file.

---

## [1.0.3] — 2019-01-19

### Fixed

- Fixed a bug where errors were displayed when the Web Dev Tool CSS files existed but were empty.

---

## [1.0.2] — 2019-01-16

### Fixed

- Re-add font URL cache messages to see if the Netlify build works.

---

## [1.0.1] — 2019-01-16

### Fixed

- Attempting to fix a build error on Netlify.

---

## [1.0.0] — 2019-01-16

### Added

- Added the ability to document utility variables within the `theme.css` file.
- Added the ability to document layouts within the pattern library.

### Changed

- Fixed the dependency versions to specific numbers.

### Fixed

- The Logger now outputs to `STDOUT` by default instead of `STDERR`
- When a field data type isn’t specified, a empty dash is output.
- Prevented the pattern description from being repeated.
- Fixed a responsive layout but in the utilities table on small screens.

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
