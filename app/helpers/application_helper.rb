module ApplicationHelper

    def is_cart_empty(cart_total)
        if cart_total > 0
            return false
        else 
            return true
        end
    end
end
