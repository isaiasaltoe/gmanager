require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "deve ser valido com todos os campos obrigatorios" do
    user = User.new(
      full_name: "João da Silva",
      email: "isaias3@gmail.com",
      password: "isaiasgoat123"
    )

    assert user.valid?
  end

  test "deve ser inválido se o usuário nao preencheu o nome completo" do
    user = User.new(
      full_name: nil,
      email: "isaias3@gmail.com",
      password: "isaiasgoat123"
    )

    assert_not user.valid?
  end

  teste "deve ser inválido com email duplicado"

  do

end
