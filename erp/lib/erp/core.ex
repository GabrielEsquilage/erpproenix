defmodule Erp.Core do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  alias Erp.Repo

  alias Erp.Core.TipoEntidade

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

      iex> get_tipo_entidade!(123)
      %TipoEntidade{}

      iex> get_tipo_entidade!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tipo_entidade!(id), do: Repo.get!(TipoEntidade, id)

  @doc """
  Creates a tipo_entidade.

  ## Examples

      iex> create_tipo_entidade(%{field: value})
      {:ok, %TipoEntidade{}}

      iex> create_tipo_entidade(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tipo_entidade(attrs \\ %{}) do
    %TipoEntidade{}
    |> TipoEntidade.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tipo_entidade.

  ## Examples

      iex> update_tipo_entidade(tipo_entidade, %{field: new_value})
      {:ok, %TipoEntidade{}}

      iex> update_tipo_entidade(tipo_entidade, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tipo_entidade(%TipoEntidade{} = tipo_entidade, attrs) do
    tipo_entidade
    |> TipoEntidade.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tipo_entidade.

  ## Examples

      iex> delete_tipo_entidade(tipo_entidade)
      {:ok, %TipoEntidade{}}

      iex> delete_tipo_entidade(tipo_entidade)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tipo_entidade(%TipoEntidade{} = tipo_entidade) do
    Repo.delete(tipo_entidade)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tipo_entidade changes.

  ## Examples

      iex> change_tipo_entidade(tipo_entidade)
      %Ecto.Changeset{data: %TipoEntidade{}}

  """
  def change_tipo_entidade(%TipoEntidade{} = tipo_entidade, attrs \\ %{}) do
    TipoEntidade.changeset(tipo_entidade, attrs)
  end

  alias Erp.Core.TipoDocumento

  @doc """
  Returns the list of tipos_documento.

  ## Examples

      iex> list_tipos_documento()
      [%TipoDocumento{}, ...]

  """
  def list_tipos_documento do
    Repo.all(TipoDocumento)
  end

  @doc """
  Gets a single tipo_documento.

  Raises `Ecto.NoResultsError` if the Tipo documento does not exist.

  ## Examples

      iex> get_tipo_documento!(123)
      %TipoDocumento{}

      iex> get_tipo_documento!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tipo_documento!(id), do: Repo.get!(TipoDocumento, id)

  @doc """
  Creates a tipo_documento.

  ## Examples

      iex> create_tipo_documento(%{field: value})
      {:ok, %TipoDocumento{}}

      iex> create_tipo_documento(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tipo_documento(attrs \\ %{}) do
    %TipoDocumento{}
    |> TipoDocumento.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tipo_documento.

  ## Examples

      iex> update_tipo_documento(tipo_documento, %{field: new_value})
      {:ok, %TipoDocumento{}}

      iex> update_tipo_documento(tipo_documento, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tipo_documento(%TipoDocumento{} = tipo_documento, attrs) do
    tipo_documento
    |> TipoDocumento.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tipo_documento.

  ## Examples

      iex> delete_tipo_documento(tipo_documento)
      {:ok, %TipoDocumento{}}

      iex> delete_tipo_documento(tipo_documento)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tipo_documento(%TipoDocumento{} = tipo_documento) do
    Repo.delete(tipo_documento)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tipo_documento changes.

  ## Examples

      iex> change_tipo_documento(tipo_documento)
      %Ecto.Changeset{data: %TipoDocumento{}}

  """
  def change_tipo_documento(%TipoDocumento{} = tipo_documento, attrs \\ %{}) do
    TipoDocumento.changeset(tipo_documento, attrs)
  end

  alias Erp.Core.Entidade

  @doc """
  Returns the list of entidades.

  ## Examples

      iex> list_entidades()
      [%Entidade{}, ...]

  """
  def list_entidades(params \\ %{}) do
    query = from(e in Entidade, preload: [:tipo_entidade])

    query =
      case Map.get(params, "tipo_entidade_id") do
        nil ->
          query

        "" ->
          query

        tipo_id_string ->
          try do
            tipo_id = String.to_integer(tipo_id_string)
            where(query, [e], e.tipo_entidade_id == ^tipo_id)
          rescue
            _ ->
              query
          end
      end

    Repo.all(query)
  end

  @doc """
  Gets a single entidade.

  Raises `Ecto.NoResultsError` if the Entidade does not exist.

  ## Examples

      iex> get_entidade!(123)
      %Entidade{}

      iex> get_entidade!(456)
      ** (Ecto.NoResultsError)

  """
  def get_entidade!(id), do: Repo.get!(Entidade, id)

  def get_entidade_with_documents!(id) do
    Entidade
    |> Repo.get!(id)
    |> Repo.preload(:documentos)
  end

  @doc """
  Creates a entidade.

  ## Examples

      iex> create_entidade(%{field: value})
      {:ok, %Entidade{}}

      iex> create_entidade(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_entidade(attrs \\ %{}) do
    %Entidade{}
    |> Entidade.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a entidade.

  ## Examples

      iex> update_entidade(entidade, %{field: new_value})
      {:ok, %Entidade{}}

      iex> update_entidade(entidade, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_entidade(%Entidade{} = entidade, attrs) do
    entidade
    |> Entidade.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a entidade.

  ## Examples

      iex> delete_entidade(entidade)
      {:ok, %Entidade{}}

      iex> delete_entidade(entidade)
      {:error, %Ecto.Changeset{}}

  """
  def delete_entidade(%Entidade{} = entidade) do
    Repo.delete(entidade)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking entidade changes.

  ## Examples

      iex> change_entidade(entidade)
      %Ecto.Changeset{data: %Entidade{}}

  """
  def change_entidade(%Entidade{} = entidade, attrs \\ %{}) do
    Entidade.changeset(entidade, attrs)
  end

  alias Erp.Core.Documento

  @doc """
  Returns the list of documentos.

  ## Examples

      iex> list_documentos()
      [%Documento{}, ...]

  """
  def list_documentos do
    Repo.all(Documento)
  end

  @doc """
  Gets a single documento.

  Raises `Ecto.NoResultsError` if the Documento does not exist.

  ## Examples

      iex> get_documento!(123)
      %Documento{}

      iex> get_documento!(456)
      ** (Ecto.NoResultsError)

  """
  def get_documento!(id), do: Repo.get!(Documento, id)

  @doc """
  Creates a documento.

  ## Examples

      iex> create_documento(%{field: value})
      {:ok, %Documento{}}

      iex> create_documento(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_documento(attrs \\ %{}) do
    %Documento{}
    |> Documento.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a documento.

  ## Examples

      iex> update_documento(documento, %{field: new_value})
      {:ok, %Documento{}}

      iex> update_documento(documento, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_documento(%Documento{} = documento, attrs) do
    documento
    |> Documento.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a documento.

  ## Examples

      iex> delete_documento(documento)
      {:ok, %Documento{}}

      iex> delete_documento(documento)
      {:error, %Ecto.Changeset{}}

  """
  def delete_documento(%Documento{} = documento) do
    Repo.delete(documento)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking documento changes.

  ## Examples

      iex> change_documento(documento)
      %Ecto.Changeset{data: %Documento{}}

  """
  def change_documento(%Documento{} = documento, attrs \\ %{}) do
    Documento.changeset(documento, attrs)
  end
end
