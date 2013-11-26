defmodule DpdClientTest do
  use ExUnit.Case
  alias DpdClient.DPD, as: DPD

  setup do
    {
      :ok,
      username: System.get_env("GETDPD_USERNAME"),
      password: System.get_env("GETDPD_API_KEY")
    }
  end

  test "getting the list of storefronts", meta do
    assert Enum.count(DPD.storefronts(meta[:username], meta[:password])) > 0
  end
end
