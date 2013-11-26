defmodule DpdClientTest do
  use ExUnit.Case
  alias DpdClient.DPD, as: DPD

  setup do
    {
      :ok,
      username: System.get_env("GETDPD_USERNAME"),
      password: System.get_env("GETDPD_API_KEY"),
      storefront_id: System.get_env("GETDPD_STORE_ID")
    }
  end

  test "getting the list of storefronts", meta do
    storefronts = DPD.storefronts(meta[:username], meta[:password])
    assert Enum.count(storefronts) > 0
    assert is_integer(Enum.at(storefronts, 0)["id"])
  end

  test "getting the list of subscribers at a given storefront", meta do
    subscribers = DPD.subscribers(meta[:storefront_id], meta[:username], meta[:password])
    assert Enum.count(subscribers) > 0
    assert is_integer(Enum.at(subscribers, 0)["id"])
  end
end
