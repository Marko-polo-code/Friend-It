class SwapRequest < ApplicationRecord
  belongs_to :requester_flat
  belongs_to :requested_flat
end
