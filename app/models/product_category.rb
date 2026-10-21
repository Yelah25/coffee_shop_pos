class ProductCategory < ApplicationRecord
    self.primary_key = "ProductCategoryID"

    has_many :products,
            primary_key: "ProductCategoryID",
            foreign_key: "ProductCategoryID"
end
