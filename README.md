Original App Design Project - README Template
===

# Search n' Learn

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app oriented towards kids learning about the outdoors. This application displays the proposed animal/species/insect in the local area of a user-inputted address/location, based on data collected by a series of API. It also provides educational information in a collection view of various animals in the United States.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Educational
- **Mobile:** This application would primarily be presented as a mobile application, as it is meant to be transportable with the user to identify different native species in visited areas (such as on hikes). It may offer limited functionality as a web application for users who want to educate themselves or others on hikes or trips ahead of time or for recreational interests.
- **Story:** This application analyzes a user's location and offers a detailed view of information of the animals native to that area. They can then store that information in their profiles or share it with friends. Users can also recreationally go and learn about the top 100 most frequent animals in the United States!
- **Market:** Targeting young learners interested in the environment and animals.
- **Habit:** App can be used as often as they would like. It would depend on how often they would like to identify some local species.
- **Scope:** We would first start by using location based data to provide animals that are in the user's area. The app would also offer an opportunity for anyone to learn about specific animals as well by selecting from a collection view.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* [x] App shows a logo on launch
* [x] User can create an account and log in
* [ ] A location based map view, with ability to input a location
* [ ] Pictures with fun facts of local animals displayed for users to read up on
* [ ] Personalized profile page for user - profile pic, saved searches, and name.


**Optional Nice-to-have Stories**

* Saved list of animals in a collection
* Fun quiz on animal user just looked at information for
* Multiple tab views for switching between searching, learning, and saved information.
* Ability to keep track of animals seen and add personal pictures of animals seen

### 2. Screen Archetypes
* Launch Screen w/ Logo
* Login Screen - user signs up or logs into their account
* Main Map Screen
   * Has address bar
   * Showcases a Google Maps map and drops a waypoint for the inputted/chosen address put in the address bar
   * Has three navigation tabs on the bottom (Search, Learn, and Profile)
 * Settings Screen
   * Allows user to change language and application notification settings
   * Allows user to change region for showcasing the top 100 animals
* Profile Screen
  * User able to change profile picture
  * User able to see their saved list of animals + photos
  * User able to change their name and input their favorite hike location and favorite animal they've seen
* Learning Screen
  * Showcases a selection of the top 100 animals in a specific continent
* Detailed View of Animals
  * Each animal would have a detailed view when a user clicks on its' collection view portrait to display information about name, habitat, and other fun facts about the animal.  
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Search (main screen)
* Learn (collection view of top 100 animals in a region)
* Profile (profile picture, saved animals / pictures, favorite animal/hiking location)

**Flow Navigation** (Screen to Screen)

* Launch screen:
  * Login screen
    * sign up confirmation 
    * main map screen (search tab selected here)
    
      * learn tab
        * learn screen
          * detailed view screen of specific animal
          
      * profile tab
        * profile picture screen
        * saved pictures gallery screen
       
       * settings button top right corner
        * settings screen (language / region settings)

## Wireframes
[Add picture of your hand sketched wireframes in this section]
We did all of our wireframes in Figma.
<img src="https://hosting.photobucket.com/images/i/tmcnutt22/Screen_Shot_2021-11-01_at_7.35.37_PM.png" width=600>

### [BONUS] Digital Wireframes & Mockups
<img src="https://hosting.photobucket.com/images/i/tmcnutt22/Screen_Shot_2021-11-01_at_7.35.37_PM.png" width=600>
"https://hosting.photobucket.com/images/i/tmcnutt22/Screen_Shot_2021-11-01_at_7.35.37_PM.png"
### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models

User Table
|Property|Type|Description|
|---|:---|:---|
|userId|Number|unique id for the user (primary key)|
|email|String|username and email address of the user|
|password|string|user's password that parse hides|
|profilePic|url String|link to user's profile pic|
|firstName|String|First name of the user|
|lastName|String|Last name of the user|
|bio|String|paragraph of information the user provides|

Collection of Animals
|Property|Type|Description|
|---|:---|:---|
|primaryId|Number|objectId(primary key)|
|uniqueAnimalId(foreign key)|pointer||
|dateSeen|DateTime|Time user seen/saved animal|
|userId(foreign key)|number||

