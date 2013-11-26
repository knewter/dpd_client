defmodule DpdClient.DPD do
  # Public API
  def storefronts(username, password) do
    get_and_decode("storefronts", username, password)
  end

  def subscribers(storefront_id, username, password) do
    get_and_decode("storefronts/#{storefront_id}/subscribers", username, password)
  end

  ### PRIVATE BITS DOWN BELOW

  defp get_and_decode(endpoint, username, password) do
    get(endpoint, username, password) |> JSON.decode!
  end

  defp get(endpoint, username, password) do
    {:ok, 200, _headers, client} = :hackney.request(:get, url_for(endpoint), [], "", options(username, password))
    {:ok, body, _client} = :hackney.body(client)
    body
  end

  defp url_for(endpoint) do
    base_url <> endpoint
  end

  defp base_url do
    "https://api.getdpd.com/v2/"
  end

  defp options(username, password) do
    [ basic_auth: { username, password }]
  end
end
