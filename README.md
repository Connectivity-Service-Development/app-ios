# app-ios

## How to run
1. Let Xcode resolve dependencies
2. Update provisioning (currently set to automatic, so change development team and `bundleId`)
3. Run target `Skoda Practical Evaluation` on desired run destination

## Dependencies
App uses SPM to manage 3rd party dependencies  
There is only one dependency: **swinject**

## App architecture overview
- App is built using Clean Architecture
- SwiftUI is used to create UI
- Swinject library is used for dependency injection


### Components diagram
![Untitled Diagram](https://github.com/user-attachments/assets/2ae04e6d-7429-4828-81cc-4f96aa4147ba)
