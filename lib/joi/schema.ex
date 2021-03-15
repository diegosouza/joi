defmodule Joi.Schema do
  alias Joi.Field
  alias Joi.Field.Options

  @type t :: %{Field.t() => Options.t()}
end
