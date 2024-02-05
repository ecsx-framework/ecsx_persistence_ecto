# EcsxPersistenceEcto

[![Hex Version](https://img.shields.io/hexpm/v/ecsx_persistence_ecto.svg)](https://hex.pm/packages/ecsx_persistence_ecto)
[![License](https://img.shields.io/hexpm/l/ecsx_persistence_ecto.svg)](https://github.com/ecsx-framework/ecsx_persistence_ecto/blob/master/LICENSE)
[![Documentation](https://img.shields.io/badge/documentation-gray)](https://hexdocs.pm/ecsx_persistence_ecto)

Ecto Persistence Adapter for ECSx

## Installation

EcsxPersistenceEcto can be installed by adding `ecsx_persistence_ecto` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ecsx_persistence_ecto, "~> 0.1"}
  ]
end
```

## Configure

To configure ECSx in your app with Ecto as the persistence adapter, update `:ecsx` in your `config.exs` file:

```elixir
    config :ecsx,
      ...
      persistence_adapter: ECSx.Persistence.Ecto
```

and specify your repo:

```elixir
    config :ecsx_persistence_ecto, repo: MyApp.Repo
```

## Add the database table

Generate a migration script:

```
mix ecto.gen.migration ecto_persistence
```

and update the change function in the migration:

```elixir
  def change do
    create table "ecsx_components" do
      add :module, :string
      add :data, :string

      timestamps()
    end
  end
```

Finally, run the migration script:

```
mix ecto.migrate
```
