defmodule Litmus.Type.Any do
  @moduledoc """
  This type provides validation for any type of value.

  ## Options

    * `:required` - Setting `:required` to `true` will cause a validation error
      when a field is not present or the value is `nil`. Allowed values for
      required are `true` and `false`. The default is `false`.

  ## Examples

      iex> schema = %{"id" => %Litmus.Type.Any{required: true}}
      iex> Litmus.validate(%{"id" => 1}, schema)
      {:ok, %{"id" => 1}}

      iex> schema = %{"id" => %Litmus.Type.Any{required: true}}
      iex> Litmus.validate(%{}, schema)
      {:error, "id is required"}

      iex> schema = %{"id" => %Litmus.Type.Any{required: true}}
      iex> Litmus.validate(%{"id" => nil}, schema)
      {:error, "id is required"}

  """

  alias Litmus.Required

  defstruct required: false

  @type t :: %__MODULE__{
          required: boolean
        }

  @spec validate_field(t, String.t(), map) :: {:ok, map} | {:error, String.t()}
  def validate_field(type, field, data), do: Required.validate(type, field, data)

  defimpl Litmus.Type do
    alias Litmus.Type

    @spec validate(Type.t(), String.t(), map) :: {:ok, map} | {:error, String.t()}
    def validate(type, field, data), do: Type.Any.validate_field(type, field, data)
  end
end
