defmodule ECSx.Persistence.Ecto do
  @behaviour ECSx.Persistence.Behaviour

  require Logger

  alias ECSx.Persistence.Ecto.Components
  alias ECSx.Persistence.Ecto.Component

  @impl ECSx.Persistence.Behaviour
  def persist_components(components, _opts \\ []) do
    {:ok, _} =
      repo().transaction(fn ->
        repo().query("TRUNCATE ecsx_components")

        Enum.map(components, fn {module, component_tuple_list} ->
          Enum.map(component_tuple_list, fn component_tuple ->
            {:ok, _} =
              Components.create_component(%{
                module: Atom.to_string(module),
                data: tuple_to_string(component_tuple)
              })
          end)
        end)
      end)

    :ok
  end

  @impl ECSx.Persistence.Behaviour
  def retrieve_components(_opts \\ []) do
    wait_for_repo_to_start()

    component_map =
      Enum.reduce(
        Components.list_components(),
        %{},
        fn %Component{module: module, data: data}, acc ->
          module = String.to_existing_atom(module)
          component = string_to_tuple(data)

          Map.update(acc, module, List.wrap(component), &[component | &1])
        end
      )

    if component_map == %{} do
      {:error, :fresh_server}
    else
      {:ok, component_map}
    end
  rescue
    e -> {:error, e}
  end

  defp wait_for_repo_to_start do
    if repo() not in Ecto.Repo.all_running() do
      Logger.info("Repo not started, waiting to retrieve ecsx components")
      :timer.sleep(500)
      wait_for_repo_to_start()
    end
  end

  def repo do
    Application.fetch_env!(:ecsx_persistence_ecto, :repo)
  end

  defp tuple_to_string(tuple), do: tuple |> :erlang.term_to_binary() |> Base.encode64()
  defp string_to_tuple(string), do: string |> Base.decode64!() |> :erlang.binary_to_term()
end
