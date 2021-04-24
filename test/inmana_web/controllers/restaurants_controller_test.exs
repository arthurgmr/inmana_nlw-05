defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  # bar and numeral is params quantity of function;
  describe "create/2" do
    test "when all params are valid, create the user", %{conn: conn} do
      # setup bloc
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}
      # verification bloc
      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      # asset bloc
      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "siri@cascudo.com",
                 "id" => _id,
                 "name" => "Siri cascudo"
               }
             } = response
    end

    test "when there are invalid params, returns an erros", %{conn: conn} do
      # setup bloc
      params = %{email: "siri@cascudo.com"}
      expected_response = %{"message" => %{"name" => ["can't be blank"]}}
      # verification bloc
      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      # asset bloc
      assert response == expected_response
    end
  end
end
