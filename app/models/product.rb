class Product < ApplicationRecord
    def self.order_by_likes(product_list)
        product_list = product_list.select("products.plu, likes.likes, products.name, products.category, products.img_link, products.price, products.size").joins("LEFT JOIN likes ON products.plu = likes.plu").order("likes desc")
    end

    def self.filter_by_params(params)
        product_list = Product.all

        product_list = product_list.filter_by_param("name", params[:name])
        product_list = product_list.filter_by_param("category", params[:category])

        product_list = product_list.filter_between_params("price", params[:min_price], params[:max_price])
        product_list = product_list.filter_between_params("size", params[:min_size], params[:max_size])

        return product_list
    end

    def self.filter_by_param(query_param, param)
        string_query = "lower(" + query_param + ") LIKE ?"

        if param.present?
            return self.where(string_query, "%#{param.downcase}%")
        end

        return self.all
    end

    def self.filter_between_params(query_param, min_param, max_param)
        product_list = self.all
        base_query = "lower(" + query_param + ") "
        string_query = base_query + "> ?"

        if min_param.present?
            product_list = product_list.where(string_query, min_param)
        end

        string_query = base_query + "< ?"
        if max_param.present?
            product_list = product_list.where(string_query, max_param)
        end

        return product_list
    end

end