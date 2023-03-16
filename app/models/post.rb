class Post < ApplicationRecord
    validate :title_true_facts

    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: ["Fiction","Non-Fiction"]} 

    

    def title_true_facts
        unless title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
            errors.add (:title, "Title not sufficiently clickbait-y")
        end
    end

    def title_is_clickbait
        if !title || (!title.include?("Won't Believe") && !title.include?("Secret") && !title.match?(/Top \d+/) && !title.include?("Guess"))
          errors.add(:title, "is not sufficiently clickbait-y")
        end
      end


end
