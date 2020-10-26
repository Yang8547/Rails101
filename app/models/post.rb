class Post < ApplicationRecord
    validates :content, presence: true

    # scope
    scope :recent, -> { order("created_at DESC")}
    # Ex:- scope :active, -> {where(:active => true)}
    
    
    belongs_to :user
    belongs_to :group
end
