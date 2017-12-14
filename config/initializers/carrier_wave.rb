require 'carrierwave/orm/activerecord'

#Chỉ định chất lượng hình ảnh by Carrier_Wave (Béo ka)
module CarrierWave    
    module MiniMagick
        def quality(percentage)
          manipulate! do |img|
            img.quality(percentage.to_s)
            img = yield(img) if block_given?
            img
          end
        end
    end
end 
