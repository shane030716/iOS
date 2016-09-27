Updated system to Xcode 8 and Swift 3

Xcode converted code automatically from Swift 2 to Swift 3.
Most of the code was converted successully.
However, there are still some code that needs to be changed manually. 
Here are some notes about the Swift language conversion and Xcode issues:

### Labels for the first parameter of functions
The first parameter of each function must have labels unless specified otherwise. Basically in the previous versions, the function name usually includes the label for the first parameters, not in Swift 3 anymore. Examples:

  Swift 2:
  ```
  func callActionFor(url: NSURL) {
    //...
  }
  
  callActionFor(someURL)
  
  func refresh(sender: UIRefrenshControl) {
    //...
  }
  
  refresh(refreshControl)
  ```
  
  Swift 3:
  ```
  func callAction(for url: URL) {
    //...
  }
  
  callAction(for: someURL)
  
  func refresh(_ sender: UIRefreshControl) {
    //...
  }
  
  refresh(refreshControl)
  ```

### Provisioning Profile
Since I haven't touched my profile for awhile, the provisioning profile somehow became ineligible. Here are the steps.
* Go to [developer.apple.com](https://developer.apple.com)
* Account -> Login
* If applicable, Agree new agreements or ask the Team agent to do so
* Certificates, Identifiers & Profiles
* Provisioning Profiles at the bottom of the left menus
* Create new profiles for Development and/or Distribution
* Download the profile to your local
* Go back to Xcode
* Target -> General -> Signing (Both Debug and Release)
* From the Provisioning Profile Dropdown, select Import Profile
* Select the file that you downloaded above

### Error: command failed due to signal abort trap 6


