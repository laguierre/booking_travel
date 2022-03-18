
import 'activity_model.dart';
import 'destination_model.dart';
import 'hotel_model.dart';

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'lib/assets/images/hotel0.jpg',
    name: 'Hotel 0',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    imageUrl: 'lib/assets/images/hotel1.jpg',
    name: 'Hotel 1',
    address: '4508 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'lib/assets/images/hotel2.jpg',
    name: 'Hotel 2',
    address: '804 Great St',
    price: 240,
  ),
];

List<Activity> activities = [
  Activity(
    imageUrl: 'lib/assets/images/stmarksbasilica.jpg',
    name: 'St. Mark\'s\n Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'lib/assets/images/gondola.jpg',
    name: 'Walking Tour \n& Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'lib/assets/images/murano.jpg',
    name: 'Murano and \nBurano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'lib/assets/images/venice.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'lib/assets/images/paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'lib/assets/images/newdelhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'lib/assets/images/saopaulo.jpg',
    city: 'Sao Paulo',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'lib/assets/images/newyork.jpg',
    city: 'New York City',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
