class User < ActiveRecord::Base
    # attr_accessible :name, :email, :password
    has_many :posts
    has_many :comments


    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true, :length => { :minimum => 5 }
    validates :email, uniqueness: true
    validates :name, uniqueness: true


    def has_required_fields?
        self.name && self.email && self.password
    end    
end
