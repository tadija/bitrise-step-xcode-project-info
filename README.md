# Xcode Project Info
**[Bitrise](https://www.bitrise.io) step which extracts Xcode project information to environment variables**

## Description

This step will simply extract Xcode project information (Version and Build),
and export them into environment variables prefixed with **XPI_**.

Afterwards, you can use these environment variables in other steps (ie. sending message on Slack).

## Outputs

| Env Var        | Description                                                 |
| -------------- | ----------------------------------------------------------- |
| `$XPI_VERSION` | Version ($CFBundleShortVersionString or $MARKETING_VERSION) |
| `$XPI_BUILD`   | Build ($CFBundleVersion or $CURRENT_PROJECT_VERSION)        |

## How to use this Step

You just need to set relative path from Source directory to `Info.plist` file.
Source directory is considered to be root directory created by the Git Clone step.
If your `Info.plist` file is in **RootDir/ProjectName** directory (for example), 
then you should set this input to `ProjectName/Info.plist`.

For Xcode 11 projects, you will need to set the relative path from source directory to the `.xcodeproj` directory.
Additionally, you can specify which target you want to get the version & build numbers for.
If actual values are set in Info.plist, they will be used instead of the values from the xcodeproj. This means it won't break if you set a build number within your workflow for instance.