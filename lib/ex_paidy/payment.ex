defmodule ExPaidy.Payment do
  @endpoint "https://api.paidy.com/payments"

  @doc """
  決済情報取得
  """
  def get(payment_id) do
    "#{@endpoint}/#{payment_id}"
    |> ExPaidy.get()
  end

  @doc """
  決済確定させる
  status: authorized が対象
  """
  def capture(payment_id) do
    "#{@endpoint}/#{payment_id}/captures"
    |> ExPaidy.post()
  end

  @doc """
  決済を破棄する
  status: authorized が対象
  """
  def close(payment_id) do
    "#{@endpoint}/#{payment_id}/close"
    |> ExPaidy.post()
  end

  @doc """
  全額返金する
  status: closed が対象
  """
  def refund(payment_id, capture_id) do
    "#{@endpoint}/#{payment_id}/refunds"
    |> ExPaidy.post(%{capture_id: capture_id})
  end
end
