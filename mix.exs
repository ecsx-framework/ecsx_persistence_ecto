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
      description: "An Ecto Persistence Adapter for ECSx",
      package: package()
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
      {:ecsx, "~> 0.4.0"},
      {:ecto, "~> 3.9"},
      {:ecto_sql, "~> 3.9"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      maintainers: ["Mike Binns"],
      licenses: ["GPL-3.0"],
      links: %{
        "Changelog" => "#{@gh_url}/blob/master/CHANGELOG.md",
        "GitHub" => @gh_url
      }
    ]
  end
end
