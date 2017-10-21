alias Takso.{Repo,User,Taxi}

[%{name: "Fred Flintstone", username: "fred", password: "parool"},
 %{name: "Barney Rubble", username: "barney", password: "parool"}]
|> Enum.map(fn user_data -> User.changeset(%User{}, user_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)

[%{username: "driver1", location: "Uus turu 2", status: "available"},
 %{username: "driver2", location: "Raatuse 22", status: "available"}]
|> Enum.map(fn taxi_data -> Taxi.changeset(%Taxi{}, taxi_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)