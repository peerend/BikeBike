class Workshop < ActiveRecord::Base
    belongs_to :conference

    def to_param
        slug
    end
end
