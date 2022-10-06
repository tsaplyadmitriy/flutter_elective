# ChuckJokes App

## Overwiew

This application provides infinite feed of Chuck Norris jokes. Swipe right to add joke to favourite list, which you can find by clicking on Star icon. 

Joke feed            |  Favourite jokes
:-------------------------:|:-------------------------:
![](https://i.postimg.cc/x1N4PVq5/Simulator-Screen-Shot-i-Phone-13-2022-10-06-at-19-35-48.png)  |  ![](https://i.postimg.cc/gJgsWgnr/Simulator-Screen-Shot-i-Phone-13-2022-10-06-at-19-36-06.png)




## Usage

- To use this application on your android app, download .apk file via [this link](https://drive.google.com/file/d/1La6smcm-GeYxRr4f3lfHkHpUdBdbFmUg/view?usp=sharing)

- To use this application on your iOS app, you need to have Apple Developer account and access to TestFlight. Build and deploy your app to TestFlight via XCode.

## Architecture

- This project uses BloC architecture
- The app has four layers: UI, Business logic, Repository and Network
- API requests is done using Dio
- Code generation is done using retrofit

Repository is an absraction on data source for business logic module. It simulates pagination, as inital API does not have it. We load jokes with chunks of 20.

Network layer is responsible to only represent data models and available API requests

## Contact

You can adress any question about this app to @dimtsaplia in telegram
