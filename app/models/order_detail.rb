class OrderDetail < ApplicationRecord

    belongs_to :order
    belongs_to :item

    enum production_status: { 着手不可: 0, 制作待ち: 1, 制作中: 2, 制作完了: 3 }

    def self.multi_update(order_detail_params)
        order_detail_params.to_h.map do |id, order_detail_param|
          order_detail = self.find(id)
          order_detail.update_attributes!(order_detail_param)
        end
    end

end
