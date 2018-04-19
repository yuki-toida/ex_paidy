defmodule ExPaidy.Environment do

  def secret_key do
    Application.get_env(:ex_paidy, :secret_key, System.get_env("PAIDY_SECRET_KEY"))
  end

  def version do
    Application.get_env(:ex_paidy, :version, "2016-07-01")
  end
  
end