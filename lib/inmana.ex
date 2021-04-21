defmodule Inmana do
  alias Inmana.Restaurant.Create

  defdelegate create_restaurant(params), to: Create, as: :call
end
