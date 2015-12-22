

User.create({
    first_name: "David",
    last_name: "Shvimer",
    gender: "Male",
    email: "dave@crossfit.com",
    password: "pass",
    phone: "3138984244",
    home_gym: "Some Gym",
    is_crossfitter: true,
    is_box_owner: false
})
{
  badges: [
    {name: "Fran Time",
     score: 600},
   ]
}


User.create({
    first_name: "Guy",
    last_name: "Fit",
    gender: "Male",
    email: "guy@crossfit.com",
    password: "pass",
    phone: "3138984244",
    is_crossfitter: false,
    is_box_owner: true
})
Box.create({
  name: "Derek Zoolander's center for kids who can't read good",
  phone: "2879876655",
  email: "gym@gym.com",
  address: "525 nw 5th ave",
  city: "Ft Lauderdale",
  zip: "33301",
  user_id: 12,
  business_hours_attributes: [
    {day: 0, close_time: 8389, open_time: 99999}
  ]
})

POST NEW Box
{
  "name": "Derek Zoolander's center for kids who can't read good",
  "phone": "2879876655",
  "email": "gym@gym.com",
  "address": "525 nw 5th ave",
  "city": "Ft Lauderdale",
  "zip": "33301",
  "business_hours_attributes": [
    {"day": 0, "close_time": 8389, "open_time": 99999}
    {"day": 1, "close_time": 8389, "open_time": 99999}
    {"day": 2, "close_time": 8389, "open_time": 99999}
    {"day": 3, "close_time": 8389, "open_time": 99999}
    {"day": 4, "close_time": 8389, "open_time": 99999}
    {"day": 5, "close_time": 8389, "open_time": 99999}
    {"day": 6, "close_time": 8389, "open_time": 99999}
  ]
}

POST NEW CROSSFITTER
{
    first_name: "David",
    last_name: "Shvimer",
    gender: "Male",
    email: "Dave@crossfit.com",
    password: "pass",
    phone: "3138984244",
    home_gym: "Some Gym",
    is_crossfitter: true,
    is_box_owner: false
}
