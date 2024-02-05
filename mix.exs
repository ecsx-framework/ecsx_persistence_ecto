defmodule EcsxPersistenceEcto.MixProject do
  use Mix.Project

  @gh_url "https://github.com/TheFirstAvenger/ecsx_persistence_ecto"
  @version "0.1.0"

  def project do
    [
      app: :ecsx_persistence_ecto,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: "An Ecto Persistence Adapter for ECSx",
      package: package(),

      # Docs
      name: "ecsx_persistence_ecto",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
      {:ecsx, "~> 0.5"},
      {:ecto, "~> 3.9"},
      {:ecto_sql, "~> 3.9"}
    ]
  end

  defp package do
    [
      maintainers: ["Andrew P Berrien", "Mike Binns"],
      licenses: ["GPL-3.0"],
      links: %{
        "Changelog" => "#{@gh_url}/blob/master/CHANGELOG.md",
        "GitHub" => @gh_url
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      logo: nil,
      source_url: @gh_url,
      extras: ["README.md"]
    ]
  end
end
