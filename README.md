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
* App shows a logo on launch
* User can create an account and log in
* A location based map view, with ability to input a location
* Pictures with fun facts of local animals displayed for users to read up on



**Optional Nice-to-have Stories**

* Saved list of animals seen in a collection
* Fun quiz on animal user just looked at information for
* Multiple tab views for switching between searching, learning, and saved information.

### 2. Screen Archetypes

* Login Screen
* Map Screen
   * Has address bar
   * Automatically populates map with users current coords
   * Has search bar to alter address
* Collection screen
   * Shows a collection of animals the user has seen previous in a tableView (use Parse?)
   * Has a count of total animals seen. Optionally, count based on type of animal, or area.
* Animals in area screen
  * Shows which animals can be found in the area
  * Allows the user to check off which animals they have seen, and saves that information.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [fill out your first tab]
* [fill out your second tab]
* [fill out your third tab]

**Flow Navigation** (Screen to Screen)

* Login screen
  * Map screen
* Map screen
   * Collection screen
   * Animals in area screen
* Collection screen
   * Map Screen
   * Animals in area screen
* Animals in area screen
  * Map Screen
  * Collection Screen

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
