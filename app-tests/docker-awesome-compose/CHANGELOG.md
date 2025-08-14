# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.4] - 2025-08-14

### Fixed

- Fixed a bug where the post view counter was not incrementing correctly due to an issue with `Rails.cache.increment`. The implementation was changed to a manual read-modify-write approach.

### Added

- Added `doc/TROUBLESHOOTING.md` with instructions on how to troubleshoot Rails cache issues.

### Changed

- Updated `README.md` with information about the view counter feature.

## [0.0.3] - 2025-08-13

### Added

- Implemented a Redis-powered page view counter for posts.
- Display individual and total view counts on the posts index page.
- Added `just` commands to manage and inspect Redis.

### Changed

- Configured the Rails application to use Redis for caching.

## [0.2.0] - 2025-08-13

### Added

- Created `_header.html.erb` and `_footer.html.erb` partials.
- Added a flashy title to the header.
- Increased the font size of the post title.

### Changed

- Refactored `application.html.erb` to use the new partials.