defmodule Lesson do
  @moduledoc """
  Documentation for Lesson.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Lesson.hello()
      :world

  """
  def hello do
    :world
  end

  # 3-1
  def myfunc do
    "hello, world."
  end

  # 5-2
  # nミリ秒以下のランダムな時間sleepさせる
  # sleepした時間を返す
  def sleep_rand(n) do
    sleep_time = :rand.uniform(n)
    :timer.sleep(sleep_time)
    #IO.puts "#{sleep_time}ミリ秒sleepしました"
    sleep_time
  end 

  # 6-4
  # n回、sleep_rand(1000)を繰り返す 
  def exec_seq(n) do
    IO.puts "=== 開始: #{n}回rand_sleepを繰り返す ==="
    result = Enum.map(1 .. n, fn(_) -> sleep_rand(1000) end)
    IO.puts "=== 終了: #{n}回rand_sleepを繰り返す ==="
    result
  end 

  # 7-4
  # n回、sleep_rand(1000)を並列に実行する
  def exec_pal(n) do
    IO.puts "=== 開始: #{n}回rand_sleepを繰り返す(並列) ==="
    list = Enum.map(1..n, fn(_) -> Task.async(Lesson, :sleep_rand, [1000]) end)
    result = Enum.map(list, fn(d) -> Task.await(d) end)
    IO.puts "=== 終了: #{n}回rand_sleepを繰り返す(並列) ==="
    result
  end
end
