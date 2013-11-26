defmodule DpdClient.DPD do
  def storefronts(username, password) do
    get("/storefronts", username, password) |> decode_list_as(Storefront)
  end

  defp decode_list_as(_string, _record) do
    []
  end

  defp get(endpoint, username, password) do
    {:ok, 200, _headers, client} = :hackney.request(:get, url_for(endpoint), headers(username, password))
    {:ok, body, _client} = :hackney.body(client)
    body
  end

  defp url_for(endpoint) do
    base_url <> endpoint
  end

  defp base_url do
    "https://api.getdpd.com/v2/"
  end

  defp headers(username, password) do
    [ basic_auth: { String.to_char_list!(username), String.to_char_list!(password) }]
  end
end
