# EcsxPersistenceEcto

Ecto Persistence Adapter for ECSx

## Installation

EcsxPersistenceEcto can be installed by adding `ecsx_persistence_ecto` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ecsx_persistence_ecto, "~> 0.1.0"}
  ]
end
```

## Configure

To configure ECSx in your app with Ecto as the persistence adapter, update `:ecsx` in your `config.exs` file:

```elixir
    config :ecsx,
      ...
      persistence_adapter: ECSX.Persistence.Ecto
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