Collection of Animals Information
|Property|Type|Description|
|---|:---|:---|
|uniqueAnimalId|String|species name|
|animalName|String|Name of animal|
|animalImage|String|Url to image|
|animalInfo|String|Information from wiki api|

Posting of pictures
|Property|Type|Description|
|---|:---|:---|
|objectId|String|Unique id for the post|
|author|pointer to user|author of the pic|
|animal|pointer to animal||
|image|string/file|image that user creates|
|caption|String|image caption by author|
|commentsCount|Number|number of comments posted to a pic|
|likesCount|Number|number of likes for a picture||
|createdAt|DateTime|Time the post was created|
|updatedAt|DateTime|Time the post was last edited|

### Networking
- Login
  * (Post) User - Create user account
- LocalAnimals
  * (Post) User saved animal and facts
- MyAnimals
  * (Get) User saved animals
  * (Delete) delete a post
  * (Update) edit a post
- User Profile
  * (Get) User details
  * (Post) User details

- [Create basic snippets for each Parse network request]

```swift
      //create a user
      var user = PFUser()
        user.username = userNameField.text
        user.password = passwordField.text
        user.email = "email@example.com"
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue()
            } else {
                print("error: \(String(describing: error?.localizedDescription))")
            }
        }
```
```swift
      //saved animal and facts
      var parseObject = PFObject(className:"AnimalCollection")

      parseObject["animal"] = "animal to be saved"
      parseObject["information"] = "info to be save"
      parseObject["dateSeen"] = DateTimeNow() 
      
      // Saves the new object.
      parseObject.saveInBackground {
        (success: Bool, error: Error?) in
        if (success) {
          // The object has been saved.
        } else {
          // There was a problem, check error.description
        }
      }
```

```swift
    //(Get) User saved animals
    var query = PFQuery(className:"MyAnimals")

    query.getObjectInBackgroundWithId("<PARSE_OBJECT_ID>") {
      (parseObject: PFObject?, error: NSError?) -> Void in
      if error == nil && parseObject != nil {
        print(parseObject)
      } else {
        print(error)
      }
    }
```

```swift
   //edit a post
   var query = PFQuery(className:"MyAnimals")

    query.getObjectInBackgroundWithId("<PARSE_OBJECT_ID>") {
      (parseObject: PFObject?, error: NSError?) -> Void in
      if error != nil {
        print(error)
      } else if parseObject != nil {
        parseObject["animal"] = "animal to be saved"
        parseObject["information"] = "info to be save"
        parseObject["updatedAt"] = DateTimeNow() 

        parseObject.saveInBackground()
      }
    }
```

```swift
    //deleted saved animal
    var deleteAttributesOnly = true

    var query = PFQuery(className:"AnimalCollection")

    query.getObjectInBackgroundWithId("<PARSE_OBJECT_ID>") {
      (parseObject: PFObject?, error: NSError?) -> Void in
      if error != nil {
        print(error)
      } else if parseObject != nil {
        if deleteAttributesOnly {

          parseObject.saveInBackground()
        } else {
          parseObject.deleteInBackground()
        }
      }
    }
    
```
```swift
    //(Get) User details
    var query = PFQuery(className:"MyCustomClassName")

    query.getObjectInBackgroundWithId("<PARSE_OBJECT_ID>") {
      (parseObject: PFObject?, error: NSError?) -> Void in
      if error == nil && parseObject != nil {
        print(parseObject)
      } else {
        print(error)
      }
    }
```
```swift
    //(Update) Update user details
     var query = PFQuery(className:"MyCustomClassName")

    query.getObjectInBackgroundWithId("<PARSE_OBJECT_ID>") {
      (parseObject: PFObject?, error: NSError?) -> Void in
      if error != nil {
        print(error)
      } else if parseObject != nil {
        parseObject["firstName"] = "firstName"
        parseObject["lastName"] = "lastName"
        parseObject["profilePic"] = "URL"
        parseObject["bio"] = "Biography"
        parseObject.saveInBackground()
      }
    }
```
- [OPTIONAL: List endpoints if using existing API such as Yelp]

### Sprint 1 GIF(S)
Here's a walkthrough of implemented user stories:

Login and Logout:
<img src='http://g.recordit.co/ThrRaTFRwN.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

Navigate through the View Controllers:
<img src='http://g.recordit.co/y5yyH4kpmo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
