defmodule Servy.BearController do
  alias Servy.Wildthings
  alias Servy.Bear

  def index(conv) do
    bear_item =
      Wildthings.list_bears()
      |> Enum.filter(&Bear.is_grizzly/1)
      |> Enum.sort(&Bear.order_asc_by_name/2)
      |> Enum.map(&bear_item/1)
      |> Enum.join
    %{conv | status: 200, resp_body: "<ul>#{bear_item}</ul>"}
  end

  def show(conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)
    %{conv | status: 200, resp_body: "Bear #{bear.id}: #{bear.name}"}
  end

  def create(conv, params) do
    %{conv | status: 201, resp_body: "Created a #{params["type"]} bear named #{params["name"]}!"}
  end

  def delete(conv, %{"id" => id }) do
    %{conv | status: 403, resp_body: "Deleting a bear is forbidden!"}
  end

  defp bear_item(bear) do
    "<li>#{bear.name} - #{bear.type}</li>"
  end

end
