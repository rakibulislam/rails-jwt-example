rails g model User name:string email:string phone:string home_gym:string overall_ranking:int
rails g model Movement name:string description:string value:int ranking:string ranking_value:int


User.create({
    name: "David Shvimer",
    email: "dshvimer@gmail.com",
    phone: "3138984244",
    home_gym: "Some Gym",
})

Movement.create({
    name: "Fran Time",
    description: "Do you even WOD, bro?",
    value: 5400,
    ranking: "Male Beginner",
    ranking_value: 1,
    user_id: 1
    })

Movement.create({
    name: "500m Row Time",
    description: "Endurance",
    value: 150,
    ranking: "Male Beginner",
    ranking_value: 1,
    user_id: 1
    })
Movement.create({
    name: "Back Squat 1RM",
    description: "Strength",
    value: 120,
    ranking: "Male Beginner",
    ranking_value: 1,
    user_id: 1
    })
