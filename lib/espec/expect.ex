defmodule ESpec.Expect do
  @moduledoc """
  Defines `expect` and `is_expected` helper functions.
  These functions wrap arguments for ESpec.ExpectTo module.
  """

  @doc false
  defmacro __using__(_arg) do
    quote do
      @doc "The same as `expect(subject)`"
      def is_expected do
        {ESpec.ExpectTo, apply(__MODULE__, :subject, [])}
      end
    end
  end

  @doc "Wrapper for `ESpec.ExpectTo`."
  def expect(do: value), do: {ESpec.ExpectTo, value}
  def expect(value), do: {ESpec.ExpectTo, value}
end
