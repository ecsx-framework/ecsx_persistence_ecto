defmodule ECSx.Persistence.Ecto.Component do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ecsx_components" do
    field :module, :string
    field :data, :string

    timestamps()
  end

  @doc false
  def changeset(component, attrs) do
    component
    |> cast(attrs, [:module, :data])
    |> validate_required([:module, :data])
  end
end
