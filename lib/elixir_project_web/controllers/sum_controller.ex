defmodule ElixirProjectWeb.SumController do
  use ElixirProjectWeb, :controller

  def index(connection, %{"first_number" => first_number}) do
    first_number
    |> handle_response(connection)
  end

  defp handle_response(first_number, connection) do
    connection
    |> put_status(:ok)
    |> json(%{message: "Your number is #{first_number}"})
  end
end
