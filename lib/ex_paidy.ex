defmodule ExPaidy do
  alias ExPaidy.Environment

  def get(url) do
    HTTPoison.get(url, headers())
    |> decode()
  end

  def post(url, body \\ %{}) do
    headers = headers() ++ [{"Content-Type", "application/json"}]
    HTTPoison.post(url, Poison.encode!(body), headers)
    |> decode()
  end

  defp headers do
    [
      {"Authorization", "Bearer #{Environment.secret_key()}"},
      {"Paidy-Version", Environment.version()}
    ]
  end

  defp decode(response) do
    case response do
      {:error, %HTTPoison.Error{reason: reason}} -> {:error, reason}
      {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
        decoded_body = Poison.decode!(body)
        case status_code do
          200 -> {:ok, decoded_body}
          _ -> {:error, decoded_body["description"]}
        end
    end
  end

end
