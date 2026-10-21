class Payment < ApplicationRecord
    self.primary_key = "PaymentID"

    belongs_to :sale,
                primary_key: "SaleID",
                foreign_key: "SaleID"

end
