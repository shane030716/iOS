Updated system to Xcode 8 and Swift 3

Xcode converted code automatically from Swift 2 to Swift 3.
Most of the code was converted successully.
However, there are still some code that needs to be changed manually. 
Here are some notes:

* The first parameter of each function must have labels unless specified otherwise. Basically in the previous versions, the function name usually includes the label for the first parameters, not in Swift 3 anymore.
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
  
