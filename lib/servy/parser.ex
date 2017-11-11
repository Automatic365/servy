defmodule Servy.Parser do

alias Servy.Conv

  def parse(request) do
    [headers, params] = String.split(request, "\n\n")

    params = parse_params(params)

    [method, path | request_lines] = String.split( headers, " ")

    %Conv{
      method: method,
      params: params,
      path: path
     }
  end

  def parse_params(params) do
      String.trim(params)
      |> URI.decode_query
  end

test stuff

end
