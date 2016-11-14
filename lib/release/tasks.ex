defmodule Release.Tasks do
  def migrate do
    {:ok, _} = Application.ensure_all_started(:api)

    path = Application.app_dir(:api, "priv/repo/migrations")

    Ecto.Migrator.run(Api.Repo, path, :up, all: true)

    :init.stop()
  end
end
