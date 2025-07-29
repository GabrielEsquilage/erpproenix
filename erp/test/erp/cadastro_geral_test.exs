defmodule Erp.CadastroGeralTest do
  use Erp.DataCase

  alias Erp.CadastroGeral

  describe "tipo_entidades" do
    alias Erp.CadastroGeral.TipoEntidade

    import Erp.CadastroGeralFixtures

    @invalid_attrs %{nome: nil}

    test "list_tipo_entidades/0 returns all tipo_entidades" do
      tipo_entidade = tipo_entidade_fixture()
      assert CadastroGeral.list_tipo_entidades() == [tipo_entidade]
    end

    test "get_tipo_entidade!/1 returns the tipo_entidade with given id" do
      tipo_entidade = tipo_entidade_fixture()
      assert CadastroGeral.get_tipo_entidade!(tipo_entidade.id) == tipo_entidade
    end

    test "create_tipo_entidade/1 with valid data creates a tipo_entidade" do
      valid_attrs = %{nome: "some nome"}

      assert {:ok, %TipoEntidade{} = tipo_entidade} = CadastroGeral.create_tipo_entidade(valid_attrs)
      assert tipo_entidade.nome == "some nome"
    end

    test "create_tipo_entidade/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CadastroGeral.create_tipo_entidade(@invalid_attrs)
    end

    test "update_tipo_entidade/2 with valid data updates the tipo_entidade" do
      tipo_entidade = tipo_entidade_fixture()
      update_attrs = %{nome: "some updated nome"}

      assert {:ok, %TipoEntidade{} = tipo_entidade} = CadastroGeral.update_tipo_entidade(tipo_entidade, update_attrs)
      assert tipo_entidade.nome == "some updated nome"
    end

    test "update_tipo_entidade/2 with invalid data returns error changeset" do
      tipo_entidade = tipo_entidade_fixture()
      assert {:error, %Ecto.Changeset{}} = CadastroGeral.update_tipo_entidade(tipo_entidade, @invalid_attrs)
      assert tipo_entidade == CadastroGeral.get_tipo_entidade!(tipo_entidade.id)
    end

    test "delete_tipo_entidade/1 deletes the tipo_entidade" do
      tipo_entidade = tipo_entidade_fixture()
      assert {:ok, %TipoEntidade{}} = CadastroGeral.delete_tipo_entidade(tipo_entidade)
      assert_raise Ecto.NoResultsError, fn -> CadastroGeral.get_tipo_entidade!(tipo_entidade.id) end
    end

    test "change_tipo_entidade/1 returns a tipo_entidade changeset" do
      tipo_entidade = tipo_entidade_fixture()
      assert %Ecto.Changeset{} = CadastroGeral.change_tipo_entidade(tipo_entidade)
    end
  end
end
