defmodule DpdClient.Mixfile do
  use Mix.Project

  def project do
    [ app: :dpd_client,
      version: "0.0.4",
      description: """
      `dpd_client` is an API client for the DPD service.  It only supports a few of the API's endpoints at present.
      """,
      contributors: ["Josh Adams"],
      licenses: ["MIT"],
      links: %{
        "GitHub repository" => "http://github.com/knewter/dpd_client"
      },
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [
        :inets,
        :hackney
      ],
      mod: { DpdClient, [] }
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:hackney, github: "benoitc/hackney"},
      {:jazz, "~> 0.1.2"}
    ]
  end
end
