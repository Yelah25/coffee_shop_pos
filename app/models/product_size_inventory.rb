class ProductSizeInventory < ApplicationRecord
    self.primary_key = "InventoryID"

    belongs_to :product_size,
                primary_key: "ProductSizeID",
                foreign_key: "ProductSizeID"


end
