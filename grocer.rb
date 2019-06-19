def consolidate_cart(cart)
  # code here
  newHash = {}
  cart.each do |food, info|
      food.each do |a,b|
        if newHash[a]== nil
          newHash[a]={price: b[:price], clearance: b[:clearance], count: 1}
        else
          newHash[a][:count]+=1
        end
      end
  end
  return newHash
end

def apply_coupons(cart, coupons)
  # code here
  couponHash = {}
	 amtHash = {}
	 cCart =  cart
	 if coupons == []
		 return cCart
	 end
	 cCart.each do |food, info|
		 coupons.each do |items|
			 if items[:item] == food
					 couponHash["#{food} W/COUPON"] = {:price => items[:cost], :clearance => info[:clearance], :count => getCouponCount(food,coupons)}
           couponHash["#{food}"] = {:price => info[:price], :clearance => info[:clearance], :count => info[:count] - (items[:num]*getCouponCount(food,coupons))}
			 end
		 end
	 end
	 return cCart.merge!(couponHash)
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
