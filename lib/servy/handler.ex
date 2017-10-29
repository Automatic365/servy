require(Logger)

defmodule Servy.Handler do
  def handle(request) do
    request
    |> parse
<<<<<<< 38e924eedc26d198f6789418f98db3826caf205e
    |> rewrite
=======
>>>>>>> add function clauses to handle routing
    |> log
    |> route
    |> emojify
    |> track
    |> format_response
  end

<<<<<<< 38e924eedc26d198f6789418f98db3826caf205e
  def emojify(%{status: 200, resp_body: response_body} = conv) do
    %{conv | resp_body: "EMOJI #{response_body} EMOJI" }
  end

  def emojify(conv), do: conv

  def rewrite(%{path: "/wildlife"} = conv) do
    %{conv | path: "/wildthings" }
  end

  def rewrite(%{path: "/bears?id=" <> id} = conv) do
    %{conv | path: "/bears/#{id}" }
  end

  def rewrite(conv), do: conv

=======
>>>>>>> add function clauses to handle routing
  def log(conv), do: IO.inspect conv

  def parse(request) do
    [method, path, _] =
      request
      |> String.split("\n")
      |> List.first
      |> String.split(" ")

    %{ method: method,
       path: path,
       resp_body: "",
       status: nil
     }
  end


  def route(%{ method: "GET", path: "/wildthings"} = conv) do
    %{ conv | status: 200, resp_body: "Bears, Lions, Tigers" }
  end

  def route(%{method: "GET", path: "/bears"} = conv) do
    %{ conv | status: 200, resp_body: "Teddy, Smokey, Paddington" }
  end

  def route(%{method: "GET", path: "/bears/" <> id} = conv) do
    %{ conv | status: 200, resp_body: "Bear #{id}" }
  end

  def route(%{method: "DELETE", path: "/bears/" <> id} = conv) do
    %{ conv | status: 200, resp_body: "Bear #{id} deleted"}
  end

  def route(conv, _method, path) do
    %{ conv | status: 404, resp_body: "No #{path} here!"}
  end

  def route(conv) do
    route(conv, conv.method, conv.path)
<<<<<<< 38e924eedc26d198f6789418f98db3826caf205e
  end

  def track(%{status: 404, path: path} = conv) do
    Logger.info("WARNING #{path} is loose!")
    conv
  end

  def track(conv), do: conv

=======
  end

  def route(conv, "GET", "/wildthings") do
    %{ conv | resp_body: "Bears, Lions, Tigers" }
  end

  def route(conv, "GET", "/bears") do
    %{ conv | resp_body: "Smokey, Teddy, Grizzly" }
  end

>>>>>>> add function clauses to handle routing
  def format_response(conv) do
    """
    HTTP/1.1 #{conv.status} #{status_reason(conv.status)}
    Content-Type: text/html
    Content-Length: #{String.length(conv.resp_body)}

    #{conv.resp_body}
    """
  end

  defp status_reason(code) do
    %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error"
    }[code]
  end

end

request = """
GET /wildthings HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts response

request = """
GET /bears HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts response

request = """
GET /bigfoot HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts response

request = """
GET /bears/1 HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts response

request = """
DELETE /bears/1 HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts response

request = """
GET /wildlife HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = Servy.Handler.handle(request)

IO.puts response
