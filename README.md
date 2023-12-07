# Gestao-de-Aeroportos
Project developed in BD (Base de Dados) class.

This project aims to simulate the operation and creation of one or more databases related to one or more airports generating the necessary database for managing one or more airports, along with the corresponding ER (Entity-Relationship) and physical models.

## About the Project
To manage multiple airports, it is necessary to understand how they are structured and what information needs to be managed. In this way, airports are divided into three parts. The first part is the internal section, which consists of the employees working at the airport and the passengers who are traveling. However, for passengers to travel, they need to acquire tickets (which can be purchased at the airport or online) and these tickets must be valid until the check-in time, with the option to cancel the purchase at any time. Each passenger can make multiple purchases (of tickets) for various flights. It is also necessary to know the data of those who are traveling and those who work at the airport (address, name, email, phone, date of birth, ID card, and tax identification number) for protection and security purposes.

The second part, the external section, encompasses all information about the location of private parking lots, indicating whether the parking lot is full or not, the entry and exit movements, the date of these movements, and the amount to be paid based on this difference. It is also important to know the location of the airport, its name, and the number of employees working there. Each airport can have a set of private parking lots, but each parking lot can only belong to one airport.

The third and final part corresponds to air traffic, where information about various flights needs to be controlled by the control tower. There can only be one control tower at each airport to display on the airport's TVs the number, destination, and origin of each available flight at the moment, the boarding gate, and the terminal to catch the flight. If the flight has a layover, this information must also be provided. In the case of delays and/or changes in boarding gates, the control tower is responsible for updating this information, which is immediately made available on the TVs. For flights to take place, tickets must have been purchased for them, and there must also be an airplane assigned to that flight—without an airplane, there is no means of transportation. Each airplane is composed of its name, type, and the number of seats it has, so it is known whether the plane is full or not. It performs multiple flights, and various flights must also be carried out by multiple airplanes. Each airline provides its own airplanes to the airport so that it has enough airplanes for the various flights. Each airline has its own acronym, a name, and the location of the company's main headquarters.


## Languages/Frameworks/Tools used:
  - Oracle SQL;
  - SQL Developer;
  - Draw.io to build the ER model.
