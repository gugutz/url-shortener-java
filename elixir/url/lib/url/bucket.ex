defmodule URL.Bucket do
  use Agent, restart: :temporary

  @moduledoc """
  Uses agents to keep the URL counts and list
  """

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  def put(bucket, key, value) do
    Agent.put(bucket, &Map.put(&1, key, value))
  end

  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end

end

  
