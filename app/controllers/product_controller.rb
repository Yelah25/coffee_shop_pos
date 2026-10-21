class ProductController < ApplicationController
 
    before_action :authenticate_user!

    def index

        product = Product.joins(:product_category).select(
            "ProductCategoryID",
            "product_categories.ProductCategoryName",
            "ProductID",
            "ProductName",
            "IsActive"
        )
        render json: product
    

    end

    def create

        product_category = ProductCategory.find_by(ProductCategoryID: params[:ProductCategory])
        if product_category.nil?
            render json: {
                message: "Product Category does not exist"
            }, status: :not_found
            return
        end

        product = Product.find_by(ProductCategoryID: params[:ProductCategoryID], ProductName: params[:ProductName])

        if product.present?
            render json: {
                message: "Duplicate product in a category"
            }, status: :conflict
            return
        end
          
        product = Product.new(
            ProductCategoryID: params[:ProductCategoryID],
            ProductName: params[:ProductName],
            IsActive: true,
            CreatedAt: Time.current
        )
    
        if product.save

            render json:{
                message: "Product created successfullt",
            },status: :created

        else
            render json: {
                message: "Failed to create product.",
                errors: product.errors.full_messages
            }, status: :unprocessable_entity
        end

    end

    def 




end
