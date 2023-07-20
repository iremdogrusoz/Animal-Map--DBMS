# Animal Map

## Overview

Animal Map is an application that provides information about various animal species. It serves as a resource for users to explore and learn about the detailed classification of animals. Species are distinguished from each other by certain characteristics such as features, behaviors, habitats, and more. The application provides the characteristics of animals to the user with a user-friendly interface to browse.

## Database Management

Animal Map is created based on the MySQL relational database management system to store and manage the data. The database schema consists of species, family, habitat, images, features, and behaviors tables. Additional tables are added to show relationships between tables and to connect tables such as SpeciesHaveFeatures, SpeciesHaveBehaviors, and SpeciesLiveHabitats.

Data is organized in a structured manner. It enables users to search and filter animals with desired criteria. Images table contains an image_pro column to share both professional and amateur photographs. This will allow users to share their amateur photographs with us.

## Limitations and Updates

Since it is a new application, there are some limitations. The project’s scope is limited to certain species and may not include all of the existing species. However, the project assumes that data will be updated periodically. Data contains extinct species and will include newly discovered species with regular updates. Moreover, this application supports only the English language and does not support translations.

## Assumptions for Design

Assumptions for the design of Animal Map include:

- A family contains many species, but a species belongs to only one family.
- An image contains only one species and habitat, but a species and habitat can have many images.
- A species lives in many habitats, and a habitat contains many species.
- A species has many features, behaviors, and features and behaviors belong to many species.

## ER diagram and Relational Mapping

The ER diagram and relational mapping of Animal Map are provided below to clarify the database design.

![Figure 1. ER diagram of Animal Map](https://github.com/iremdogrusoz/Animal-Map--DBMS/blob/main/ER.png)

Figure 1. ER diagram of Animal Map

![Figure 2. Relational mapping of Animal Map](https://github.com/iremdogrusoz/Animal-Map--DBMS/blob/main/RT.png)

Figure 2. Relational mapping of Animal Map
## Get Started

To explore the fascinating world of animals, simply access Animal Map and start browsing through the diverse species. Enjoy the adventure of learning about the animal kingdom!

---

Thank you for your interest in Animal Map. If you have any questions, suggestions, or feedback, feel free to contact us. We hope you have a wonderful experience using our application!

