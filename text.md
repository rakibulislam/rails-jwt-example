rails g model User name:string email:string phone:string home_gym:string overall_ranking:int
rails g model Badge name:string description:string value:int ranking:string ranking_value:int


User.create({
    first_name: "David",
    last_name: "Shvimer",
    email: "dshvimer@gmail.com",
    password: "pass",
    password_confirmation: "pass",
    phone: "3138984244",
    home_gym: "Some Gym",
})

Badge.create({
    name: "Fran Time",
    description: "Do you even WOD, bro?",
    value: 5400,
    ranking: "Male Beginner",
    ranking_value: 1,
    user_id: 1
    })

Badge.create({
    name: "500m Row Time",
    description: "Endurance",
    value: 150,
    ranking: "Male Beginner",
    ranking_value: 2,
    user_id: 1
    })
Badge.create({
    name: "Back Squat 1RM",
    description: "Strength",
    value: 120,
    ranking: "Male Beginner",
    ranking_value: 1,
    user_id: 1
    })


curl -H "Content-Type: application/json" -X POST -d '{"email":"dshvimer@gmail.com","name":"David Shvimer"}' http://localhost:3000/authenticate | python -mjson.tool

{
    ..,
    ..,

}
