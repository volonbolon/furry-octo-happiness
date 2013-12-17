#Accessibility
VoiceOver is an application run by the OS that, when turned on, intercepts all touches and gestures. `UIAccessibility` ask the the app to gather information about the particular element, and the information is send back to VoiceOver. VoiceOver synthesize the received text, or push it to any other pre-defined output (like special keyboards for blinds). 

With UIKit is quite simple, and most of the time, is almost free. `UIAccessibility` will use special attributes (defined in the informal protocol `UIAccessibility`). The two most important attributes are: 

* `isAccessibilityElement`: returns `YES` by default in all UIKit  controls. If the value returned is `NO`, Voice Over will not be able to see it. 
* `accessibilityLabel`: an `NSString` that briefly describe the element. Ideally just one word. For UIKit controls, the OS tries to gather meaningful information from the context to use as default value. For instance, `UIImage` value is going to be defaulted to the file name, and `UILabel` to the text. 

The protocol also define a few more attributes: 
* `accessibilityHint`: an `NSString` that further describe the element, or give users a `hint` on how to activate the control. Is used by VoiceOver to provide context
* `accessibilityTraits`: is a flag that describe a set of traits that characterize how a control behaves or should be treated.

##Accessibility Notifications
Most of the times, all you need is to configure the accessibility attributes. But sometimes, you also need to inform changes on the status of a view or a control. For that, we need to post notifications to let VoiceOver knows about the changes. The VoiceOver notifications use a special circuit, i.e., you should not use `NSNotificationCenter`, but the function `UIAccessibilityPostNotification` (and yes, it is a function). The function takes as a first parameter the kind of notification that you want to broadcast. The second parameter is the element we want voice over to focus. 

But we might also want to hear back from VoiceOver, for instance. In that case, the notifications are broadcasted trough NSNotificationCenter. To known when VoiceOver is done with the announcement, we need to listed for `UIAccessibilityAnnouncementDidFinishNotification` and then look at the user info of the notification. 

## No UIKit
UIKit makes almost too easy to implement accessibility. But what happens if you need to customize UIKit even further, perhaps drawing things with `-drawRect:` or OpenGL? First, we need to produce an array of UIAccessibilityElement. We define as an accessibility element any distinct object that we want to present in the screen. 

`UIAccesibilityElement`s are created with `-initWithAccessibilityContainer:`, and the container is the view that going to do the actual drawing. The Accessibility Element, obviously, can be configured with accessibility labels, hints, and traits. 

The [`UIAccessibilityContainer`](https://developer.apple.com/library/ios/documentation/uikit/reference/UIAccessibilityContainer_Protocol/Introduction/Introduction.html) informal protocol let `UIView`s instance expose the accessibility elements they contains. The protocol is composed by three methods:  

	– accessibilityElementCount
	– accessibilityElementAtIndex:
	– indexOfAccessibilityElement:
 
Since `UIAccessibilityElement`s are abstract, in the sense they are not the actual element to be draw to the screen, but meta-data to be attached to the elements, we need a mechanism to let VoiceOver knows where the elements are going to be presented. The element coordinates needs to be presented in **screen coordinates**. UIKit has the helper methods `-convertRect:toView:` to get the coordinates in the container view frame, and `convertRect:toWindow:` to easily do the job. 

#Demo App
The first view controller is simply a view controller with three buttons. The first is no customized. The second is customized in IB, the third in code. 
Then we have a table view where the labels accesibility parameter has been customized in code. 
The third tab is a simple Core Text based view that expose the string draw as the accessibility label. 
The fourth is also a custom view, but this time we are using `UIAccessibilityContainer` to let VoiceOver knows where to find accesibility elements. 

Further readings: 
* [UIAccessibility](http://nshipster.com/uiaccessibility/) 