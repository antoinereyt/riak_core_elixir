defmodule NoSlides.Mixfile do
  use Mix.Project

  def project do
    [app: :no_slides,
     version: "0.1.0",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:riak_core, :logger ],
     mod: {NoSlides, []}]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:riak_core, "~> 3.1.1", hex: :riak_core_ng},
      {:cuttlefish, git: "https://github.com/gpad/cuttlefish", branch: "develop", override: true},
      {:poolboy, "~> 1.5.1", override: true},
    ]
  end
end
