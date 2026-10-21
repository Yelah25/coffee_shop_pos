class Product < ApplicationRecord
    self.primary_key = "ProductID"

    belongs_to :product_category,
                primary_key: "ProductCategoryID",
                foreign_key: "ProductCategoryID"
             
    has_many :product_sizes,
                foreign_key: "ProductID",
                primary_key: "ProductID"    

end
