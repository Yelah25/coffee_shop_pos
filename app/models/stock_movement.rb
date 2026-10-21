class StockMovement < ApplicationRecord
    self.primary_key = "StockMovementID"

    belongs_to :product_size,
                primary_key: "ProductSizeID",
                foreign_key: "ProductSizeID"

    belongs_to :user,
                primary_key: "UserID",
                foreign_key: "UserID"

    belongs_to :sale_item,
                primary_key: "SaleItemID",
                foreign_key: "SaleItemID"


end
