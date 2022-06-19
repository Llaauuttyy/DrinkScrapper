class Product < ApplicationRecord
    def self.filter_by_params(params)
        product_list = Product.all

        product_list = product_list.filter_by_param("name", params[:filter_name])
        product_list = product_list.filter_by_param("category", params[:filter_category])

        product_list = product_list.filter_between_params("price", params[:filter_min_price], params[:filter_max_price])
        product_list = product_list.filter_between_params("size", params[:filter_min_size], params[:filter_max_size])

        return product_list
    end

    def self.filter_by_param(query_param, param)
        string_query = "lower(" + query_param + ") = ?"

        if param.present?
            return self.where(string_query, param.downcase)
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
