class ProductSize < ApplicationRecord
    self.primary_key = "ProductSizeID"
    
    belongs_to :product,
                primary_key: "ProductID",
                foreign_key: "ProductID"

    has_many :sale_items,
            primary_key: "ProductSizeID",
            foreign_key: "ProductSizeID"

    has_one :product_size_inventory,
            primary_key: "ProductSizeID",
            foreign_key: "ProductSizeID"

    has_many :stock_movements,
            primary_key: "ProductSizeID",
            foreign_key: "ProductSizeID"
    
end
