defmodule Takso.BookingAPIController do
  use Takso.Web, :controller
  import Ecto.Query, only: [from: 2]

  alias Takso.{Taxi,Repo}

  def create(conn, _params) do
    query = from t in Taxi, where: t.status == "available", select: t
    available_taxis = Repo.all(query)
    if length(available_taxis) > 0 do
      taxi = List.first(available_taxis)
      conn
      |> put_status(201)
      |> json(%{message: "Your taxi will arrive in 5 mins", taxi_location: taxi.location})
    else
      conn
      |> put_status(409)
      |> json(%{message: "Our apologiez"})
    end
  end
end