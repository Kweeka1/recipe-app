# 📗 Table of Contents

- [📖 About the Project](#[project])
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Available Scripts](#available-scripts)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgments)
- [📝 License](#license)


# Recipe App


**Recipe App** is web app that allow users to add food and create recipes, the app is built with Ruby on Rails and has a user authentication and an authorization system.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li>HTML, CSS</li>
    <li>JavaScript</li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li>Ruby on Rails</li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features

- User registration system (using Devise gem)
- User authorization system to manage permissions and access control (using CanCanCan gem)

## Getting Started 

> To get a local copy up and running follow these simple steps.

### Prerequisites

  - <a href="https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-3-released/">Ruby</a>
  - <a href="https://rubyonrails.org/">Ruby on Rails</a>
  - <a href="https://www.postgresql.org/">PostgreSQL</a>
  - any code editor

### Setup

To setup the project follow the steps:

1. Clone this project using Git Bash: 
    ``` 
    git clone https://github.com/Kweeka1/recipe-app.git
    ```
  
2. Inside the project directory, install the project's dependencies
    ```
    bundle install
    ``` 

3. Setup the app's database
    ```
    rails db:setup
    ``` 


### Available Scripts

In the project directory, you can run:

- ```
  rails server
  ```
  Runs the app server

- ```
  rubocop
  ```
  Launches the test runner.

## Authors

👤 **Mohamed Talbi**

- GitHub: [@Kweeka1](https://github.com/Kweeka1)
- LinkedIn: [Mohamed Talbi](https://www.linkedin.com/in/moetalbi/)

👤 **Selma Hamutenya**

- GitHub: [@SelmaNdapanda](https://github.com/SelmaNdapanda)
- Twitter: [@SellohBlaq](https://twitter.com/sellohBlaq)
- LinkedIn: [selma-hamutenya](www.linkedin.com/in/selma-hamutenya)

## Future Feature

- Implement user engagement features (likes, comments and ratings)

## Contributing 

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support <a name="support"></a>

If you like this project give it a star!

## Acknowledgments 

- Microverse 
- Code Reviewers

## License 

This project is [MIT](./LICENSE) licensed.