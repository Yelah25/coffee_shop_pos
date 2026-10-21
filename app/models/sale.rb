class Sale < ApplicationRecord
    self.primary_key = "SaleID"

    belongs_to :user,
            primary_key: "UserID",
            foreign_key: "UserID"

    has_many :sale_items,
                primary_key: "SaleID",
                foreign_key: "SaleID"

    has_many :payments,
             primary_key: "SaleID",
             foreign_key: "SaleID"

end
