module FakeModelWithoutPasswordStrategy
  def fake_model_without_password_strategy
    Class.new do
      include ActiveModel::Validations

      validates_with UniquenessValidator

      def self.before_validation(*args); end
      def self.before_create(*args); end

      include Clearance::User
    end.new
  end
end

class UniquenessValidator < ActiveModel::Validator
  def validate(record)
  end
end

RSpec.configure do |config|
  config.include FakeModelWithoutPasswordStrategy
end
