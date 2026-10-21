class SaleItem < ApplicationRecord
    self.primary_key = "SaleItemID"

    belongs_to :sale,
                primary_key: "SaleID",
                foreign_key: "SaleID"

    belongs_to :product_size,
                primary_key: "ProductSizeID",
                foreign_key: "ProductSizeID"

    has_many :stock_movements,
                primary_key: "SaleItemID",
                foreign_key: "SaleItemID"

end
