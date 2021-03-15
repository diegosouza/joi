defmodule Joi.TypeTest do
  use ExUnit.Case, async: true
  import Joi.Type

  describe "all/0" do
    test "returns all supported types" do
      assert all() == [:boolean, :date, :datetime, :list, :map, :number, :string]
    end
  end
end
