defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  # bar and numeral is params quantity of function;
  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      # setup bloc
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special banana"}
      # verification bloc
      result = Welcomer.welcome(params)
      # asset bloc
      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      # setup bloc
      params = %{"name" => "arthur", "age" => "27"}
      expected_result = {:ok, "Welcome arthur"}
      # verification bloc
      result = Welcomer.welcome(params)
      # asset bloc
      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      # setup bloc
      params = %{"name" => "arthur", "age" => "17"}
      expected_result = {:error, "You shall not pass arthur"}
      # verification bloc
      result = Welcomer.welcome(params)
      # asset bloc
      assert result == expected_result
    end
  end
end
