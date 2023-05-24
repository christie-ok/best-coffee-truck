defmodule BestCoffeeTruck.TrucksClient do
  use Tesla

  @base_url "https://data.sfgov.org/resource/rqzj-sfat.json"

  def client do
    [
      {Tesla.Middleware.BaseUrl, @base_url},
      {Tesla.Middleware.JSON, engine_opts: [strings: :copy]}
    ]
    |> Tesla.client()
  end

  def get_path do
    get(client(), "")
  end

  def list_trucks do
    case get_path() do
      {:ok,
       %Tesla.Env{
         status: 200,
         body: all_trucks
       }} ->
        all_trucks

      _ ->
        :error
    end
  end
end
