defmodule ErpWeb.EntidadeLiveTest do
  use ErpWeb.ConnCase

  import Phoenix.LiveViewTest
  import Erp.CoreFixtures

  @create_attrs %{nome_razao_social: "some nome_razao_social", nome_fantasia_apelido: "some nome_fantasia_apelido", email_principal: "some email_principal", telefone_principal: "some telefone_principal", data_nascimento_fundacao: "2025-07-23", ativo: true, observacoes: "some observacoes"}
  @update_attrs %{nome_razao_social: "some updated nome_razao_social", nome_fantasia_apelido: "some updated nome_fantasia_apelido", email_principal: "some updated email_principal", telefone_principal: "some updated telefone_principal", data_nascimento_fundacao: "2025-07-24", ativo: false, observacoes: "some updated observacoes"}
  @invalid_attrs %{nome_razao_social: nil, nome_fantasia_apelido: nil, email_principal: nil, telefone_principal: nil, data_nascimento_fundacao: nil, ativo: false, observacoes: nil}

  defp create_entidade(_) do
    entidade = entidade_fixture()
    %{entidade: entidade}
  end

  describe "Index" do
    setup [:create_entidade]

    test "lists all entidades", %{conn: conn, entidade: entidade} do
      {:ok, _index_live, html} = live(conn, ~p"/entidades")

      assert html =~ "Listing Entidades"
      assert html =~ entidade.nome_razao_social
    end

    test "saves new entidade", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/entidades")

      assert index_live |> element("a", "New Entidade") |> render_click() =~
               "New Entidade"

      assert_patch(index_live, ~p"/entidades/new")

      assert index_live
             |> form("#entidade-form", entidade: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#entidade-form", entidade: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/entidades")

      html = render(index_live)
      assert html =~ "Entidade created successfully"
      assert html =~ "some nome_razao_social"
    end

    test "updates entidade in listing", %{conn: conn, entidade: entidade} do
      {:ok, index_live, _html} = live(conn, ~p"/entidades")

      assert index_live |> element("#entidades-#{entidade.id} a", "Edit") |> render_click() =~
               "Edit Entidade"

      assert_patch(index_live, ~p"/entidades/#{entidade}/edit")

      assert index_live
             |> form("#entidade-form", entidade: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#entidade-form", entidade: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/entidades")

      html = render(index_live)
      assert html =~ "Entidade updated successfully"
      assert html =~ "some updated nome_razao_social"
    end

    test "deletes entidade in listing", %{conn: conn, entidade: entidade} do
      {:ok, index_live, _html} = live(conn, ~p"/entidades")

      assert index_live |> element("#entidades-#{entidade.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#entidades-#{entidade.id}")
    end
  end

  describe "Show" do
    setup [:create_entidade]

    test "displays entidade", %{conn: conn, entidade: entidade} do
      {:ok, _show_live, html} = live(conn, ~p"/entidades/#{entidade}")

      assert html =~ "Show Entidade"
      assert html =~ entidade.nome_razao_social
    end

    test "updates entidade within modal", %{conn: conn, entidade: entidade} do
      {:ok, show_live, _html} = live(conn, ~p"/entidades/#{entidade}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Entidade"

      assert_patch(show_live, ~p"/entidades/#{entidade}/show/edit")

      assert show_live
             |> form("#entidade-form", entidade: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#entidade-form", entidade: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/entidades/#{entidade}")

      html = render(show_live)
      assert html =~ "Entidade updated successfully"
      assert html =~ "some updated nome_razao_social"
    end
  end
end
