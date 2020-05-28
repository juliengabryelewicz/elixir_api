defmodule ElixirApi.EndpointTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts ElixirApi.Endpoint.init([])

  test "it returns 200 and pong test" do
    conn = conn(:get, "/ping")
    conn = ElixirApi.Endpoint.call(conn, @opts)
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "pong"
  end

  test "it returns 404" do
    conn = conn(:get, "/notfound")
    conn = ElixirApi.Endpoint.call(conn, @opts)
    assert conn.status == 404
  end
end