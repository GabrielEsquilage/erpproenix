defmodule Erp.CadastroGeral do
  @moduledoc """
  The CadastroGeral context.
  """

  import Ecto.Query, warn: false
  alias Erp.Repo

  alias Erp.CadastroGeral.TipoEntidade

  @doc """
  Returns the list of tipos_entidade.

  ## Examples

      iex> list_tipos_entidade()
      [%TipoEntidade{}, ...]

  """
  def list_tipos_entidade do
    Repo.all(TipoEntidade)
  end

  @doc """
  Gets a single tipo_entidade.

  Raises `Ecto.NoResultsError` if the Tipo entidade does not exist.

  ## Examples

      iex> get_tipos_entidade!(123)
      %TipoEntidade{}

      iex> get_tipos_entidade!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tipos_entidade!(id), do: Repo.get!(TipoEntidade, id)

  @doc """
  Creates a tipo_entidade.

  ## Examples

      iex> create_tipos_entidade(%{field: value})
      {:ok, %TipoEntidade{}}

      iex> create_tipos_entidade(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tipos_entidade(attrs \\ %{}) do
    %TipoEntidade{}
    |> TipoEntidade.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tipo_entidade.

  ## Examples

      iex> update_tipos_entidade(tipo_entidade, %{field: new_value})
      {:ok, %TipoEntidade{}}

      iex> update_tipos_entidade(tipo_entidade, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tipos_entidade(%TipoEntidade{} = tipo_entidade, attrs) do
    tipo_entidade
    |> TipoEntidade.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tipo_entidade.

  ## Examples

      iex> delete_tipos_entidade(tipo_entidade)
      {:ok, %TipoEntidade{}}

      iex> delete_tipos_entidade(tipo_entidade)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tipos_entidade(%TipoEntidade{} = tipo_entidade) do
    Repo.delete(tipo_entidade)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tipo_entidade changes.

  ## Examples

      iex> change_tipos_entidade(tipo_entidade)
      %Ecto.Changeset{data: %TipoEntidade{}}

  """
  def change_tipos_entidade(%TipoEntidade{} = tipo_entidade, attrs \\ %{}) do
    TipoEntidade.changeset(tipo_entidade, attrs)
  end
end