class Search < ApplicationRecord
    def _pictures 
        @pictures ||= find_pictures 
    end 

    private 
    
    def find_pictures
        Picture.find(:all, :conditions => conditions)
    end 

    def keyword_conditions 
        ["pictures.name LIKE ?", "%#{keywords}%"] unless keywords.blank?
    end 

    def conditions 
        [conditions_clauses.join(' AND '), *conditions_options]
    end 

    def conditions_clauses
        conditions_parts.map { |condition| condition.first}
    end 

    def conditions_options
        conditions_parts.map { |conditions| condition[1..-1]}.flatten
    end 
end
def conditions_parts 
    private_methods(false).grep(/_conditions$/).map{|m| send(m)}.compact
end 
