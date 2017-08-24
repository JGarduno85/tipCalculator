
# Pre-work - *Tip Calculator*

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Humberto Garduno**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [ x ] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [ x ] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough 

Here's a walkthrough of implemented user stories:


![alt text](https://github.com/gohu79/tipCalculator/blob/master/tipCalculatorp1.gif)
![alt text](https://github.com/gohu79/tipCalculator/blob/master/tipCalculatorp2.gif)
![alt text](https://github.com/gohu79/tipCalculator/blob/master/tipCalculatorp3.gif)


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** [It seems like a well and suitable platform. At the beggining a little confusing but once you get use to it's not that hard. Outlets are the conections to between the Views created in the xib and the code file, whereas Actions are conections between the actions a control can do and the code file. I think they are implemented using xml and then that is transformed into the UIControls and UIViews].

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** [a closure captures every variable that is declare out its scope and is used inside its scope. The self reference is the most common strong reference a closure does if an ivar or instance method is called].


## License

    Copyright [2017] [Humberto Garduno]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
