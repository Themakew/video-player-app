# SilverOrange Challenge App

<p align="center">
  <img src="https://github.com/Themakew/video-player-app/assets/3030029/5673da12-26be-48a3-b65c-1681c24a6515" alt="Simulator Screenshot - iPhone 15 Pro Max - 2023-10-10 at 17 54 42" width="200"/>
  <img src="https://github.com/Themakew/video-player-app/assets/3030029/7e6420d5-c005-4d83-bd7f-77b84a216642" alt="Simulator Screenshot - iPhone 15 Pro Max - 2023-10-10 at 17 54 42" width="200"/>
  <img src="https://github.com/Themakew/video-player-app/assets/3030029/bac33656-5089-445b-953e-365cf1942892" alt="Simulator Screenshot - iPhone 15 Pro Max - 2023-10-10 at 17 54 42" width="200"/>
  <img src="https://github.com/Themakew/video-player-app/assets/3030029/d054ea72-dc2d-4add-839b-9336ac6a6089" alt="Simulator Screenshot - iPhone 15 Pro Max - 2023-10-10 at 17 54 33" width="200"/>
  <img src="https://github.com/Themakew/video-player-app/assets/3030029/adfc6f7a-5550-457f-8313-b99c93fbb50d" alt="Simulator Screenshot - iPad Pro - 2023-10-10 at 17 54 42" width="500"/>
</p>

This is a simple app result of the SilverOrage assessment, using tools such as: Swift, SwiftUI and MVVM.

## Functionalities
✔️ Fetch a list of videos using the local server (available in this repo), where it is possible to play or pause the videos, as well as see their descriptions.

## Technologies and tools used

- Swift: program language
- SwiftUI: declarative way to build screens layout
- Alamofire: networking (API integration)
- Alamofire: networking (API integration)
- MarkdownKit: handling markdown texts

## Architecture used

Architecture used was MVVM, with some elements of Clean Architecture. Strong reference used: <a href="https://github.com/kudoleh/iOS-Clean-Architecture-MVVM">repo.</a></p> 

## Good to Have

Due the timebox and the requirenment set for the assessment, was not done the implementation of important UX aspects: layout for the loading and error states. 

In order to serve as a reference, according to my dissertation related to mobile usability (<a href="https://www.researchgate.net/publication/333106215_Set_of_Usability_Heuristics_for_Quality_Assessment_of_Mobile_Applications_on_Smartphones">Link.</a></p>), the heuristic "Visibility of System Status", "The application should keep the user informed about all processes and state changes within a reasonable period of time".

## How to run the project?

It is quite straightforward:

Run `./bootstrap.sh` from the root directory of this repository, it will install all dependecies, start the server locally and open the Xcode Project automatically.
