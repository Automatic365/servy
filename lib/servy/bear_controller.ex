defmodule Servy.BearController do
  alias Servy.Wildthings

  def index(conv) do
    %{ conv | status: 200, resp_body: "Teddy, Smokey, Paddington" }
  end

  def show(conv, %{"id" => id}) do
  %{ conv | status: 200, resp_body: "Bear #{id}" }
  end

  def create(conv, params) do
    %{ conv | status: 201, resp_body: "Created a #{params["type"]} bear named #{params["name"]}!" }
  end

end
