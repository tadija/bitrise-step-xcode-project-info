# Xcode Project Info
**[Bitrise](https://www.bitrise.io) step which extracts Xcode project info data to environment variables**

## Description

This step will simply read Xcode Project Info data from `Info.plist` file,
then export that data to environment variables prefixed with **XPI_**.

After this you can use these environment variables in other steps (ex. sending message on Slack).

## Outputs

Env Var | Description
------------ | -------------
`$XPI_VERSION` | Version (CFBundleShortVersionString from Info.plist)
`$XPI_BUILD` | Build (CFBundleVersion from Info.plist)

## How to use this Step

You just need to set relative path from Source directory to `Info.plist` file.
Source directory is considered to be root directory created by the Git Clone step.
If your `Info.plist` file is in **RootDir/ProjectName** directory (for example), 
then you should set this input to `ProjectName/Info.plist`.