defmodule DpdClientTest do
  use ExUnit.Case
  alias DpdClient.DPD, as: DPD

  test "getting the list of storefronts" do
    storefronts = DPD.storefronts(username, password)
    assert Enum.count(storefronts) > 0
    assert is_integer(Enum.at(storefronts, 0)["id"])
  end

  test "getting the list of subscribers at a given storefront" do
    subscribers = DPD.subscribers(storefront_id, username, password)
    assert Enum.count(subscribers) > 0
    assert is_integer(Enum.at(subscribers, 0)["id"])
  end

  def username do
    System.get_env("GETDPD_USERNAME")
  end

  def password do
    System.get_env("GETDPD_API_KEY")
  end

  def storefront_id do
    System.get_env("GETDPD_STORE_ID")
  end
end
