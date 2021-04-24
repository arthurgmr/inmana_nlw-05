defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  # bar and numeral is params quantity of function;
  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      # setup bloc
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}
      # verification bloc
      response = Restaurant.changeset(params)
      # asset bloc
      assert %Changeset{changes: %{email: "siri@cascudo.com", name: "Siri cascudo"}, valid?: true} =
               response
    end

    test "when there are invalid params, returns an invalid changeset" do
      # setup bloc
      params = %{name: "S", email: ""}

      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      # verification bloc
      response = Restaurant.changeset(params)
      # asset bloc
      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
