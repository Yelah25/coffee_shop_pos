
class User < ApplicationRecord

  self.table_name = "Users"
  self.primary_key = "UserID"


  def password_digest
    self["Password"]
  end

  def password_digest=(value)
    self["Password"] = value
  end

  has_secure_password validations: false

  validates :FullName, presence: true
  validates :UserName, presence: true, uniqueness: true
  validates :Role, inclusion: {
    in: ["Manager", "Cashier", "Admin"]
  }

 
validates :password,
          length: { minimum: 12, maximum: 72 },
          format: {
            with: /\A(?=.*[A-Za-z])(?=.*\d)(?=.*[^A-Za-z0-9]).+\z/,
            message: "must contain at least one letter, one number, and one special character"
          },
          if: -> { password.present? }

validates :password_confirmation,
          presence: true,
          if: -> { password.present? }

validates :UserName,
          uniqueness: {
            case_sensitive: false
          }

has_many :stock_movements,
           primary_key: "UserID",
           foreign_key: "UserID"

has_many :sales,
           primary_key: "UserID",
           foreign_key: "UserID"

end
