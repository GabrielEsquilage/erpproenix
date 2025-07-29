defmodule Erp.CadastroGeralFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Erp.CadastroGeral` context.
  """

  @doc """
  Generate a tipo_entidade.
  """
  def tipo_entidade_fixture(attrs \\ %{}) do
    {:ok, tipo_entidade} =
      attrs
      |> Enum.into(%{
        nome: "some nome"
      })
      |> Erp.CadastroGeral.create_tipo_entidade()

    tipo_entidade
  end
end
