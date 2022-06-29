class Product < ApplicationRecord
    def self.fill_with(section)

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