# Dubr
## A Duke Rideshare App

Dubr is a rideshare app designed specifically for Duke students, allowing them to coordinate transportation with each other. Unlike mainstream rideshare apps that can be expensive, Dubr enables students going to similar locations at similar times to carpool, making it an affordable and eco-friendly alternative. With Dubr, connecting with fellow students who are headed to the same destination has never been easier - whether it's a nearby store, restaurant, or off-campus housing. By inputting their ideal pickup/dropoff locations and times, users can be matched with other students going in the same direction, making it a convenient transportation solution. Not only does Dubr reduce traffic congestion, but it also promotes sustainability by encouraging students to share rides, making a positive impact on the environment.


## APIs to use

Maps API: 

Dubr will use Swift Maps API to let users choose locations for pick-up and drop-off. If possible, the app will let users set a proximity range (e.g. pickup within ~0.5 miles from the ideal location). It will also calculate the distance of each ride so the driver can earn miles, which will provide some incentives to the drivers.

Calendar API (EventKit):

Dubr will use EventKit to let users choose dates for rides.

## Sources of complexity/difficulty will be

- Determining time overlap to assign driver and passenger.

- Building separate features for two different groups of users: drivers & passengers.

- Implementing Maps API and Calendar API, which we are not very familiar with yet.

- Learning new UX/UI types and features to build a (hopefully) seamless app experience.

## Jon Approval
- hey team, looks good. Glad you're doing something more sophisticated with Maps. If memory serves, Apple doens't have a lot of built in functions for calculating distance (could be wrong), so StackOverflow with abandon!
