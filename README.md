# iOS Swift Project Template

Please make sure you are familiar with these ground rules:

- [Coding Style Guidline](Documents/coding-style-guideline.md)
- [Development Cycle](Documents/development-cycle.md)

# Initial Checklist

## .gitignore

By default, the `Carthage/` and `Pods/` folders are not tracked.

If you would like to start tracking those folders,
please delete the relevant lines in the `.gitignore` file.

## .swiftlint.yml

By default, `swiftlint` will run as a build step in your main target's Build Phases.

The configs are specified under the root directory of the repository in a hidden file called `.swiftlint.yml`

Feel free to modify the config as per project's or dev team's liking.
