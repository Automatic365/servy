defmodule Servy.Wildthings do
  alias Servy.Bear

  def list_bears do
    [
      %Bear{id: 1, name: "Teddy", type: "Brown", hibernating: true},
      %Bear{id: 2, name: "Smokey", type: "Black"},
      %Bear{id: 3, name: "Paddington", type: "Brown"},
      %Bear{id: 4, name: "Scarface", type: "Grizzly", hibernating: true},
      %Bear{id: 5, name: "Snow", type: "Polar"},
      %Bear{id: 6, name: "Brutus", type: "Grizzly"},
      %Bear{id: 7, name: "Rosie", type: "Black", hibernating: true},
      %Bear{id: 8, name: "Roscoe", type: "Panda"},
      %Bear{id: 9, name: "Iceman", type: "Polar", hibernating: true},
      %Bear{id: 10, name: "Kenai", type: "Grizzly"}
    ]
  end

  def get_bear(id) when is_integer(id) do
<<<<<<< HEAD
    Enum.find(list_bears(), fn b -> b.id == id end)
=======
    Enum.find(list_bears(), fn (b) -> b.id == id end)
>>>>>>> bb0327bcf5a9f8debcccb0de238800134a1d14d9
  end

  def get_bear(id) when is_binary(id) do
    id
<<<<<<< HEAD
    |> String.to_integer()
    |> get_bear
  end

  def delete_bear(id) when is_integer(id) do
    List.delete_at(list_bears(), id)
  end

  def delete_bear(id) when is_binary(id) do
    id
    |> String.to_integer()
    |> delete_bear
  end

end
=======
    |> String.to_integer
    |> get_bear
  end

end
>>>>>>> bb0327bcf5a9f8debcccb0de238800134a1d14d9
