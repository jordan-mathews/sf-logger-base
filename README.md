# sf-logger-Base

Lightweight package used for logging in Salesforce. Uses platform events and flows to save log events as SystemLog\_\_c records.

## Publishing log events

### Publish a single message with log lovel

```
Logger.getCurrent().publish('Test Error Message', LogLevel.ERROR);
```

### Add multiple events and then publish all at once.

```
Logger.getCurrent().add('Test Log Message 1', LogLevel.ERROR);
Logger.getCurrent().add('Test Log Message 2', LogLevel.ERROR);
Logger.getCurrent().add('Test Log Message 3', LogLevel.ERROR);
Logger.getCurrent().publish();
```

## Salesforce Development Setup

1. Install [npm](https://nodejs.org/en/download/)
1. Install [Salesforce DX CLI](https://developer.salesforce.com/tools/sfdxcli)
   - Alternative: `npm install sfdx-cli --global`
1. Clone this repository ([GitHub Desktop](https://desktop.github.com) is recommended for non-developers)
1. Run `npm install` from the project root folder
1. Install [VS Code](https://code.visualstudio.com) (recommended)
   - Install [Salesforce Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode)
   - **Install recommended plugins!** A notification should appear when opening VS Code. It will prompt you to install recommended plugins.
1. Install [AdoptOpenJDK](https://adoptopenjdk.net) (only version 8 or 11)
1. Open VS Code settings and search for `salesforcedx-vscode-apex`
1. Under `Java Home`, add the following:
   - macOS: `/Library/Java/JavaVirtualMachines/adoptopenjdk-[VERSION_NUMBER].jdk/Contents/Home`
   - Windows: `C:\\Program Files\\AdoptOpenJDK\\jdk-[VERSION_NUMBER]-hotspot`

## Build Project

To build the project locally using scratch orgs, follow these steps:

1. If you have not authenticated to a DevHub run `sfdx auth:web:login -d -a production` and then log in.
2. Create scratch org and push project source.

```
npm install
npm run mac:build
```

## Install project in Sandbox or Production

1. Authenticate to the environment that you would like to install the source to (it is recommended to always test in a sanbox first).
2. run the following command:

```
sfdx force:source:deploy -p force-app/main/default -l RunLocalTests
```
