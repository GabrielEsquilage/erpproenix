defmodule ErpWeb.TipoEntidadeLiveTest do
  use ErpWeb.ConnCase

  import Phoenix.LiveViewTest
  import Erp.CadastroGeralFixtures

  @create_attrs %{nome: "some nome"}
  @update_attrs %{nome: "some updated nome"}
  @invalid_attrs %{nome: nil}

  defp create_tipo_entidade(_) do
    tipo_entidade = tipo_entidade_fixture()
    %{tipo_entidade: tipo_entidade}
  end

  describe "Index" do
    setup [:create_tipo_entidade]

    test "lists all tipo_entidades", %{conn: conn, tipo_entidade: tipo_entidade} do
      {:ok, _index_live, html} = live(conn, ~p"/tipo_entidades")

      assert html =~ "Listing Tipo entidades"
      assert html =~ tipo_entidade.nome
    end

    test "saves new tipo_entidade", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/tipo_entidades")

      assert index_live |> element("a", "New Tipo entidade") |> render_click() =~
               "New Tipo entidade"

      assert_patch(index_live, ~p"/tipo_entidades/new")

      assert index_live
             |> form("#tipo_entidade-form", tipo_entidade: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#tipo_entidade-form", tipo_entidade: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tipo_entidades")

      html = render(index_live)
      assert html =~ "Tipo entidade created successfully"
      assert html =~ "some nome"
    end

    test "updates tipo_entidade in listing", %{conn: conn, tipo_entidade: tipo_entidade} do
      {:ok, index_live, _html} = live(conn, ~p"/tipo_entidades")

      assert index_live |> element("#tipo_entidades-#{tipo_entidade.id} a", "Edit") |> render_click() =~
               "Edit Tipo entidade"

      assert_patch(index_live, ~p"/tipo_entidades/#{tipo_entidade}/edit")

      assert index_live
             |> form("#tipo_entidade-form", tipo_entidade: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#tipo_entidade-form", tipo_entidade: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tipo_entidades")

      html = render(index_live)
      assert html =~ "Tipo entidade updated successfully"
      assert html =~ "some updated nome"
    end

    test "deletes tipo_entidade in listing", %{conn: conn, tipo_entidade: tipo_entidade} do
      {:ok, index_live, _html} = live(conn, ~p"/tipo_entidades")

      assert index_live |> element("#tipo_entidades-#{tipo_entidade.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#tipo_entidades-#{tipo_entidade.id}")
    end
  end

  describe "Show" do
    setup [:create_tipo_entidade]

    test "displays tipo_entidade", %{conn: conn, tipo_entidade: tipo_entidade} do
      {:ok, _show_live, html} = live(conn, ~p"/tipo_entidades/#{tipo_entidade}")

      assert html =~ "Show Tipo entidade"
      assert html =~ tipo_entidade.nome
    end

    test "updates tipo_entidade within modal", %{conn: conn, tipo_entidade: tipo_entidade} do
      {:ok, show_live, _html} = live(conn, ~p"/tipo_entidades/#{tipo_entidade}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Tipo entidade"

      assert_patch(show_live, ~p"/tipo_entidades/#{tipo_entidade}/show/edit")

      assert show_live
             |> form("#tipo_entidade-form", tipo_entidade: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#tipo_entidade-form", tipo_entidade: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/tipo_entidades/#{tipo_entidade}")

      html = render(show_live)
      assert html =~ "Tipo entidade updated successfully"
      assert html =~ "some updated nome"
    end
  end
end
