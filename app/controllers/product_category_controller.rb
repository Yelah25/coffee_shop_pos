class ProductCategoryController < ApplicationController

    def index

        category = ProductCategory.all
        render json: category

    end

    def create

        category = ProductCategory.new(
            ProductCategoryName: params[:ProductCategoryName],
            IsActive: 1,
            CreatedAt: Time.current
        )


       
        
        if ProductCategory.exists?(ProductCategoryName: params[:ProductCategoryName])

            render json: {
                message: "Category already exist"                
            }, status: :conflict
            return

            elsif category.save
            render json: {
                message: "Success",
                category:{
                   ProductCategoryId: category.ProductCategoryID,
                    ProductCategoryName: category.ProductCategoryName,
                    IsActive: category.IsActive,
                    CreatedAt: category.CreatedAt
                }
            }, status: :created
        else
          
            render json: {
                message: "Failed to create category", 
                error: category.errors.full_messages

        },status: :unprocessable_entity
        return


        end
       
    end


    def destroy
        category = ProductCategory.find_by(ProductCategoryName: params[:ProductCategoryName])

        if category.nil?
            render json: {
                message: "Product Category does not exist."
            }, status: :not_found

        elsif category.destroy

                render json: {
                    message: "Delete Success"
                    }, status: :ok

        else
            render json: {
                message: "Failed",
                errors: category.errors.full_messages
            }, status: :unprocessable_entity

        end
    end


    def update
        category = ProductCategory.find_by(ProductCategoryName: params[:ProductCategoryName])
        
        if category.nil?
            render json: {
                message: "Product category name does not exist."
                }, status: :not_found
                return
            end
            
            newcategory = ProductCategory.find_by(ProductCategoryName: params[:NewProductCategoryName])
            
            if newcategory.present?
                render json: {
                    message: "New product category name already exists."
                    }, status: :conflict
                    return
                end
                
            if category.update(ProductCategoryName: params[:NewProductCategoryName])
                render json: {
                    message: "Update Success",
                    category: {
                        ProductCategoryName: category.ProductCategoryName
                    }
                    }, status: :ok
  
            else
                    render json: {
                        message: "Update Failed",
                        errors: category.errors.full_messages
                        }, status: :unprocessable_entity
            end
    end


end

            
  

