# Xcode Project Info

This step will simply read version and build number from given `Info.plist` path,
then export those to **APP_VERSION** and **APP_BUILD** environment variables.

After this you can use these variables in other steps (ex. sending message on Slack).


## How to use this Step

You just need to set path to `Info.plist` file inside your project's directory,
in order for step to be able to read your project data and export it 
to environment variables which you can later use in other steps.