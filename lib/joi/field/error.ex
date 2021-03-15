defmodule Joi.Field.Error do

  @type t :: %{
    constraint: boolean(),
    field: atom(),
    message: String.t(),
    type: String.t()
  }

end
