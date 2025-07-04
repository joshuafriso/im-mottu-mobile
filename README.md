# im_mottu_mobile

# Project Description
This is a Pokédex app

# Table of Contents

* [Getting Started](#getting-started)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Implemented Features](#implemented-features)
* [Architecture](#architecture)
* [Running Tests Locally](#running-tests-locally)
* [Screenshots](#screenshots)

# Getting Started
These instructions will get you a copy of the project up and running on your local machine for development purposes.

## Prerequisites
To run this project, you need to have the following installed on your machine:
1. Flutter 3.32.0 (https://docs.flutter.dev/get-started/install)
2. Dart SDK 3.8.0 (https://dart.dev/tools/sdk)
3. Android Studio
4. Xcode (for iOS development)
5. VS Code
6. JDK 21+ for android development
7. Gradle for android build tools

## Installation
Clone or download this repository and open it in an IDE like Android Studio or Visual Studio Code. Make sure that all dependencies are properly set up before.<br>
Then execute the following commands in order:<br>
flutter pub get<br>
After all the dependencies were got, press F5 to run the project

## Implemented Features
# Level 1
[X]Show a Pokemon List with name and picture
[X]Show a Pokemon Details with name, picture, weight, and height when touch in one of the list

# Level 2
[X]Store locally in cache the consultations made to the API
[X]Create a name filter for the listing
[X]On the detail screen, also display: Types and Abilities

# Level 3
[X]Create a custom splash screen
[X]Clean the cache when closing the app
[X]Implement pagination in the listing
[X]When clicking on a type or skill, display the list of related Pokémon
[X]Allow navigation for the details of related Pokémon
[X]Create unit tests for business rules

## Architecture
This project was created using MVC with GetX

# Running Tests Locally
To run tests locally, open the terminal or command prompt navigate to the root directory of the app folder then type flutter test. This will start running all the tests

# Screenshots
![SplshScreen](examples/Screenshot%202025-07-04%20at%2000.56.06.png)
![Home](examples/Screenshot%202025-07-04%20at%2000.55.41.png)
![Pokemon Details](examples/Screenshot%202025-07-04%20at%2000.56.32.png)
![Pokemon List by Type](examples/Screenshot%202025-07-04%20at%2000.56.42.png)
![Pokemon List Filtered](examples/Screenshot%202025-07-04%20at%2000.56.59.png)
![Pokemon List by Ability](examples/Screenshot%202025-07-04%20at%2000.57.18.png)
